const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY)

  const btn = document.getElementById("button")
  btn.addEventListener('click', (e) => {
    e.preventDefault()

    const form = document.getElementById("charge-form")
    const formData = new FormData(form)

    const card = {
      number:     formData.get("purchase_phistory[number]"),
      exp_month:  formData.get("purchase_phistory[exp_month]"),
      exp_year:   `20${formData.get("purchase_phistory[exp_year]")}`,
      cvc:        formData.get("purchase_phistory[cvc]")
    }
    Payjp.createToken(card, (status, response) => {
      if(status == 200){
        const token = response.id
        const renderDom = document.getElementById("charge-form")
        const tokenHTML = `<input value=${token} name='token' type='hidden'>`
        renderDom.insertAdjacentHTML('beforeend',tokenHTML)
      }

      document.getElementById("card-number").removeAttribute("name")
      document.getElementById("card-exp-month").removeAttribute("name")
      document.getElementById("card-exp-year").removeAttribute("name")
      document.getElementById("card-cvc").removeAttribute("name")

      document.getElementById("charge-form").submit()
    })
  })
}

window.addEventListener('load',pay)

