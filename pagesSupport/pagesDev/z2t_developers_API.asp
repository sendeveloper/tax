<!DOCTYPE html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers - API"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
    Session("devPage") = "API"
%>

<html lang="en">
  <head>
    <title>Developer Information | API - Zip2Tax.com</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="keywords" content="Sales Tax, Zip Code, Tax Rates, Sales Tax Database">
    <meta name="description" content="Use our API to retrieve tax rate information for your applications with door-step granularity. This includes ZIP Code API, ZIP+4 API, and Spot-On API.">
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <meta name="robots" content="index,follow">
	<script language="javascript" src="/Website/Includes/Javascript/page_developers_API.js" type="text/javascript"></script>
    <style type="text/css">
    <!--
    .right {    text-align: right;
    }
    .right {    text-align: right;
    }
    -->
    </style>
</head>
  <body>    
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">
            <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar.asp" -->
		  <!-- #include virtual="/Website/pagesSupport/Developers/Dev_API/page_developers_API_content.asp" -->
            <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>
	