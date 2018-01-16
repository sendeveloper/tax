<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Compatibility"
    Session("currentPage") = "z2t_compatible.asp"
%>

<html>
  <head>
    <title>Compatible Systems - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Zip2Tax's .CSV tax tables are compatible with a variety of shopping carts, ERPS, bookkeeping software, and other eCommerce applications.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	<script language="javascript" src="/Website/pagesProducts/Compatible/page_compatible.js" type="text/javascript"></script>
    </head>
  
  <body>    
    <div class="container-fluid" style="padding: 0px;">
    <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">

		<!-- #include virtual="/Website/pagesProducts/Compatible/page_compatible_content.asp" -->
        <!-- #include virtual="/Website/pagesProducts/Compatible/page_compatible_right_sidebar.asp" -->
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>
