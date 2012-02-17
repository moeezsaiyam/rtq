$(document).ready(function()
{
  $(".watermarked").each(function() {
    $(this).Watermark($(this).attr('title'));
  });
});
