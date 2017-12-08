<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Privacy"
    Session("currentPage") = "z2t_privacypolicy.asp"
%>

<html lang="en">
  <head>
	<style type="text/css">
	   
	   li.blankspace {
	     list-style-type: none;
		 margin-top: 2em;
	    }

	</style>
    
	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <script language="javascript" src="/Website/Includes/Javascript/page_home.js" type="text/javascript"></script>
    </head>
  
  <body>	
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
	  
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">
		<!-- #include virtual="/Website/pagesExtra/PrivacyPolicy/page_privacy_content.asp" -->
       <!-- #include virtual="/Website/pagesExtra/PrivacyPolicy/page_privacy_right_sidebar.asp" -->
    	</div>
		</div>
    </div>
	
	<!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->	
  </body>
</html>

