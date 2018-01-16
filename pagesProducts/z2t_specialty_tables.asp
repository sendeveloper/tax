<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Specialty Tables"
    Session("currentPage") = "z2t_specialty_tables.asp"
%>

<html>
  <head>
    <title>Specialty .CSV Tax Tables - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Zip2Tax created specialty .CSV tax tables formatted to fullfill customer's specific requests. See if we have the format you need.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	<script language="javascript" src="/Website/pagesProducts/SpecialtyTables/page_specialty_tables.js" type="text/javascript"></script>
    </head>
  
  <body>    
    <div class="container-fluid" style="padding: 0px;">
    <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
      
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">
		<!-- #include virtual="/Website/pagesProducts/SpecialtyTables/page_specialty_tables_content.asp" -->
        <!-- #include virtual="/Website/pagesProducts/SpecialtyTables/page_specialty_tables_right_sidebar.asp" -->
        </div>
         </div>
    </div>
    
    <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
  </body>
</html>
