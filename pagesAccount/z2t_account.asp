<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->
<%
    Session("activePage") = "Account"
    Session("acctPage") = "Account Information"
    Session("currentPage") = "account/z2t_account.asp"
%>

<% 
    If Session("z2t_loggedin") = "" Then Server.Transfer("/index.asp")   
%>


<html>
  <head>
    <title>Account Information - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Log in and see information about your account and Zip2Tax subscription status.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

        <!-- #include virtual="/Website/pagesAccount/Account/page_account_left_sidebar_new.asp" -->
		<!-- #include virtual="/Website/pagesAccount/Account/page_account_content_new.asp" -->
        <!-- #include virtual="/Website/pagesAccount/Account/page_account_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
         
  </body>
</html>
