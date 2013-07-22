$(document).ready(function(){
	 $('#create_shot').hide();
   $('#new_shot').click(function(){
      $('#create_shot').toggle();
   });
   $('#assigned_user_tooltip').on('mouseover', function(){
   	
     	 $('#assigned_user_tooltip').tooltip('toggle');
   });
   $('#Shot_number').on('click', function(){
   	alert(0);
   });
});

