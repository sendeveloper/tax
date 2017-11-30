<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers - API"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
    Session("devPage") = "API"
%>

<html>
  <head>
    <title>Developer Information | API - Zip2Tax.com</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="keywords" content="Sales Tax, Zip Code, Tax Rates, Sales Tax Database">
    <meta name="description" content="Use our API to retrieve tax rate information for your applications with door-step granularity. This includes ZIP Code API, ZIP+4 API, and Spot-On API.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
    <meta name="robots" content="index,follow">	 	
	<script language="javascript" src="/Website/Includes/Javascript/page_developers_API.js" type="text/javascript"></script>
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

	<style type="text/css">
    <!--
	.right {	text-align: right;
	}
	.right {	text-align: right;
	}
	-->
    </style>
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar_new.asp" -->
		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_API/page_developers_API_content_new.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
  </body>
</html>
	