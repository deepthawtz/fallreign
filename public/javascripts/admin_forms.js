$(".form").hide();
$("a#create1").click(function() {
  // $(this).html("Cancel");
  $(".form").toggle(400);
});                                             
$("a#create2").click(function() {
  $(this).html("Cancel");
  $(".form").toggle(400);
});                  
$(".edit").hide();
$("a.editme").click(function() {
  $(".edit").toggle(400);
});