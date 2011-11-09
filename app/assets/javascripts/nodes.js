$(document).ready(function(){
  $(".reply_form").hide(); 
  $(".reply_link").mousedown(function(event){
    event.preventDefault();
    $(this).prev(".reply_stuff").toggle(true);
    $(this).toggle(false);
  });
});