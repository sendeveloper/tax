<!-- Google Remarketing Code for Main list -->
	<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. 
	For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->
	<script type="text/javascript">
		/* <![CDATA[ */
		var google_conversion_id = 1052565426;
		var google_conversion_label = "gZqsCLTU0QMQsr_z9QM";
		var google_custom_params = window.google_tag_params;
		var google_remarketing_only = true;
		/* ]]> */
	</script>
	<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
	</script>
<!-- end remarketing main list -->


<div id="footer" style="width: 1200px !important">
  <div align="center" class="NoScreen">

    <hr>
    <span class="footer-large">
      Zip2Tax, LLC
      <span class="footer-small">1740H Dell Range Blvd #449 -- Cheyenne, WY 82009</span>
      Toll Free 1-866-492-8494
    </span>	
	<hr>

  </div>
  
  <div class="NoPrint">
    <div class="footerwrap">
      <% bottomMenu = True %>
      <!-- #include virtual="/website/includes/bodyParts/Menus/footer_content_menu.asp" -->
      <br>
    </div><!-- footerwrap -->
    <hr>
    <p style="width: 1100px">
      <strong>Terms of service: </strong>At Zip2Tax,  your security and confidentiality are our highest priority. We will
      never share  your e-mail address or any other personally identifiable information (PII) with  any other
      person or company. Please review our full
      <a href="/Website/pagesExtra/z2t_privacypolicy.asp" target="_blank">privacy policy</a>.
      <strong>License:</strong> Please refer to our
      <a href="/Website/pagesExtra/z2t_eula.asp" target="_blank">end user license agreement</a>.
     <strong>Cancellation and Refund Policy:</strong> Please refer to our
      <a href="/Website/pagesExtra/z2t_refundpolicy.asp" target="_blank">refund policy</a> prior to purchase.
    </p>
    <hr>
    <center>Copyright &copy; 2006-<% Response.Write Year(now) %> 
    Zip2Tax, LLC. All rights reserved. 
    Zip2Tax and Spot-On are trademarks of Zip2Tax, LLC, reg. pending  U.S. Pat. &amp; Tm. Off., S/N 86/613550 and 86/613547.
    </center>

  </div><!-- NoPrint -->

  <div align="center" class="NoScreen"></div>

  <div class="NoPrint">
    <table width="1140px" border="0" cellspacing="10" cellpadding="10" style="height: 70px; vertical-align: middle;">
      <tr>
        <td>
		
		<!--
		  <a href="http://www.quantcast.com/zip2tax.com" target="_blank">
		  <img border="0" height="43" width="88" src="//widget.quantcast.com/user/widgetImage?domain=zip2tax.com&amp;widget=2" alt="Quantcast">
		  </a>
		-->
		  
			<!-- Quantcast Tag -->
			<script type="text/javascript">
			var _qevents = _qevents || [];

			(function() {
			var elem = document.createElement('script');
			elem.src = (document.location.protocol == "https:" ? "https://secure" : "http://edge") + ".quantserve.com/quant.js";
			elem.async = true;
			elem.type = "text/javascript";
			var scpt = document.getElementsByTagName('script')[0];
			scpt.parentNode.insertBefore(elem, scpt);
			})();

			_qevents.push({
			qacct:"p-2df0ATjdz9mQk"
			});
			</script>

			<noscript>
			<div style="display:none;">
			<img src="//pixel.quantserve.com/pixel/p-2df0ATjdz9mQk.gif" border="0" height="1" width="1" alt="Quantcast"/>
			</div>
			</noscript>
			<!-- End Quantcast tag -->
			
			<!-- GoDaddy Certificate Seal -->
			<span id="siteseal"><script async type="text/javascript" 
				src="https://seal.godaddy.com/getSeal?sealID=wQHAJIHBeV2ScTR5Qd2iqCo6mqkRjTetCKcosGIfhD032VvKSIXAi5AmjboO"></script>
		</span>		

          
        </td>
		
		<span id="siteseal"><script async type="text/javascript" 
			src="https://seal.godaddy.com/getSeal?sealID=wQHAJIHBeV2ScTR5Qd2iqCo6mqkRjTetCKcosGIfhD032VvKSIXAi5AmjboO"></script>
		</span>		

        <td><img src="/Website/Images/credit_cards.png" alt="cards" width="307" height="33" align="middle"></td>

<%
   If Session("activePage") = "LookupXXX" And cAdministrator <> "" Then
    If (GetUserSubscriptions(Session("z2t_UserName")).IsSubscribed(cAdministrator)) Then
%>
	    <td>
	    
		<table>
	      <tr>
	        <td class="admin-test" style="padding-left: 20em;">
	          <a href="javascript:void(window.location='http://www.zip2tax.com/z2t_lookup.asp?debugerror=daily max')" style="white-space: nowrap;">Max Daily </a>
	          <a href="javascript:void(window.location='http://www.zip2tax.com/z2t_lookup.asp?debugerror=total max')" style="white-space: nowrap;">Max Total</a>
	        </td>
<%
    End If
  End If
%>
            <td>
             <!-- Commented By Humair- Cookie cleanup task- 27 July 2016 TrackingID:
              <script type="text/javascript" language="javascript">
                document.write('<a href="javascript:openPopUp(\'<%'=pathIncludes%>bodyParts/PopUps/EnterCode.asp\');"><%'=Session("z2t_TrackingID")%><\/a>')
              </script>
              <noscript>
                <a href="/Website/Includes/bodyParts/PopUps/EnterCode.asp"><%'=Session("z2t_TrackingID")%></a><br>
              </noscript><br>
              Remaining Session Timout: <%'=Session.Timeout%>
              <script type="text/javascript" language="javascript">
                document.write('<a href="javascript:openPopUp(\'<%'=pathIncludes%>bodyParts/PopUps/EnterCode.asp\');"><%'=Session("CookieID")%><\/a>')
              </script>
              <noscript>
                <a href="/Website/Includes/bodyParts/PopUps/EnterCode.asp"><%'=Session("CookieID")%></a><br>
              </noscript><br>
                            Remaining Session Timout: <%'=Session.Timeout%><br/>
             End Humair Comment-->

              IP Address: <%=Request.ServerVariables("REMOTE_ADDR")%><br>
              JavaScript: <span id='JavaScriptTest'>Fail</span><br>
			  WS<%=strWebService%>/DB<%=strDatabase%>/<%=CreditCardProcessing%>
            </td>
<%
  If Session("activePage") = "Lookup" Then
%>

	      </tr>
	    </table>
<%
  End If
%>

	<!-- #include virtual="/website/includes/bodyParts/footer_debug_information.inc" -->	
	
	</table>
  </div>
</div>
<%
    Session("LoginErrorUrgent") = ""
%>


             



<!-- END NEWSLETTER BOX -->

 <div id="LoginPopup">
						<!-- Login Popup Div Starts Here -->
					<div id="popupFreeTrialSecondlevel">
						<!-- Contact Us Form -->
						<img id="close" src="/Website/Images/popupcancel.png" onclick ="div_hide(1)">
						<span class="blackheading" >Please log in to your account </span>
            			<br/>  <br/>
			            <div   style="display:inline;" >
							<label class="ftlabellogin"> Username:</label>           
			            </div>
			            <div  style="display:inline;">
							<input id="ftUsername" name="ftUsername" class type="text">
			            </div>
            			<br/>
			            <div   style="display:inline;" >
            				<label class="ftlabelpassword"> Password:</label>
			            </div>
            			<div  style="display:inline;">
							<input id="ftPassword" name="ftPassword" style="margin-top: 4px;" type="password">
			            </div>
			            <br/>
						<a href="javascript:ftLogin()" class="redButton w80"  id="submit" style="margin-top: 7px; margin-bottom: 7px;">submit</a>
			            <hr width="90%" align="center" color="#B0161E" size="4px" style="margin:auto;">            
            			<div class="blackheading" >Don't have an account? </div>
			            <div class="heading" > 
                        	<a style=" color:#4F8FAF; text-decoration:none;"
                        	  href="javascript:FreeTrialInitialSingup();">
                              Sign up for a free trial here
                             </a>
                         </div>
                         
                         
					</div>
						<!-- Popup Div Ends Here -->
                   </div>
                   
                      <div id="InitialSignupPopup">
						<!-- Popup Div Starts Here -->
							<div id="popupFreeTrialSecondlevel">
							<!-- Contact Us Form -->
								<img id="close" src="/Website/Images/popupcancel.png" onclick ="div_hide(2)">
								<span class="blackheading" >Sign Up </span>
            					<br/>  <br/>
                        		<div   style="display:block" >
									If you do not have an account, please provide the information below.        
			            		</div>
                        		<br/>
                         		<hr width="90%" align="center" color="#B0161E" size="4px" style="margin:auto;">  
                         		<br/>
			            		<div   style="display:inline;" >
									<label class="ftlabelfname"> First Name:</label>           
			            		</div>
			            		<div  style="display:inline">
									<input id="FirstName" name="FirstName"  type="text">
			            		</div>
            					<br/>
			            		<div   style="display:inline;" >
            						<label class="ftlabelemail"> Email:</label>
			            		</div>
            					<div  style="display:inline;">
									<input id="Email" name="Email" style="margin-top: 4px;" type="text">
			            		</div>
			            		<br/>
								<a href="javascript:SubmitFreeTrialInitialSingup();" 
                                	 class="redButton w80"  
                                     id="submit" 
                                     style="margin-top: 7px; margin-bottom: 7px;">
                                    submit
                                </a>
			            		<hr width="90%" align="center" color="#B0161E" size="4px" style="margin:auto;"> <br/>           
            					<div class="heading" >
                        	 		<a style=" color:red; text-decoration:none;" 
                             	 		href="javascript:FreeTrialLogin();">
                                 		Already have an account?  
                             		</a>
                        		</div>
                                
                               
							</div>
						<!-- Popup Div Ends Here -->
                   	</div>
                   
                   
                   
                    <div id="ThankyouPopup">
						<!-- Popup Div Starts Here -->

					 <div id="popupFreeTrialSecondlevel" style="max-width: 365px !important;">
						<!-- Contact Us Form -->
						<img id="close" src="/Website/Images/popupcancel.png" onclick ="div_hide(3)">
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
                   
<script type="text/javascript">

		function LookupORLoginBox(){
                   
			// Humair - 19 Jully 2016, Called in z2t_function.js keyPressNumbersOnly and keyPress 
			//which applies on "Look up the Tax" on right side bar 
	 	   // If user is logged in take user to lookup page otherwise show login box
              			
   				<% If Session("z2t_loggedin") = "True"  Then %>
              		clickLookup();
               
                 <% Else %>
                 
                div_show(1);                    
              			
                 <% End If %> 
		}
                
	</script>                                   