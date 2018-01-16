<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Refund Policy"
    Session("currentPage") = "z2t_refundpolicy.asp"
%>


<html lang="en">
  <head>
    <title>Refund Policy - Zip2Tax.com</title>
    <meta name="keywords" content="Sales Tax, Zip Code, Tax Rates, Sales Tax Database">
    <meta name="description" content="Learn more about zip2tax's refund policy and how we protect your information.">
	<!-- Start of HeadContent.inc -->
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
          <!-- #include virtual="/Website/pagesExtra/RefundPolicy/page_refund_content.asp" -->
          <!-- #include virtual="/Website/pagesExtra/RefundPolicy/page_refund_right_sidebar.asp" -->
        </div>
      </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>
