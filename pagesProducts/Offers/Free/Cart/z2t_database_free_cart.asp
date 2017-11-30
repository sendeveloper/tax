<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Services"
    Session("currentPage") = "z2t_database_free_cart.asp"
%>

<html>
  <head>
    <title>Database Interface 30 Day Free Trial - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="robots" content="noindex,follow">
    <meta name="description" content="Get your free 30-day database trial today.">
    <!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	

<script language="javascript" type="text/javascript">
    var userName = '<%=Session("UserName")%>';
    var ProductID = 0;
    var TaxType = '';
    var TableFormat = '';
</script>

<script language="javascript" src="/Website/pagesProducts/Offers/Free/Cart/DatabaseFreeCart/page_database_free_cart.js" type="text/javascript"></script>

    <style>
      body {background: none;}
      h1 {border-bottom: 1px solid black; background: none !important;}
	  .logoandinfo{ 
		width: 630px;
		float: left;
		display: inline-block; }	 
		
	  .logo{ 
		width: 150px;
		float: left;
		display: inline-block; }
		
	  .info { 
	    width: 450px;
		padding-left: 20px;
		float: left;
		display: inline-block; }
		
		.fontsize2
	{
		font-size: 10px;
	}
	
	.redButton.s20
	{
		font-size: 20px;
		border-radius: 30px;
        -moz-border-radius: 30px;
        -webkit-border-radius: 30px;
	}
	
    </style>

  </head>

  <body>
   
  <!--#include virtual="/Website/pagesProducts/Offers/Free/Cart/DatabaseFreeCart/page_database_free_cart_content.asp" -->

  </body>
</html>
