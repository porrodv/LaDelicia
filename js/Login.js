import { postData } from "./DataFunctions.js";

document.getElementById('login-form').addEventListener('submit', login);

async function login(event) {
  event.preventDefault();

  let user = document.getElementById("username").value;
  let pass = (document.getElementById("password").value);

  const data = await postData('./php/db_verify_admin.php', user, pass);

  if (data) {
    window.location = "./admin/dashboard.html";
    return;
  }
  alert("Datos incorrectos");
}

async function encodePassword(password) {
  const encoder = new TextEncoder();
  const data = encoder.encode(password);

  const hashBuffer = await window.crypto.subtle.digest("SHA-256", data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  const encodedPassword = hashArray.map(byte => byte.toString(16).padStart(2, "0")).join("");

  return encodedPassword;
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