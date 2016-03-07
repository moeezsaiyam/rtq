
$(document).ready(function() {
  if($('#editor').length > 0)
    CKEDITOR.replace( 'editor',
      {
        toolbar :
        [
          { name: 'basicstyles', items : [ 'Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat' ] },
          { name: 'paragraph', items : [ 'BulletedList', 'NumberedList' ] },
          { name: 'document', items : [ 'NewPage', 'Preview' ] },
          { name: 'clipboard', items : [ 'Cut', 'Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
          { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
          { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
          { name: 'insert', items: [ 'Image' ] },
          { name: 'styles', items: [ 'Format', 'FontSize' ] },
          { name: 'colors', items: [ 'TextColor', 'BGColor' ] }
        ]
      });
    });

function toggleMe(truncated,full,more,less){
  var truncated_text=document.getElementById(truncated);
  var full_text=document.getElementById(full);
  var more_link=document.getElementById(more);
  var less_link=document.getElementById(less);
  if(!truncated_text || !full_text)
    return true;

  if(truncated_text.style.display=="none"){
    truncated_text.style.display="block"
    full_text.style.display = "none"
    more_link.style.display = "none"
    less_link.style.display = "block"
  }
  else
  {
    truncated_text.style.display="none"
    full_text.style.display="block"
    more_link.style.display = "block"
    less_link.style.display = "none"
  }
  return true;
};

