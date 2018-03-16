<div class="col-lg-6 col-md-9 content">
	<h1>
	<span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	API Connect Samples
	</h1>
		<div class="clearfix"></div>
      <p>
      <img src="/Website/Images/Developers/connect.jpg" alt="connect" width="200" height="200" border="0" align="right" title="XML or JSON response">
      This section provides code samples for calling the Database Interface API.
      The Database Interface is offered at three <a href="/free-sales-tax-calculator#PageSection2">subscription levels</a>, 
	  so your business can get the accuracy it needs without paying for more data than you'll use:
      <a href="/developers-api-zipcode"> ZIP code,</a>&nbsp;
      <a href="/developers-api-zip-plus-4">ZIP+4,</a>&nbsp; and
        <a href="/developers-api-spot-on">
        Spot-On&trade;.</a>
		<p>These samples show a ZIP code level request, however you can easily perform a ZIP+4 or Spot-On&trade; request by increasing the number of input variables.</p>
      <p>The <a href="/developers-api-sample-asp">ASP</a>, 
      <a href="/developers-api-sample-asp-net">ASP.NET</a>, 
      <a href="/developers-api-sample-c-sharp">C#.NET</a> and
      <a href="/developers-api-sample-php">PHP</a> pages have code samples for .XML responses, allowing 
         unlimited testing with addresses found within the ZIP code range from 90001 to 90999.
         If you would like to perform testing outside of that range, please call
        866-492-8494 or <a href="mailto:info@zip2tax.com">e-mail</a> us to request
        a free limited-time account.    </p>
      
  	<h2>
	<span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Error Handling
	</h2>
      <p>
      The &lt;errorInfo&gt; element contains two elements for error
      handling: &lt;errorCode&gt; and &lt;errorMessage&gt;.  Below is a
      list of possible results &hellip;</p>
		<table border="0" cellspacing="3" cellpadding="2" style="border-style: none; margin-left:60px;" align="center">
			
		   <% Set cn = Server.CreateObject("ADODB.Connection")
		cn.Open "Driver={SQL Server};Server=127.0.0.1," + strPort + ";DATABASE=z2t_WebPublic;UID=z2t_WebUser;PWD=WebUser_z2t;"
		
		Set rs = cn.Execute("EXEC z2t_Types_list 'ErrorCode'")
		
		rs.MoveFirst
	Do While Not rs.EOF
		' -- output the contents
		Response.Write "<tr>"
		For i = 0 to rs.Fields.Count - 1
			Response.Write "<td style=""border-style: none;"">" & rs.Fields(i) & "</td>"
		Next
		Response.write "</tr>"
		' -- move to the next record
		rs.MoveNext
	Loop
		
		cn.close
		%>
		</table>

</div>