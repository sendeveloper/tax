<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Redistribution"
    Session("currentPage") = "z2t_redistribution.asp"
%>

<html lang="en">
  <head>
    <title>Redistributable Services and Prices - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Prices for Zip2Tax's redistributable Database Interface and .CSV Tax Tables.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	<script type="text/javascript" src="/Website/pagesProducts/Redistribution/page_redistribution.js" language="javascript"></script>
    <script language="javascript" type="text/javascript">
      //var pathBase = '<%=pathBase%>shopping/'; 
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

          <!-- #include virtual="/Website/pagesProducts/Redistribution/page_redistribution_content.asp"-->
          <!-- #include virtual="/Website/pagesProducts/Redistribution/page_redistribution_right_sidebar.asp" -->

        </div>
       </div>
    </div>
  
  <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>
