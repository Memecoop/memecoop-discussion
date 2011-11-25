$(document).ready(function(){
  $(".reply_form").hide();
  $(".reply_link").click(function(event){
    event.preventDefault();
    $(this).siblings(".reply_form").toggle(true);
    $(this).toggle(false);
  });
});

