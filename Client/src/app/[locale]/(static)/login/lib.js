import { SignJWT, jwtVerify } from "jose";
import { cookies } from "next/headers";
import { NextRequest, NextResponse } from "next/server";

const secretKey = "secret";
const key = new TextEncoder().encode(secretKey);

export async function encrypt(payload) {
  return await new SignJWT(payload)
    .setProtectedHeader({ alg: "HS256" })
    .setIssuedAt()
    .setExpirationTime("10 sec from now")
    .sign(key);
}

export async function decrypt(input) {
  const { payload } = await jwtVerify(input, key, {
    algorithms: ["HS256"],
  });
  return payload;
}

export async function signin(formData) {
  // Verify credentials && get the user

  const requestBody = {
    actor: {
      name: "Guest",
      id: "null"
    },
    verb: {
      "id-enum": "log-into-account",
      display: {
        "en-US": "log user"
      }
    },
    object: {
      id: "null",
      objectType: "Agent",
      definition: {
        name: {
          "en-US": "user data"
        }
      }
    },
    context: {
      user: {
        email: formData.get("email"),
        password: formData.get("password")
      }
    }
  };

  try {
    // Use fetch to send the login request
    const response = await fetch('https://academia-hvno.onrender.com/api/auth/login', {
      cache: 'force-cache',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(requestBody),
    });

    if (!response.ok) {
      throw new Error('Login failed');
    }

    const user = { email: formData.get("email"), password: formData.get("password") };

    // Create the session
    const expires = new Date(Date.now() + 10 * 1000);
    const session = await encrypt({ user, expires });

    // Save the session in a cookie
    cookies().set("session", session, { expires, httpOnly: true });
  } catch (error) {
    console.error(error);
  }

}

export async function logout() {
  // Destroy the session
  cookies().set("session", "", { expires: new Date(0) });
}

export async function getSession() {
  const session = cookies().get("session")?.value;
  if (!session) return null;
  return await decrypt(session);
}

export async function updateSession(request) {
  const session = request.cookies.get("session")?.value;
  if (!session) return;

  // Refresh the session so it doesn't expire
  const parsed = await decrypt(session);
  parsed.expires = new Date(Date.now() + 10 * 1000);
  const res = NextResponse.next();
  res.cookies.set({
    name: "session",
    value: await encrypt(parsed),
    httpOnly: true,
    expires: parsed.expires,
  });
  return res;
}