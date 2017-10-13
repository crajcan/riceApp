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
    return false;
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

  //toggle event/post form
  $('#event-form-switch').click(function(){
    $('#post_content').css('margin-top', '0');
    if ($(this).hasClass("event-form-open")) { 
      $('.event-form').css('display', 'block');
      $('.event-form-open').attr('class', 'event-form-close');
      $(this).text("Close event form");
      $("textarea").attr("placeholder", "Describe the event...");
      $("#post_title").attr("placeholder", "");
    } else {
      $('.event-form').css('display', 'none');
      $('.event-form-close').attr('class', 'event-form-open');    
      $(this).text("Make this post an event");
      $("textarea").attr("placeholder", "Create new post...");
      $("#post_title").attr("placeholder", "title (optional)");
      //clear event fields
      $('#post_event_location').val('');
      $('select').val(''); 
    }
  }); 

  $('#post_content').click(function(){
    $('.post-form-hidden').css('display', 'block');
    $('#post-form-title').css('display', 'none');
    $(this).css('height', '100px');
    $(this).css('margin-top', '15');
    $(this).css('margin-bottom', '15px');
  }); 
 
});


