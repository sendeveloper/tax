<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Home"
    Session("currentPage") = "index.asp"
%>

<html>
  <head>
    <title>Zip2Tax Sales Tax Seminar Special Offer</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Sales tax seminar special offer.">
    <meta name="robots" content="noindex,follow">
	<!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
    <script language="javascript" src="/Website/Includes/Javascript/z2t_Functions.js" type="text/javascript"></script>
    <script language="javascript" src="/Website/Includes/Javascript/page_home.js" type="text/javascript"></script>
	
	<style type="text/css">
	  .post ul { margin: 0 1em 0 0; color: red; list-style-type: disc;}
	  .redbullets li { font-size: 1.3em; }
	  .redbullets li span { color: black; }
	  .lorman-backg {background: url(http://dev.zip2tax.com/Website/pagesProducts/Offers/Lorman/Images/Lady_Drinking_Coffee.png) no-repeat left top; width: 625px; min-height: 400px; margin: 20px 0 0 0; }
	  .red-lorman-text { color: red; font-size: 1.8em; text-align: right; padding: 0 50px 0 0; margin: 0 0 0 0;}
	  
	  .post th {text-decoration: none;}
	  
	  th {padding-left: 1.5em; padding-right: 1.5em; width: 20%; text-align: center; vertical-align: top; height: 50px;}
	  .black-link {color: #4A5157;}
	</style>
	
  </head>
  
  <body>
    <div id="divMain">
      
      <div id="divPageTop">
        <!-- #include virtual="/Website/pagesProducts/Offers/Lorman/page_top_Lorman.asp"-->
      </div><!-- divPageTop -->

      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!-- #include virtual="/Website/pagesProducts/Offers/Lorman/page_home_left_sidebar_Lorman.asp" -->
        </div><!-- divPageLeft -->

        <div id="divPageCenter">
          <!-- #include virtual="/Website/pagesProducts/Offers/Lorman/page_home_content_July_2014_Update.asp" -->
        </div><!-- divPageCenter -->

        <div id="divPageRight">
          <!-- #include virtual="/Website/pagesProducts/Offers/Lorman/page_home_right_sidebar_Lorman.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

      <div id="divPageBottom">
        <!-- #include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->
      
    </div><!-- main -->    
  </body>
</html>
