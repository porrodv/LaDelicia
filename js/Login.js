import { postData } from "./DataFunctions.js";

document.getElementById('login-form').addEventListener('submit', login);

async function login(event) {
  event.preventDefault();

  let user = document.getElementById("usuario").value;
  let pass = document.getElementById("contraseña").value;

  // fix

  const data = await postData('./php/db_verify_admin.php', user, pass);

  // if (data) {
  //   window.location = "./admin/dashboard.html";
  //   return;
  // }
  // alert("Datos incorrectos");
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