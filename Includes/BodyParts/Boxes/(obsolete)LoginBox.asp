<!-- START LOGIN BOX -->
<div class="NoPrint">

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

    If Session("z2t_loggedin") = "" Then
%>

  <div id="loginbox" class="box">
    <h2 class="title">Login</h2>
    <div class="content">
      <Form Method="post" Action="index.asp" Name="frm">
        <table width="100%" border="0" cellspacing="2" cellpadding="0">
          <tr>
            <td align="center" colspan="2" style="color: red;">
              <%=Session("LoginErrorPassive")%> 
            </td>
          </tr>

          <tr>
            <td width="50%" align="right">
              Username: 
            </td>
            <td width="50%" align="left">
              <INPUT TYPE="text" size="10"  NAME="z2tLogin" ID="z2tLogin" onKeyPress="return keyPress(this, event);">
            </td>		 
          </tr>

          <tr>
            <td align="right">
              Password:
            </td>
            <td align="left">
              <INPUT Type="password" size="10" NAME="z2tPassword" ID="z2tPassword" onKeyPress="return keyPress(this, event);">
            </td>
          </tr>

          <tr>
            <td>&nbsp;</td>
            <td align="left">
              <a href="javascript:clickLogin();" class="redButton w80">Submit</a>
            </td>
		  </tr>
          
          <tr>
            <td align="right" colspan="2" style="font-size: 11px;">
              <a href="javascript:passwordRecoveryPopup();">Forgot your password?</a>
            </td>
		  </tr>


          <tr>
            <td align="left" colspan="2" style="font-size: 11px;">
              Having trouble? <br /> Call <b>1-866-492-8494</b> for help.
            </td>
		  </tr>

        </table>

      </Form>
    </div><!-- content -->
  </div><!-- loginbox -->
  
  
  
  
  <!--  Forgot password Start -->
  
  
  <div id="passwordRecoveryPopup" style="display:none;">
						<!-- Popup Div Starts Here -->
							<div id="popupFreeTrialSecondlevel">
							<!-- Contact Us Form -->
								<img id="close" src="/Website/Images/popupcancel.png" onclick ="div_hide(5)">
								<span class="blackheading" >Password recovery</span>
            					<br/>  <br/>
                        		<div   style="display:block" >
									Please provide your registered email to verify and send password.        
			            		</div>
                        		<br/>
                         		<hr width="90%" align="center" color="#B0161E" size="4px" style="margin:auto;">  
                         					            		
			            		<div   style="display:inline;" >
            						<label class="ftlabelemail"> Email:</label>
			            		</div>
            					<div  style="display:inline;">
									<input id="passrEmail" name="passrEmail" style="margin-top: 4px;" type="text">
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
                   
                   
  
  
<!-- Forgot password end  -->
  
  
  
  

<%
    Else
%>

  <div id="loginbox" class="box">
    <h2 class="title">Login</h2>
    <div class="content">
      <table width="100%" border="0" cellspacing="2" cellpadding="0">
        <tr>
          <td align="center" colspan="2">
            <% Response.Write DisplayCompanyName() %> 
          </td>
        </tr>

        <tr>
          <td width="50%">&nbsp;</td>
          <td width="50%" align="left">
            <a href="javascript:clickLogout();" class="redButton w80">Log Out</a>
          </td>
        </tr>

        <tr>
          <td align="center" colspan="2" style="color: red;">
            <b><%=Session("LoginErrorPassive")%></b>
          </td>
        </tr>

      </table>
    </div><!-- content -->
  </div><!-- loginbox -->

<%
    End If
%>


<!-- END LOGIN BOX -->

<!-- Sign up Part 2 start -->
 <%
				   If Session("FreeTrialInterimLogin") = "Interim" and Session("FreeTrialInterimSignupAllowTemp") <> "1"   Then
				  %>
				   <div id="InterimSignupPopup" style="display:block; ">
						<!-- Popup Div Starts Here -->
							<div id="popupFreeTrialSecondlevelinterm">
                            
                             <h2  class="titleloginbox titleposition">Free Trial Signup</h2>
                            
                            	
								
                         		
							<!-- Left Side Form -->
                            <table border="0" cellpadding="0" cellspacing="2px">
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
                                     id="submit" 
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
                            <table border="0" cellpadding="0" cellspacing="2px">
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
                                     id="submit" 
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
<!-- Sign up part 2 End -->


<!-- Top Box End -->
</div><!-- NoPrint -->