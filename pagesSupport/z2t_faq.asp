<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "faq"
    Session("currentPage") = "z2t_faq.asp"
%>

<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->	
	<script language="javascript" src="/Website/Includes/Javascript/page_faq.js" type="text/javascript"></script>
	<style type = "text/css">
	  li.indent1 {margin-left: 2em;}
	  li.indent2 {margin-left: 4em;}
	</style>
	<body>	
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
	  
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">		
		<!-- #include virtual="/Website/pagesSupport/FAQ/page_faq_content_new.asp" -->
        <!-- #include virtual="/Website/pagesSupport/FAQ/page_faq_right_sidebar_new.asp" -->
    	</div>
		</div>
    </div>
	
	<!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->	
  </body>
</html>

	