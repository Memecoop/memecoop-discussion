$(document).ready(function(){
  $(".reply_form").hide();
  $(".reply_link").click(function(event){
    event.preventDefault();
    $(this).prev(".reply_form").toggle(true);
    $(this).toggle(false);
  });
});

