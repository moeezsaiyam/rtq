$(document).ready(function() {
  if($('#editor').length > 0)
    CKEDITOR.replace( 'editor',
	{
		toolbar :
		[
		  { name: 'basicstyles', items : [ 'Bold','Italic' ] },
		  { name: 'paragraph', items : ['BulletedList','NumberedList' ] },
		  { name: 'document', items : [ 'NewPage','Preview' ] },
		  { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		  { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
		]
	});
});

