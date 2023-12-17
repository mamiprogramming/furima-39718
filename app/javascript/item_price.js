window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const priceValue = parseFloat(inputValue.replace(/[^0-9.]/g, ''));
    if (isNaN(priceValue)) {
      return;
    }
    if (priceValue < 300 || priceValue > 9999999) {
      alert("The price must be within the range of ¥300 to ¥9,999,999.");
      return;
    }
    priceInput.value = formatPrice(priceValue);

    if (addTaxDom && profitDom) {
      addTaxDom.innerHTML = formatPrice(Math.floor(priceValue * 0.1));
      profitDom.innerHTML = formatPrice(Math.floor(priceValue - Math.floor(priceValue * 0.1)));
    }
  });
});

function formatPrice(price) {
  return price.toLocaleString();
}