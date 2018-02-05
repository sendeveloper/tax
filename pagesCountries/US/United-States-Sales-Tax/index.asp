<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Tax Rates"
    Session("currentPage") = "index.asp"
%>

<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
	
	<link rel="stylesheet" type="text/css" href="/Website/pagesCountries/Includes/Menu/z2t_JurisdictionMenu.css" />
	
     <style>
      ul#myList li {margin-left: 2em;}     
      h1 {text-align: left; margin-top: 1em; margin-bottom: 1em;}
      h2 {margin-bottom: .5em;}
      ul.disc {list-style: disc outside none !important;}

      .box h1 {margin-bottom: 0em; margin-top: 0em;}
      .box h2 {margin-bottom: 0em;}
      .post > h1.title {
        margin: 45px 0 20px 0;
        padding-left: 33px;
        background: url(/Website/Images/star.gif) no-repeat left top !important;}

      .post h2.title {
        margin: 45px 0 20px 0;
        padding-left: 33px;
        margin-left: -33px;
        background: url(/Website/Images/star.gif) no-repeat left top !important;}

      /* h2.title {margin-left: -5em;} */
      /*#map2 svg { width: 100%; height: auto; }*/
      /*#map2 { width: 100%; height: auto; }*/
    </style>
  </head>
  
  <body>    
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">     
		  <!-- #include virtual="/Website/pagesCountries/US/United-States-Sales-Tax/index/page_index_content.asp" -->
		  <div class="col-lg-3 col-md-3 NoPrint">
			<%Session("MenuOrder")="USA|Canada"%>
			<!-- #include virtual="/Website/pagesCountries/Includes/Menu/z2t_JurisdictionMenu.asp" -->
		  </div>
        </div>
        </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>

