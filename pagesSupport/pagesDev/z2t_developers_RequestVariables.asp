<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers"
    Session("currentPage") = "developers/z2t_developers_RequestVariables.asp"
    Session("devPage") = "RequestVariables"
%>

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	 <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
     <meta name="robots" content="index,follow">	
    </head>
  
  <body>  
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
    
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar.asp" -->
		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_RequestVariables/page_developers_RequestVariables_content.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar.asp" -->
      </div>
      </div>
    </div>
  
  <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>
