window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const priceValue = inputValue;
    
    priceInput.value = priceValue;

    if (addTaxDom && profitDom) {
    addTaxDom.innerHTML = Math.floor(priceValue * 0.1);
    profitDom.innerHTML = Math.floor(priceValue - Math.floor(priceValue * 0.1));
    }
  });
});