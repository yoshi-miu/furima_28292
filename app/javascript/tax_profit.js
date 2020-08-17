function tax_profit() {  
  const priceForm = document.getElementById("item-price");
  priceForm.addEventListener("input", (e) =>{
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/items/new`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      const price = priceForm.value;
      const addTax = document.getElementById("add-tax-price");
      const addProfit = document.getElementById("profit");
      const tax = price * 0.1;
      addTax.innerHTML = parseInt(tax, 10);
      const profit = price - tax;
      addProfit.innerHTML = parseInt(profit, 10);
  
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
      } else {
        return null;
      }
    };
    XHR.onerror = () => {
      alert("Request failed");
    };

    e.preventDefault();

    
  });
}
window.addEventListener("turbolinks:load", tax_profit);