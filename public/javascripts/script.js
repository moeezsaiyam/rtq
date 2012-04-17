$(document).ready(function()
{
   $(document).pngFix(); 
    
  className = $(location.pathname.split("/")).last()[0];
  $("#menu-bar ul li a").removeClass("active");
  if(className == "")
    $("#menu-bar ul li a").addClass("active");
  else
    $("#menu-bar ul li a." + className).addClass("active");

  $(".watermarked").each(function() {
    $(this).Watermark($(this).attr('title'));
  });
  
  $('#carousel').infiniteCarousel({
	transitionSpeed : 800,
	displayTime : 5000,
	textholderHeight : .30,
	displayProgressBar : 0
  });
  
   $('#nav li').hover(
        function () {
            //show its submenu
            $('ul', this).slideDown(100);
 
        },
        function () {
            //hide its submenu
            $('ul', this).slideUp(100);        
        });

  $('#add_button').click(function(){
    var new_box = $('.alternate_phrase_field:last').clone().val('');
    $('#alternate_phrases').append(new_box);
    $('#alternate_phrases').append('<br/>');
    new_box.focus();
      return false;
  });
  
  $('#add_reference_button').click(function(){
   var new_box = $('#new_references div').clone().val('');
   $('#references').append(new_box);
   return false;
   });

    
 $(".trans-select form input:checkbox").click(function(){ 
  $('.trans-select form').submit(); 
 });

});
