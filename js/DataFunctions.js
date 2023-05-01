function loadJSON(url = "menus.json") {
  return fetch(url)
    .then((response) => response.json())
    .catch((error) => console.error("Error al cargar JSON:", error));
}

export { loadJSON };
