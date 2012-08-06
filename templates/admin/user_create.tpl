﻿<!-- user_create.tpl -->

<script language="JavaScript" type="text/javascript">

var firstTimeUserNameFlag = true;
var firstTimeEmailFlag = true;
var firstTimePasswordFlag = true;
var my_base_url="{$my_base_url}{$my_pligg_base}";
var error=false;
var UserNameAjaxUrl= my_base_url+'/checkfield.php';

{literal}

function checkValidation(){

	username=$("#username").val();
	email=$("#email").val();
	password=$("#password").val();
	
	
	
     //for username
	 checkUsername(username);
     checkEmail(email);
	 checkPassword(password);
   
  	 

	if(username=="")
	{
		error=true;
	
	}
	
	if(email=="")
	{
		error=true;
	
	}
	
	if(password=="")
	{
	
		error=true;
	
	}
	
	
	if(error==false){
	 return true;
	}else
	 return false;
	
}


function checkUsername(val){
	
	if(firstTimeUserNameFlag)
	{
	   $(".username").append("<span class='error'></span>");
	   firstTimeUserNameFlag = false;
	}
	
	pdata='type=username&name='+val;
	 $.ajax({
	 type: 'POST',
	 data: pdata,
	 url: UserNameAjaxUrl,
	 beforeSend: function() {
				$('.username .error').addClass("loader");
			},
	 success: function(data) {
	 $('.username .error').removeClass("loader");	 
	 $('.username .error').html(data);
	 	 if(data!="OK")
		  error=true;
		 else
		  error=false;
	  }
	 }); 
	 
}
	 function checkEmail(val){
		
		if(firstTimeEmailFlag)
		{
		$(".email").append("<span class='error'></span>");
		firstTimeEmailFlag = false;
		} 
		 
		pdata='type=email&name='+val;
		 $.ajax({
		 type: 'POST',
		 data: pdata,
		 url: UserNameAjaxUrl,
		 beforeSend: function() {
				$('.email .error').addClass("loader");
			},
		 success: function(data) {
		 $('.email .error').removeClass("loader");	 
		 $('.email .error').html(data);
			 if(data!="OK")
			  error=true;
			 else
			  error=false; 
			}
		 }); 
	 
   }
   
   
   function checkPassword(val){
	 
	if(firstTimePasswordFlag)
	{
	$(".password").append("<span class='error'></span>");
	firstTimePasswordFlag = false;
	}
	
	   
	 pdata='type=password&name='+val;
	 $.ajax({
	 type: 'POST',
	 data: pdata,
	 url: UserNameAjaxUrl,
	 beforeSend: function() {
				$('.password .error').addClass("loader");
			},
	 success: function(data) {
	 $('.password .error').removeClass("loader");	 
	 $('.password .error').html(data);
	 
		 if(data!="OK"){
		  error=true;
		 }else
		  error =false; 
		}
	 }); 
	 
   }

	
{/literal}	
</script>
	
	<!-- JDR: our modal window -->
	<div id="createUserForm-modal"  class="modal hide fade" >
	<div class="modal-header">
	<button class="close" data-dismiss="modal">&times;</button>
		<h3>{#PLIGG_Visual_AdminPanel_New_User#}</h3>
	</div>
     <form action="admin_users.php" method="post" id="createUserForm" class="form" onsubmit="return checkValidation()">
    <div class="modal-body">	
        
		
		<!-- JDR: our form, no buttons (buttons generated by jQuery UI dialog() function) -->
	   
			{$hidden_token_admin_users_create}
			<label for="username">{#PLIGG_Visual_Register_Username#}:</label>
			<div class="div_texbox username">
				<input name="username" type="text" class="textbox" id="username" value=""  onchange="checkUsername(this.value)" />
			</div>
			
			<div style="clear:both;"></div>
			<label for="email">{#PLIGG_Visual_Register_Email#}:</label>
			<div class="div_texbox email">
				<input name="email" type="text" class="textbox" id="email" value="" onchange="checkEmail(this.value)"/>
			</div>
			<div style="clear:both;"></div>
			<label>{#PLIGG_Visual_View_User_Level#}:</label>
			<div class="div_texbox">
				<select name="level">
					<option value="normal">Normal</option>
					<option value="moderator">Moderator</option>
					<option value="admin">Admin</option>
				</select>
			</div>
			<div style="clear:both;"></div>
			<label for="password">{#PLIGG_Visual_Register_Password#}:</label>
			<div class="div_texbox password">
				<input name="password" type="text" class="textbox" id="password" value=""   onchange="checkPassword(this.value)"/>
			</div>
			
			<div style="clear:both;"></div>
			<div class="buton_div">
				<input type="hidden" name="mode" value="newuser">
				
			</div>
		
	</div>
    <div class="modal-footer">
								<a href="#" class="btn" data-dismiss="modal" >Close</a>
							<input type="submit" class="btn btn-primary" value="Create User"/>
	</div>
    </form>
    </div>

	<!--/user_create.tpl -->