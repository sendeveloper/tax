<div class="col-lg-6 col-md-9 content">
	<h1>
	<span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Database Interface API 
	</h1>
		<div class="clearfix"></div>
      <p><span class="firstword">This API</span>
       provides for  XML or JSON responses to an exact streeet address or to
       ZIP+4 or ZIP code levels. The simpliest way to view  results is to 
	   click on one of the sample links below or paste the link into any 
	   browser's URL box. Just pass in an address, or portion of an address, 
	   and leave the username as &quot;sample&quot; and password as 
	   &quot;password&quot;. The response results will be returned in the 
	   appropriate format determined by the URL you have used.</p>
	   
      <p>This sample query string will allow for unlimited testing with 
	  addresses found within the ZIP codes from 90001 to 90999. If you would 
	  like to perform testing outside of that range, please call 866-492-8494 
	  or <a href="mailto:info@zip2tax.com">e-mail</a> us to request a free 
	  limited-time account. For subscription information, check out our 
	  <a href="/free-sales-tax-calculator#PageSection2">Database 
	  Interface pricing</a>.</p>

	<h2><span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>XML Response API</h2>
        <p>Click on the sample code below to see what a Spot-On&trade; level result 
	  would look like in browser for a street address in Beverly Hills, 
	  California. In a practical application you would typically read the 
	  results into a XMLHttpRequest object. 
	  
      <br><br>
	  
      <a href="https://api.zip2tax.com/TaxRate-USA.xml?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;username=sample&amp;password=password" target="_blank">https://api.zip2tax.com/TaxRate-USA.xml?AddressLine1=8555%20Beverly%20Blvd.&amp;
	  <br>City=Los%20Angeles&amp;State=CA&amp;username=sample&amp;password=password</a></p>
	  
      <p>If you have additional address information available, you may 
	  specify it for use when the address is incorrect.  For example, you 
	  might specify the ZIP+4 or ZIP code:
	  <br>
	  
      <a href="https://api.zip2tax.com/TaxRate-USA.xml?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;zip=90210-3303&amp;username=sample&amp;password=password" target="_blank">https://api.zip2tax.com/TaxRate-USA.xml?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;
      <br>zip=90210-3303&amp;username=sample&amp;password=password</a>
	  
      <br><br>
	  
      <a href="https://api.zip2tax.com/TaxRate-USA.xml?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;zip=90210&amp;username=sample&amp;password=password" target="_blank">https://api.zip2tax.com/TaxRate-USA.xml?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;
      <br>zip=90210&amp;username=sample&amp;password=password</a>  
	  
	  
      <h2><span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>JSON Response API</h2>
          <p>For a JSON response, simply replace .XML with .JSON, as seen below:
<br><br>
		
        <a href="https://api.zip2tax.com/TaxRate-USA.json?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;username=sample&amp;password=password" target="_blank">https://api.zip2tax.com/TaxRate-USA.json?AddressLine1=8555%20Beverly%20Blvd.&amp;
	    <br>City=Los%20Angeles&amp;State=CA&amp;username=sample&amp;password=password</a></p>
		
        <p>If you have additional address information available, you may specify 
		it for use when the address is incorrect.  For example, you might specify 
		the ZIP+4 or ZIP code:
		
        <br><br>
		
        <a href="https://api.zip2tax.com/TaxRate-USA.json?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;zip=90210-3303&amp;username=sample&amp;password=password" target="_blank">https://api.zip2tax.com/TaxRate-USA.json?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;
        <br>zip=90210-3303&amp;username=sample&amp;password=password</a>
		
        <br><br>
		
        <a href="https://api.zip2tax.com/TaxRate-USA.json?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;zip=90210&amp;username=sample&amp;password=password" target="_blank">https://api.zip2tax.com/TaxRate-USA.json?AddressLine1=8555%20Beverly%20Blvd.&amp;City=Los%20Angeles&amp;State=CA&amp;zip=90210&amp;
        <br>username=sample&amp;password=password</a></p>
	  
 </div>