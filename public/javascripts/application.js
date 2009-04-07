// Common JavaScript code across your application goes here.

// confirm deletion
$(document).ready(function () {
  $('.delete').click(function() {
    var answer = confirm('Deletion will be permanent. Are you sure you want this?');
    return answer;
  }); 
  
  $('#menu').lavaLamp({
    fx: 'easeOutBounce',
    speed: 700,
    autoReturn: false
  });                    
  
  $("#gallery a").lightBox({
    imageLoading: 'images/loadingAnimation.gif'    
  })
});
