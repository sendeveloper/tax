<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Home"
    Session("currentPage") = "index.asp"
%>

<html>
  <head>
    <title>Database Interface - Single State</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Sales tax rates at ZIP code, ZIP+4 or Spot-On&trade; levels via Database Interface for every state in the U.S.">
    	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	<script type="text/javascript" src="/Website/Includes/Javascript/z2t.js" language="javascript"></script>
    <script type="text/javascript" src="/Website/pagesProducts/Cart/Database_Single/page_database_single.js" language="javascript"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
  </head>
  
  <body>
    <!-- #include virtual="/Website/pagesProducts/Cart/Database_Single/database_single_signup.asp" -->
  </body>
</html>
