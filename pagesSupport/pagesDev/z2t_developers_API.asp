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
	