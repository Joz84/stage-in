//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .


$(document).ready(function() {

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

  $('#trigger-recapitulatif').on('click', function(event){
    $('#prenom').html($('#user_first_name').val());
    $('#nom').html($('#user_last_name').val());
    $('#adresse').html($('#user_address').val());
    $('#telephone').html($('#user_phone').val());
    $('#email').html($('#user_email').val());
    $('#classe').html($('#user_level').val());
    // ($('#user_last_name').val());
  })
});



