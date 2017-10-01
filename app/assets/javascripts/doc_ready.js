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
      //open reply form
      $(this).next('.reply-form').toggle();
      //change control text
      $(this).text(function(i, text){
        return text === "reply" ? "close" : "reply";
      }); 

      $(this).next('.reply-form').find('#reply_picture').bind('change', function() {
        var size_in_megabytes = this.files[0].size/1024/1024;
        if (size_in_megabytes > 5) {
          alert('Maximum file size is 5MB. Please choose a smaller file.');
//          $(this).wrap('<form>').closest('form').get(0).reset();
//          $(this).unwrap();
        } else {
          var photo_name = this.files[0].name;
          $(this).next('.photo-label').text(function(i, text){
            return text = photo_name + " attached.";
          });
        }
      });


    });


  //background image mobile
  $(window).scroll(function() {
    var scrolledY = $(window).scrollTop();
    $('.on-device > body').css('background-position', 'center ' + ((scrolledY)) + 'px');
  });

 
});


