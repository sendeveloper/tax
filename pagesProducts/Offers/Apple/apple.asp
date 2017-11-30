<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Mobile App"
    Session("currentPage") = "apple.asp"
%>

<html>
  <head>
    <title>Zip2Tax Mobile App Free Offer</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="The Zip2Tax Sales Tax Calculator will instantly give you the general sales tax rate for any jurisdiction in the United States.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
    <script language="javascript" src="/Website/Includes/Javascript/z2t_Functions.js" type="text/javascript"></script>
    <script language="javascript" src="/Website/Includes/Javascript/page_home.js" type="text/javascript"></script>
	
	<style type="text/css">
	 .apple-bullet-font {
		margin: 20px 0 20px 0;
		padding-left: 33px;
		background: url(/Website/Images/star.gif) no-repeat left center;
		font-size: 16px;
	 }
	 
	</style>
  </head>
  
  <body>
    <div id="divMain">
      
      <div id="divPageTop">
        <!-- #include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->

      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!-- #include virtual="/Website/pagesProducts/Offers/Apple/includes/page_apple_left_sidebar.asp" -->
        </div><!-- divPageLeft -->

        <div id="divPageCenter">
          <!-- #include virtual="/Website/pagesProducts/Offers/Apple/includes/page_apple_content.asp" -->
        </div><!-- divPageCenter -->

        <div id="divPageRight">
          <!-- #include virtual="/Website/pagesProducts/Offers/Apple/includes/page_apple_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

      <div id="divPageBottom">
        <!-- #include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->
      
    </div><!-- main -->     
  </body>
</html>
