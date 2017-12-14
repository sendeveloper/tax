<!doctype html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->
<%
    Session("activePage") = "Badge"
    Session("acctPage") = "Downloadable Badges"
    'Session("currentPage") = "account/z2t_account.asp"
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
		<!-- #include virtual="/Website/pagesSupport/Badges/page_badges_content.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Badges/page_badges_right_sidebar.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>
