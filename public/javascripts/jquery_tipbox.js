/***************************/
//@Author: Adrian "yEnS" Mato Gondelle & Ivan Guardado Castro
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/
 
 
jQuery.fn.tipbox = function(content, allowHtml, className){
	jQuery.fn.tipbox.created.id = "tipBox";
	$("body").append(jQuery.fn.tipbox.created);
	//set some properties for the tipBox division
	var tipBox = $(jQuery.fn.tipbox.created);
	tipBox.css({"position":"absolute","display":"none"});
 
	//functions
	function tipBoxShow(e){
		tipBox.css({"display":"block", "top":e.pageY+16, "left":e.pageX});
	}
	function tipBoxHide(){
		tipBox.css({"display":"none"});
	}
 
	//events for each element
	this.each(function(){
		$(this).mousemove(function(e){
			tipBoxShow(e);
			//update the content
			if(allowHtml)
				tipBox.html(content);
			else
				tipBox.text(content);
			//remove all classes for the tipBox before add a new one and to avoid the "append class"
			tipBox.removeClass();
			//set class if specified
			if(className) tipBox.addClass(className);
		});
		$(this).mouseout(function(){
			tipBoxHide();
		});
	});	
};
 
//create the element (avoiding create multiple divisions for the tipBox)
jQuery.fn.tipbox.created = document.createElement("div");