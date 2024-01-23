function count (){
  const itemPrice = document.getElementById("item-price");
  
  itemPrice.addEventListener("input", () => {
    const price = parseFloat(itemPrice.value);

    const itemFeeValue = Math.floor(price * 0.1);
    const itemProfitValue = price - itemFeeValue;

    const itemFee = document.getElementById("add-tax-price");
    itemFee.innerHTML = `${itemFeeValue}`;

    const itemProfit = document.getElementById("profit");
    itemProfit.innerHTML = `${itemProfitValue}`;
  });
};

window.addEventListener('turbo:load', count);
window.addEventListener("turbo:render", count);