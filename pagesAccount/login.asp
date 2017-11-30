<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->
<%
    Session("activePage") = "Login"
    Session("acctPage") = "Login Page"
    Session("currentPage") = "account/login.asp"
%>
<% 
    ' If Session("z2t_loggedin") = "True" Then Server.Transfer("/index.asp")   
%>
<html>
  <head>
    <title>Login - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Log in and see information about your account and Zip2Tax subscription status.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

        <!-- #include virtual="/Website/pagesAccount/Login/page_login_content.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
         
  </body>
</html>
