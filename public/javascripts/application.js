// Common JavaScript code across your application goes here.

// confirm deletion
$(document).ready(function () {
  $('.delete').click(function() {
    var answer = confirm('Deletion will be permanent. Are you sure you want this?');
    return answer;
  });               
  $("#gallery").lightBox({
    fixedNavigation:true,
    imageLoading: 'images/loadingAnimation.gif'    
  })
});
