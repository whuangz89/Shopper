// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require cocoon



$(document).on('turbolinks:load', function(){
  function check_to_hide_or_show_add_link() {
       if ($('#image .nested-fields:visible').length == 5) {
         $('#image .links a').hide();
       } else {
         $('#image .links a').show();
       }
     }

     $('#image').on('cocoon:after-insert', function() {
       check_to_hide_or_show_add_link();
     });

     $('#image').on('cocoon:after-remove', function() {
       check_to_hide_or_show_add_link();
     });

     check_to_hide_or_show_add_link();     
});



$(document).ready(function(e){
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
    e.preventDefault();
    var param = $(this).attr("href").replace("#","");
    var concept = $(this).text();
    $('.search-panel span#search_concept').text(concept);
    $('.input-group #search_param').val(param);
  });
});


$(document).on("turbolinks:load",function(){
  var products = [
   { value: 'Trousers dark', data: 'celana' },
    { value: 'Denim Blue Navy shirt', data: 'celana' },
    { value: 'Denim Worker shirt', data: 'shirt' },
    { value: 'MOUTLEY', data: 'shirt' },
    { value: 'GREENLIGHT', data: 'shirt' },
    { value: 'shirt', data: 'shirt' },
    { value: "Short sleeves with ribbed cuffs", data: "shirt"}
  ];
  
  // setup autocomplete function pulling from currencies[] array
  $('#autocomplete').autocomplete({
    lookup: products,
    onSelect: function (suggestion) {
      var thehtml = '<strong>Currency Name:</strong> ' + suggestion.value + ' <br> <strong>Symbol:</strong> ' + suggestion.data;
      $('#outputcontent').html(thehtml);
    }
  });
  

});