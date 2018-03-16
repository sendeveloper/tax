	  
	  <!-- START: HOW DOES YOUR DATABASE INTERFACE HANDLE ZIP CODES... -->
      <div class="AccordionPanel">
        <div class="AccordionPanelTab">
          <h3><strong>How does your Database Interface handle ZIP codes that have more than one tax rate?</strong></h3>
        </div><!-- AccordionPanelTab -->
        <div class="AccordionPanelContent">       
          <div class="divContent6">
            <p>Our <a href="/developers-api" 
			target="_blank">XML and JSON response API</a> can provide data at the 
			Spot-On&trade;, ZIP+4 and ZIP code levels.</p>
			
            <p><a href="/developers-api-zip-plus-4" 
			target="_blank">ZIP+4</a> subscriptions allow you to input a nine digit 
			postal code and will provide granularity down to one side of a street 
			for a range of addresses. This will sometimes result in more than one 
			tax jurisdiction. In those cases you will see the most likely match 
			first, followed by other possible matches lower on the page. You can 
			then manually choose the one you want. If no exact match is found, the 
			results for a five digit ZIP code lookup will be displayed.</p>
			
            <p><a href="/developers-api-zipcode" 
			target="_blank">ZIP code</a> lookups often return more than one possible 
			matching result. The default result will provide the rate for the Primary 
			Record - the town within the ZIP code where the U.S. Post Office is 
			located. A menu will appear below the main window showing the names and 
			tax rates of other communities sharing the same ZIP code. You can then 
			manually determine which municipality you are looking for.</p>
			
			<p>We also continue to support 
			non-<a href="/Website/pagesSupport/pagesDev/z2t_developers_DirectConnect.asp" 
			target="_blank">API SQL and MySQL</a> sample codes that work on the ZIP code 
			level only. They are written in a few of the most commonly used programming 
			languages, that will provide four distinct data sets: "Basic" returns the 
			tax data aggregated for state-level reporting; "Breakout" provides the 
			sum as well as portioning the rates for state, county, city, and special 
			district levels;"Basic, multiple rows" returns a aggregated result for each 
			district within a ZIP code; and "Breakout, multiple rows" provides the full 
			data for each.</p>			
          </div>      
        </div><!-- AccordionPanelContent -->
      </div><!-- AccordionPanel -->
	  <!-- END: HOW DOES YOUR DATABASE INTERFACE HANDLE ZIP CODES... -->