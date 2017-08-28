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

    $(".float-right").click(function(e){
      e.stopPropagation();
    });


    $("header").click(function(e){
      e.stopPropagation();
    });

    $("#nav-hidden").children().click(function(){
      console.log("in control")
      //console.log(`elements = ${document.getElementsByTagName("A")}`);
      //elements = ${document.getElementsByTagName("A")}
      //().getElementsByTagName('a')[0].trigger('click')
    });
    
  });

});

