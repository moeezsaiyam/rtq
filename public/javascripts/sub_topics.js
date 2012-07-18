$(document).ready(function(){
  $(".del_topic_image").click(function(){
    id = $(this).attr("id");
    topic_id = $(this).attr("rel");
    target_url = "/topics/" + topic_id + "/sub_topics/" + id;
    $.ajax({
      url: target_url,
      type: 'PUT',
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
  $('table.table-subtopics tbody').sortable({handle : '.sort-handle'});
});

