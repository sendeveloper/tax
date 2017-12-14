<!DOCTYPE html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers - ZIP+4"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
    Session("devPage") = "ZIP+4 API"
%>

<html lang="en">
<!-- <%=Session("devPage")%> -->
<!-- <%=(Session("devPage") = "ZIP+4 API")%> -->
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
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar.asp" -->
		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_ZIP+4/page_developers_ZIP+4_content.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>

