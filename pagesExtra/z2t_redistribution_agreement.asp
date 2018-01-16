<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Redistribution Agreement"
    Session("currentPage") = "z2t_redistribution_agreement.asp"
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
      		<!-- #include virtual="/Website/pagesExtra/Redistribution_Agreement/page_redistribution_agreement_content.asp" -->
      		<!-- #include virtual="/Website/pagesExtra/Redistribution_Agreement/page_redistribution_agreement_right_sidebar.asp" -->		
		
      </div>
      </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>

