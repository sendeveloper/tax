<div class="col-md-9 content">
	<h1>
	<span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Database Interface
	</h1>
		<div class="clearfix"></div>
	<p><h4>Recommended for experienced coders, developers and IT professionals</h4></p>
      <img src="/Website/Images/Database_Structure.jpg" width="300" height="217" alt="Database structure" align="right">
<!-- START CONNECTION METHODS BOX -->

<!--div style="padding-left: 15px; padding-top: 50px; font-size: 14px; line-height: 200%;" 1-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->
<%
'   Dim menu
   menu = Array("DB Connection", "API", "SpotOn API", "ZIP Code API", "ZIP+4 API", "DirectConnect", "ASP", "ASP.NET", "C#.NET", "PHP", "RequestVariables", "QuickLink", "RequestVariablesXML", "Table Download (HTTP)", "API Connect", "NewASP", "NewASP.NET", "NewC#.NET", "NewPHP") '"WSDL", "WSDLSOAP"
  
   Dim selection: Set selection = Server.CreateObject("Scripting.Dictionary")

   For Each item in menu
     If Session("devPage") = item Then
       selection.add item, " class='mSelected'"
     Else
       selection.add item, ""
     End If
   Next 
   
   
   	Dim subscriptions
    Set subscriptions = GetUserSubscriptions(Session("z2t_UserName"))
	Dim subscription
            Set subscription = subscriptions.EnumSubscriptions()
%>

  <ul style="margin-bottom:0;list-style-type:none;padding-left:10px;text-align:left;">
    <li<%=selection.item("DB Connection")%>>
      <a class="firstword" href="/developers-interface">DB Connection</a>

    <ul style="margin-bottom:0;list-style-type:none;padding-left:10px;text-align:left;">
      <li<%=selection.item("API")%>>
        <a class="firstword" href="/developers-api">API</a>

	<ul style="margin-bottom:0;list-style-type:none;padding-left:10px;text-align:left;">
        <li<%=selection.item("ZIP Code API")%>>
          <a href="/developers-api-zipcode">ZIP Code API</a></li>
         <li<%=selection.item("ZIP+4 API")%>>
          <a href="/developers-api-zip-plus-4">ZIP+4 API</a></li>
        <li<%=selection.item("SpotOn API")%>>
          <a href="/developers-api-spot-on">Spot-On API</a></li></ul></li>
      
	  <li<%=selection.item("API Connect")%>>
        <a class="firstword" href="/developers-api-samples">API Connect Samples</a>
        
        <ul style="margin-bottom:0;list-style-type:none;padding-left:10px;text-align:left;">   
          <li<%=selection.item("NewASP")%>>
            <a href="/developers-api-sample-asp">API using ASP</a></li>
          <li<%=selection.item("NewASP.NET")%>>
            <a href="/developers-api-sample-asp-net">API using ASP.NET</a></li>
          <li<%=selection.item("NewC#.NET")%>>
            <a href="/developers-api-sample-c-sharp">API using C#.NET</a></li>
          <li<%=selection.item("NewPHP")%>>
            <a href="/developers-api-sample-php">API using PHP</a></li></ul></li>
			
			
      <li<%=selection.item("RequestVariables")%>>
        <a class="firstword" href="/developers-passing-variables">Passing Request Variables</a>
        
        <ul style="margin-bottom:0;list-style-type:none;padding-left:10px;text-align:left;">
          <li<%=selection.item("QuickLink")%>>
            <a href="/developers-quick-link">Quick Link</a></li>
          <li<%=selection.item("RequestVariablesXML")%>>
            <a href="/developers-xml-response">XML Response</a></li></ul></li>
    </ul>
  <li<%=selection.item("Table Download (HTTP)")%>>
    <a class="firstword" href="/developers-table-download">Table Download (HTTP)</a></li>
	
	<%IF Not (subscription Is Nothing) then%>  
      <%if subscription.SubscriptionName = "Administrator" then%>
	  
      <li<%=selection.item("DirectConnect")%>>
        <a class="firstword" href="/Website/pagesSupport/pagesDev/z2t_developers_DirectConnect.asp">Direct Connect(ADMIN Only)</a>
        <ul style="margin-bottom:0;list-style-type:none;padding-left:10px;text-align:left;">
        <ul style="margin-bottom:0;list-style-type:none;padding-left:10px;text-align:left;">   
          <li<%=selection.item("ASP")%>>
            <a href="/Website/pagesSupport/pagesDev/z2t_developers_example.asp?language=ASP&amp;file=asp&amp;db=mssql">SQL Server using ASP</a></li>
          <li<%=selection.item("ASP.NET")%>>
            <a href="/Website/pagesSupport/pagesDev/z2t_developers_example.asp?language=ASP.NET&amp;file=vb&amp;db=mssql">SQL Server using ASP.NET</a></li>
          <li<%=selection.item("C#.NET")%>>
            <a href="/Website/pagesSupport/pagesDev/z2t_developers_example.asp?language=C%23.NET&amp;file=cs&amp;db=mssql">SQL Server using C#.NET</a></li>
          <li<%=selection.item("PHP")%>>
            <a href="/Website/pagesSupport/pagesDev/z2t_developers_example.asp?language=PHP&amp;file=php&amp;db=mysql">MySQL using PHP</a></li></ul></li>
	  </ul>
   <br><br>
        <a class="firstword" href="/free-sales-tax-calculator#PageSection3">Legacy Table Update <br>(ADMIN Only)</a>
        <ul style="margin-bottom:0;list-style-type:none;padding-left:10px;text-align:left;">
          
          <li>
            <a href="/Website/pagesProducts/Cart/Table_Single_Update/table_single_update_popup.asp">Single State Update <br>(w/ initial table)</a></li>
          <li>
            <a href="/Website/pagesProducts/Cart/Table_Country_Update/table_country_update_popup.asp">U.S. or Canada Update <br>(w/ initial table</a></li>
          <li>
            <a href="/Website/pagesProducts/Cart/Redist_Table_Single_Update/redist_table_single_update_popup.asp">VAR Single State Update <br>(w/ initial table</a></li>
          <li>
            <a href="/Website/pagesProducts/Cart/Redist_Table_Country_Update/redist_table_country_update_popup.asp">VAR U.S. or Canada Update <br>(w/ initial table</a></li></ul></li>
	  </ul>
   
	  <%end if%>
	  <%end if%>
  
  <!--
      
  <li<%=selection.item("WSDL")%>>
    <a href="/Website/pagesSupport/pagesDev/z2t_developers_WSDL.asp">Web Services Definition Language</a></li>
      
  <li<%=selection.item("WSDLSOAP")%>>
    <a href="/Website/pagesSupport/pagesDev/z2t_developers_WSDLSOAP.asp">WSDL, SOAP</a></li>
      
   -->
</ul>

<!-- END CONNECTION METHODS BOX -->

</div>