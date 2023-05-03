function login() {
  var user, password;

  user = document.getElementById("usuario").value;
  password = document.getElementById("contraseña").value;

  if (user == "admin" && password == "1234") {
    window.location = "../admin/dashboard.html";
  } else {
    alert("Datos incorrectos");
  }
}

let listElements = document.querySelectorAll(".list__button--click");

listElements.forEach((listElement) => {
  listElement.addEventListener("click", () => {
    listElement.classList.toggle("arrow");

    let height = 0;
    let menu = listElement.nextElementSibling;
    if (menu.clientHeight == "0") {
      height = menu.scrollHeight;
    }

    menu.style.height = `${height}px`;
  });
});
