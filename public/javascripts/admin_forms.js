$(document).ready(function(){
  $(".form").hide();
  $("a#create1").click(function() {
    $(this).html("Cancel");
    $(".form").toggle(400);
  });                                             
  $("a#create2").click(function() {
    $(this).html("Cancel");
    $(".form").toggle(400);
  });                  
  $(".show").hide();
  $("a.showme").click(function() {
    $(".show").slideDown("slow");
  })                           
});

