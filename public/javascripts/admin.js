//this tucks away all the descriptions
// and then animates (slideUp/slideDown) them open or closed
$(document).ready(function(){
      // first tuck away all descriptions
	$("dd").hide().click(function(){
  		$(this).slideUp("slow").prev().removeClass("selected");
		});
		
		$("dt").click(function(){
  		var $this = $(this);
  		var $next = $this.next();
  		
  		if($next.is(":visible")) {
    			$this.removeClass("selected");
    			$next.slideUp("slow");
  		}
  		else {
    	  $this.addClass("selected").parents("dl").find("dd").slideUp("normal");
    			$next.slideDown("slow");
  		}
		});
});
