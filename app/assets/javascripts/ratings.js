$(document).ready(function(){
  $('.rate_link').bind('ajax:success', function() { 
    previous_number = parseInt($(this).prev().html());
    $(this).prev().html(previous_number + 1);
    $(this).toggle(false);
  });
});