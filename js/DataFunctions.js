'use strict';

async function getData(url) {
  try {
    const response = await fetch(url);
    const data = await response.json();

    return data;
  } catch (error) {
    console.log(error);
  }
}

async function postData(url, user, pass){
  const data = {
    username: user,
    password: pass,
  };
  // console.log("usuario enviado: ", data);

  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {  
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    });

    const result = await response.json();
    return result;    
  } catch (error) {
    console.log("Error:", error);
  }
}

// testing
async function putData(url, method, dataObject = []) {
  const token = await getTokenFromServer();
  const csrftoken = getCookie("csrftoken");

  try {
    const response = await fetch(url, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer" + token,
        "X-CSRFToken": csrftoken,
      },
      body: JSON.stringify(dataObject),
    });
    const data = await response.json();
    return data;
  } catch (error) {
    console.log(error);
  }
}

export { getData, postData };
