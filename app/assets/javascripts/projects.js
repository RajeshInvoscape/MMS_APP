$(document).ready(function(){
	 $('#create_project').hide();
   $('.new_project').click(function(){
      $('#create_project').show();
   });

   $('#project_list #project_Edit_link').on('click', function(){
     var projectId = $(this).data('id');
   	$('#project_name_link_'+projectId).toggle();
    $('#edit_project_' + projectId).toggle();

   });
});

