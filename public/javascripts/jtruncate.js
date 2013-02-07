(function($){
	$.fn.jTruncate = function(options) {
	   
		var defaults = {
			length: 300,
			minTrail: 20,
			moreText: "more",
			lessText: "less",
			ellipsisText: "...",
			moreAni: "",
			lessAni: ""
		};
		
		var options = $.extend(defaults, options);
	   
		return this.each(function() {
			obj = $(this);
			var body = obj.html();
			
			if(body.length > options.length + options.minTrail) {
				var splitLocation = body.indexOf(' ', options.length);
				if(splitLocation != -1) {
					// truncate tip
					var splitLocation = body.indexOf(' ', options.length);
					var str1 = body.substring(0, splitLocation);
					var str2 = body.substring(splitLocation, body.length - 1);
					obj.html(str1 + '<span class="truncate_ellipsis">' + options.ellipsisText +'<a href="#" class="morelink" id = "more"  >'+ " " + options.moreText + '</a>' + '</span>' + '<span class="truncate_more">' + str2 +'</span>');
					obj.find('.truncate_more').css("display", "none");
					
					// insert more link
		
          obj.find('.lesslink').css("display", "block");
					// set onclick event for more/less link
					var moreLink = $('.morelink', obj);
					var lessLink = $('.lesslink', obj);
				  var truncated_text=document.getElementById("truncated");
          var full_text=document.getElementById("full-text");
          var less_link=document.getElementById("less");
					//var moreContent = $('.truncate_more', obj);
					//var ellipsis = $('.truncate_ellipsis', obj);
					moreLink.click(function() {
							less_link.style.display ="block"
							moreLink.css("display", "none")
						 truncated_text.style.display="none"
						  full_text.style.display = "block"
							return false;
							});	
				less_link.onclick = (function() {
							moreLink.css("display", "inline");
							less_link.style.display ="none"
							truncated_text.style.display="block"
						  full_text.style.display = "none"
							return false;
							});	
				  }
				
			} // end if
			
		});
	};
})(jQuery);

function toggleMe(truncated,full,more,less){
  var truncated_text=document.getElementById(truncated);
  var full_text=document.getElementById(full);
  var more_link=document.getElementById(more);
  var less_link=document.getElementById(less);
  if(!truncated_text || !full_text)
    return true;

  if(truncated_text.style.display=="none"){
    truncated_text.style.display="block"
    full_text.style.display = "none"
    more_link.style.display = "none"
    less_link.style.display = "block"
  }
  else
  {
    truncated_text.style.display="none"
    full_text.style.display="block"
    more_link.style.display = "block"
    less_link.style.display = "none"
  }
  return true;
};
