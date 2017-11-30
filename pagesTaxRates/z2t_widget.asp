<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "widget"
    Session("currentPage") = "z2t_widget.asp"
%>

<% 
   Select Case Request("download")
   Case "widget_v1"
   Call z2t_LogActivity(Session("z2t_UserName"), cActivityWidgetDownload, cActivityWidgetDownload, FormatPath(Request.ServerVariables("PATH_INFO")), Unescape(Request.ServerVariables("HTTP_REFERER")), Session("z2t_TrackingID"), Session("CookieID"), Request.ServerVariables("REMOTE_ADDR"), "z2t_widget.asp", Date())
   Response.Redirect("/downloads/z2t-Widget.msi")
   End Select
%>

<html>
  <head>
    <!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	<script language="javascript" src="Website/Includes/Javascript/page_desktop_widget.js" type="text/javascript"> </script>
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

		<!-- #include virtual="/Website/pagesTaxRates/Widget/page_widget_content_new.asp" -->
        <!-- #include virtual="/Website/pagesTaxRates/Widget/page_widget_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
         
  </body>
</html>
 