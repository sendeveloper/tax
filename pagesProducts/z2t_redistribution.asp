<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Redistribution"
    Session("currentPage") = "z2t_redistribution.asp"
%>

<html>
  <head>
    <title>Redistributable Services and Prices - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Prices for Zip2Tax's redistributable Database Interface and .CSV Tax Tables.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	<script type="text/javascript" src="/Website/pagesProducts/Redistribution/page_redistribution.js" language="javascript"></script>
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->
    <script language="javascript" type="text/javascript">
      //var pathBase = '<%=pathBase%>shopping/'; 
      var userName = '<%=Session("UserName")%>';
      var ProductID = 0;
      var TaxType = '';
      var TableFormat = '';
    </script>

	
	
  </head>

  <body>
    <div id="divMain">

          <!-- #include virtual="/Website/pagesProducts/Redistribution/page_redistribution_content.asp"-->
          <!-- #include virtual="/Website/pagesProducts/Redistribution/page_redistribution_right_sidebar.asp" -->

        <!-- #include virtual="/Website/Includes/footer_new.asp"-->

    </div><!-- main -->
  </body>
</html>
