<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers - ZIP+4"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
    Session("devPage") = "ZIP+4 API"
%>

<html>
<!-- <%=Session("devPage")%> -->
<!-- <%=(Session("devPage") = "ZIP+4 API")%> -->
  <head>
    <title>Developer Information | ZIP+4 API - Zip2Tax.com</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="keywords" content="Sales Tax, Zip Code, Tax Rates, Sales Tax Database">
    <meta name="description" content="Use our ZIP+4 API to retrieve tax rate information for your applications with rooftop accuracy.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	<script language="javascript" src="/Website/Includes/Javascript/page_developers_ZIP+4.js" type="text/javascript"></script>
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar_new.asp" -->
		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_ZIP+4/page_developers_ZIP+4_content_new.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
  </body>
</html>
