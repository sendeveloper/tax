<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Services"
    Session("currentPage") = "z2t_services.asp"
%>

<html>
  <head>
    <title>Database Interface- United States</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Sales tax rates at ZIP code, ZIP+4 or Spot-On levels via Database Interface for a the whole U.S.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script type="text/javascript" src="/Website/Includes/Javascript/z2t.js" language="javascript"></script>
	<script type="text/javascript" src="/Website/pagesProducts/Cart/Database_US/page_database_US.js" language="javascript"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
<script type="text/javascript">
	function ShowHide(divId)
	{
	  if(document.getElementById(divId).style.display == 'none')
	  {
		document.getElementById(divId).style.display='block';
	  }
	  else
	  {
		document.getElementById(divId).style.display = 'none';
	  }
	}

	function clickLink(link) {
	  if (link != "#") {
            window.open(link, "_blank");}}
  </script>
  </head>
  
  <body>
    <!-- #include virtual="/Website/pagesProducts/Cart/Database_US/database_US_signup.asp" -->
  </body>
</html>
