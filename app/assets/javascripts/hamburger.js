/*$(document).ready(function(){
  $('.hamburger').click(function() {
     $('.hamburger').not(this).find('#nav-hidden').hide();
     $(this).find('#nav-hidden').toggle();
  });
});*/

$(document).on('turbolinks:load',function(){

  $(".hamburger").click(function(){
    $("#nav-hidden").toggle();
    $("header").toggleClass('open')
  });

  $('body').click(function(){
    $("#nav-hidden").css('display: none;')
  });

});

