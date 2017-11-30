<div class="col-lg-6 col-md-9 content">
	<h1>
	<span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Connecting to API Using 
	<% 
		if (Request.QueryString("language") = "NewASP") then
		Response.Write("ASP")
		End if	
		if (Request.QueryString("language") = "NewC#.NET") then
		Response.Write("C#.NET")
		End if
		if (Request.QueryString("language") = "NewASP.NET") then
		Response.Write("ASP.NET")
		End if
		if (Request.QueryString("language") = "NewPHP") then
		Response.Write("PHP")
		End if
	%>
	</h1>
		<div class="clearfix"></div>
      <p>
        <% Select Case Session("devPage") %>
        <% Case "NewC#.NET" %>
        <img src="/Website/Images/Developers/C_sharp_logo.jpg" align="right" width="144" height="130" style="display:inline-block; margin-left:10px;" alt="C#-Logo">
        <% Case "NewASP.NET" %>
        <img src="/Website/Images/Developers/ASP_net_logo.jpg" align="right" width="144" height="48" style="display:inline-block; margin-left:10px;" alt="ASP.NET-Logo">
		<% Case "NewPHP" %>
        <img src="/Website/Images/Developers/php.jpg" align="right" width="144" height="100" style="display:inline-block; margin-left:10px;" alt="php-Logo">
		<% Case "NewASP" %>
        <img src="/Website/Images/Developers/asp_logo.jpg" align="right" width="144" height="100" style="display:inline-block; margin-left:10px;" alt="asp-Logo">
        <% End Select %>
        Included here you will find simple sample code for parsing the Database Interface API in XML.
        The first example returns primary data for a given jurisdiction - the result containing the 
		United States Post Office. Some ZIP codes include multiple cities and sometimes multiple tax jurisdictions, 
		so the second example shows how to go down the hierarchy and parse the XML. 
		</p>
		
      <a name="Basic" id="Basic"></a>
      <% If (Request.QueryString("language") <> "NewASP") And (Request.QueryString("language") <> "NewPHP") Then %>
     <span class="firstword">Basic:</span> sample header for <%= Request.QueryString("language") %>
      <div class="samplesBox">

        <pre><code>
		<% Select Case Request.QueryString("language") %>
		<% Case "NewASP", "NewPHP" %>
		<!-- no header for ASP -->
		<% Case "NewASP.NET" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_basic_header_new.inc" -->
		<% Case "NewC#.NET" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_csharpdotnet_basic_header_new.inc" -->
		<% Case Else %>
		&lt;No language selected&gt;
		<% End Select %>
		</code></pre>
			  </div>
			  <% End If %>
			  <span class="firstword">Basic:</span> <%= Request.QueryString("db") %>-basic.<%= Request.QueryString("file") %>
			  <div class="samplesBox">
				<pre><code>
		<% Select Case Request.QueryString("language") %>
		<% Case "NewASP" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_asp_basic_new.inc" -->
		<% Case "NewASP.NET" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_basic_new.inc" -->
		<% Case "NewC#.NET" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_csharpdotnet_basic_new.inc" -->
		<% Case "NewPHP" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_php_basic_new.inc" -->
		<% Case Else %>
		&lt;No language selected&gt;
		<% End Select %>
		</code></pre>
			  </div>

			  <p>&nbsp;</p>

			  <a name="Breakout" id="Breakout"></a>
			  <% If (Request.QueryString("language") <> "NewASP") And (Request.QueryString("language") <> "NewPHP") Then %>
			  <span class="firstword">Breakout:</span> sample header for  <%= Request.QueryString("language") %>
			  <div class="samplesBox">
				<pre><code>
		<% Select Case Request.QueryString("language") %>
		<% Case "NewASP", "NewPHP" %>
		<!-- no header for ASP -->
		<% Case "NewASP.NET" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_breakout_header_new.inc" -->
		<% Case "NewC#.NET" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_csharpdotnet_breakout_header_new.inc" -->
		<% Case Else %>
		&lt;No language selected&gt;
		<% End Select %>
		</code></pre>
			  </div>
			  <% End If %>
			  <span class="firstword">Breakout:</span> <%= Request.QueryString("db") %>-breakout.<%= Request.QueryString("file") %>
			  <div class="samplesBox">
				<pre><code>
		<% Select Case Request.QueryString("language") %>
		<% Case "NewASP" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_asp_breakout_new.inc" -->
		<% Case "NewASP.NET" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_breakout_new.inc" -->
		<% Case "NewC#.NET" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_csharpdotnet_breakout_new.inc" -->
		<% Case "NewPHP" %>
		<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_php_breakout_new.inc" -->
		<% Case Else %>
		&lt;No language selected&gt;
		<% End Select %>
		</code></pre>
			  </div><!-- samplebox -->

      <p>&nbsp;</p>
</div>