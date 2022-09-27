let nav = document.querySelector(".navbar")
let cart = document.querySelector(".cart-items-container")
let search = document.querySelector(".searchForm")
var menu = document.getElementById("btnMenu")
var shop = document.getElementById("btnShop")
var btnSearch = document.getElementById("btnSearch")

menu.addEventListener("click",()=>{
    nav.classList.toggle('active');
    cart.classList.remove('active');
    search.classList.remove('active');
})
shop.addEventListener("click",()=>{
    cart.classList.toggle('active');
    search.classList.remove('active');
    nav.classList.remove('active');
})
btnSearch.addEventListener("click",()=>{
    search.classList.toggle('active');
    nav.classList.remove('active');
    cart.classList.remove('active');
})
window.onscroll = () =>{
    nav.classList.remove('active');
    search.classList.remove('active');
    cart.classList.remove('active');
}
let addToCartBtn = document.getElementsByClassName('btnCart');
let mainContainer = document.getElementById('title')

for(let i = 0; i < addToCartBtn.length; i++){
    addToCartBtn[i].addEventListener('click',addcart)
}

totalCommand = [];
let pos;
let result = document.getElementById('results');

function addcart(event){
    let btn = event.target
    let btn_parent = btn.parentElement
    let itemName = btn_parent.children[1].innerText
    let itemPrice = btn_parent.children[2].innerText
    let itemImage = btn_parent.children[0].src
    pos++;
    let itemContainer = document.createElement('div')
    itemContainer.classList.add("cart-item")
    itemContainer.innerHTML = `
    <span class="fa fa-times" data-index="${pos}" onclick="remove(this)"></span>
     <img src="${itemImage}" alt="">
    <div class="content1">
        <h3>${itemName}</h3>
        <div class="price">${itemPrice}</div>
    </div> `
     mainContainer.append(itemContainer)
        totalR += parseInt(itemPrice);
    result.value = totalR;
}
totalCommandRemove=[];
let totalR=0;
function remove(values){
    debugger
    let priceToSub = values.parentElement.children[2].children[1].innerText;
    totalR -= parseInt(priceToSub);
    values.parentElement.remove();
    result.value = totalR;
}

function send_Email(){
    Email.send({
        Host : "smtp.gmail.com",
        Username : "mmahrar011@gmail.com",
        Password : "ayoub2002",
        To : 'ayoubkhyat@gmail.com',
        From : document.getElementById("email").value,
        Subject : "New Contact",
        Body : "And this is the body"
    }).then(
      message => alert(message)
    );
}

