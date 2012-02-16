// Drop Down Menu
$(document).ready(function(){
$(" #menu ul li ul ").css({display: "none"}); // Opera Fix
$(" #menu li").hover(function(){
  $(this).addClass("activeLink");
  $(this).find('ul:first').css({visibility: "visible",display: "none"}).show();
  },function(){
  $(this).removeClass("activeLink");
  $(this).find('ul:first').css({visibility: "hidden"});
  });
});