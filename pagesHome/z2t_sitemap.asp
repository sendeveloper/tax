<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->


<%
    Session("activePage") = "Sitemap"
    Session("currentPage") = "z2t_sitemap.asp"
%>

<html lang="en">
<head>
  <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
  <script language="javascript" src="/Website/Includes/Javascript/page_home.js" type="text/javascript"></script>
  <style>
    a h2{
      color: #00e;
      font-size: 15px !important;
    }
    a:hover h2{
      text-decoration: none;
      color: #23527c;
    }
  </style>
</head>
<body>
  <div class="container-fluid" style="padding: 0px;">
    <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
    <div class="mainBody">
      <div class="clearfix"></div>
      <div class="container"> 
        <!-- #include virtual="/Website/pagesHome/Sitemap/page_sitemap_content.asp"-->
      </div>
    </div>
  </div>
  <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
  <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
</body>
</html>
