<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<%
    Session("activePage") = "Compatible"
    Session("currentPage") = "z2t_compatible.asp"
%>

<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <script language="javascript" src="/Website/pagesProducts/TableFormats/page_table_format.js" type="text/javascript"></script>
    </head>
  
  <body>  
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
    
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">   
		    <!-- #include virtual="/Website/pagesProducts/TableFormats/page_table_format_content.asp" -->
        <!-- #include virtual="/Website/pagesProducts/TableFormats/page_table_format_right_sidebar.asp" -->
        </div>
       </div>
    </div>
  
  <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>

