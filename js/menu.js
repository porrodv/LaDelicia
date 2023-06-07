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
                <h2 class="card-text text-primary my-auto">$ ${menu.precio}</h2>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop${menu.id}">Ordenar</a>
            </div>

            <div class="modal-lg modal fade" id="staticBackdrop${menu.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdrop${menu.id}Label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title fs-5 text-success" id="staticBackdrop${menu.id}Label">
                                Realizar compra
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form>
                            <div class="modal-body">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="form-name" placeholder="Ingrese su nombre">
                                    <label for="form-name">Nombre</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="form-phone" placeholder="Ingrese su teléfono">
                                    <label for="form-phone">Teléfono</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="form-address" placeholder="Ingrese su dirección">
                                    <label for="form-address">Dirección</label>
                                </div>

                                <section class="row">
                                    <section class="col-md-6 mx-auto">
                                        <img src="./admin/${menu.imagen}" class="card-img-top" alt="...">
                                    </section>
                                    <section class="col-md-6 mx-auto">
                                        <div class="text-center w-100 mb-3">
                                            <h5 class="text-primary">${menu.nombre}</h5>
                                        </div>

                                        <div class="row mb-3 d-flex align-items-center">
                                            <div class="col-md-6">
                                                <label for="price">Precio</label>
                                            </div>
                                            <div class="col-md-6 d-flex justify-content-center">
                                                <span class="span-price">${menu.precio}</span>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="form-quantity">Cantidad</label>
                                            </div>    
                                            <div class="col-md-6 d-flex justify-content-center">
                                                <button class="btn btn-outline-secondary btn-increment" type="button">+</button>
                                                <span class="input-group-text span-quantity">1</span>
                                                <button class="btn btn-outline-secondary btn-decrement" type="button">+</button>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="form-total">Total</label>
                                            </div>
                                            <div class="col-md-6 text-center">
                                                <span class="span-total">0</span>
                                            </div>
                                        </div>
                                    </section>    
                                </section>
                            </div>
                                                
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-primary">Comprar</button>
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
}
