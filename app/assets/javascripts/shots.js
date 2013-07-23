$(document).ready(function(){
	$('#create_shot').hide();
   $('#new_shot').click(function(){
      $('#create_shot').toggle();
   });
   
   $('#assigned_user_tooltip').on('mouseover', function(){
   	
     	 $('#assigned_user_tooltip').tooltip('toggle');

   });                                  
   $('.shot_details_row #Shot_number').on('click', function(){
       var retrieveId = $(this).data('id');
      $("#shot_show_page_" + retrieveId ).modal('show');
   });
});

