// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
//リッチエディタ
require("trix")
require("@nathanvda/cocoon")
require("@rails/actiontext")

const swiper = new Swiper
import Swiper from 'swiper/bundle';
window.Swiper = Swiper

require("bootstrap")
import "../stylesheets/application";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

const WOW = require('wowjs');

window.wow = new WOW.WOW({
  live: false
});
