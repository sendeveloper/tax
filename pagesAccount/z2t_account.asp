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


<html lang="en">
  <head>
    <title>Account Information - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Log in and see information about your account and Zip2Tax subscription status.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
	    <body> 
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container"> 
        <!-- #include virtual="/Website/pagesAccount/Account/page_account_left_sidebar.asp" -->
		<!-- #include virtual="/Website/pagesAccount/Account/page_account_content.asp" -->
        <!-- #include virtual="/Website/pagesAccount/Account/page_account_right_sidebar_new.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>