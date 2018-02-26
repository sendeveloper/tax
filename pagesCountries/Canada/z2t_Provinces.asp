<!doctype html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    <!-- Session("activePage") = "Province Sales Tax"
    Session("currentPage") = "z2t_provinces.asp"				
	
	Province = Request("Province")
	If Province="" Then
		Province = "Alberta"
	End If
%>

<html lang="en">
  <head>
  	<title><%=Province%></title>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
	
	<script src="/js/jquery.fancybox.pack.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="/js/jquery.fancybox.css?v=2.1.5" media="screen" />
	<link rel="stylesheet" type="text/css" href="/Website/pagesCountries/Includes/Menu/z2t_JurisdictionMenu.css" />
    <script>
			$(document).ready(function() {
				$("#single_1").fancybox({
					  helpers: {
						  title : {
							  type : 'float'
						  }
					  }
				  });
			});			
	</script>
	<style>
		@media (min-width: 768px){
	        #img-small img{
	          	width: 300px !important;
	        }
		}
	</style>
  </head>
  
  <body>	
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
	    
        <div class="clearfix"></div>
        <div class="container">		
<%
	Select Case Province
	Case "Alberta"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_alberta.asp" -->
<%
	Case "BritishColumbia"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_british_columbia.asp" -->
<%
	Case "Manitoba"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_manitoba.asp" -->	
<%

	Case "NewBrunswick"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_new_brunswick.asp" -->	

<%
	Case "NewfoundlandLabrador"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_newfoundland_labrador.asp" -->
<%
	Case "NorthwestTerritories"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_northwest_territories.asp" -->
<%
	Case "NovaScotia"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_nova_scotia.asp" -->
<%
	Case "Nunavut"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_nunavut.asp" -->
<%
	Case "Ontario"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_ontario.asp" -->	
<%
	Case "PrinceEdwardIsland"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_prince_edward_island.asp" -->
<%
	Case "Quebec"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_quebec.asp" -->
<%
	Case "Saskatchewan"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_saskatchewan.asp" -->
<%
	Case "Yukon"
%>
		  <!-- #include virtual="/Website/pagesCountries/Canada/Provinces/page_provinces_content_yukon.asp" -->
<%
	End Select
%>		 
		  <div class="col-lg-3 col-md-3 NoPrint">
			<%Session("MenuOrder")="Canada|USA"%>
			<!-- #include virtual="/Website/pagesCountries/Includes/Menu/z2t_JurisdictionMenu.asp" -->
		  </div>
		</div>
    </div>
	
	<!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->	
  </body>
</html>
