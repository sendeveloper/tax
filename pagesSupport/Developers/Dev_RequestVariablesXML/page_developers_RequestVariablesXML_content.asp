<div id="content">
  
  <div class="post">
    <h1 class="title">Return Data Using XML</h1>
    <div class="NoScreen">
      <p>&nbsp;</p>
    </div>
    <div class="entry">
      <p><span class="firstword">Rather</span> Than returning the information
        in a plain string, you may prefer to have data passed back using the
        XML Format</p>
    </div>
  </div>
  
  <div class="post">
    <h2 class="title">Quick XML Link</h2>
    <div class="entry">
      <p>The simpliest way to view XML is to click on the link below (use the browser's 
        back button to return to here).<br><br>
        
        <a href="/Link/Lookup_XML.asp?zip=90210&amp;usr=sample&amp;pwd=password">
          <span style="font-family: Courier;">http://www.zip2tax.com/Link/Lookup_XML.asp?zip=90210&amp;usr=sample&amp;pwd=password</span></a></p>
      
      <p>Or you can paste this line of code into any browser's URL box.</p>
      
      <p>When XML is returned to your browser it will look differently depending on your browser brand (IE, Firefox) and version.
        But, the information is the same.  In a practical application you would typically read the results into a requestXML object.</p> 
      
      <p>You may wish to try other zip codes (between 90001 and 90999) to see the results.</p>
      
      <p>This example shows our basic version of tax information giving you the total rate.  You may require our full breakout 
        information which returns all the components (State, County, City and Special District) of the total.
        By clicking the link below you can view this.<br><br>
        
        <a href="/Link/Lookup_XML_Extended.asp?zip=90210&amp;usr=sample&amp;pwd=password">
          <span style="font-family: Courier;">http://www.zip2tax.com/Link/Lookup_XML_Extended.asp?zip=90210&amp;usr=sample&amp;pwd=password</span></a></p>
      
    </div>
    
    <h2 class="title">Error Handling</h2>
    <div class="entry">
      
      <p>Two fields have been added for error handling, error_code and error_message.  Below is a list of possible results . . .</p>
      
      <table border=1 cellspacing="2" cellpadding="2"
             style="border-style: none;">
        <tr><td align="center" width="100" style="border-style: none;">0</td><td width="250" style="border-style: none;">"No Errors"</td></tr>
        <tr><td align="center" style="border-style: none;">1</td><td style="border-style: none;">"Missing Zip Code"</td></tr>
        <tr><td align="center" style="border-style: none;">2</td><td style="border-style: none;">"Missing Password"</td></tr>
        <tr><td align="center" style="border-style: none;">3</td><td style="border-style: none;">"Connection Error"</td></tr>
        <tr><td align="center" style="border-style: none;">4</td><td style="border-style: none;">"Zip Code Less than 5 Characters"</td></tr>
        <tr><td align="center" style="border-style: none;">5</td><td style="border-style: none;">"Zip Code Out of Range for Sample"</td></tr>
        <tr><td align="center" style="border-style: none;">6</td><td style="border-style: none;">"Incorrect Username/Password"</td></tr>
        <tr><td align="center" style="border-style: none;">7</td><td style="border-style: none;">"Zip Code Not Found"</td></tr>
        <tr><td align="center" style="border-style: none;">8</td><td style="border-style: none;">"Missing Username"</td></tr>
        <tr><td align="center" style="border-style: none;">99</td><td style="border-style: none;">"Error Unknown"</td></tr>
      </table>
      
    </div>
  </div>
  
  
</div>
