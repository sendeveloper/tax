<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Privacy"
    Session("currentPage") = "z2t_500_error_create.asp"
%>

<html lang="en">
  <head>
    <title>500 Error Create - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Learn more about zip2tax's refund policy and how we protect your information.">
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
	<script language="javascript" src="/Website/pagesExtra/RefundPolicy/page_refund_policy.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
      var userName = '<%=Session("UserName")%>'
    </script>

	<style type="text/css">
	   
	   li.blankspace {
	     list-style-type: none;
		 margin-top: 2em;
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
          <!--#include virtual="/Website/pagesExtra/Errors/500/page_500_error_left_sidebar.asp" -->
          <!-- #include virtual="/Website/pagesExtra/Errors/500/page_500_error_create_content.asp" -->
          <!--#include virtual="/Website/pagesExtra/Errors/500/page_500_error_right_sidebar.asp" -->
        </div>
       </div>
    </div>
  
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>
