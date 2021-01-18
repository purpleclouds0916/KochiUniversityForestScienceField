// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


window.onload = () => {

    class Confirm {
      constructor(el) {
        this.message = el.getAttribute('data-confirm')
        if (this.message) {
          el.form.addEventListener('submit', this.confirm.bind(this))
        } else {
          console && console.warn('No value specified in `data-confirm`', el)
        }
      }
  
      confirm(e) {
        if (!window.confirm(this.message)) {
          e.preventDefault();
        }
      }
    }
  
    Array.from(document.querySelectorAll('[data-confirm]')).forEach((el) => {
      new Confirm(el)
    })
  
  }