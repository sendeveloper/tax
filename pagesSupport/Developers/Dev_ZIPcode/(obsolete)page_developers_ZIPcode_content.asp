<div id="content">
  
  <div class="post">
    <h1 class="title">Database Interface API</h1>
    <div class="entry">
      <p><span class="firstword">This API</span>
      provides for  XML or JSON responses at the ZIP code resolution level.
      The simpliest way to view  results is to click on one of the sample 
	  links below or paste the link into any browser's URL box. Just pass 
	  in an address, or portion of an address, and leave the username as 
	  &quot;sample&quot; and password as &quot;password&quot;. The 
	  response results will be returned in the appropriate format 
	  determined by the URL you have used. </p>
	  
      <p>This sample query string will allow for unlimited testing with  
	  ZIP codes between 90001 and 90999. If you would like to perform 
	  testing outside of that range, please call 866-492-8494 or 
	  <a href="mailto:info@zip2tax.com">e-mail</a> us to request a free 
	  limited-time account. For subscription information, check out our 
	  <a href="/free-sales-tax-calculator#PageSection2">Database 
	  Interface pricing</a>.</p>
    </div><!-- entry -->
  </div><!-- post -->
  
  <div class="post">
    <h2 class="title">XML Response API</h2>
    <div class="entry">
      <p>Click on the sample code below to see what the ZIP code level result
      would look like in browser for a ZIP code in Beverly Hills, California. 
	  In a practical application you would typically read the results into a 
	  XMLHttpRequest object.</p>
      
      <a href="https://api.zip2tax.com/TaxRate-USA.xml?username=sample&amp;password=password&amp;zip=90210" 
	  target="_blank">https://api.zip2tax.com/TaxRate-USA.xml?username=sample&amp;password=password&amp;zip=90210</a>
         
    </div><!-- entry -->
	
    <div class="post">
      <h2 class="title">JSON Response API</h2>
        <div class="entry">
          <p>For a JSON response, simply replace .XML with .JSON, as seen below:</p>
		  
          <a href="https://api.zip2tax.com/TaxRate-USA.json?username=sample&amp;password=password&amp;zip=90210" 
		  target="_blank">https://api.zip2tax.com/TaxRate-USA.json?username=sample&amp;password=password&amp;zip=90210</a>
        </div><!-- entry -->
      </div><!-- post -->
	  
      <h2 class="title"></h2>
        <div class="entry">
  

         <!-- <table border=1 cellspacing="2" cellpadding="2" style="border-style: none;">
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
			tr><td align="center" width="100" style="border-style: none;">101</td><td style="border-style: none;"></td></tr 
	      </table -->
        </div>
      </div>
</div>
