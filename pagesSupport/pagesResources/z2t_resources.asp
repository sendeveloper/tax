<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<%
    Session("activePage") = "resources"
    Session("currentPage") = "resources/z2t_resources.asp"
%>

<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->	
		<script language="javascript" src="/Website/Includes/Javascript/page_faq.js" type="text/javascript"></script>
		<style type = "text/css">
		  li.indent1 {margin-left: 2em;}
		  li.indent2 {margin-left: 4em;}
		</style>
	</head>
  
  <body>	
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
	  
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">
		<!-- #include virtual="/Website/pagesSupport/Resources/Resources_Home/page_resources_home_content.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Resources/Resources_Home/page_resources_right_sidebar.asp" -->
    	</div>
		</div>
    </div>
	
	<!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->	
  </body>
</html>

	