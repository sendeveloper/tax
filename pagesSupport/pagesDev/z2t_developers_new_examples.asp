<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers"
    Session("currentPage") = "developers/z2t_developers_example.asp"
    Session("devPage") = Request.QueryString("language")
%>

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="robots" content="index,follow"> 
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
    		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_Example/page_developers_example_new_content.asp" -->
            <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>
	