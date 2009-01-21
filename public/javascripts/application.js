// Common JavaScript code across your application goes here.

// confirm deletion
$(document).ready(function () {
  $('.delete').click(function() {
    var answer = confirm('Are you sure?');
    return answer;
  });
});
