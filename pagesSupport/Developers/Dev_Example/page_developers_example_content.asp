<div id="content">
  <div class="post">
    <h1 class="title">Connecting to <% If Request("language") <> "PHP" Then  %>SQL Server<% Else %>MySQL<% End If %> Using <% Response.Write(Request.QueryString("language")) %></h1>
    <div class="NoScreen">
      <p>&nbsp;</p>
    </div>
    <div class="entry">
      <!--
          <p><span class="firstword">When</span> connecting to our Microsoft
            SQL Server be sure that the Microsoft Data Access Components
            (MDAC) have been installed on your server. These come standard
            on Windows-based servers but not on Linux machines. In either
            case, the MDAC is available for free from Microsoft.</p>
          -->
      <p>
        <% Select Case Session("devPage") %>
        <% Case "C#.NET" %>
        <img src="/Website/Images/Developers/C_sharp_logo.jpg" align="right" width="144" height="130" style="display:inline-block; margin-left:10px;" alt="C#-Logo">
        <% Case "ASP.NET" %>
        <img src="/Website/Images/Developers/ASP_net_logo.jpg" align="right" width="144" height="48" style="display:inline-block; margin-left:10px;" alt="ASP.NET-Logo">
        <% End Select %>
        <span class="firstword">You</span > have a choice to retrieve
        the tax data aggregated for state-level reporting
        (<a href="#Basic" class="firstword">Basic</a>)
        or partitioned to local municipalities
        (<a href="#Breakout" class="firstword">Breakout</a>).
        Some zip codes include multiple tax jurisdictions, so you can also retrieve multiple rows per zip code 
        (<a href="#BasicMultiple" class="firstword">Basic, multiple rows</a> or
        <a href="#BreakoutMultiple" class="firstword">Breakout, multiple rows</a>,
        respectively). If you retrieve multiple rows, examine the <span class="firstword">"City"</span>
        field on each row. Use the "City" to determine which row contains the tax data you need. 
        (The "Post_Office_City" will be the same on each row.)</p>
    </div>
    <div class="entry">
      <a name="Basic" id="Basic"></a>
      <% If (Request.QueryString("language") <> "ASP") And (Request.QueryString("language") <> "PHP") Then %>
     <span class="firstword">Basic:</span> sample header for <%= Request.QueryString("language") %>
      <div class="samplesBox">

        <pre><code>
<% Select Case Request.QueryString("language") %>
<% Case "ASP", "PHP" %>
<!-- no header for ASP -->
<% Case "ASP.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_basic_header.inc" -->
<% Case "C#.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_ceesharpdotnet_basic_header.inc" -->
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
<% Case "ASP" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_asp_basic.inc" -->
<% Case "ASP.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_basic.inc" -->
<% Case "C#.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_ceesharpdotnet_basic.inc" -->
<% Case "PHP" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_MySQL_php_basic.inc" -->
<% Case Else %>
&lt;No language selected&gt;
<% End Select %>
</code></pre>
      </div>

      <p>&nbsp;</p>

      <a name="Breakout" id="Breakout"></a>
      <% If (Request.QueryString("language") <> "ASP") And (Request.QueryString("language") <> "PHP") Then %>
      <span class="firstword">Breakout:</span> sample header for  <%= Request.QueryString("language") %>
      <div class="samplesBox">
        <pre><code>
<% Select Case Request.QueryString("language") %>
<% Case "ASP", "PHP" %>
<!-- no header for ASP -->
<% Case "ASP.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_breakout_header.inc" -->
<% Case "C#.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_ceesharpdotnet_breakout_header.inc" -->
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
<% Case "ASP" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_asp_breakout.inc" -->
<% Case "ASP.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_breakout.inc" -->
<% Case "C#.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_ceesharpdotnet_breakout.inc" -->
<% Case "PHP" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_MySQL_php_breakout.inc" -->
<% Case Else %>
&lt;No language selected&gt;
<% End Select %>
</code></pre>
      </div><!-- samplebox -->

      <p>&nbsp;</p>

      <a name="BasicMultiple" id="BasicMultiple"></a>
      <% If (Request.QueryString("language") <> "ASP") And (Request.QueryString("language") <> "PHP") Then %>
      <span class="firstword">Basic, multiple rows:</span> sample header for <%= Request.QueryString("language") %>
      <div class="samplesBox">

        <pre><code>
<% Select Case Request.QueryString("language") %>
<% Case "ASP", "PHP" %>
<!-- no header for ASP -->
<% Case "ASP.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_basic_header_multiple.inc" -->
<% Case "C#.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_ceesharpdotnet_basic_header_multiple.inc" -->
<% Case Else %>
&lt;No language selected&gt;
<% End Select %>
</code></pre>
      </div>
      <% End If %>
      <span class="firstword">Basic, multiple rows:</span> <%= Request.QueryString("db") %>-basic-multiple.<%= Request.QueryString("file") %>
      <div class="samplesBox">
        <pre><code>
<% Select Case Request.QueryString("language") %>
<% Case "ASP" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_asp_basic_multiple.inc" -->
<% Case "ASP.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_basic_multiple.inc" -->
<% Case "C#.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_ceesharpdotnet_basic_multiple.inc" -->
<% Case "PHP" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_MySQL_php_basic_multiple.inc" -->
<% Case Else %>
&lt;No language selected&gt;
<% End Select %>
</code></pre>
      </div>

      <p>&nbsp;</p>

         <a name="BreakoutMultiple"></a>
      <% If (Request.QueryString("language") <> "ASP") And (Request.QueryString("language") <> "PHP") Then %>
      <span class="firstword">Breakout, multiple rows:</span> sample header for  <%= Request.QueryString("language") %>
      <div class="samplesBox">
        <pre><code>
<% Select Case Request.QueryString("language") %>
<% Case "ASP", "PHP" %>
<!-- no header for ASP -->
<% Case "ASP.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_breakout_header_multiple.inc" -->
<% Case "C#.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_ceesharpdotnet_breakout_header_multiple.inc" -->
<% Case Else %>
&lt;No language selected&gt;
<% End Select %>
</code></pre>
      </div>
      <% End If %>
      <span class="firstword">Breakout, multiple rows:</span> <%= Request.QueryString("db") %>-breakout-multiple.<%= Request.QueryString("file") %>
      <div class="samplesBox">
        <pre><code>
<% Select Case Request.QueryString("language") %>
<% Case "ASP" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_asp_breakout_multiple.inc" -->
<% Case "ASP.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_aspdotnet_breakout_multiple.inc" -->
<% Case "C#.NET" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_SQLServer_ceesharpdotnet_breakout_multiple.inc" -->
<% Case "PHP" %>
<!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/Dev_Includes/z2t_developers_MySQL_php_breakout_multiple.inc" -->
<% Case Else %>
&lt;No language selected&gt;
<% End Select %>
</code></pre>
      </div><!-- samplebox -->
    </div><!-- entry -->
    
    <h2 class="title">Error Handling</h2>
    <div class="entry">      
      <p>In the case of erroneous input, the State and County fields will report "Error", and the Post_Office_City field will hold the error message.<br><br>
      Possible error messages are:<br><br>
      "Zip Out Of State"<br>
      "Invalid Zip"<br>
      "Invalid Sample Zip"<br>
      "Unknown Error"<br>
      </p>     
      
      <br><br>
    </div>

  </div><!-- post -->
</div><!-- content -->

