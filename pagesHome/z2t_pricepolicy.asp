<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Low Price Policy"
    Session("currentPage") = "z2t_pricepolicy.asp"
%>

<html>
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
      var userName = '<%=Session("UserName")%>';
      var ProductID = 0;
      var TaxType = '';
      var TableFormat = '';
    </script>

  </head>

  <body>
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container"> 
          <div id="divMain">
            <div id="divPageLeft">
              <!-- #include virtual="/Website/pagesHome/PricePolicy/page_price_policy_left_sidebar.asp"-->
            </div><!-- divPageLeft -->
        
            <div id="divPageCenter">
              <!--#include virtual="/Website/pagesHome/PricePolicy/page_price_policy_content.asp"-->
            </div><!-- divPageCenter -->
        
            <div id="divPageRight">
              <!--#include virtual="/Website/pagesHome/PricePolicy/page_price_policy_right_sidebar.asp"-->
            </div><!-- divPageRight -->

          </div><!-- main -->
        </div>
       </div>
    </div>
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>
