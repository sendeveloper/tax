
<div id="content">
  
  <div class="post">
    <h1 class="title">API Connect Samples</h1>
    <div class="entry">

      <p>
      <img src="/Website/Images/Developers/connect.jpg" alt="connect" width="200" height="200" border="0" class="imgRight" title="XML or JSON response">
      This section provides code samples for calling the Database Interface API.
      The Database Interface is offered at three <a href="/free-sales-tax-calculator#PageSection2">subscription levels</a>, 
	  so your business can get the accuracy it needs without paying for more data than you'll use:
      <a href="/developers-api-zipcode"> ZIP code,</a>&nbsp;
      <a href="/developers-api-zip-plus-4">ZIP+4,</a>&nbsp; and
        <a href="/developers-api-spot-on">
        Spot-On.</a>
		<p>These samples show a ZIP code level request, however you can easily perform a ZIP+4 or Spot-On request by increasing the number of input variables.</p>
      <p>The <a href="/developers-api-sample-asp?amp;language=NewASP&amp;file=asp&amp;db=mssql">ASP</a>, 
      <a href="/developers-api-sample-asp?amp;language=NewASP.NET&amp;file=vb&amp;db=mssql">ASP.NET</a>, 
      <a href="/developers-api-sample-asp?amp;language=NewC%23.NET&amp;file=cs&amp;db=mssql">C#.NET</a> and
      <a href="/developers-api-sample-asp?amp;language=NewPHP&amp;file=php&amp;db=mssql">PHP</a> pages have code samples for .XML responses, allowing 
         unlimited testing with addresses found within the ZIP code range from 90001 to 90999.
         If you would like to perform testing outside of that range, please call
        866-492-8494 or <a href="mailto:info@zip2tax.com">e-mail</a> us to request
        a free limited-time account.    </p>
    </div>
  </div>
  
  <div class="post">
    <div class="post"> </div>
    <h2 class="title">Error Handling</h2>
    <div class="entry">
      <p>
      The &lt;errorInfo&gt; element contains two elements for error
      handling: &lt;errorCode&gt; and &lt;errorMessage&gt;.  Below is a
      list of possible results &hellip;</p>

   <!--   <table border=1 cellspacing="2" cellpadding="2" style="border-style: none;">
	<tr><td align="center" width="100" style="border-style: none;">0</td>
	<td style="border-style: none;">Success</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">1</td>
	<td style="border-style: none;">Incorrect ZIP</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">2</td>
	<td style="border-style: none;">Incorrect state as per ZIP code provided</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">3</td>
	<td style="border-style: none;">Incorrect city as per ZIP code and state provided</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">4</td>
	<td style="border-style: none;">City alias is provided by user</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">5</td>
	<td style="border-style: none;">Blank IP received</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">6</td>
	<td style="border-style: none;">Address not found</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">7</td>
	<td style="border-style: none;">Expired account</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">8</td>
	<td style="border-style: none;">Invalid credentials</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">9</td>
	<td style="border-style: none;">Invalid ZIP+4</td></tr>
	<tr>
	<td align="center" width="100" style="border-style: none;">10</td>
	<td style="border-style: none;">Address found, but tax jurisdiction boundaries could not be matched</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">55</td>
	<td style="border-style: none;">Valid sample ZIP codes must fall in the range
	  90001 - 90999 (Spot-On resolution)</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">56</td>
	<td style="border-style: none;">Valid sample ZIP codes must fall in the range
	  90001 - 90999 (ZIP+4 resolution)</td></tr>
	tr><td align="center" width="100" style="border-style: none;">66</td><td style="border-style: none;"></td></tr
	<tr><td align="center" width="100" style="border-style: none;">99</td>
	<td style="border-style: none;">Invalid ZIP code (ZIP Code resolution)</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">100</td>
	<td style="border-style: none;">Invalid ZIP code</td></tr>
 	<tr>
	<td align="center" width="100" style="border-style: none;">111</td>
	<td style="border-style: none;">Insufficient input to specify a tax jurisdiction
	  (Spot-On resolution)</td>
   </tr>
   	<tr>
	<td align="center" width="100" style="border-style: none;">112</td>
	<td style="border-style: none;">Insufficient input to specify a tax jurisdiction
	  (ZIP+4 resolution)</td>
   </tr>
      	<tr>
	<td align="center" width="100" style="border-style: none;">113</td>
	<td style="border-style: none;">Insufficient input to specify a tax jurisdiction
	  (ZIP Code resolution)</td>
   </tr>
	<tr><td align="center" width="100" style="border-style: none;">101</td><td style="border-style: none;"></td></tr>
      </table -->
    </div>
  </div>
</div>
