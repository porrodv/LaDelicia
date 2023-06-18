'use strict';
import { getData } from "./DataFunctions.js";

Promise.all([showMenus()]).then(() => {
  modalActions();
});

async function showMenus() {
  const data = await getData("./php/db_get_products.php");
  console.log(data);

  const menuSection = document.getElementById("menu");
  const menuContent = menuSection.querySelector(".content");

  data.forEach((menu) => {
    menuContent.innerHTML += `
    <div class="col-md-4" menu-id-valu="${menu.id}">
        <div class="card mb-5">
            <img src="./admin/${menu.imagen}" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">${menu.nombre}</h5>
                <p class="card-text">${menu.descripcion}</p>                                    
            </div>
            <div class="card-footer d-flex justify-content-between align-items-center">
                <h2 class="card-text text-primary my-auto">S/. ${menu.precio}</h2>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop${menu.id}">Ordenar</a>
            </div>

            <div class="modal-lg modal fade" id="staticBackdrop${menu.id}" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdrop${menu.id}Label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title text-primary" id="staticBackdrop${menu.id}Label">
                                ${menu.nombre}
                            </h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form>
                            <div class="modal-body">
                                <article class="row mb-2">
                                    <div class="col-md-12 text-center">
                                        <h4 class="text-muted mb-4">Datos del comprador</h4>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="form-names" placeholder="a">
                                            <label for="form-names">Nombres</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="form-dni" placeholder="a">
                                            <label for="form-dni">DNI</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="form-phone" placeholder="a">
                                            <label for="form-phone">Teléfono</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="form-address" placeholder="a">
                                            <label for="form-address">Dirección</label>
                                        </div>
                                    </div>
                                </article>

                                <article class="row">
                                    <div class="col-md-12 text-center">
                                        <h4 class="text-muted mb-4">Datos del producto</h4>
                                    </div>
                                    <section class="col-md-7">
                                        <img src="./admin/${menu.imagen}" class="card-img-top" alt="...">
                                    </section>
                                    <section class="col-md-5 mx-auto">
                                        <div class="row mb-3 d-flex align-items-center">
                                            <div class="col-md-6 mb-3">
                                                <label for="price">Precio</label>
                                            </div>
                                            <div class="col-md-6 mb-3 d-flex justify-content-center">
                                                <span class="span-price">${menu.precio}</span>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="form-quantity">Cantidad</label>
                                            </div>    
                                            <div class="col-md-6 mb-3 d-flex justify-content-center">
                                                <button class="btn btn-outline-secondary btn-increment" type="button"><i class="fa-solid fa-plus"></i></button>
                                                <span class="input-group-text span-quantity ps-3 pe-3">1</span>
                                                <button class="btn btn-outline-secondary btn-decrement" type="button"><i class="fa-solid fa-minus"></i></button>
                                            </div>

                                            <div class="col-md-6 mb-4">
                                                <label for="form-total">Total</label>
                                            </div>
                                            <div class="col-md-6 mb-4 text-center">
                                                <span class="span-total fw-bold">${menu.precio}</span>
                                            </div>
                                            <div class="col-md-12 text-center">
                                                <button type="button" class="btn btn-primary btn-buy">Comprar</button>
                                            </div>
                                        </div>
                                    </section>
                                </article>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `;
  });
}

function modalActions() {
  let incrementButtons = document.querySelectorAll(".btn-increment");
  let decrementButtons = document.querySelectorAll(".btn-decrement");

  const handleButtonClick = (btn, increment) => {
    btn.addEventListener("click", () => {
      let section = btn.closest("section");
      let spanQuantity = section.querySelector(".span-quantity");
      let spanPrice = section.querySelector(".span-price");
      let spanTotal = section.querySelector(".span-total");

      let quantity = parseInt(spanQuantity.textContent);
      if (increment) {
        quantity++;
      } else {
        if (quantity > 1) quantity--;
      }
      spanQuantity.textContent = quantity;

      let total = (
        parseInt(spanQuantity.textContent) * parseFloat(spanPrice.textContent)
      ).toFixed(2);
      spanTotal.textContent = total;
    });
  };

  incrementButtons.forEach((btn) => {
    handleButtonClick(btn, true);
  });
  decrementButtons.forEach((btn) => {
    handleButtonClick(btn, false);
  });


  let payButtons = document.querySelectorAll(".btn-pay");

  payButtons.forEach(btn => {
    console.log(btn);
    btn.addEventListener('click', ()=>{
        let form = btn.closest('form');
        if (a = 1){
            // terminar
        }
    });
  });
}
