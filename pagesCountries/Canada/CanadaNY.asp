<!doctype html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<%
    <!-- Session("activePage") = "States Sales Tax"
    Session("currentPage") = "states.asp"

	set con = server.createobject("adodb.connection")
	con.open connStrPublic
	Set cmd = Server.CreateObject("ADODB.Command")   
	cmd.CommandTimeout = 120
	cmd.ActiveConnection = con
				
	sqlstr="z2t_EntityPages_US_State_read"
	cmd.CommandText = sqlstr
	cmd.CommandType  = 4
	cmd.Parameters(1) = request("StateID")
	set rs=cmd.execute()				



	PageTitle=rs("PageTitle") 
	Statefullname=rs("Statefullname") 
	State=rs("State") 
	staterate=rs("staterate") 
	Jurisdictions_text=rs("Jurisdictions_text") 
	UseTaxBaseText=rs("UseTaxBaseText") 
	NexusDefText=rs("NexusDefText") 
	NexusText=rs("NexusText") 
	ContactText=rs("ContactText") 
	ShippingText=rs("ShippingText") 
	FinanceText=rs("FinanceText") 
	ClothingText=rs("ClothingText") 
	HolidayText=rs("HolidayText") 
	OriginText=rs("OriginText") 
	SourceText=rs("SourceText") 
	linkURL1=rs("linkURL1") 
	linkName1=rs("linkName1") 
	linkURL2=rs("linkURL2") 
	linkName2=rs("linkName2") 
	linkURL3=rs("linkURL3") 
	linkName3=rs("linkName3") 
	linkURL4=rs("linkURL4") 
	linkName4=rs("linkName4") 
	
	statePageTitle =  Statefullname & " Sales Tax Rates | Zip2Tax LLC"
	statePageDescription="Zip2Tax specializes in sales tax and use tax for "&Statefullname&". Try it today and find "&Statefullname&" sales tax and use tax information instantly!"
	statePageKeyWord= "Sales and use tax rates for commerce"    
	
	'for each item in rs.fields
	'	response.write item.name & "=rs(""" & item.name &""") <br>" 
	'next -->
				

	%>

<html lang="en">
  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
	
	<script src="/js/jquery.fancybox.pack.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="/js/jquery.fancybox.css?v=2.1.5" media="screen" />
	<link rel="stylesheet" type="text/css" href="/Website/pagesCountries/Canada/States/page_states.css" />
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
  </head>
  
  <body>	
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
	    
        <div class="clearfix"></div>
        <div class="container">		
		  <!-- #include virtual="/Website/pagesCountries/Canada/States/page_states_content.asp" -->
          <!-- #include virtual="/Website/pagesCountries/Canada/States/page_states_right_sidebar.asp" -->
		</div>
    </div>
	
	<!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->	
  </body>
</html>
