<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Spot-On Lookup"
    Session("currentPage") = "z2t_lookup.asp"
%>

<html>
  <head>
  	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
  	<script language="javascript" src="/Website/Includes/Javascript/Javascript_test.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript" src="/Website/pagesTaxRates/LookupZipCode/map.js"></script>
    <script type="text/javascript" language="javascript" src="/Website/pagesTaxRates/online-lookups/maps.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAptBhnQg4zQMZPim2KLfbJguUyFBIjj9I&sensor=false"></script>
    <link type="text/css" rel="stylesheet" href="/Website/pagesTaxRates/Online-Lookups/z2t_Lookup.css">
  </head>
  <body>  
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
    
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">   
		      <!-- #include virtual="/Website/pagesTaxRates/Online-Lookups/page_lookup_content_new.asp" -->
          <!-- #include virtual="/Website/pagesTaxRates/Online-Lookups/page_lookup_right_sidebar_new.asp" -->
        </div>
      </div>
    </div>
    <!-- #include virtual="/Website/Includes/footer_new.asp"-->   
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

    
