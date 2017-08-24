//on render or redirect
$(document).on('turbolinks:load',function(){

  
  $(".hamburger").click(function(){
    $("#nav-hidden").toggle();
    $("header").toggleClass('open')

  
    //after burger click, close if outside click
    $('html').click(function(){
      $("#nav-hidden").hide();
      $("header").removeClass('open');
    });


    $("header").click(function(e){
      e.stopPropagation();
    });

    $("header").find("#nav-hidden").click(function(e){
      e.stopPropagation();
      $(this).find("a").first().click();
    });

  });

});

