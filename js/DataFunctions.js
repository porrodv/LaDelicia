async function getData(url) {
  try {
    const response = await fetch(url);
    const data = await response.json();

    return data;
  } catch (error) {
    console.log(error);
  }
}

// testing
async function giveData(url, method, dataObject = []) {
  const token = await getTokenFromServer();
  const csrftoken = getCookie("csrftoken");

  if (method === "PUT") {
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
  } else if (method === "POST") {
    try {
      const response = await fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer" + token,
          "X-CSRFToken": csrftoken,
        },
        body: JSON.stringify(dataObject),
      });
      const contentType = response.headers.get("content-type");

      if (contentType && contentType.indexOf("application/json") !== -1) {
        const data = await response.json();
        return data;
      } else {
        const blob = await response.blob();
        return blob;
      }
    } catch (error) {
      console.log(error);
    }
  }
}

export { getData };
