<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
  Session("activePage") = "Tax rate level availability"
  Session("currentPage") = "z2t_tax_rates.asp"  
%>

<html lang="en">
  <head>
    
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
	<script src="/Website/Includes/Javascript/page_tax_rates.js"></script>
      </head>
  
  <body>    
    <div class="container-fluid" style="padding: 0px;">
    <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container"> 
		<!-- #include virtual="/Website/pagesTaxRates/TaxRates/page_tax_info_content.asp" -->
        <!-- #include virtual="/Website/pagesTaxRates/TaxRates/page_tax_rates_right_sidebar.asp" -->
        </div>
      </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>