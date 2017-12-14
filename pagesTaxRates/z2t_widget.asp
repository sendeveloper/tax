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
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
  </head>
  
  <body>  
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
    
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">   
		<!-- #include virtual="/Website/pagesTaxRates/Widget/page_widget_content.asp" -->
        <!-- #include virtual="/Website/pagesTaxRates/Widget/page_widget_right_sidebar.asp" -->
      </div>
       </div>
    </div>
  
  <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
  </body>
</html>