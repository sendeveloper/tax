
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


<%
    Session("activePage") = "Home"
    Session("currentPage") = "index.asp"
%>

<html>
  <head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Free Trial Sign Up</title>
<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	


 
<style>
.txtlogin{
	background-color: #808080;
    height: 29px;
	width:265px;
	font-size:20px;
	font-weight:bold;
    border-top: 3px inset;
    border-top-color: black;
    border-left: 3px inset;
    border-left-color: black;
    border-bottom: 3px inset;
    border-bottom-color: #CCCCCC;
    border-right: 3px inset;
    border-right-color: #CCCCCC;
	color:white;
	}
.labellogin{
	font-size: 20px;
    font-weight: bold;
    text-align: right;
	}
.btnsubmit{
	width: 157px;
    height: 30px;
    background-color: #B0161E;
    border-radius: 18px;
    color: white;
    font-size: 18px;
    font-weight: bold;
	}
.labelrec{
	color:red;
	font-size:20px;
	}


</style>


</head>

<body onLoad="SetScreen(620,500);" >

	<table width="100%"  border="0px"  align="center">
		<tr>
			<td colspan="2" style="font-size: 30px; font-weight:bold; text-align:center;">
				Sign up for free trial
             </td>
         </tr>
         <tr>
			<td colspan="2" style="font-size: 30px; font-weight:bold; text-align:center;">&nbsp;
				
             </td>
         </tr>
         
        <tr>
        	<td>
			<form action="FreeTrialSignupSubmit.asp" method="post" onsubmit="return validate_form(this)">
				<div  align="center">
					<table bordercolor="#B0161E" width="98%" height="100%" 
						style="border-radius:26px; font-family:'Trebuchet MS', Arial, Helvetica, sans-serif" 
						border="3px" cellpadding="0px" cellspacing="0px">
						<tr>
							<td style="border:0px; text-align:center;">

								<table width="100%"  border="0px" >
									
                                     <tr>
										<td colspan="2" style="font-size: 30px; font-weight:bold;">
										Free Trial Request
							             </td>
							         </tr>
                                     
                                     <tr>
										<td colspan="2" style="font-size: 30px; font-weight:bold;">&nbsp;
										
							             </td>
							         </tr>
							         <tr>
							         	<td class="labellogin">First Name:</td>
								            <td>
                                            	<input type="text" class="txtlogin" name="FirstName" id="FirstName" />
                                            	<span class="labelrec">*</span>
                                             </td>
									 </tr>   

         							 <tr>
							         	<td class="labellogin">Last Name:</td>
							            <td>
                                        	<input type="text" class="txtlogin" name="LastName" id="LastName" />
                                        	<span class="labelrec">*</span>
                                         </td>
         							 </tr>   
                                     
                                      <tr>
							         	<td class="labellogin">E-mail:</td>
							            <td>
                                        	<input type="text" class="txtlogin" name="Email" id="Email" />
                                            <span class="labelrec">*</span>
                                        </td>
							         </tr>   
                                     
							         <tr>
							         	<td class="labellogin">Company:</td>
							            <td>
                                        	<input type="text" class="txtlogin" name="Company" id="Company" />
                                            <span class="labelrec">&nbsp;</span>
                                        </td>
							         </tr>   
                                     
							        
                                     
        							 <tr>
							         	<td class="labellogin">Phone:</td>
							            <td>
                                        	<input type="text" class="txtlogin" name="Phone" id="Phone" />
                                        	<span class="labelrec">&nbsp;</span>
                                        </td>
							         </tr>
         
							         <tr>
							            <td  colspan="2">&nbsp;</td>
							         </tr>   
                                     
         							 <tr>
							         	<td colspan="2">
                                        	<input  class="redButton" 
                                            		style=" width:158px;  height:34px;" 
                                                    type="submit" 
                                                    value="Submit" 
                                                    id="btnsubmit" />
                                        </td>
         							 </tr>               

									 <tr>
         								<td colspan="2" > 
            								<div  style="color:#B0161E; font-weight:bolder; font-size: 28px; display:none;" >
					            				Phone is required 
                     						</div>
                     
             							</td>
         							 </tr> 
								</table>
							</td>
						</tr>
					</table>

				</div>
			</form>

		</td>
	</tr>
</table>
                                                                                         
</body>
<script type="text/javascript">
function validate_required(field,alerttxt){
with(field){
if (name.toLowerCase() == "gender" && value.toLowerCase() == "it's a secret") {
alert(alerttxt); return false;}else if(value==null||value==""){
alert(alerttxt);return false;}
else {return true;}}}
function validate_required_radio(fieldName,alerttxt){
 var checked =false; 
 var rdos=  document.getElementsByName(fieldName); 
 for (var x = 0; x < rdos.length; x++) { 
 checked = checked || rdos[x].checked; 
 } 
 if (!checked) { 
  alert(alerttxt); return false; } 
  else { return true; } 
     }
function validate_form(thisform){
with(thisform){
if(validate_required(FirstName,"First name is required")==false){
FirstName.focus();return false;}
if(validate_required(LastName,"Last name is required")==false){
LastName.focus();return false;}
if(validate_required(Email,"E-mail is required")==false){
Email.focus();return false;}
}}</script>
</html>
