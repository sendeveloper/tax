<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Low Price Policy"
    Session("currentPage") = "z2t_pricepolicy.asp"
%>

<html>
  <head>
    <title>Low Price Policy - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Learn more about Zip2Tax's low price policy.">
    <!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

    <script language="javascript" type="text/javascript">
      var userName = '<%=Session("UserName")%>';
      var ProductID = 0;
      var TaxType = '';
      var TableFormat = '';
    </script>

  </head>

  <body>
    <div id="divMain">


      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!-- #include virtual="/Website/pagesHome/PricePolicy/page_price_policy_left_sidebar.asp"-->
        </div><!-- divPageLeft -->
		
        <div id="divPageCenter">
          <!--#include virtual="/Website/pagesHome/PricePolicy/page_price_policy_content.asp"-->
        </div><!-- divPageCenter -->
		
        <div id="divPageRight">
          <!--#include virtual="/Website/pagesHome/PricePolicy/page_price_policy_right_sidebar.asp"-->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

      <div id="divPageBottom">
        <!-- #include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->

    </div><!-- main -->
  </body>
</html>
