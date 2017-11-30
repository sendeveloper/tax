<div class="row" style="padding: 15px 30px 15px">
	<div class="col-sm-5 login_page_module" style="border-right: 1px solid #CCC;">
		<h3 class="large-h3">
			<span style="color: #F00">
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
			</span>
			Returning Customer?
		</h3>
		<div class="col-sm-9 col-sm-offset-2">
		<%
	Function DisplayCompanyName()

	    Dim loginBox_haAccountInfo

	    DisplayCompanyName = "nbsp;"
	    
		If Session("z2t_DisplayName") > "" Then
			DisplayCompanyName = Session("z2t_DisplayName")
		Else
			If Session("ha_AccountID") <> 0 Then
				Set loginBox_haAccountInfo = GetHAAccountInfo(Session("ha_AccountID"))
				DisplayCompanyName = loginBox_haAccountInfo.Organization
			End If
		End If
			
	End Function
	%>
	<script type="text/javascript">
	function clickLoginNew() {
		//alert('<%="http://" & request.servervariables("server_name") &  request.servervariables("script_name")%>');
		
	  if (document.getElementById('z2tLogin').value == '' && document.getElementById('z2tPassword').value == '') {
	    document.getElementById('z2tLogin').focus();
	    return;}

	  if (document.getElementById('z2tLogin').value == '') {
	    document.getElementById('z2tLogin').focus();
	    alert('Please enter your User Name');
	    return;}

	  if (document.getElementById('z2tPassword').value == '') {
	    document.getElementById('z2tPassword').focus();
	    alert('Please enter your Password');
	    return;}
		

		var URL2 = '<%="http://" & request.servervariables("server_name") &  request.servervariables("script_name")%>' +
			'?lname=' + document.getElementById('z2tLogin').value +
			'&pass=' + document.getElementById('z2tPassword').value;
		location.href = URL2;

		}
	</script>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
						 <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Login
						</h3>
					</div>
					<div class="panel-body">
	<% If Session("z2t_loggedin") = "" Then%>
						<form class="form-horizontal smallFonts" Method="post" Action="/index.asp">
						  <fieldset>
							<div class="form-group">
							  <label for="z2tLogin" class="col-lg-4 control-label">Username</label>
							  <div class="col-lg-8">
								<input type="text" class="form-control" NAME="z2tLogin"  id="z2tLogin" placeholder="Username" required>
							  </div>
							</div>
							<div class="form-group">
							  <label for="z2tPassword" class="col-lg-4 control-label">Password</label>
							  <div class="col-lg-8">
								<input type="password" class="form-control" id="z2tPassword" NAME="z2tPassword" placeholder="Password">
								 <span class="help-block"><a href="javascript:passwordRecoveryPopup();">Forgot your password?</a></span>
							  </div>
							</div>		
							<div class="form-group">
								  <div class="col-lg-12 text-right">
									<button type="button" class="btn btn-danger" onclick="clickLoginNew();">Submit</button>
								  </div>
								</div>
						  </fieldset>
						</form>						
						Having trouble? <br>
						Call 1-866-492-8494 for help.
	<%else%>
						<table width="100%" border="0" cellspacing="2" cellpadding="0">
							<tr>
							  <td align="center" colspan="2">
								<% Response.Write DisplayCompanyName() %> 
							  </td>
							</tr>

							<tr>
							  <td colspan="2" class="text-center">
								<a href="javascript:clickLogout();" class="btn btn-danger">Log Out</a>
							  </td>
							</tr>

							<tr>
							  <td align="center" colspan="2" style="color: red;">
								<b><%=Session("LoginErrorPassive")%></b>
							  </td>
							</tr>
						</table>					
	<%end if%>
					</div>
				</div>
				
				<div id="passwordRecoveryPopup" style="display:none;">
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

				
				<!-- Sign up Part 2 start -->
	 <%
					   If Session("FreeTrialInterimLogin") = "Interim" and Session("FreeTrialInterimSignupAllowTemp") <> "1"   Then
					  %>
					   <div id="InterimSignupPopup" style="display:block; ">
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
	                  <% Else%>
	                  
	                  
	                     <div id="InterimSignupPopup" style="display:none; ">
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
		</div>
	</div>
	<div class="col-sm-7" style="z-index: -1;">
		<h3 class="large-h3">
			<span style="color: #F00">
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
			</span>
			New to Zip2Tax?
		</h3>
		<div class="col-sm-6 col-sm-offset-2" style="text-align: center;">
			<p style="text-align: left; font-size: 125%; font-weight: 700; line-height: 1.2;">
				Check out some of our products that will make Sales and Use tax a breeze!
			</p>
			<a class="green-btn-sm" href="/Website/pagesProducts/z2t_services_online_lookup.asp" onclick="ga('send', 'event', 'API Leads', 'Button Interaction', 'apibuttonclicked');" style="background-color: #98e428;
					color: #fff;
					padding: 16px 16px;
					border-radius: 16px;
					font-weight: bold;
					text-transform: uppercase;
					font-size: 23px;
					text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.52);
					white-space: nowrap;">
					GET STARTED</a>
		</div>
	</div>
</div>