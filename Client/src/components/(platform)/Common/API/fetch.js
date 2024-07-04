export async function fetchData({ route }) {

  const baseURL = "https://academia-hvno.onrender.com/api/";
  const dataFetsh = await fetch(
    baseURL + route,
    {
      headers: {
        "Content-Type": "application/json",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijc1YTY2OWRhLTViMGMtNDg3Yy1hNjIzLTFkOTdmODVhZmJmOCIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxOTY3NTUyMiwiZXhwIjoxNzIwMDIxMTIyfQ.ySjoa1nq-jhItnHAdvTzIICMdlgxMXoxjDp5r0Qt04s"
      },
    }
  );
  const data = await dataFetsh.json();
  // data.then((res) => { return res })

  return data;
}

export async function getUserById({ userID }) {
  const baseURL = "https://academia-hvno.onrender.com/api/users/";
  const dataFetsh = await fetch(
    baseURL + userID,
    {
      headers: {
        "Content-Type": "application/json",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijc1YTY2OWRhLTViMGMtNDg3Yy1hNjIzLTFkOTdmODVhZmJmOCIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxOTY3NTUyMiwiZXhwIjoxNzIwMDIxMTIyfQ.ySjoa1nq-jhItnHAdvTzIICMdlgxMXoxjDp5r0Qt04s"
      },
    }
  );
  const data = await dataFetsh.json();
  // console.log(data)

  
  // data.then((res) => { return res })

  return data;
}