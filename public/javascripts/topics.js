$(document).ready(function(){
  $("#del_topic_image").click(function(){
    id = $(this).attr("rel");
    target_url = "/topics/update/" + id;
    $.ajax({
      url: target_url,
      type: 'POST',
      data: { photo_name: ""},
      success: function(response){
        if(response == "success")
          $("form img").remove();
      }
    });
    return false;
  });
});

$(document).ready(function() { 
  $('table.table-topics tbody').sortable({handle : '.sort-handle'});
});   

