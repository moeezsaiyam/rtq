$(document).ready(function()
{
   $(document).pngFix(); 
    
  className = $(location.pathname.split("/")).last()[0];
  $("#menu-bar ul li a").removeClass("active");
  if(className == "")
  {
    $("#menu-bar ul li a").removeClass("active");
    $("#menu-bar ul li a.home").addClass("active");
  }
  else
    $("#menu-bar ul li a." + className).addClass("active");
    

  $(".watermarked").each(function() {
    $(this).Watermark($(this).attr('title'));
  });
  
  $('#carousel').infiniteCarousel({
   transitionSpeed : 800,
   displayTime : 5000,
   textholderHeight : .30,
   displayProgressBar : 0,
   displayThumbnails :false
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
    $('#alternate_phrases').append('<br/>');
    $('#alternate_phrases').append($('#new_alternate_phrases div').clone().val(''));
      $('#remove_button').click(function(){
        $(this).parent().remove();
        return false;
      });
    return false;
   });
  
  $('#add_reference_button').click(function(){
    $('#references').append($('#new_references div').clone().val(''));
    $('#remove_reference_button').click(function(){
        $(this).parent().remove();
        return false;
      });
   return false;
   });

    
 $('.trans-select form input').click(function() {
  $.cookies.set($(this).val(), this.checked, {path:'/'});
  $('.trans-select form').submit();
 });
}); 


