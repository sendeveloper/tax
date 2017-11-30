<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Services"
    Session("currentPage") = "z2t_services_database_cart.asp"
%>

<html>
  <head>
    <title>Database Interface 15 Day Free Trial - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Try Zip2Tax's powerful Database Interface risk free for 15 day today.">
    <!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	<script type="text/javascript" src="/Website/Includes/Javascript/z2t.js" language="javascript"></script>

	<script language="javascript" src="/Website/pagesProducts/Offers/Free/Cart/ServicesDatabaseCart/page_services_database_cart.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
    var userName = '<%=Session("UserName")%>';
    var ProductID = 0;
    var TaxType = '';
    var TableFormat = '';
</script>

    <style>
      body {background: none;}
      h1 {border-bottom: 1px solid black; background: none !important;}
    </style>

  </head>

  <body>
   
  <!--#include virtual="/Website/pagesProducts/Offers/Free/Cart/ServicesDatabaseCart/page_services_database_cart_content.asp" -->

  </body>
</html>
