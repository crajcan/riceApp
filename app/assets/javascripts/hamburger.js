//on render or redirect
$(document).on('turbolinks:load',function(){

  
  $(".hamburger").click(function(e){
    $("#nav-hidden").toggle();
    $("header").toggleClass('open')
    e.stopPropagation();
  
    //after burger click, close if outside click
    $('html').click(function(){
      $("#nav-hidden").hide();
      $("header").removeClass('open');
    });

  });

});

