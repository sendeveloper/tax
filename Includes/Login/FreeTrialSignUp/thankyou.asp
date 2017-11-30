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
<%
	Set conn=server.CreateObject("ADODB.Connection")
   'conn.Open "driver=SQL Server;server=dallas01.HarvestAmerican.net;uid=z2t_WebUser;pwd=WebUser_z2t;database=z2t_BackOffice"
   conn.Open "driver=SQL Server;server=philly01.HarvestAmerican.net,8143;uid=z2t_Subscription_Admin;pwd=get2subscriptions;database=z2t_Subscriptions_Interim"

	Set cmd = Server.CreateObject("ADODB.Command")


	cmd.CommandText = "z2t_Add_Subscriptions_InitialInfo"
	cmd.CommandType = 4
'        cmd.CommandTimeout = 10 '10 seconds

	Set param = cmd.CreateParameter("@Return", adInteger, adParamReturnValue)
	cmd.Parameters.Append param
	
	Set param = cmd.CreateParameter("@NameFirst", adVarChar, adParamInput)
	param.Value = request.Form("FirstName")
	cmd.Parameters.Append param

	Set param = cmd.CreateParameter("@Email", adVarChar, adParamInput)
	param.Value = request.Form("Email")
	cmd.Parameters.Append param

	cmd.ActiveConnection = conn
	cmd.Execute




%>
</head>

<body onLoad="SetScreen(620,450);" >
<table bordercolor="#B0161E" width="98%" height="277px;" style="border-radius:26px; font-family:'Trebuchet MS', Arial, Helvetica, sans-serif" border="3px" cellpadding="0px" cellspacing="0px">
 <tr>
  <td style="border:0px; text-align:center;">

	<table width="100%" height="277px" border="0px" >
		<tr>
			<td colspan="2" style="font-color:#B0161E;">
				Thank you!
             </td>
         </tr>

		<tr>
			<td colspan="2" style="font-color:#B0161E;">
				Please check your email for your Username and Password.
             </td>
         </tr>
         
         <tr>
			<td colspan="2" style="font-color:#B0161E;">
				If you do not receive your email shortly, check your SPAM folder for mail from "info@Zip2Tax.com" or call us at 1-866-492-8494, Monday - Friday 8am - 5pm EST.
             </td>
         </tr>            
    </table>

    </td>
   </tr>
  </table>

 </body>
</html>
