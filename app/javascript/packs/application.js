// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("channels")

//= require bootstrap-datepicker
//= require chosen
//= require jquery
//= require jquery_ujs
//= require popper
//= require tether
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

import 'bootstrap';
global.$ = require("jquery")

require("jquery") // Don't really need to require this...
require("jquery-ui")
require("chosen-js")
require("components/avatar")
import { initUpdateNavbarOnScroll } from '../components/navbar';

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initUpdateNavbarOnScroll();
  $(function(){
    $('#birthdayField').datepicker( { dateFormat: 'yy/mm/dd' } );
    $('#relation_hobbies_id').chosen({
      allow_single_deselect: true,
      width: '100%'
    });
    $('#product_hobby_id').chosen({
      allow_single_deselect: true,
      width: '100%'
    });
    $('#product_gender').chosen({
      allow_single_deselect: true,
      width: '100%'
    });
    $('#product_price').chosen({
      allow_single_deselect: true,
      width: '100%'
    });
    $('#product_age').chosen({
      allow_single_deselect: true,
      width: '100%'
    });

  })


});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
