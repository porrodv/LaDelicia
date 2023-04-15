const navbar = document.querySelector(".navbar");

function handleScroll() {
  if (window.scrollY > 0) {
    navbar.classList.add("navbar-scrolled");
  } else {
    navbar.classList.remove("navbar-scrolled");
  }
}

window.addEventListener("scroll", handleScroll);
