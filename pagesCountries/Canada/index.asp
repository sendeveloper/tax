<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Tax Rates"
    Session("currentPage") = "index.asp"
%>

<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
	
	<link rel="stylesheet" type="text/css" href="/Website/pagesCountries/US/States/page_states.css" />

	   <script src="/Website/pagesCountries/Canada/index/page_index.js"></script>
     <style>
      text[text-anchor="end"] {
        display: none;
      }
    </style>
  </head>
  
  <body>    
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">     
		<!-- #include virtual="/Website/pagesCountries/Canada/index/page_index_content_new_map.asp" -->
        <!-- #include virtual="/Website/pagesCountries/Canada/index/page_index_right_sidebar.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>

