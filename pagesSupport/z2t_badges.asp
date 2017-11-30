<!doctype html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->
<%
    Session("activePage") = "Badge"
    Session("acctPage") = "Downloadable Badges"
    'Session("currentPage") = "account/z2t_account.asp"
%>


<html>
  <head>
    <title>Account Badges - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Post a Zip2Tax badge on your web site to assure customers they are getting accurate tax rates.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	<script language="javascript" src="/Website/pagesSupport/Badges/page_badges.js" type="text/javascript"></script>
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->
	
		<!-- #include virtual="/Website/pagesSupport/Badges/page_badges_content_new.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Badges/page_badges_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
  </body>
</html>
