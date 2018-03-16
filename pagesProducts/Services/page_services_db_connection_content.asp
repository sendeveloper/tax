<script type="text/javascript">
$(function(){
	$("a[class^=HiddenSummary]").click(function(event){
		event.preventDefault;
		var theLayer = $(this).attr("class");
		$("#"+theLayer).toggle("slow");
	});

});
</script>
<div class="col-md-9 content">

<a name="PageSection2"></a>
		<h1>
		<img src="/Website/Images/sales-tax-rates-businesses-database-interface-zip2tax-panel2.png" alt="Database Interface" class="left paddedImage">
		<a name="Database"></a>Database Interface - Sales Tax API
		</h1>
	<p class="noPadding">
		<span class="firstword">Automate</span>
		your online shopping cart with sales tax data at the point of sale. A secure sales tax API connects your 
		database to our constantly updated servers to power your ecommerce site with a real-time data 
		when you need it.
	</p><br>
	
	<!--Beginning of green button section--------------------------------------------------------------------->

	
	<p>
	<!--Beginning of the comm100 chat button------------------------------------------------------------->
	<div class="col-md-2 col-md-push-1" id="Secondcomm100-button-2583"><a href="#" onclick="Comm100API.open_chat_window(event, 731);" style="color: #fff!important;">Chat</a></div>
					<script type="text/javascript">
						var Comm100API = Comm100API || new Object;
						Comm100API.chat_buttons = Comm100API.chat_buttons || [];
						var comm100_chatButton = new Object;
						comm100_chatButton.code_plan = 2583;
						comm100_chatButton.div_id = 'Secondcomm100-button-2583';
						Comm100API.chat_buttons.push(comm100_chatButton);
						Comm100API.site_id = 49685;
						Comm100API.main_code_plan = 2583;

						var comm100_lc = document.createElement('script');
						comm100_lc.type = 'text/javascript';
						comm100_lc.async = true;
						comm100_lc.src = 'https://chatserver.comm100.com/livechat.ashx?siteId=' + Comm100API.site_id;

						var comm100_s = document.getElementsByTagName('script')[0];
						comm100_s.parentNode.insertBefore(comm100_lc, comm100_s);

						setTimeout(function() {
							if (!Comm100API.loaded) {
								var lc = document.createElement('script');
								lc.type = 'text/javascript';
								lc.async = true;
								lc.src = 'https://hostedmax.comm100.com/chatserver/livechat.ashx?siteId=' + Comm100API.site_id;
								var s = document.getElementsByTagName('script')[0];
								s.parentNode.insertBefore(lc, s);
							}
						}, 5000)
					</script>
	<!--End of chat button------------------------------------------------------------------------------>
	
	<div class="col-md-2 col-md-push-2"style="background-color: #98e428;
				color: #fff;
				padding: 10px 10px;
				border-radius: 16px;
				font-weight: bold;
				text-transform: uppercase;
				font-size: 25px;
				text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.52);
				white-space: nowrap;
				text-align: center;"><a href="#See_options" style="color: #fff;">Pricing</a>
	</div>
	
	<div class="col-md-2 col-md-push-3"style="background-color: #98e428;
				color: #fff;
				padding: 10px 10px;
				border-radius: 16px;
				font-weight: bold;
				text-transform: uppercase;
				font-size: 25px;
				text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.52);
				white-space: nowrap;
				text-align: center;"><a href="#See_options" style="color: #fff;">Purchase</a>
	</div>
	
	<br><br><br><br><br><br>
	</p>
	<!--End of green button section--------------------------------------------------------------------->

	<h2><span class="glyph glyphicon glyphicon-star redFont" ariahidden="true"></span><strong>Sales Tax API</strong></h2>
	<p>
		<span class="firstword">Not every business</span> and not every state has the same sales tax reporting requirements. 
		Zip2Tax understands this and has created three subscription levels within our sales tax API to give business 
		what they need while staying within budget.<br><br>
		
		<span class="firstword">Our</span> sales tax API has anywhere from the ZIP code level that can return multiple jurisdictions, to the Spot-On&trade; 
		doorstep-level, you can get the sales tax jurisdictional granularity you need and not 
		pay for more than you'll use.
	</p>
	
	<div>
		<p>The sales tax API provides for <span class="firstword">XML</span> or <span class="firstword">JSON</span> responses for all three resolution levels we offer.</p>
		
			<div class="row">
			  <p>
				
				<div>
					<strong><img src="/Website/Images/Services/ZIP-code-sm.png" class="left" alt="Zip Code resolution">
					<h3><strong style="color: red; text-algin:left;">ZIP Code resolution</strong><span style="float:right"><a href="/developers-api-zipcode">Sample ZIP Sales Tax API</a></span></h3><br>
					<p>The most economical service for companies wanting to improve efficiency while 
					while maintaining affordability. City and town names with sales tax detail are 
					provided for every locality with a 5-digit ZIP code.</p>
					</strong>
				</div>
			  </p><br>

			  <p>
				
				<div>
					<strong><img src="/Website/Images/Services/ZIP-plus-4-sm.png" class="left" alt="Zip+4 resolution">
					<h3><strong style="color: red">ZIP+4 resolution</strong><span style="float:right"><a href="/developers-api-zip-plus-4">Sample ZIP+4 Sales Tax API</a></span></h3><br>
					A very high level of jurisdictional certainty at an affordable price. 
					Sometimes referred to as the 9-digit ZIP code, the first 5 digits 
					determine a delivery area, such as a town and state, and the additional 
					4 digits target the location to within one side of a street.
					</strong>
				</div>
			  </p><br>

			  <p>
				
				<div>
					<strong><img src="/Website/Images/Services/SpotOn-sm.png" class="left" alt="Spot-On&trade; resolution">
					<h3><strong style="color: red">Spot-On&trade; resolution</strong><span style="float:right"><a href="/developers-api-spot-on">Sample Spot-On&trade; Sales Tax API</a></span></h3><br>
					The most accurate granularity for companies that need precision data. This 
					method validates the US postal address and converts it into latitude and 
					longitude coordinates to provide the highest level of resolution available.
					</strong>
				</div>
			  </p><br>

			</div>
	</div>
	
	<div>
		<h2><span class="glyph glyphicon glyphicon-star redFont" ariahidden="true"></span><strong>Sales Tax API Connect Samples</strong></h2>
			<p>
				The ASP, ASP.NET, C#.NET and PHP pages have code samples for XML responses, 
				allowing unlimited testing with addresses found within the ZIP code range from 90001 
				to 90999. If you would like to perform testing outside of that range, please call 
				866-492-8494 or <a href="mailto:info@Zip2Tax.com">e-mail</a> us to request a free limited-time account.<br><br>
				
				<table class="table">
					<tr>
						<td style="color: red">Sales Tax API using ASP</td>
						<td><a href="/developers-api-sample-asp">See Sample Code</a></td>
					</tr>
					<tr>
						<td style="color: red">Sales Tax API using ASP.NET</td>
						<td><a href="/developers-api-sample-asp-net">See Sample Code</a></td>
					</tr>
					<tr>
						<td style="color: red">Sales Tax API using C#.NET</td>
						<td><a href="/developers-api-sample-c-sharp">See Sample Code</a></td>
					</tr>
					<tr>
						<td style="color: red">Sales Tax API using PHP</td>
						<td><a href="/developers-api-sample-php">See Sample Code</a></td>
					</tr>
				</table>
			
			</p>

	</div><br><br>
	
	<div>
		<h2><span class="glyph glyphicon glyphicon-star redFont" ariahidden="true"></span><strong>The Zip2Tax Network</strong></h2>
			<p>
				Our powerful database servers boast a 99.9% uptime with more than enough bandwidth 
				to handle requests even during the heaviest traffic periods. Our network is designed 
				for optimum response time regardless of your location around the globe.<br><br>
				
				Within each of our three data centers we have an automatic fail safe should a server 
				go down. If an entire data center were to fail we maintain complete redundancy 
				at the other server farms.<br>
			
				<img src="/Website/Images/z2t_World_Map_5.png" alt="World Map" usemap="#Map" id="map">
			</p>
	</div>
	
	<h2><span class="glyph glyphicon glyphicon-star redFont" ariahidden="true"></span><strong>View some of our Database Interface Options</strong></h2>
	<table class="table" id="See_options">
	<thead>
		<tr>
		<th>Database Interface - Sales Tax API</th>
        <!--<th colspan="2" class="text-center">Starting at:</th>-->
		</tr>
	</thead>
	<tbody>
	<tr>
	<td>
	<strong>Single State sales tax</strong>
	</td>
	<td align="right"></td>
	<td align="right">
	<a href="javascript:openPopUp('/Website/pagesProducts/Cart/Database_Single/database_single_popup.asp');void(0);" class="btn btn-danger btn-sm">See options</a>
	</td>
	</tr>

	<tr>
	<td>
	<strong>United States sales tax</strong>
	</td>
	<td align="right"></td>
	<td align="right">
	<a href="javascript:openPopUp('/Website/pagesProducts/Cart/Database_US/database_US_popup.asp');void(0);" class="btn btn-danger btn-sm">See options</a>
	</td>
	</tr>  

	<tr>
	<td colspan="4">
	<a href='/Website/Downloads/Other/PrintablePriceList.pdf' target='_blank'class="btn btn-danger btn-sm">
	Download a printable price list</a>
	</td>
	</tr>

	<tr>
	<td align="right" colspan="4">
	<a href="http://www.ewebcart.com/~17202/cgi-bin/cart.cgi?view=1&amp;amp" class="btn btn-danger btn-sm">
	View cart / checkout</a></td>
	</tr>
	</tbody>
</table>	
	  
	  <div class="clearfix"></div>
</div>