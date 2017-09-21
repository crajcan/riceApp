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

  //Show/hide reply form
  $('.reply-form').css("display","none");
    $('.reply-open').click(function () {
      $(this).next('.reply-form').toggle();
      $(this).text(function(i, text){
        return text === "reply" ? "close" : "reply";
      }); 
    });

});


