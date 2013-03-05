function remove_alternate(remove_link){
  if(confirm("Are you sure you want to delete this?"))
    $(remove_link).siblings('.alternate_phrase_field').remove();
}
function remove_issue(remove_link){
  if(confirm("Are you sure you want to delete this?"))
    $(remove_link).siblings('.refernce-details').remove();
    $(remove_link).remove()
}
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
    return false;
   });


  $('#add_button_image').click(function(){
    $('#upload').append($('.upload_image div').clone().val(''));
   });

  $('#add_reference_button').click(function(){
    $('#references').append(
      $('#new_references div').clone().val('')
      );
   return false;
   });

  $('#advance-search').click(function(){
    window.location.hash = '#footer2'
   return true;
   });
 $('.trans-select form input').click(function() {
  $.cookies.set($(this).val(), this.checked, {path:'/'});
  $('.trans-select form').submit();
 });
});


