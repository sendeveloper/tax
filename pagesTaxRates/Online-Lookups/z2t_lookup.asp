<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Spot-On Lookup"
    Session("currentPage") = "z2t_lookup.asp"
%>

<html lang="en">
  <head>
  	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <script src="/Website/pagesTaxRates/LookupZipCode/map.js"></script>
    <script src="/Website/pagesTaxRates/online-lookups/maps.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAptBhnQg4zQMZPim2KLfbJguUyFBIjj9I&sensor=false"></script>
    <link type="text/css" rel="stylesheet" href="/Website/pagesTaxRates/Online-Lookups/z2t_Lookup.css">
    <style>
      .padded { margin-bottom:5px !important; padding: 5px 5px !important;}
      .col-md-3, .col-md-4 {padding-right:8px !important; }
      #inputZip {left:0 !important}
    </style>
  </head>
  <body>  
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
    
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">   
		      <!-- #include virtual="/Website/pagesTaxRates/Online-Lookups/page_lookup_content.asp" -->
          <!-- #include virtual="/Website/pagesTaxRates/Online-Lookups/page_lookup_right_sidebar.asp" -->
        </div>
      </div>
    </div>
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>

<%
Function debug(text)
  debug = "" 'iif(Session("z2t_DebugData") = 1, text, "")
End Function

Function iif(test, consequent, alternative)
  If test Then iif = consequent Else iif = alternative
End Function
%>

    
