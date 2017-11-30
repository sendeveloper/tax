<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers"
    Session("currentPage") = "developers/z2t_developers_example.asp"
    Session("devPage") = Request.QueryString("language")
%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
    <meta name="robots" content="index,follow">	
	<script language="javascript" src="/Website/Includes/Javascript/page_developers_example.js" type="text/javascript"></script>
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_left_sidebar_new.asp" -->
		<!-- #include virtual="/Website/pagesSupport/Developers/Dev_Example/page_developers_example_new_content_new.asp" -->
        <!-- #include virtual="/Website/pagesSupport/Developers/Dev/page_developers_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
  </body>
</html>
	