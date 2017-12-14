<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers - ZIPcode"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
    Session("devPage") = "ZIP Code API"
%>

<html lang="en">
  <head>
    <title>Developer Information | ZIP Code API - Zip2Tax.com</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="keywords" content="Sales Tax, Zip Code, Tax Rates, Sales Tax Database">
    <meta name="description" content="Use our ZIP Code API to retrieve tax rate information for your applications with rooftop accuracy.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    </head>
  
  <body>    
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container"> 
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar.asp" -->
		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_ZIPcode/page_developers_ZIPcode_content.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>
