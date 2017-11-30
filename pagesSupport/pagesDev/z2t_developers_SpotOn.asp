<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers - Spot-On"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
    Session("devPage") = "SpotOn API"
%>

<html>
  <head>
    <title>Developer Information | Spot-On API - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
    <meta name="description" content="Use our Spot-On API to retrieve tax rate information for your applications with door-step accuracy.">
	<!-- <script language="javascript" src="/Website/Includes/Javascript/page_developers_SpotOn.js" type="text/javascript"></script> -->
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

	    <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar_new.asp" -->
		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_SpotOn/page_developers_SpotOn_content_new.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
  </body>
</html>
