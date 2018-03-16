<style>
	.ui-state-active {
	color:#ffffff !important;
	}
</style>
<a name="about3"></a><h1>About The Data</h1>
<div class="accordion">
	<h3>Does your data indicate whether shipping is taxable? </h3>
	<div>
		<p>
		Yes, all of our services include information about the taxability of shipping.  With the Online Lookup, the shipping information is show at the bottom of the lookup window. With Database Interface and Tax Tables, Shipping is taxable if  there is a "1" in that field and not taxable if there is a "0".
		</p>
		<p>
		If there is any variance on the taxability of shipping depending on certain rules, such as whether or not it is separated out on the invoice, we have defaulted to "0" for non-taxable.
		</p>
		<p>
		Our services do not separate shipping and handling charges.
		</p>
	</div>
	
	<h3>Do you provide tax rates for other countries?</h3>
	<div>
		<p>
		We currently offer monthly updated tax rates for the United States and Canada. Canada data is available in .CSV table format only.
		</p>
		<p>
		At this time, we do not offer tax data for any other countries, but we are willing to consider your request if you need a different location. Please forward your request to <a href="mailto:info@zip2tax.com">info@zip2tax.com</a>.
		</p>
	</div>
	
	<h3>Do you provide the names of the special districts? </h3>
	<div>
		<p>
		The Full Breakout .CSV Tax Table provides the reporting codes for state, county, city, and special districts in those states and jurisdictions that require reporting codes. In cases with multiple special districts, the tax rate will be an aggregate.
		</p>
		<p>
		The Online Lookup will provide the proper name of the special district, and Database Interface will provide both the reporting code and the proper name of each special district broken out.
		</p>
	</div>
	
	<h3>Can there be more than one result for a single ZIP code?</h3>
	<div>
		<p>
		Yes. In the United States, a 5 digit ZIP code can encompass many square miles. This area will frequently contain several different cities and towns and sometime cross county boundaries. So a lookup based on ZIP code may return several possible results. Zip2Tax provides each result so you can choose the most appropriate match.
		</p>
		<p>
		A ZIP+4 lookup will narrow the results down to about one side of a road about a block long. This could still potentially cross city and county boundaries.
		</p>
		<p>
		Zip2Tax's Spot-On&trade; lookups ascertain a jurisdiction by exact, validated street address. This method will only provide one result for that door step.
		</p>
	</div>
	
	<h3>Do you provide breakouts for municipalities  smaller than the state level?</h3>
	<div>
		<p>
		We offer sales tax breakouts for state, county, city and special districts. These breakouts have the municipal sales tax rate as well as the reporting code, where applicable. These columns will be left blank for those localities that do not require reporting codes or do not have their own sales tax rates.
		</p>
		<p>
		<a href="/free-sales-tax-calculator#PageSection1" target="_blank">Online Lookup Service:</a> Breakouts are available to our Online Lookup Service subscribers by hovering your mouse over the tax rate on the ZIP Code to Sales Tax Calculator. A pop-up window will appear showing the breakout rates. A menu will appear below the main window showing the names and tax rates of other communities sharing the same ZIP code.
		</p>
		<p>
		<a href="/free-sales-tax-calculator#PageSection2" target="_blank">Database Interface:</a> Breakouts are now available to our Database Interface subscribers. Current Database Interface subscribers need do nothing if they wish to continue to receive aggregate sales tax data. Current and new Database Interface subscribers have the choice of linking to the aggregate data or to receive the full breakout version. Sample test codes for both types are available in our Developers section for Direct Connection or Passing Request Variables
		</p>
		<p>
		<a href="/free-sales-tax-calculator#PageSection3" target="_blank">Sales and Use Tax Tables:</a> Breakout data is the standard format available to all Sales and Use Tax Table subscribers. The Breakout style table contains all of the information that Zip2Tax collects.
		</p>
		<p>
		We also have tables formatted to provide less information than the Breakout style, such as the Basic (a single tax sum combining all municipal levels, and the Unique ZIPs (one row per ZIP code based on the "Primary Record," the municipality housing the U.S. Post Office.) We also have tables designed to work with specific shopping carts and eCommerce systems that organize the data differently than the Breakout version. Please check the Sample Tables and Layout Information found on the <a href="/Website/pagesProducts/z2t_specialty_tables.asp" target="_blank">Services Page</a> for each type of table to see which one will work best with your software.
		</p>
	</div>
	
	<h3>Do tax jurisdictions match up with ZIP codes?</h3>
	<div>
		<p>
		Many times tax districts are based on factors other than ZIP code. There are locations within certain states that have more than one tax jurisdiction for a single ZIP code. This can make it tricky to determine which rate to use based solely upon the 5 digit ZIP code.
		</p>
		<p>
		We offer ZIP+4 and Spot-On&trade; subscriptions to <a href="/free-sales-tax-calculator#PageSection2" target="_blank">Database Interface</a> and <a href="/free-sales-tax-calculator#PageSection1" target="_blank">Online Lookup</a> subscribers to make it easier for you to find the jurisdiction you require. To learn more about the different <a href="/how-to-calculate-sales-tax" target="_blank">levels of granularity</a>.
		</p>
		<p>
		The <a href="/free-sales-tax-calculator#PageSection3" target="_blank">.CSV Tax Tables</a> are available at the ZIP code level only. We've made it possible for you determine which rate to use by providing multiple results for ZIP codes with more than one community. The default result is the municipality that is home to the U.S. Post Office - in the Tax Tables, this location is denoted with a "1" in the Primary Record column. The other rows for that ZIP code show all of the other communities sharing the same ZIP code.
		</p>
		<p>
		You can manually select the row with the closest city match, or, if you are a Database Interface or Tax Tables subscriber, you may be able to program your systems to automatically make the match.
		</p>
	</div>
	
	<h3>Is your data compatible with my shopping cart?</h3>
	<div>
		<p>
		We've determined that our standard .CSV Tax Tables integrate very well with many shopping carts which allow importation ofdata. In fact,  several eCommerce providers have purposely developed their shopping  carts to make sure our data import flawlessly. If you are in the  market for a new provider, please check out our list of  <a href="/Website/pagesProducts/z2t_compatible.asp" target="_blank">compatible systems</a>.
		</p>
		<p>
		We also offer a selection of specially formatted tables for some of the most popular eCommerce systems. Please check out our selection of <a href="/Website/pagesProducts/z2t_specialty_tables.asp" target="_blank">specialty tables</a>.
		</p>
		<p>
		We can also provide our tax data through a variety of database linking methods available at our <a href="/developers-interface" target="_blank">Developers page</a>. Here, your developer or IT professional can access a portion of our live data for testing purposes. The codes provided use a sample username and password which will allow you access to real-time data for ZIP codes between 90001 and 90999. If you subscribe to one of our services, you'll be able to replace the sample username and password with those issued to you, thereby gaining full access without having to alter the rest of the tested code. Your developer should be able to determine which method will work best to meet your needs.
		</p>
		<p>
		If you don't see find a compatible method here, <a href="mailto:info@zip2tax.com">e-mail</a> us your specifications and a sample of what you require and we'll work with you to see if we can accommodate your needs.
		</p>			  
	</div>
	
	<h3>What kinds of taxes do you have data for?</h3>
	<div>
		<p>
		Our data covers general sales and use taxes. We also provide information on the  taxability of shipping. We do not currently provide rate or rule data for specific  products or services.
		</p>
		<p>
		Laws pertaining to the taxability of certain products, business types, and services vary greatly from state to state. Zip2Tax is evaluating the feasibility of providing data for additional tax types such as automobiles, alcoholic beverages, software, and more. If you would like to suggest another type of tax, or if you'd be interested in receiving notice when a tax type is added to our services, please e-mail your request to <a href="mailto:info@zip2tax.com">info@zip2tax.com</a>.
		</p>
	</div>
	
	<h3>How often is your data updated?</h3>
	<div>
		<p>
		Every month each state is analyzed carefully by our tax experts for changes to both the tax rates and the ZIP codes. Our data is updated and provided to our subscribers on the first of every month.
		</p>
		<p>
		Sales Tax Table Updates are provided to our Update subscribers usually 5 - 7 days before the beginning of the month to allow time for implementation.
		</p>
	</div>
</div>
<a href="#top">Back to top</a>


<a name="onlinelookup"></a><h1>Online Lookup</h1>
<div class="accordion">
	<h3>How many free Online Lookups do I get?</h3>
	<div>
		<p>
		You are allowed <a href="/sales-tax-calculator">50 free lookups</a> at the ZIP code level only, not to exceed 10 per day. Spot-On&trade; and ZIP+4 services are available by subscription only, but <a href="mailto:info@zip2tax.com" target="_blank">contact us</a> and we'll be happy to set you up with a  trail account.
		</p>
		<p>
		We sincerely hope that the free lookups will provided you with a good estimation of how accurate our data is and how useful it can be to you personally. If you find value in our product, we invite you to subscribe to one of our <a href="/free-sales-tax-calculator">sales tax data services</a>.
		</p>
	</div>
	
	<h3>What if I've used up my free lookups?</h3>
	<div>
		<p>
		You can subscribe to our service through our easy-to-use shopping cart. Pricing starts at $24.95 which gives you a one-month subscription good for up to 1,000 lookups.
		</p>
		<p>
		Click her to go to the <a href="/free-sales-tax-calculator#PageSection1" target="_blank">Online Lookup subscription</a> options page or give us a call at (866) 492-8494.
		</p>
	</div>
	
	<h3>How many Online Lookups do I get with a subscription?</h3>
	<div>
		<p>
		The <a href="/sales-tax-calculator" target="_blank">trial version</a> of the Online Lookup will allow anyone 50 total lookups, with a maximum of 10 per day.
		</p>
		<p>The <a href="/free-sales-tax-calculator#PageSection1" target="_blank">Online Lookup</a> 
		subscription is for 5 users and no more than 1,000 lookups
		per month.
		We offer scaled pricing for additional users or lookups. Call 1-866-492-8494 or e-mail 
		<a href="mailto:info@zip2tax.com">info@zip2tax.com</a> for more information.</p>
	</div>
	
	<h3>I'm not a customer but I tried to log in. Now the free lookups don't work. How do I fix this?</h3>
	<div>
		<p>Clear your browser's cookies before attempting another free Online Lookup.</p>         
	</div>
	
	<h3> I see extra lookups in my usage history. Where did they come from?</h3>
	<div>
		<p>The number of lookups is counted based on each IP address rather than 
		each unique user. Therefore, if you have multiple users sharing one IP 
		address, the number of lookups will reflect the entire group's activity.</p>

		<p>If you feel that this is not the case, please call our offices and we 
		will be able to assist you, 866-492-8494.</p>
	</div>

	<h3>How does your Online Lookup handle ZIP codes that have more than one tax rate?</h3>
	<div>
		<p>The <a href="/sales-tax-by-zipcode" target="_blank">
		Sales Tax Calculator</a> is available at 3 levels of subscription.</p>

		<p><a href="/sales-tax-lookup" 
		target="_blank">Spot-On&trade;</a> gives you the ability to input and validate a full street 
		address, therefore it will only return more than one possible location if the address 
		cannot be found. In those cases it will provide results to the next closest location, 
		usually ZIP+4.</p>

		<p><a href="/sales-tax-lookup" 
		target="_blank">ZIP+4</a> subscriptions allow you to input a nine digit postal code and 
		will provide granularity down to one side of a street for a range of addresses. This 
		will sometimes result in more than one tax jurisdiction. In those cases you will see 
		the most likely match first, followed by other possible matches lower on the page. You 
		can then manually choose the one you want. If no exact match is found, the results for 
		a five digit ZIP code lookup will be displayed.</p>

		<p><a href="/sales-tax-lookup" target="_blank">
		ZIP code</a> lookups often return more than one possible matching result. The default 
		result will provide the rate for the Primary Record - the town within the ZIP code where 
		the U.S. Post Office is located. A menu will appear below the main window showing the 
		names and tax rates of other communities sharing the same ZIP code. You can then 
		manually determine which municipality you are looking for.</p>

	</div>
	
	<h3>Special District names and breakouts available with the  Spot-On&trade; Lookup</h3>
	<div>
		<p>While the<a href="/sales-tax-calculator" target="_blank">
		ZIP Code Sales Tax Calculator</a> provides sales tax rates and a breakdown of those rates by state, county, city, and the total of special district rates, the <a href="/sales-tax-by-zipcode" target="_blank">Spot-On&trade; Lookup </a> (available only to subscribers) provides the common names of the special districts and a breakdown of the taxes as they apply to each special district.</p>
		<p>This sample shows the lookup result for 23631 Genesee Village Rd., Golden, Colorado, 80401. </p>
		<img src="/Website/Images/23631-Genesee-Golden-CO.jpg" alt='Spot-On&trade; Special Districts' class="img-responsive"> 
	</div>
</div>
<a href="#top">Back to top</a>

<a name="database"></a><h1>Database</h1>
<div class="accordion">
	<h3>SQL Server does not exist or access denied error</h3>
	<div>
		<p>If you are attempting to link to the Zip2Tax database through ASP, and 
		you receive the error:</p>

		<p>Error Type:<br>
		Microsoft OLE DB Provider for ODBC Drivers (0x80004005)<br>
		[Microsoft][ODBC SQL Server Driver][DBNETLIB]SQL Server does not exist or 
		access denied.</p>

		<p>It may be a firewall issue. Make sure you have allowed access to our 
		site from your server. You can test this by pinging our server 
		db.Zip2Tax.com through access port 1433.</p>

		<p>If you have SQL Management Studio, try to connect to db.Zip2Tax.com<br>
		user: z2t_link<br>
		pwd: H^2p6~r<br>
		If you cannot connect to db.Zip2Tax.com, it is likely that you need to 
		enable outgoung connections to db.Zip2Tax.com:1433 in your server firewall 
		and incoming connections from db.Zip2Tax.com.</p>         
	</div>
	
	<h3>Database error codes</h3>
	<div>
		<p>API: XML or JSON responses
		<table>
		<tr>
		<td width="128" align="right" valign="middle">0</td>
		<td width="50"></td>
		<td width="241" valign="middle">Success</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">1</td>
		<td width="50"></td>
		<td width="241" valign="middle">Incorrect Zipcode</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">2</td>
		<td width="50"></td>
		<td width="241" valign="middle">Incorrect State as per Zipcode provided</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">3</td>
		<td width="50"></td>
		<td width="241" valign="middle">Incorrect City as per Zipcode and State provided </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">4</td>
		<td width="50"></td>
		<td width="400" valign="middle">City Alias used for address correction</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">5</td>
		<td width="50"></td>
		<td width="241" valign="middle">One of the mandatory input is blank </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">6</td>
		<td width="50"></td>
		<td width="241" valign="middle">Address not found </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">7</td>
		<td width="50"></td>
		<td width="241" valign="middle">Expired Account </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">8</td>
		<td width="50"></td>
		<td width="241" valign="middle">Invalid Credentials </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">9</td>
		<td width="50"></td>
		<td width="241" valign="middle">Invalid Zip+4 </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">10</td>
		<td width="50"></td>
		<td width="241" valign="middle">Address found, but tax jurisdiction boundaries could not be matched </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">55</td>
		<td width="50"></td>
		<td width="241" valign="middle">Valid sample ZIP codes must fall in the range 90001 - 90999 (ZIP+4 resolution) </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">56</td>
		<td width="50"></td>
		<td width="241" valign="middle">Valid sample ZIP codes must fall in the range 90001 - 90999 (SpotOn resolution) </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">99</td>
		<td width="50"></td>
		<td width="241" valign="middle">Invalid ZIP code (Basic) </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">100</td>
		<td width="50"></td>
		<td width="241" valign="middle"> Invalid ZIP code</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">111</td>
		<td width="50"></td>
		<td width="241" valign="middle"> Insufficient input to specify a tax jurisdiction (SpotOn resolution) </td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">112</td>
		<td width="50"></td>
		<td width="241" valign="middle"> Insufficient input to specify a tax jurisdiction (ZIP+4 resolution)</td>
		</tr>

			<tr>
		<td width="128" align="right" valign="middle">113</td>
		<td width="50"></td>
		<td width="241" valign="middle"> Insufficient input to specify a tax jurisdiction (ZIP Code resolution)</td>
		</tr>

			<tr>
		<td width="128" align="right" valign="middle">500</td>
		<td width="50"></td>
		<td width="241" valign="middle"> 	Internal Error</td>
		</tr>
		</table>        
		<br>
		<hr>
		<p>Passing Request Variable, Quick XML Link:<br>
		In the case of erroneous input, the State and County fields will report "Error", 
		and the Post_Office_City field will hold the error message.<br>
		Possible error messages are:<br>
		"Zip Out Of State"<br>
		"Invalid Zip"<br>
		"Invalid Sample Zip"<br>
		"Unknown Error"</p>

		<table>
		<tr>
		<td width="128" align="right" valign="middle">0</td>
		<td width="50"></td>
		<td width="241" valign="middle">"No Errors"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">1</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Missing Zip Code"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">2</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Missing Password"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">3</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Connection Error"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">4</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Zip Code Less than 5 Characters"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">5</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Zip Code Out of Range for Sample"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">6</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Incorrect Username/Password"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">7</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Zip Code Not Found"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">8</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Missing Username"</td>
		</tr>

		<tr>
		<td width="128" align="right" valign="middle">99</td>
		<td width="50"></td>
		<td width="241" valign="middle">"Error Unknown"</td>
		</tr>
		</table>
	</div>
	
	<h3>How do I test for data retrieval for Database Interface connections?</h3>
	<div>

		<p>To get quick access for testing purposes of Zip2Tax's database responses, use 
		the <a href="/developers-xml-response">XML Response </a> request variables connection method. </p>

		<p>If you a not a current client, use the address<br> 
		<a href="/Link/Lookup_XML.asp?zip=90210&amp;usr=sample&amp;pwd=password">
		<span style="font-family: Courier;">http://www.zip2tax.com/Link/Lookup_XML.asp?zip=90210&amp;usr=sample&amp;pwd=password</span></a> and perform free sample tests with any ZIP code between 90000 and 90999.</p>   

		<p>If you are a current Database Interface customer, use the same address, but 
		replace "sample" with your account username and replace "password" with your 
		password. This will allow you to test any ZIP code within the range (single state 
		or whole U.S.) that you have subscribed to.</p>
	</div>

	<h3>What database port do I use?</h3>
	<div>
		<p>db.Zip2Tax.com accepts connections through port 1433.</p>
	</div>
	
	<h3>How does your Database Interface handle ZIP codes that have more than one tax rate?</h3>
	<div>
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

		<!--<p>We also continue to support 
		non-<a href="/Website/pagesSupport/pagesDev/z2t_developers_DirectConnect.asp" 
		target="_blank">API SQL and MySQL</a> sample codes that work on the ZIP code 
		level only. They are written in a few of the most commonly used programming 
		languages, that will provide four distinct data sets: "Basic" returns the 
		tax data aggregated for state-level reporting; "Breakout" provides the 
		sum as well as portioning the rates for state, county, city, and special 
		district levels;"Basic, multiple rows" returns a aggregated result for each 
		district within a ZIP code; and "Breakout, multiple rows" provides the full 
		data for each.</p>	-->		
	</div>

	<h3>What does a Spot-On&trade; XML Response look like for an address with special districts?</h3>
	<div>
		<p>650 Lindsey Rd., Golden, CO 80401<br><br>
		https://api.zip2tax.com/TaxRate-USA.xml?AddressLine1=650%20Lindsey%20Rd.&amp;City=Golden&amp;State=CO&amp;zip=80401&amp;username=XXXXXX&amp;password=XXXXXX</p>
		<img src="/website/images/services/SpotOn-XML-Special-District-Address.jpg" alt='The API for the Spot-On&trade; level XML response'>
	</div>
</div>
<a href="#top">Back to top</a>


<a name="csvtaxtables"></a><h1>.CSV Tax Tables</h1>
<div class="accordion">

	<h3>Full Breakout tax table layout information</h3>
	<div>
		<p>Download the <a href="/Website/Downloads/Sample_Tables/Zip2TaxTableLayoutInformation.pdf" 
		target="_blank">CSV table layout information </a> in PDF format.</p>

		<p>Each table is provided in .CSV format. If you purchase the entire U.S. 
		Tax Table, you will notice the data is ordered by ZIP code (lowest to 
		highest). If you use Excel to examine the table, you will note that all 
		of the data is on one tab. Note: Excel doesn't show the leading 0's in 
		the ZIP codes. You can solve this by highlighting the ZIP code column and 
		changing it to Zip code format.</p>

		<p>The following is an explanation of the column headings of the U.S. Full Breakout Table:<br><br>

		z2t_ID - A number generated by Zip2Tax for reference 
		purposes. This ID remains constant from month to month except in the case 
		of a few unincorporated areas in Washington State. If a unique identifier 
		is needed, we suggest a combination of ZIP code and city name.<br><br>

		ZIP Code - (Zone Improvement Plan) code; the U.S. system of 
		5-digit codes that identifies the individual post office or metropolitan 
		area delivery station associated with an address.<br><br>

		Sales Tax Rate - The combined state, county and local 
		taxes associated with an area's ZIP code.<br><br>

		Rate State &ndash; The portion of the sales tax remitted to the state. <br><br>

		Reporting Code State &ndash; Some states use a reporting code, often an abbreviation of the jurisdiction, (ex: CG for &ldquo;city of Casa Grande, AZ) or sometimes a numeric code decided by the state. This field will be left blank for those states that do not require reporting codes.<br><br>

		Rate County &ndash; The portion of the sales tax remitted to the county.<br><br>

		Reporting Code County &ndash; Some counties use a reporting code. This field will be left blank for those counties that do not require reporting codes.<br><br>

		Rate City &ndash; The portion of the sales tax remitted to the city. <br><br>

		Reporting Code City &ndash; Some cities use a reporting code. This field will be left blank for those cities that do not require reporting codes.<br><br>

		Rate Special District &ndash; The portion of the sales tax remitted to a special district. This district could be a school system, a service authority -- often related to utilities or transportation -- or other municipality designated for taxation purposes such as police, fire or ambulance.<br><br>

		Reporting Code Special District &ndash; Some special districts use a reporting code. This field will be left blank for those special districts that do not require reporting codes. <br><br>

		City &ndash; An incorporated administrative district established by state charter.<br><br>

		Post Office &ndash; The name of the city used by the postal service which is not necessarily match the city named above.<br><br>

		State &ndash; A two letter abbreviation for the state.<br><br>

		County &ndash; A local level of government below the state or federal territory. Counties are used in 48 of the 50 states, while Louisiana is divided into parishes and Alaska into boroughs.<br><br>

		Shipping Taxable &ndash; &ldquo;1&rdquo; mean shipping is taxable and &ldquo;0&rdquo; means no.<br><br>

		Primary Record &ndash; Some municipalities share ZIP codes. For example: The Arizona city of New River, county of Maricopa, shares the 85087 ZIP code with the City of Phoenix. New River is the location of the post office, therefore it is the Primary Record. A &ldquo;1&rdquo; denotes the Primary Record and &ldquo;0&rdquo; means this is a shared ZIP code but the other location contains the post office.</p>
	</div>
	
	<h3>What is the maximum character length for each column?</h3>
	<div>
		<p>Download the <a href="/Website/Downloads/Sample_Tables/Zip2TaxTableLayoutInformation.pdf" 
		target="_blank">CSV table layout information </a> in PDF format.</p>
		<p>The following is an explanation of the maximum possible field lengths for each column in the .CSV tables - for use by programmers. </p>
		<p>z2t_ID &ndash; Integer.  *Not a unique identifier.*<br>
		ZIP Code &ndash; String 50 char max <br>
		Sales Tax Rate &ndash; Decimal <br>
		Rate State &ndash; Decimal <br>
		Reporting Code State &ndash; String 50 char max <br>
		Rate County &ndash; Decimal<br>
		Reporting Code County &ndash; String 50 char max<br>
		Rate City &ndash; Decimal <br>
		Reporting Code City &ndash; String 50 char max<br>
		Rate Special District &ndash; Decimal<br>
		Reporting Code Special District &ndash; String 50 char max <br>
		City &ndash; String 50 char max<br>
		Post Office &ndash; String 50 char max<br>
		State &ndash; String 50 char max <br>
		County &ndash; String 50 char max<br>
		Shipping Taxable &ndash;String 2 char max <br>
		Primary Record &ndash; String 50 char max
		</p>
	</div>

	<h3>Why are some columns in the tax table blank?</h3>
	<div>
		<p>The tax tables have been standardized to work for the entire country. This has 
		forced us to make some generalizations in the data fields that may or may not 
		match up perfectly with every state's structure. An example would be the parishes 
		of Loisianna appearing in the county column.</p>
		<p>Some columns may be blank because that particular state has a different taxing 
		structure. This occurs frequently with the reporting code columns since many 
		states do not require them.</p>
	</div>

	<h3>Why do several ZIP codes have fewer than 5 digits in the .CSV file?</h3>
	<div>
		<p>All U.S. ZIP codes have a minimum of 5 digits and Zip2Tax's .CSV tables do 
		contain that data. A few ZIP codes start with leading zeros, for example 00824. 
		Some programs, such as Microsoft Excel, by default hide any leading zeros, 
		therefore making a ZIP code such as 00824 appear as 824.</p>

		<p>You can fix this very simply by right-clicking on the ZIP code column. Go to 
		Format Cells and in the Number tab choose 
		Special. Then in Type select Zip Code. Click 
		OK and now the leading zeros will appear correctly.</p>         
	</div>
	
	<h3>How do your .CSV Tax Tables handle ZIP codes that have more than one tax rate?</h3>
	<div>
		<p>With the <a href="/Website/Downloads/Sample_Tables/zip2tax_Sample.csv">
		Full Breakout table</a> you can search by ZIP code, which will frequently 
		return more than one row. You can manually or programmatically choose which 
		of the rows most closely matches the jurisdiction you are looking for, or 
		you can default to the row with a "1" in the  Primary Record column if you 
		want to return only one result.</p>

		<p>Some of the <a href="/Website/pagesProducts/z2t_specialty_tables.asp" 
		target="_blank">specialty table formats</a> do not provide more than one 
		result per ZIP code, and some do not provide breakdowns by jurisdiction. 
		Tax tables are <a href="/Website/pagesExtra/z2t_refundpolicy.asp" 
		target="_blank">non-refundable</a>, so it is highly recommended that you 
		check out the sample tables and read the table layout descriptions prior 
		to purchase.</p>
	</div>

	<h3>Will your Sales Tax Tables be compatible with my accounting software?</h3>
	<div>
		<p>There are many different kinds and brands of accounting software available 
		and we don't know if our tables will merge seamlessly with your system. We 
		provide a sample <a href="/Website/Downloads/Sample_Tables/zip2tax_Sample.csv">
		Tax Table</a> that you can download and test for compatibility.</p>

		<p>If you don't see what you need, <a href="mailto:info@zip2tax.com"> e-mail</a> 
		us your specifications and we'll work with you to see if we can accommodate your 
		request. The more specifics you include, the better we can estimate the scope of 
		your project. If you so desire, we may refer you to specialty outside 
		contractors if your project requires hands-on development.</p>
	</div>
</div>
<a href="#top">Back to top</a>


<a name="subscription"></a><h1>Subscription</h1>
<div class="accordion">
	<h3> Why are Zip2Tax's prices lower than everyone else's?</h3>
	<div>
		<p>Zip2Tax is an affordable alternative to the mega-sized tax rate 
		providers that often charge thousands if not hundreds of thousands 
		of dollars a year.</p>
		<p>How can Zip2Tax afford to charge so much less? The short answer 
		is: we are a lean company.</p>

		<p>Zip2Tax relies on a small core of key personnel and we don't keep 
		staff sitting around waiting to up-sell you.</p>
		<p>The big tax companies use commission-driven sales and marketing 
		staff who's sole purpose is to hover by the phones and harangue 
		prospective customers. They don't tell you what their fees are until 
		after they have all of your personal information and they have you on 
		the phone. We publish our full rates right on our web page and let 
		you decide for yourself if our services are right for your company.</p>
		<p>We provide samples of our data and set-up information right on our 
		web site. Most of our customers are do-it-yourselfers who are able to 
		integrate our data for themselves. Meanwhile, our competition employs 
		dozens of programers who are poised to sweep into your shop and 
		commandeer your databases. They have lots of smiling young MBAs who 
		are eager to hold your staff hostage in long training seminars.</p>
		<p>Zip2Tax doesn't offer tax filing services or guarantees of audit 
		protection. We've found that the majority of our clients prefer to use 
		their own accountants, or are interested in a referral to one of our 
		affiliates who offer special deals to Zip2Tax customers. This makes it 
		possible for us to forego the stable of CPAs, tax law specialists and 
		lawyers the competition must maintain.</p>
		<p>Based on the trim size of our company and our commitment to stay 
		focused on what we do best - providing accurate sales and use tax data 
		affordably to autonomous businesses - the difference between us and 
		our competition is clear.</p>
		<p>I invite you download our 
		<a href="/Website/Downloads/Other/PrintablePriceList.pdf" target="_blank">printable price list</a> and compare for yourself.</p>			
	</div>
	
	<h3>I'm having trouble logging in. What can I do? </h3>
	<div>
		<p>If you are a subscriber and having difficulty in logging in, try the 
		following suggestions:</p>
		<p>If this is your first log in attempt:
		<ul>
		<li class="indent1">The system may have generated a bad username or password. 
		Give us a call at 866-492-8494 and we'll make sure your credentials are usable 
		and your expiration dates are correct.</li>
		</ul>
		<p>If you have successfully logged in before:</p>
		<ul>
		<li class="indent1">Some browsers handle the Zip2Tax web site better than 
		others. We've experienced frequent trouble with Internet Explorer in particular. 
		Try switching to a different browser. Internet Explorer is a frequently used 
		browser that has caused minimal conflicts.</li>
		<li class="indent1">Close every page you have open in your browser and open a 
		fresh session.
		<li class="indent2">If a browser is left open for a long period of time, it will 
		point to the version of a page as it was when the browser was first opened. 
		Sometimes a small change has occurred on that page and the browser is unable to 
		match up the two slightly different occurrences which causes a login failure.</li>
		<li class="indent1">Make sure your firewall and antivirus settings will allow 
		Zip2Tax to have appropriate access.</li>
		</ul>	   
	</div>
	
	<h3>I've heard that some companies provide sales tax rates for free. What's the catch?</h3>
	<div>
		<p>Sales tax providers that offer their services for free are usually 
		associated with the 
		<a href="http://www.streamlinedsalestax.org/index.php?page=faqs" 
		target="_blank">Streamline Sales Tax Agreement</a>. There are currently 
		six companies certified with SSTA and they are paid directly by the 
		states for their services. The states are happy to pay for these 
		services because when a merchant signs up for these "free tax rate 
		services," their company is automatically registered with each and 
		every state taking part in the agreement and they will end up having to 
		pay sales taxes to every state. These free service providers tell you 
		how much to collect in sale tax, but then they take full control over 
		the reporting and remittance to the states - even going so far as to 
		automatically withdraw the funds from your bank account.</p>
		<p>These free services can be a godsend for small companies who can't 
		handle their existing remittance burden, but the level of control that 
		they are handing over to these providers is enormous.</p>
		<p>Just keep in mind that any service provider is naturally going to 
		work in the interest of the person who holds the purse strings - the states.</p>		  
	</div>
	
	<h3>How do I change my user name and password?</h3>
	<div>
		<p>Just contact our offices via <a href="mailto:info@zip2tax.com" 
		target="_blank">e-mail</a>, phone (866) 492-8494, or live chat, and 
		we can change your user name and password for you.</p>
		<p>The credentials must be at least 5 characters, they must be unique 
		(not already in use by another subscriber) and they cannot contain 
		certain characters like !, - or '.</p>
		<p>We will e-mail you a confirmation for your records when the change 
		has been made.</p>
	</div>
	
	<h3>How do I subscribe to your service?</h3>
	<div>
		<p>The fastest way to subscribe is to place your order through our 
		convenient and secure online 
		<a href="/free-sales-tax-calculator">shopping cart</a>. 
		We accept American Express, Visa, MasterCard and PayPal.</p>
		<p>We also accept checks. In the "Payment Method" section of the 
		shopping cart, select "Offline (Mail)" and you will be provided 
		with a printable form at the end of the checkout process so that 
		you can pay by mail. We will send you your subscription information 
		along with a copy of the paid invoice once the check clears. If you 
		prefer, you can send a purchase order to 
		<a href="mailto:info@zip2tax.com">info@zip2tax.com</a> and we'll get 
		a custom invoice to you quickly.</p>
		<p>Or, call us at 1-866-492-8494 and our customer service 
		representatives will be happy to assist you.</p> 
	</div>
	
	<h3>Is there a usage and/or user limit?</h3>
	<div>
		<p><a href="/free-sales-tax-calculator#PageSection1" 
		target="_blank">#1: Online Lookup:</a> 
		The standard subscription allows for 5 users up to 1,000 lookups monthly. Please call 
		(866) 492-8494 for a quote on additional user licenses.</p>
		<p><a href="/free-sales-tax-calculator#PageSection2" 
		target="_blank">#2: Database Interface:</a> 
		Allows for 1,000 queries per month. If queries 
		exceed that level, a customer service representative will call you 
		and help you decide if an upgrade in service level will be necessary.</p>
		<p><a href="/free-sales-tax-calculator#PageSection3" 
		target="_blank">#3: Sales and Use Tax Tables:</a> 
		Unlimited usage and users within a single company. The tables may be 
		implemented into multiple systems.</p>
		<p>Zip2Tax's subscriptions vary in the manner they will be implemented 
		into an organization, but they are meant for use by a single company. 
		The published subscriptions do not include resale or redistribution to 
		third parties. Please read the <a href="/Website/pagesExtra/z2t_eula.asp" 
		target="_blank">End User License Agreement</a> for more information.</p><br>

		<p>You can also find out more information about our 
		<a href="/Website/pagesProducts/z2t_redistribution.asp" target="_blank">
		Value-Added Reseller</a> licensing?</p>
		<p>E-mail <a href="mailto:info@zip2tax.com">info@zip2tax.com</a> to 
		request additional information.</p>
	</div>
	
	<h3>What services do you offer?</h3>
	<div>
		<p>Zip2Tax offers a limited-usage free ZIP Code to 
		<a href="/sales-tax-calculator">Sales Tax Calculator</a>. We also 
		offer a variety of subscription services designed to meet your business&rsquo; 
		needs at very affordable prices. We offer an Online Lookup Service, a Database 
		Interface, and Sales Tax Tables. 
		<a href="/comparison-chart">Compare our services side by side.</a></p>        
	</div>

	<h3>What is the difference between your subscription types?</h3>
	<div>
		<p><a href="/free-sales-tax-calculator#PageSection1" target="_blank">
		#1 Online Lookup Service:</a> This subscription allows up to 5 users to visit our 
		web site and manually type in full addresses or ZIP codes to learn the sales and 
		use tax rates for any U.S. jurisdiction. Our systems automatically update rates 
		and jurisdictions on the first of every month.</p>

		<p>This subscription can be purchased in 1, 3, 6, or 12 month increments. This is 
		available by the ZIP code, ZIP+4 or Spot-On&trade; level. Rates for additional users are 
		available. This subscription is accessed manually only and cannot be automated.</p>

		<p><a href="/free-sales-tax-calculator#PageSection2" target="_blank">
		#2 Database Interface:</a> This subscription is designed for eCommerce developers 
		or database programmers who wish to "set it up and forget it." Your web site or 
		database sends a query to our database for each address behind the scenes. Our 
		systems automatically update rates and jurisdictions on the first of every month. 
		Sample code and access to our API can be found at our 
		<a href="/developers-interface">Developers</a> section.</p>

		<p>You can purchase a single state or the whole U.S. annually. This is available 
		by the ZIP code, ZIP+4 or Spot-On&trade; level. The starter subscription is good for 
		1,000 queries per month. Representatives monitor monthly usage and will offer 
		options if higher levels of usage are required. 
		<a href="/Website/pagesProducts/z2t_redistribution.asp" target="_blank">Value 
		Added Reseller</a> licensing is available for this service.</p>

		<p><a href="/free-sales-tax-calculator#PageSection3" target="_blank">
		#3 Sales and Use Tax Tables:</a>  This subscription provides .CSV tables in a 
		variety of formats designed to work with many popular shopping carts, accounting 
		systems, and eCommerce platforms. You purchase an "Initial Table" for a single 
		state or the whole U.S. or Canada and then you have the option to purchase the 
		"Table Update Subscription" to provide you with monthly updated tax rates and ZIP 
		codes for a whole year. You can log in and download these files or automate the 
		<a href="/developers-table-download">
		download via HTTP</a>.</p>

		<p>This subscription is available by the ZIP code level only. 
		<a href="/Website/pagesProducts/z2t_redistribution.asp" target="_blank">Value 
		Added Reseller</a> licensing is available for this service.</p>
	</div>
</div>
<a href="#top">Back to top</a>


<a name="security"></a><h1>Security</h1>
<div class="accordion">
	<h3>Is your shopping cart secure?</h3>
	<div>
		<p>The security of your personal and credit card information is our top 
		priority. All shopping cart activities take place on a secure server 
		hosted by SecureNetShop.com, LLC.</p>
		<ul>
		<li class="indent1">Data between your web browser and our shopping 
		cart is encrypted using 128-bit SSL Data Encryption certified through 
		Rapid SSL.</li>
		<li class="indent1">Weekly security scans, performed by Comodo, Inc., 
		test our shopping cart hardware and software for 1000's of security 
		vulnerabilities.</li>
		<li class="indent1">Our shopping cart is PCI Certified through Comodo, 
		Inc. PCI Data Security Standards are developed by American Express, 
		Discover Financial Services, JCB International, MasterCard Worldwide 
		and Visa Inc. to protect customer account data. Companys that are PCI 
		Certified must pass weekly security scans and meet requirements for 
		security management, policies, procedures, network architecture, 
		software design and other critical protective measures.</li>
		</ul>
	</div>

	<h3>Privacy Policy</h3>
	<div>
		<p>At Zip2Tax, your security and confidentiality are our highest priority. 
		We will never share your e-mail address or any other personally identifiable 
		information (PII) with any other person or company. Please review our full 
		<a href="/Website/pagesExtra/z2t_privacypolicy.asp" target="_blank">privacy policy</a>.</p>
	</div>
	
	<h3>Why did my valid credit card get a "Payment Processor Error"?</h3>
	<div>
		<p>We've found that sometimes corporate cards have security settings applied to 
		their accounts that cause Zip2Tax's shopping cart to generate a "Payment Processor 
		Error: Credit Card rejected: General decline of the card. No other information 
		provided by the issuing bank."</p>

		<p>This is usually the result of a security setting applied by the account holder 
		and is usually designed to prevent the card from being used for unauthorized 
		purchases.</p>

		<p>In most instances, this can be easily remedied by calling the 800 number on the 
		back of the card and describing the service you are trying to purchase. In other 
		cases, using the corporate card of someone with administrative privileges won't 
		set off the security warnings.</p>

		<p>If none of the above remedies work, just call our offices at (866) 492-8494 and 
		we can process the payment manually.</p>
	</div>
</div>
<a href="#top">Back to top</a>


<a name="states"></a><h1>State-Specific Information</h1>
<div class="accordion">
	<h3>Which states have taxable shipping?</h3>
	<div>
		<p>Is shipping taxable?  Just for once, wouldn't it be great if this was a "yes" or "no"?  
		Oct. 2011  By Jim Frazier <a href="http://salestaxguy.blogspot.com/" target="_blank">The Sales Tax Guy</a></p>

		<p>The taxability of freight or delivery charges is one of the most frequently asked 
		questions. And the rules vary all over the place. In more than half the states, freight 
		charges are taxable. This means that you would add the charges to the merchandise total 
		in determining the basis for the tax calculation.</p>

		<p>This means that, if the sale is taxable, then the freight will be taxable in those 
		states. But if the sale is not taxable (eg. manufacturing equipment or resale), freight 
		isn't taxable. Here are some additional points. Remember though, that whether or not 
		freight is taxable is only a question if the sale is taxable.</p>

		<p>1. If the seller is actually separately showing his inbound freight (for deliveries 
		TO the seller), then that charge is generally included in the basis - it's taxable. For 
		freight charges to be non-taxable, they can only be for shipments from the seller to the 
		buyer.<br>
		2. In states where shipping charges are NOT included in the basis, there are usually 
		restrictions. Here's a laundry list of the possible requirements. Note that these are 
		highly variable:</p>
		<ul>
		<li class="indent1">Is the freight charge separately stated? This is universal. For 
		shipping charges to be non-taxable, they must be separately stated on the invoice.</li>
		<li class="indent1">If the sale terms are FOB origin, then the freight isn't taxable. 
		Does the ownership transfer at the shipping point?</li>
		<li class="indent1">The seller can't make a profit on the delivery charge: the charge 
		better be pretty close to what the carrier actually charged the vendor. If the seller's 
		freight charge is more than the freight he paid, the freight charge is taxable.</li>
		<li class="indent1">Did the seller ship via common carrier or in his own vehicle?</li>
		<li class="indent1">Does the buyer have the option of arranging their own shipment or 
		going and picking up the goods at the seller location?</li>
		<li class="indent1">Was the freight charge separately agreed upon? In some states, 
		having it be on a separate line on an order form is enough. In other states, it must 
		be a separate physical contract. In other states, it depends on the precise wording of 
		the agreement. If there's any restriction that is a highly gray area, this is the one.</li>
		</ul>

		<p>Shipping charges billed directly to the buyer by a common carrier are generally not 
		taxable (these are "collect" charges). The buyer owes no use tax on those charges.</p>

		<p>Please remember that this is a taxing policy that is highly variable from state to 
		state. You need to research this carefully.</p>

		<p>Then there are those "easy" states who just say "Is the sale taxable? Then the freight 
		is taxable." I love those states.<p>

		<p><i>Disclaimer: This is intended for education and entertainment only and is not 
		intended as legal advice. Tax laws can vary significantly depending on the type of 
		business, product, location, and other factors not fully explored here. Always consult a 
		qualified attorney, CPA or tax adviser who is an expert in sales and use tax law for your 
		area before making business decisions.</i></p>

		<p>Shipping is Taxable in the following states:</p>
		<p>AR - Arkansas<br>
		CT - Connecticut<br>
		GA - Georgia<br>
		HI - Hawaii<br>
		IN - Indiana<br>
		KS - Kanasas<br>
		KY - Kentucky<br>
		MI - Michigan<br>
		MN - Minnesota<br>
		MS - Mississippi<br>
		NC - North Carolina<br>
		ND - North Dakota<br>
		NE - Nebraska<br>
		NJ - New Jersey<br>
		NM - New Mexico<br>
		NY - New York<br>
		OH - Ohio<br>
		PA - Pennsylvania<br>
		RI - Rhode Island<br>
		SC - South Carolina<br>
		SD - South Dakota<br>
		TN - Tennessee<br>
		TX - Texas<br>
		VT - Vermont<br>
		WA - Washington<br>
		WV - West Virginia</p>
	</div>

	<h3>State Departments of Revenue and/or Taxation</h3>
	<div>
		<p>Laws on the taxibility of certain items, services, and business
		types vary considerably from state to state. Our data pertains to
		general sales and use tax only, and we do not gather information
		specific to individual state laws.</p>
		<p>For tax questions other than general sales and use, the best source
		of information is the state itself. Below is a phone directory for
		the revenue departments of each state.</p>
		<table cellpadding="0" cellspacing="10">
		<col width="140">
		<col width="140">
		<tr>
		<td width="128" align="right" valign="middle">Alabama</td>
		<td width="241" valign="middle">334-242-1490</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Alaska</td>
		<td width="241" valign="middle"> 907-269-4605</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Arkansas</td>
		<td width="241" valign="middle">501-682-1895</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Arizona</td>
		<td width="241" valign="middle">602-255-2060</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">California</td>
		<td width="241" valign="middle">800-400-7115</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Colorado</td>
		<td width="241" valign="middle">303-238-7378</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Connecticut</td>
		<td width="241" valign="middle">860-297-5962</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Delaware</td>
		<td width="241" valign="middle">302-577-8205</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Florida</td>
		<td width="241" valign="middle">800-352-3671</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Georgia</td>
		<td width="241" valign="middle">877-423-6711</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Hawaii</td>
		<td width="241" valign="middle">808-587.4242</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Iowa</td>
		<td width="241" valign="middle">515-281-3114</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Idaho</td>
		<td width="241" valign="middle">800-972-7660</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Illinois</td>
		<td width="241" valign="middle">800-732-8866</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Indiana</td>
		<td width="241" valign="middle">317-232-2240</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Kansas</td>
		<td width="241" valign="middle">785-368-8222</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Kentucky</td>
		<td width="241" valign="middle">502-564-4581</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Louisiana</td>
		<td width="241" valign="middle">225-219-2448</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Massachusetts</td>
		<td width="241" valign="middle">617-887-6367</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Maryland</td>
		<td width="241" valign="middle">410-767-1300</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Maine</td>
		<td width="241" valign="middle">207-624-9693</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Michigan</td>
		<td width="241" valign="middle">517-636-4486</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Minnesota</td>
		<td width="241" valign="middle">800-657-3777</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Missouri</td>
		<td width="241" valign="middle">573-751-2836</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Mississippi</td>
		<td width="241" valign="middle">601-923-7000</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Montana</td>
		<td width="241" valign="middle">406-444-6900</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">North Carolina</td>
		<td width="241" valign="middle">877-252-3052</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">North Dakota</td>
		<td width="241" valign="middle">701-328-2770</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Nebraska</td>
		<td width="241" valign="middle">402-471-5729</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">New Hampshire</td>
		<td width="241" valign="middle">603-230-5000</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">New Jersey</td>
		<td width="241" valign="middle">609-826-4400</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">New Mexico</td>
		<td width="241" valign="middle">505-827-0908</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Nevada</td>
		<td width="241" valign="middle">866-962-3707</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">New York</td>
		<td width="241" valign="middle"> 518-485-2889</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Ohio</td>
		<td width="241" valign="middle">800-282-1780</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Oklahoma</td>
		<td width="241" valign="middle">405-521-3160</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Oregon</td>
		<td width="241" valign="middle">503-378-4988</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Pennsylvania</td>
		<td width="241" valign="middle">717-787-1064</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Rhode Island</td>
		<td width="241" valign="middle">401-574-8955</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">South Carolina</td>
		<td width="241" valign="middle">803-896-1420</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">South Dakota</td>
		<td width="241" valign="middle">800-829-9188</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Tennessee</td>
		<td width="241" valign="middle">615-253-0700</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Texas</td>
		<td width="241" valign="middle">800-252-5555</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Utah</td>
		<td width="241" valign="middle">800-662-4335</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Virginia</td>
		<td width="241" valign="middle">804-367-8031</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Vermont</td>
		<td width="241" valign="middle">802-828-2551</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Washington</td>
		<td width="241" valign="middle">800-647-7706</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Wisconsin</td>
		<td width="241" valign="middle">608-266-2772</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">West Virginia</td>
		<td width="241" valign="middle">304-558-3333</td>
		</tr>
		<tr>
		<td width="128" align="right" valign="middle">Wyoming</td>
		<td width="241" valign="middle">307-777-3745</td>
		</tr>
		</table>
	</div>
	
	<h3>Hawaii's tax is 4% why does your site say 4.166?</h3>
	<div>
		<p>Why do some businesses add nothing extra for tax, some add 4%, and 
		some add 4.166%? The reason depends first on whether the business 
		chooses to visibly pass on the tax or not, and second, if visibly 
		passed on, the extent to which the business chooses to recover the 
		general excise tax expense incurred on the transaction through a 
		specific charge to the customer.</p>

		<p>IF the business does not add anything extra for tax, then the 
		business has chosen not to visibly pass on its general excise tax 
		expense.</p>

		<p>EXAMPLE 1 - Business X charges its customers $125; 
		it does not visibly pass on its general excise tax expense. The customer 
		pays $125 to X, and X pays $5 (4% of $125) in general excise tax to the 
		State. Part of the remaining $120 (the $125 total price less the $5 tax 
		paid) will be used by X to pay its other expenses; the rest is X's profit.<br>
		IF the business adds 4% extra for tax, then the business has chosen to 
		visibly pass on its general excise tax expense, and to recover 4% of a 
		base amount from customers to pay the general excise tax expense 
		incurred on the transaction. The 4% recovered is part of the total price 
		subject to the general excise tax.</p>

		<p>EXAMPLE 2 - Business Y charges its customers a base 
		amount of $125 and visibly passes on an additional $5 (4% of $125) for 
		a total price of $130 ($125 + $5). The customer pays $130 to Y, and Y 
		pays $5.20 (4% of $130) in general excise tax to the State. Part of the 
		remaining $124.80 (the $130 total price less the $5.20 tax paid) will be 
		used by Y to pay its other expenses; the rest is Y's profit. IF 
		the business adds 4.166% extra for tax, then the business has chosen to 
		visibly pass on its general excise tax expense, and to recover 4.166% of 
		a base amount from customers to pay the general excise tax expense 
		incurred on the transaction.</p>

		<p>EXAMPLE 3 - Business Z charges its customers a base 
		amount of $125 and visibly passes on an additional $5.21 (4.166% of $125) 
		for a total price of $130.21 ($125 + $5.21). The customer pays $130.21 to 
		Z, and Z pays $5.21 (4% of $130.21) in general excise tax to the State. 
		Part of the remaining $125 (the $130.21 total price less the $5.21 tax 
		paid) will be used by Z to pay its other expenses; the rest is Z's profit.</p>

		<p>In the three examples above, note that, although the amount of general 
		excise tax paid to the State differed, the percentage due the State in 
		general excise tax was the same (i.e., 4%).</p>

		<p><i>Source: Publication 96-1, Revised July 2000, Hawaii Dept of 
		Taxation at www.state.hi.us</i><p>
	</div>
</div>	
<a href="#top">Back to top</a>
