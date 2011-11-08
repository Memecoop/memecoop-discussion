$(document).ready(function(){
  $(".reply_stuff").hide();
  
  $(".reply_link").mousedown(function(event){
    event.preventDefault();
    $(this).prev(".reply_stuff").toggle(true);
    $(this).toggle(false);
       
    
  });

});