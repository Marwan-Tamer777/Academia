export const requestBody = {
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
        email: email,
        password: password
      }
    }
  };