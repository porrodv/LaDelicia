'use strict';

document.addEventListener("DOMContentLoaded", function() {
  loadContent();
  navbarFunctionality();
});

function loadContent() {
  let headerContent, footerContent;
  let headerRequest = new XMLHttpRequest();
  let footerRequest = new XMLHttpRequest();

  headerRequest.open("GET", "./templates/header.html", false);
  headerRequest.onreadystatechange = function () {
    if (headerRequest.readyState === 4) {
      if (headerRequest.status === 200 || headerRequest.status === 0) {
        headerContent = headerRequest.responseText;
      }
    }
  };
  headerRequest.send(null);

  footerRequest.open("GET", "./templates/footer.html", false);
  footerRequest.onreadystatechange = function () {
    if (footerRequest.readyState === 4) {
      if (footerRequest.status === 200 || footerRequest.status === 0) {
        footerContent = footerRequest.responseText;
      }
    }
  };
  footerRequest.send(null);

  document.getElementById("header").innerHTML = headerContent;
  document.getElementById("footer").innerHTML = footerContent;
}

function navbarFunctionality() {
  const navbar = document.querySelector(".navbar");

  function handleScroll() {
    if (window.scrollY > 0) {
      navbar.classList.add("navbar-scrolled");
    } else {
      navbar.classList.remove("navbar-scrolled");
    }
  }
  window.addEventListener("scroll", handleScroll);
}
