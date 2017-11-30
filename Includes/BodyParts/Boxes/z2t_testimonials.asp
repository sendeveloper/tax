<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Testimonials"
    Session("currentPage") = "z2t_testimonials.asp"
%>

<html>
  <head>
    <title>Testimonials - Zip2Tax.com</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="keywords" content="sales tax rate lookup zip code, Zip Code, Sales and Use Tax Rates, Sales Tax Database">
    <meta name="description" content="Read what many Zip2Tax customers have to say about their experience using our services.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	<script language="javascript" src="/Website/Includes/Javascript/page_testimonials.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
      var userName = '<%=Session("UserName")%>';
      var ProductID = 0;
      var TaxType = '';
      var TableFormat = ''; 
    </script>

  </head>

  <body>
    <div id="divMain">

      <div id="divPageTop" style="overflow: visible !important;">
        <!-- #include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->

      <div id="divPageMiddle" style="float:left;">
        <div id="divPageLeft">
          <!-- #include virtual="/Website/pagesHome/Testimonials/page_testimonials_left_sidebar.asp"-->
        </div><!-- divPageLeft -->
		
        <div id="divPageCenter" align="center">
          <!-- #include virtual="/Website/pagesHome/Testimonials/page_testimonials_content.asp"-->
        </div><!-- divPageCenter -->
		
        <div id="divPageRight">
          <!-- #include virtual="/Website/pagesHome/Testimonials/page_testimonials_right_sidebar.asp"-->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->

    </div><!-- main -->
  </body>
</html>
