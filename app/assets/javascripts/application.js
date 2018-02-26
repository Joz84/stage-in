//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .

$(document).ready(function() {

  $('.attachinary-input').attachinary();

  $(window).scroll(function() {
    $('#animatedElement').each(function(){
    var imagePos = $(this).offset().top;

    var topOfWindow = $(window).scrollTop();
      if (imagePos < topOfWindow+400) {
        $(this).addClass("slideUp");
      }
    });
  });

  $(document).on('click', 'a.scroll', function(event){
    event.preventDefault();

    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 500);
  });
});



