<!doctype html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->


<%
    Session("activePage") = "Comparison Chart"
    Session("currentPage") = "z2t_comparison_chart.asp"
%>
<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
    <script language="javascript" src="/Website/Includes/Javascript/page_about.js" type="text/javascript"></script>
  </head>
  
  <body>  
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      <!--#include virtual="/Website/Includes/z2t_Function_HelpPopup.asp"-->
  <style type="text/css">
    td h3 {vertical-align: middle; font-size:14px !important}
    .paddedtable1 tr {vertical-align: middle;}
    .paddedtable1 th {padding-left: 1.5em; padding-right: 1.5em; width: 20%; text-align: center; vertical-align: top; height: 50px;}
    .row-mod-0 {background-color: #CCCCCC;}
    .row-mod-1 {background-color: #EAEAEA;}
  </style>
    <div class="mainBody">
      <div class="clearfix"></div>
      <div class="container">
        <!-- #include virtual="/Website/pagesProducts/ComparisonChart/page_comparison_chart_content.asp" -->
        <!-- #include virtual="/Website/pagesProducts/ComparisonChart/page_comparison_chart_right_sidebar.asp" -->
      </div>
    </div>
  </div>
  
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"--> 
</body>
</html>
<style>
  /*.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }.comparison-chart td {
  font-size: 14px;
  }
  .comparison-chart td span.glyphicon-ok {
  color: green;
  font-size: 18px;
  }
  .comparison-chart img {
  width: 100px;
  }
  .comparison-chart a {
  color: #929292;
  }
  .table-category {
   font-weight: bold;
   background: #ddd;
   white-space: nowrap;
   }
  td:first-of-type {
  font-weight: bold;
  }   */
</style>
