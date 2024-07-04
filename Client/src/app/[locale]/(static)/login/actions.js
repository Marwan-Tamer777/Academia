'use server'

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