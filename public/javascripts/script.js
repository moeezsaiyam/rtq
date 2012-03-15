$(document).ready(function()
{
  $(".watermarked").each(function() {
    $(this).Watermark($(this).attr('title'));
  });

  $('#coin-slider').coinslider({ width: 663,height: 306, navigation: true });

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
});
