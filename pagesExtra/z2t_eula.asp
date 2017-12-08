<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "EULA"
    Session("currentPage") = "z2t_eula.asp"
%>

<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    </head>
  
  <body>  
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">   
		<!-- #include virtual="/Website/pagesExtra/EULA/page_eula_content.asp" -->
		<!-- #include virtual="/Website/pagesExtra/EULA/page_eula_right_sidebar.asp" -->		
		
        </div>
      </div>
    </div>
  
  <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>

