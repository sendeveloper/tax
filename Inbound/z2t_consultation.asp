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
    <title>Zip2Tax Can Answer Your Sales And Use Tax Questions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Sign up now to recieve a free sales tax  consultation.">
    <!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	    <script type="text/javascript" src="/Website/Includes/Javascript/z2t.js" language="javascript"></script>
	<script type="text/javascript" src="/Website/Inbound/Consultation/page_consultation.js" language="javascript"></script>
    <script language="javascript" type="text/javascript"></script>

    <style>
      body {background: none;}
      h1 {border-bottom: 1px solid black; background: none !important;}
    </style>
  </head>
  
  <body>
  
    <!-- #include virtual="/Website/Inbound/Consultation/page_consultation_content.asp" -->
    
  </body>
</html>
