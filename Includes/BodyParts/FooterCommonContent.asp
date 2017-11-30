<!-- Start of FooterCommonContent -->	
	
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/respond.min.js"></script>
	<script src="/js/scripts.js"></script>
    <script src="/Website/Includes/Javascript/z2t_Functions.js"></script>
    <script src="/Website/Includes/Javascript/z2t_UserTrackingPost.js"></script>
	<script src="/Website/Includes/Javascript/z2t_Ajax.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="/js/jquery.vticker.min.js"></script>

<script>

$(document).ready(function(){
    $('ul.nav li.dropdown').hover(function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
    }, function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
    });  
	
	$('li.dropdown :first-child').on('click', function() {
		var $el = $(this).parent();
		if ($el.hasClass('open')) {
			var $a = $el.children('a.dropdown-toggle');
			if ($a.length && $a.attr('href')) {
				location.href = $a.attr('href');
			}
		}
	});	

	var url = window.location;
	
	$('ul.dropdown-menu a').filter(function() {
		return this.href == url;
	}).parent().parent().parent().addClass('active');

	$('ul.nav li.dropdown a').filter(function() {
		return this.href == url;
	}).parent().addClass('active');
	
});

</script>
			
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/blitzer/jquery-ui.min.css">
<link type="text/css" href="/Website/Includes/CSS/z2t_additional.css" rel="stylesheet" media="screen">
<script>
  $( function() {
    $( "#dialog-form, #dialog-form2" ).dialog({
      	autoOpen: false
    });
    fillZipInput();
	function getUrlParameter(sParam) {
	    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;

	    for (i = 0; i < sURLVariables.length; i++) {
	        sParameterName = sURLVariables[i].split('=');

	        if (sParameterName[0] === sParam) {
	            return sParameterName[1] === undefined ? true : sParameterName[1];
	        }
	    }
	};
	function fillZipInput() {
		var inputZip = getUrlParameter('inputZip');
		var url = window.location.href;
		if (inputZip != undefined && url.indexOf('z2t_lookup.asp') != -1)
		{
			var loggedin = $('#loggedin').val();
			if (inputZip.length>5&&(inputZip=inputZip.substr(0,5)),5==inputZip.length)
				$('#inputZip').val(inputZip);
			else
				alert("Zip Code Must Contain 5 Characters");
			if (loggedin != "True")
			{
				$( "#dialog-form" ).dialog("open");
			}
		}
	}
    $("#lookupOpener,#lookupOpener2").on( "click", function() {
    	$('.modal-backdrop').remove();
    	$('<div class="modal-backdrop" style="opacity: 0.6; background-color: #FFF;"></div>').appendTo(document.body);
      $( "#dialog-form" ).dialog( "open" );
      $('#dialog-form').parent().css('z-index', 1100);
    });
    $( "#showSignUp" ).on( "click", function() {
    	$('.modal-backdrop').remove();
    	$('<div class="modal-backdrop" style="opacity: 0.6; background-color: #FFF;"></div>').appendTo(document.body);
      $( "#dialog-form" ).dialog( "close" );
      $( "#dialog-form2" ).dialog( "open" );
      $('#dialog-form2').parent().css('z-index', 1100);
    });
    $( "#showLogin" ).on( "click", function() {
    	$('.modal-backdrop').remove();
    	$('<div class="modal-backdrop" style="opacity: 0.6; background-color: #FFF;"></div>').appendTo(document.body);
      $( "#dialog-form2" ).dialog( "close" );
      $( "#dialog-form" ).dialog( "open" );
      $('#dialog-form').parent().css('z-index', 1100);
    });
    $('.ui-dialog-titlebar-close').click(function(e) {
    	$('.modal-backdrop').remove();
    })
  } );
  </script>  
<div id="dialog-form" title="Please log in to your account">
     <fieldset>
      <label for="ftUsername">Username</label>
      <input type="text" name="ftUsername" id="ftUsername" class="text ui-widget-content ui-corner-all">
      <label for="ftPassword">Password</label>
      <input type="password" name="ftPassword" id="ftPassword" class="text ui-widget-content ui-corner-all">
	  <div class="text-center"><button type="button" class="btn btn-danger" onclick="ftLoginNew();">submit</button></div>
    </fieldset>
	<div class="clearfix"></div>
	<hr style="margin:auto; width: 90%; text-align: center; color: #B0161E;"> <!-- size: 4px -->
	<div class="text-center">
		<h3>Don't have an account? </h3>
	</div>
	<div class="text-center"> 
		<a style=" color:#4F8FAF; text-decoration:none; font-size:18px; cursor:pointer" id="showSignUp"> Sign up for a free trial here</a>
	</div>
</div>

<div id="dialog-form2" title="Sign Up">
	<div  class="text-center"><small>If you do not have an account, please provide the information below.</small></div>
    <hr style="margin:auto; width: 90%; text-align: center; color: #B0161E;"> 
	 <fieldset>
      <label for="FirstName">First Name</label>
      <input type="text" name="FirstName" id="FirstName" class="text ui-widget-content ui-corner-all">
      <label for="Email">Email</label>
      <input type="text" name="Email" id="Email" class="text ui-widget-content ui-corner-all">
	  <div class="text-center"><button type="button" class="btn btn-danger" onclick="SubmitFreeTrialInitialSingup();">submit</button></div>
    </fieldset>
	<div class="clearfix"></div>
	<hr style="margin:auto; width: 90%; text-align: center; color: #B0161E;"> 
	<div class="text-center"> 
		<a style=" color:#4F8FAF; text-decoration:none; font-size:18px; cursor:pointer" id="showLogin">Already have an account? </a>
	</div>
</div>
	


                   
                      
                   
                   
                   
                    <div id="ThankyouPopup" class="NoPrint">
						<!-- Popup Div Starts Here -->

					 <div id="popupFreeTrialSecondlevel2" style="max-width: 365px !important;">
						<!-- Contact Us Form -->
						<img id="close2" src="/Website/Images/popupcancel.png" alt="Free trial close" onclick ="div_hide(3)">
						<span style="color:red;" > Thank You! </span>
            			<br/>  <br/>
                        <span style="color:red">
                        Please check your email for your Username and Password.
                        </span>
            			<br/>  <br/>                        
		            	<div>
                     	   If you do not receive your email shortly, check your SPAM folder for mail from "info@Zip2Tax.com"
                           or call us at 1-866-492-8494, Monday - Friday 8am - 5pm EST.
	                    </div>
						
					</div>
						<!-- Popup Div Ends Here -->
                   </div>
                   <%
					   If Session("FreeTrialInterimLogin") = "Interim" and Session("FreeTrialInterimSignupAllowTemp") <> "1"   Then
					  %>
                   <div id="InterimSignupPopup" style="z-index: 1000; background-color: rgba(255,255,255,0.6);">
						<!-- Popup Div Starts Here -->
							<div id="popupFreeTrialSecondlevelinterm">
                            
                             <h2  class="titleloginbox titleposition">Free Trial Signup</h2>
                            
                            	
								
                         		
							<!-- Left Side Form -->
                            <table>
                            	<tr>
                                	<td>
                            
                            	<div style="display:inline; width:60%"> 
								
			            		<div class="ftintlbldivfirst"     >
									<label class="ftinterimlb"> First Name: </label> &nbsp;
                                    <span style="color:black !important; display:inline">
											<%=Session("FirstName")%>
                                    </span>           
			            		</div>
			            		<!--div  >
									<input id="ftintFirstName" name="ftintFirstName" class type="text">
			            		</div-->
            					
			            		<div class="ftintlbldiv"    >
            						<label class="ftinterimlb"> Last Name:</label>
			            		</div>
            					<div  >
									<input id="ftintlname" name="ftintlname" style="margin-top: 4px;" type="text">
			            		</div>
                                
                                <div  class="ftintlbldiv"    >
            						<label class="ftinterimlb"> Title:</label>
			            		</div>
            					<div  >
									<input id="ftinttitle" name="ftinttitle" style="margin-top: 4px;" type="text">
			            		</div>
                               <div  class="ftintlbldiv"    >
            						<label class="ftinterimlb"> Company Name:</label>
			            		</div>
            					<div  >
									<input id="ftintcompanyname" name="ftintcompanyname" style="margin-top: 4px;" type="text">
			            		</div>
                               <div  class="ftintlbldiv"     >
            						<label class="ftinterimlb"> Phone:</label>
			            		</div>
            					<div  >
									<input id="ftintphone" 
                                    		name="ftintphone" 
                                    		maxlength="14" 
                                            
                                            style="margin-top: 4px;" 
                                            type="text">
			            		</div>
                                
                                </div> <!-- Left Side Form End -->
                                </td>
                                <td style="padding-right: 20px; padding-top: 22px;  padding-left: 20px; vertical-align: text-top;">
                                
                                <div style="display:inline; width:40%; "> <!-- Right Side instruction and submit button -->
                                
                                	Please provide the following information to access the full features of our FREE Trial Lookup.
			            		
								<a href="javascript:SubmitFreeTrialInterimSingup();" 
                                	 class="redButton w80"  
                                     id="submit2" 
                                     style="margin-top: 51px; margin-bottom: 0px;">
                                    submit
                                </a>
                                </div>
                                
                                </td>
                               </tr>
                               </table>
							</div>
						<!-- Popup Div Ends Here -->
                   	</div>
                   	<% End If%>
                   	<div id="passwordRecoveryPopup">
					<!-- Popup Div Starts Here -->
						<div id="popupFreeTrialSecondlevel">
						<!-- Contact Us Form -->
							<img id="close" src="/Website/Images/popupcancel.png" alt="Zip2Tax Password recovery close" onclick ="div_hide(5)">
							<span class="blackheading" >Password recovery</span>
							<br/>  <br/>
							<div   style="display:block" >
								Please provide your registered email to verify and send password.        
							</div>
							<br/>
							<hr style="margin:auto; width: 90%; text-align: center; color: #B0161E;"> <!-- size="4px" -->
															
							<div   style="display:inline;" >
								<label class="ftlabelemail" style="display: inline-block;"> Email:</label>
								<input id="passrEmail" name="passrEmail" style="margin-top: 4px; display: inline-block;" type="text">
							</div>
							<br/>
							<a href="javascript:SubmitPasswordRecovery();" 
								 class="redButton w80"  
								 id="submit" 
								 style="margin-top: 7px; margin-bottom: 7px;">
								submit
							</a>
							
						   
						</div>
					<!-- Popup Div Ends Here -->
				</div>	
<script type="text/javascript">

		function LookupORLoginBox(){
                                 			
   				<% If Session("z2t_loggedin") = "True"  Then %>
              		clickLookup();
               
                 <% Else %>
                 
                div_show(1);                    
              			
                 <% End If %> 
		}
                
	</script>    	
<!-- End of FooterCommonContent -->
	