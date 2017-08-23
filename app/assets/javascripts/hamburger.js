$(document).on('turbolinks:load',function(){

  $(".hamburger").click(function(){
    $("#nav-hidden").toggle();
    $("header").toggleClass('open')
  });


  $(document).click(function(){
    $("#nav-hidden").hide();
    $("header").removeClass('open');
  });

  $("header").click(function(e){
    e.stopPropagation();
  });

/*
  $('body').click(function(e){
    if($(e.target).hasClass("open")){
      return false;
    } else {
      $("#nav-hidden").toggle();
      $("header").toggleClass('open');
    }
  });
*/
});

