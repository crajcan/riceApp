$(document).on('turbolinks:load',function(){

  $(".hamburger").click(function(){
    $("#nav-hidden").toggle();
    $("header").toggleClass('open')

    $('html').click(function(){
      $("#nav-hidden").hide();
      $("header").removeClass('open');
    });


    $("header").click(function(e){
      e.stopPropagation();
    });

  });

});

