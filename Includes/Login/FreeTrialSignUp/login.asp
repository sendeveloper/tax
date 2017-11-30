<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "htt p://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Free Trial Login</title>
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
</style>
</head>

<body onLoad="SetScreen(620,450);" >
<table bordercolor="#B0161E" width="98%" height="277px;" style="border-radius:26px; font-family:'Trebuchet MS', Arial, Helvetica, sans-serif" border="3px" cellpadding="0px" cellspacing="0px">
<tr>
<td style="border:0px; text-align:center;">

	<table width="100%" height="277px" border="0px" >
		<tr>
			<td colspan="2" style="font-size: 30px; font-weight:bold;">
				Please log in to your account
             </td>
         </tr>
         <tr>
         	<td class="labellogin">Username:</td>
            <td><input type="text" class="txtlogin" name="UserName" id="UserName" /></td>
         </tr>   
         
         <tr>
         	<td class="labellogin">Password:</td>
            <td><input type="password" class="txtlogin" name="UserPassword" id="UserPassword" /></td>
         </tr>   
		<tr>
         	<td colspan="2"><input class="redButton" style=" width:158px;  height:34px;" type="submit" value="Submit" id="btnsubmit" /></td>
         </tr>  
         <tr>
         	<td colspan="2" style= "text-align:center;" >
            	<div >
	             <hr width="90%" align="center" color="#B0161E" size="4px" style="margin:auto;">
                </div>
             </td>

		<tr>
         	<td colspan="2" > 
            		<div  style="color:#B0161E; font-weight:bolder; font-size: 28px; display:none;" >
					            Username or password is incorrect
                     </div>
                    
                     <div  style="font-weight:bolder; font-size: 28px;" >
					            Don't have an account?
                     </div>
             </td>
         </tr>               


		<tr>
         	<td colspan="2" > 
            		<div style="color:#4F8FAF;  font-size:30px; display:none;" >
					           Need help logging in?
                     </div>
                     
                     <div style="color:#4F8FAF;  font-size:30px;" >
                     <a href="javascript:openPopUp('/Website/Includes/Login/FreeTrialSignUp/initial_signup.asp');window.close();" style="color:#4F8FAF;">
                               	Sign up for free here
                                </a>
                     </div>
                     
             </td>
         </tr>               

	</table>


</td>
</tr>
</table>

</body>
</html>
