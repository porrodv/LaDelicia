"use strict";

async function getData(url) {
  try {
    const response = await fetch(url);
    const data = await response.json();

    return data;
  } catch (error) {
    console.log(error);
  }
}

// se puede mejorar bastante las excepciones al usuario
async function postData(url, data) {
  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    });
    if (response.ok) {
      console.log('Data posteada correctamente');
      return { success: true, message: 'Compra realizada con éxito' };
    } else {
      const errorMessage = await response.text();
      console.log('Error interno: ' + errorMessage);
      return { success: false, message: errorMessage };
    }
  } catch (error) {
    throw new Error("Error al enviar la solicitud POST");
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
