$(document).ready(function()
{
  $(".watermarked").each(function() {
    $(this).Watermark($(this).attr('title'));
  });
  $('#coin-slider').coinslider({ width: 663,height: 306, navigation: true });
});
