<div class="col-lg-6 col-md-9 content">
  <%=HeadingH1("Database Interface API")%>
		<div class="clearfix"></div>
      <p>
      <img src="/Website/Images/Developers/XML.jpg" alt="XML or JSON response" width="200" height="288" border="0" align="right" title="XML or JSON response">
      <span class="firstword">This API</span> provides for  XML or JSON responses for all three resolution levels we offer to 
	  <a href="/free-sales-tax-calculator#PageSection2">subscribers</a>.</p>

      <p> We offer several levels of subscription, so your business can get the
        accuracy it needs without paying for more than you'll use:
      <a onclick ="javascript:ShowHide('HiddenSummary1')" href="javascript:;"> ZIP
      Code,</a>&nbsp;
      <a onclick ="javascript:ShowHide('HiddenSummary2')" href="javascript:;">ZIP+4,</a>&nbsp;
        <a onclick ="javascript:ShowHide('HiddenSummary3')" href="javascript:;">and
        Spot-On.</a>
      <p id="HiddenSummary1" style="DISPLAY: none" > <img src="/Website/Images/Services/ZIP-code-sm.png" class="imgLeft" alt="Zip Code resolution"> 
              The most economical service for companies wanting to improve efficiency
              while maintaining affordability. City and town names with sales
              tax detail are provided for every locality within a ZIP code, giving
              the operator the ability to choose the jurisdiction they want. <a href="/developers-api-zipcode">ZIP Code API</a> </p>
          
            <p id="HiddenSummary2" style="DISPLAY: none" > <img src="/Website/Images/Services/ZIP+4-sm.png" class="imgLeft" alt="Zip+4 resolution"> 
              A very high level of jurisdictional certainty at an affordable price.
              Sometimes referred to as the 9-digit ZIP code, the first 5 digits
              determine a delivery area, such as a town and state, and the additional
              4 digits target the location to within one side of a street within
              a range of addresses, such as 100 to 120 East Main St. <a href="/developers-api-zip-plus-4">ZIP+4 API</a></p>
          
      <p id="HiddenSummary3" style="DISPLAY: none" > <img src="/Website/Images/Services/SpotOn-sm.png" class="imgLeft" alt="Spot-On resolution"> 
              The most accurate sales tax jurisdiction granularity for companies
              needing precision data. Spot-On validates U.S. postal address
              and converts street address into latitude and longitude coordinates
              (also known as geocoding) to provide the highest level of resolution
              available. <a href="/developers-api-spot-on">Spot-On API</a></p>
   
      <p>Database Interface subscriptions are available for a <a href="javascript:openPopUp('/Website/pagesProducts/Cart/Database_Single/database_single_popup.asp');void(0);">single
          state</a>, or for the whole <a href="javascript:openPopUp('http://www.zip2tax.com/Website/pagesProducts/Cart/Database_US/database_US_popup.asp');void(0);">United
          States</a>.</p>
      <p>The <a href="/developers-api-zipcode">ZIP Code API</a>, <a href="/developers-api-zip-plus-4">ZIP+4 API</a>, and <a href="/developers-api-spot-on">Spot-On API</a> 
        pages have code samples for .XML or .JSON responses, allowing 
         unlimited testing with addresses found within the ZIP code range from 90001 to 90999.
         If you would like to perform testing outside of that range, please call
        866-492-8494 or <a href="mailto:info@zip2tax.com">e-mail</a> us to request
        a free limited-time account.    </p>
		
	<h2>
	<span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Error Handling
	</h2>		
	<div class="clearfix"></div>
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