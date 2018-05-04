<style type="text/css">
<!--
.right {	text-align: right;
}
.right {	text-align: right;
}
-->
</style>
<div id="content">
  
  <div class="post">
    <h1 class="title">Database Interface API</h1>
    <div class="entry">


      <p>
      <img src="/Website/Images/Developers/XML.jpg" alt="XML or JSON response" width="200" height="288" border="0" class="imgRight" title="XML or JSON response">
      <span class="firstword">This API</span>
       provides for  XML or JSON responses for all three resolution levels
         we offer to <a href="/free-sales-tax-calculator#PageSection2">subscribers</a>.</p>

      <p> We offer several levels of subscription, so your business can get the
        accuracy it needs without paying for more than you'll use:
      <a onclick ="javascript:ShowHide('HiddenSummary1')" href="javascript:;"> ZIP
      Code,</a>&nbsp;
      <a onclick ="javascript:ShowHide('HiddenSummary2')" href="javascript:;">ZIP+4,</a>&nbsp;
        <a onclick ="javascript:ShowHide('HiddenSummary3')" href="javascript:;">and
        PinPoint.</a>
      <p id="HiddenSummary1" style="DISPLAY: none" > <img src="/Website/Images/PinPoint/ZIP-code-sm.png" class="imgLeft" alt="Zip Code resolution" /> 
              The most economical service for companies wanting to improve efficiency
              while maintaining affordability. City and town names with sales
              tax detail are provided for every locality within a ZIP code, giving
              the operator the ability to choose the jurisdiction they want. <a href="/developers-api-zipcode">ZIP Code API</a> </p>
          
            <p id="HiddenSummary2" style="DISPLAY: none" > <img src="/Website/Images/PinPoint/ZIP+4-sm.png" class="imgLeft" alt="Zip+4 resolution" /> 
              A very high level of jurisdictional certainty at an affordable price.
              Sometimes referred to as the 9-digit ZIP code, the first 5 digits
              determine a delivery area, such as a town and state, and the additional
              4 digits target the location to within one side of a street within
              a range of addresses, such as 100 to 120 East Main St. <a href="/developers-api-zip-plus-4">ZIP+4 API</a></p>
          
      <p id="HiddenSummary3" style="DISPLAY: none" > <img src="/Website/Images/PinPoint/PinPoint-sm.png" class="imgLeft" alt="PinPoint resolution" /> 
              The most accurate sales tax jurisdiction granularity for companies
              needing precision data. PinPoint validates U.S. postal address
              and converts street address into latitude and longitude coordinates
              (also known as geocoding) to provide the highest level of resolution
              available. <a href="/Website/pagesSupport/pagesDev/z2t_developers_PinPoint.asp">PinPoint API</a></p>
   
      <p>Database Interface subscriptions are available for a <a href="javascript:openPopUp('http://www.zip2tax.com/shopping/cart/database_single_popup.asp');void(0);">single
          state</a>, or for the whole <a href="javascript:openPopUp('http://www.zip2tax.com/shopping/cart/database_US_popup.asp');void(0);">United
          States</a>.</p>
      <p>The <a href="/developers-api-zipcode">ZIP Code API</a>, 
	    <a href="/developers-api-zip-plus-4">ZIP+4 API</a>, 
		and <a href="/Website/pagesSupport/pagesDev/z2t_developers_PinPoint.asp">PinPoint API</a> 
        pages have code samples for .XML or .JSON responses, allowing 
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
      handling: &lt;errorCode&gt; and &lterrorMessage&gt.  Below is a
      list of possible results &hellip;</p>

      <table border=1 cellspacing="2" cellpadding="2" style="border-style: none;">
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
	  90001 - 90999 (PinPoint resolution)</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">56</td>
	<td style="border-style: none;">Valid sample ZIP codes must fall in the range
	  90001 - 90999 (ZIP+4 resolution)</td></tr>
	<!--tr><td align="center" width="100" style="border-style: none;">66</td><td style="border-style: none;"></td></tr-->
	<tr><td align="center" width="100" style="border-style: none;">99</td>
	<td style="border-style: none;">Invalid ZIP code (ZIP Code resolution)</td></tr>
	<tr><td align="center" width="100" style="border-style: none;">100</td>
	<td style="border-style: none;">Invalid ZIP code</td></tr>
 	<tr>
	<td align="center" width="100" style="border-style: none;">111</td>
	<td style="border-style: none;">Insufficient input to specify a tax jurisdiction
	  (PinPoint resolution)</td>
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
	<!--tr><td align="center" width="100" style="border-style: none;">101</td><td style="border-style: none;"></td></tr-->
      </table>
    </div>
  </div>
</div>
