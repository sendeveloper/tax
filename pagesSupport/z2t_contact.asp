<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "contact us"
    Session("currentPage") = "z2t_contact.asp"
%>

<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    	<script language="javascript" src="/Website/Includes/Javascript/page_contact.js" type="text/javascript"></script>
    <style type="text/css">
      #comm100 { display:none; }
      .noscriptmsg { margin-top: 3em; }
    </style>
  </head>
  
  <body>  
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
    
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">   
		      <!-- #include virtual="/Website/pagesSupport/ContactUs/page_contact_content_new.asp" -->
          <!-- #include virtual="/Website/pagesSupport/ContactUs/page_contact_right_sidebar_new.asp" -->
    </div>
       </div>
    </div>
  
  <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
  <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>

