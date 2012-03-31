$(document).ready(function()
{
  className = $(location.pathname.split("/")).last()[0];
  $("#menu ul li a").removeClass("active");
  if(className == "")
    $("#menu ul li a.home").addClass("active");
  else
    $("#menu ul li a." + className).addClass("active");

  $(".watermarked").each(function() {
    $(this).Watermark($(this).attr('title'));
  });

  $('#coin-slider').coinslider({ width: 700,height: 307, navigation: true });
  

  $('#add_button').click(function(){
    var new_box = $('.alternate_phrase_field:last').clone().val('');
    $('#alternate_phrases').append(new_box);
    $('#alternate_phrases').append('<br/>');
    new_box.focus();
      return false;
  });
  
  $('#add_reference_button').click(function(){
   var new_box = $('#new_references div').clone();
   $('#references').append(new_box);
   return false;
   });

  $("#search_form form").submit(function(){
    if($("input.search-field").val() == "" || $("input.search-field").val() == "Search")
      return false;
  });
    
 $(".trans-select form input:checkbox").click(function(){ 
  $('.trans-select form').submit(); 
 });


});
