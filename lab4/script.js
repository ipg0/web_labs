const hoverHandlerSpec = "onmouseenter=\"hoverOnto(this)\" onmouseleave=\"hoverAway(this)\""
const productHandlerSpec = "onclick=\"addItemFromList(this)\""

function addItem(item, cart) {
    document.getElementById("priceOutput").innerHTML = ""
    if(item.pname == "" || item.price == "") {
        alert("Empty field!")
        return false;
    }
    cart.innerHTML += "<tr " + hoverHandlerSpec +
    "><td>" + item.pname
        + "</td><td class=\"priceValue\">" + item.price
        + "</td></tr>"
    return true;
}

function addItemToCart() {
    cart = document.getElementById("cart")
    pnameInput = document.getElementById("pname")
    priceInput = document.getElementById("price")
    if(addItem({
        pname: pnameInput.value,
        price: priceInput.value
    }, cart)) {
        pnameInput.value = "";
        priceInput.value = "";
    }
}

function addItemFromList(row) {
    addItem({
        pname: row.firstChild.innerHTML,
        price: row.lastChild.innerHTML
    }, document.getElementById("cart"));
}

function calculatePrice() {
    sum = 0;
    cart = document.getElementById("cart");
    Array.from(document.getElementsByClassName("priceValue")).forEach(element => {
        console.log(element);
        sum += parseInt(element.innerHTML);
    });
    result = document.getElementById("priceOutput");
    result.innerHTML = "<p>Суммарная стоимость: " + sum + "</p>"
}

function hoverOnto(cell) {
    cell.style.setProperty("background-color", "lightgreen")
}

function hoverAway(cell) {
    cell.style.removeProperty("background-color")
}

function loadProducts(table) {
    products = []
    console.log('called');
    fetch('products.json')
        .then(response => response.json())
        .then(json => {
            console.log(json);
            json.forEach(current => {
                table.innerHTML += "<tr " +
                    productHandlerSpec + " " + hoverHandlerSpec +
                    "><td>" + current.pname + "</td>" +
                    "<td>" + current.price + "</td></tr>";
            });
        });
}
