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
    <title>Newsletter Signup - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="keywords" content="Sales Tax For Zip Code, Sales and Use Tax Rates, Sales Tax Questions Answered">
    <meta name="description" content="Sign up now to recieve zip2tax's informative newsletters and never worry again about staying up to date with sales and use tax rate changes, state law changes and more.">

    <!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	

    <script type="text/javascript" src="/Website/Includes/Javascript/z2t.js" language="javascript"></script>
	<script type="text/javascript" src="/Website/Inbound/Newsletter/newsletter_signup.js" language="javascript"></script>
    <script language="javascript" type="text/javascript"> </script>

    <style>
      body {background: none;}
      h1 {border-bottom: 1px solid black; background: none !important;}
      #content{width: 540px!important;}
    </style>
  </head>
  
  <body>
  
    <!-- #include virtual="/Website/Inbound/Newsletter/newsletter_signup_content.asp" -->

  </body>
</html>
