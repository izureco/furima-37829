const price = () => {
  const price_form = document.getElementById("item-price")
  price_form.addEventListener('keyup',() => {
    const charge = parseInt(price_form.value * 0.1,10)
    const profit = parseInt(price_form.value - charge,10)
    
    const charge_form = document.getElementById("add-tax-price")
    const profit_form = document.getElementById("profit")

    charge_form.innerHTML = charge
    profit_form.innerHTML = profit
  })
}

window.addEventListener('load',price)