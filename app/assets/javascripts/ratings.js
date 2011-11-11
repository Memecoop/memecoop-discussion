$(document).ready(function(){
  $('.rate_link').bind('ajax:success', function() { 
    previous_number = parseInt($(this).parent().find(".rating_number").html());
    $(this).parent().find(".rating_number").html(previous_number + 1);
    $(this).toggle(false);
  });
});