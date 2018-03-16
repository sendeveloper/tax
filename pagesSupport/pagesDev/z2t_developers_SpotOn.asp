<!DOCTYPE html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers - Spot-On"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
    Session("devPage") = "SpotOn API"
%>

<html lang="en">
    <head>
      <title>Developer Information | Spot-On&trade; API - Zip2Tax</title>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <meta name="description" content="Use our Spot-On API to retrieve tax rate information for your applications with door-step accuracy.">
    <script language="javascript" src="/Website/Includes/Javascript/page_developers_SpotOn.js" type="text/javascript"></script>
    </head>
  
  <body>    
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">     
	    <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar.asp" -->
		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_SpotOn/page_developers_SpotOn_content.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>
