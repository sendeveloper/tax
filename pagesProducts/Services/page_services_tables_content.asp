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

<a name="PageSection3"></a>
		<h1>
		<img src="/Website/Images/sales-tax-rates-businesses-tax-tables-zip2tax-panel3.png" alt="Sales Tab Tables w/Monthly Update Option" class="left paddedImage">
		<a name="Database"></a>Sales &amp; Use Tax Tables
		</h1>
	<p class="noPadding">
		Our .CSV Sales and Use Tax Tables offer a wide range of options to meet your needs, from online shopping cart integration,
		to ERP system platforms, to call centers and invoicing programs. Many formats to choose from. Single state, entire US and/or
		Candada, monthly subscriptions...whatever you need. All ZIP codes included---over 12,000 jurisdictions!
	</p>
	
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



<!--Beginning of table for .CSV Formats------------------------------------------------------------------------------------------------>
<div>
        <h2><span class="glyph glyphicon glyphicon-star redFont" ariahidden="true"></span><strong>.CSV Formats</strong></h2>
			<p style="text-align:left;">
				<h3><strong style="color: red;">Full Breakout .CSV Format</strong></h3>
			</p>
			
			<p>
				The Full Breakout table provides all tax rates broken down for every jurisdictional level 
				including ZIP code, state, country, city, and special districts; and includes jurisdictional codes 
				where applicable.<br><br>
				
				The table provides the Primary Rate, which is the location within a ZIP code containing the 
				USPS Office, and indicates whether shipping is taxable.<br><br>
				
				The table contains multiple rows for ZIP codes encompassing multiple jurisdictions.
			</p>
			
			<p style="text-align: center;"><a href="/Website/Downloads/Sample_Tables/Zip2TaxTableLayoutInformation.pdf" style="background-color: #98e428;
				color: #fff;
				padding: 10px 10px;
				border-radius: 16px;
				font-weight: bold;
				text-transform: uppercase;
				font-size: 15px;
				text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.52);
				white-space: nowrap;">Layout Information</a></p>
			<br>
			
			<div class="horizontal-line" style="width: auto; height: 1px; background-color: black;" ></div>
			
          
		  <br><br>
		  
			<p style="text-align:left;">
				<h3><strong style="color: red;">Basic .CSV Format</strong></h3>
			</p>
			
			<p>
				The Basic table provides the total sales tax rate for all jurisdictions combined.
				It provides multiple rows for a single ZIP code if it contains more than one city per ZIP.
			</p>
			
			<p style="text-align: center;"><a href="/Website/Downloads/Sample_Tables/Zip2TaxBasicSalesTableLayoutInformation.pdf" style="background-color: #98e428;
				color: #fff;
				padding: 10px 10px;
				border-radius: 16px;
				font-weight: bold;
				text-transform: uppercase;
				font-size: 15px;
				text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.52);
				white-space: nowrap;">Layout Information</a></p>
			<br>
			
			<div class="horizontal-line" style="width: auto; height: 1px; background-color: black;" ></div>
			
          
		  <br><br>
		  
			<p style="text-align:left;">
				<h3><strong style="color: red;">Unique ZIPs .CSV Format</strong></h3>
			</p>
			
			<p>
				The Unique ZIPs table provides just one row per ZIP code. This row is the municipality
				containing the USPS office (referred to in the table as the Primary Record) and may or may
				not be representative of the tax rates of other communities sharing that ZIP code.
			</p>
			
			<p style="text-align: center;"><a href="/Website/Downloads/Sample_Tables/Zip2TaxUniqueZipsTableLayoutInformation.pdf" style="background-color: #98e428;
				color: #fff;
				padding: 10px 10px;
				border-radius: 16px;
				font-weight: bold;
				text-transform: uppercase;
				font-size: 15px;
				text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.52);
				white-space: nowrap;">Layout Information</a></p>
			<br>
			
			<div class="horizontal-line" style="width: auto; height: 1px; background-color: black;" ></div>
			
          
		  <br><br>
		  
			<p style="text-align:left;">
				<h3><strong style="color: red;">Canadian Tax .CSV Format</strong></h3>
			</p>
			
			<p>
				One table breaks out the GST/HST/PST/QST/RST rates for all Canadian Postal Codes.
			</p>
			
			<p style="text-align: center;"><a href="/Website/Downloads/Sample_Tables/Zip2TaxCanadaTableLayoutInformation.pdf" style="background-color: #98e428;
				color: #fff;
				padding: 10px 10px;
				border-radius: 16px;
				font-weight: bold;
				text-transform: uppercase;
				font-size: 15px;
				text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.52);
				white-space: nowrap;">Layout Information</a></p>
			<br>
			
			<div class="horizontal-line" style="width: auto; height: 1px; background-color: black;" ></div>
			
          
		  <br><br>
		  
			<p style="text-align:left;">
				<h3><strong style="color: red;">NY State Clothing .CSV Format</strong></h3>
			</p>
			
			<p>
				New York State implemented a year-round sales/use tax exemption for certain clothing, footwear,
				and items used to make or repair exempt clothing.<br><br>
				
				There are several exemptions which may or may not apply to locally imposed sales and use taxes.
			</p>
			
	<!--		<p style="text-align: center;"><a href="/Website/Downloads/Sample_Tables/Zip2TaxUniqueZipsTableLayoutInformation.pdf" style="background-color: #98e428;
				color: #fff;
				padding: 10px 10px;
				border-radius: 16px;
				font-weight: bold;
				text-transform: uppercase;
				font-size: 15px;
				text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.52);
				white-space: nowrap;">Layout Information - Switch to the right link later.</a></p>
	-->
			<br>
			
			<div class="horizontal-line" style="width: auto; height: 1px; background-color: black;" ></div>
			
          
		  <br><br>
</div>	  
<!--End of .CSV formats table--------------------------------------------------------------------------------->		  


<!--Beginning of integration section-------------------------------------------------------------------------->

	<h2><span class="glyph glyphicon glyphicon-star redFont" ariahidden="true"></span><strong>Integrations</strong></h2>
	<p>Select a platform below...Don't see your platform? Let us know and we'll create one!</p>
	
	<ul style="list-style: none;">
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_chargeover.asp"><img src="/Website/Images/Logos/chargeover-logo.png" width="200" height="100" alt="ChargeOver" title="ChargeOver"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_cirkuit.asp"><img src="/Website/Images/Logos/CircuitCommerceLogo.png" width="200" height="100" alt="Cirkuit Commerce" title="Cirkuit Commerece"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_evolution.asp"><img src="/Website/Images/Logos/EvolutionLogo.png" width="200" height="100" alt="Evolution" title="Evolution"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_fleapay.asp"><img src="/Website/Images/Logos/FleaPayLogo.png" width="200" height="100" alt="Fleapay" title="Fleapay"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_kampdata.asp"><img src="/Website/Images/Logos/KampDataLogo.png" width="200" height="100" alt="Kamp-data" title="Kamp-data"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_magento_newer_versions.asp"><img src="/Website/Images/Logos/Magento Logo.PNG" width="200" height="100" alt="Magento" title="Magento"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_sedona.asp"><img src="/Website/Images/Logos/SedonaOffice Logo.PNG" width="200" height="100" alt="Sedona" title="Sedona"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_compatible_smith_cart.asp"><img src="/Website/Images/Logos/SmithCartLogo.png" width="200" height="100" alt="Smith" title="Smith"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_compatible_tradepoint.asp"><img src="/Website/Images/Logos/TradepointLogo.png" width="200" height="100" alt="Tradepoint" title="Tradepoint"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_ultracart.asp"><img src="/Website/Images/Logos/UltracartLogo.png" width="200" height="100" alt="Ultracart" title="Ultracart"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_compatible_upshot.asp"><img src="/Website/Images/Logos/UpshotCommerceLogo.png" width="200" height="100" alt="Upshot" title="Upshot"></a></li>
		<li style="display:inline; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px;"><a href="/Website/pagesProducts/z2t_specialty_tables_volusion.asp"><img src="/Website/Images/Logos/VolusionLogo.png" width="200" height="100" alt="Volusion" title="Volusion"></a></li>

	</ul>
<div class="clearfix"></div><br><br>

	<h2><span class="glyph glyphicon glyphicon-star redFont" ariahidden="true"></span><strong>.CSV Sales Tax Table Options</strong></h2>
	<table class="table" id="See_options">
		<thead>
			<tr>
			<th>.CSV tax tables</th>
			<!--<th colspan="2" class="text-center">Starting at:</th>-->
			</tr>
		</thead>
		<tbody>
			<tr>
			<td><strong>Single State - 1 Month</strong></td>
			<td align="right"></td>
			<td align="right">
			<a href="javascript:openPopUp('/Website/pagesProducts/Cart/Table_Single/table_single_popup.asp');void(0);" class="btn btn-danger btn-sm">See options</a>
			</td>
			</tr>
			<tr>
			<td><strong>Single State Update Subscription  - 12 Months</strong></td>
			<td align="right"></td>
			<td align="right">            
			<a href="javascript:openPopUp('/Website/pagesProducts/Cart/Table_Single_Update/table_single_12_popup.asp');void(0);"class="btn btn-danger btn-sm">See options</a>
			</td>
			</tr>
			<tr>
			<td><strong>United States  - 1 Month</strong></td>
			<td align="right"></td>
			<td align="right"><a href="javascript:openPopUp('/Website/pagesProducts/Cart/Table_Country/table_country_popup.asp');void(0);" class="btn btn-danger btn-sm">See options</a></td>
			</tr>
			<tr>
			<td><strong>United States Update Subscription  - 12 Months</strong></td>
			<td align="right"></td>
			<td align="right">
			<a href="javascript:openPopUp('/Website/pagesProducts/Cart/Table_Country_Update/table_country_12_popup.asp');void(0);" class="btn btn-danger btn-sm">See options</a>
			</td>
			</tr>    
			<tr>
			<td><strong>Canada - 1 Month</strong></td>
			<td align="right"></td>
			<td align="right"><a href="javascript:openPopUp('/Website/pagesProducts/Cart/Table_Country/table_country_CA_popup.asp');void(0);" class="btn btn-danger btn-sm">See options</a></td>
			</tr>
			<tr>
			<td><strong>Canada Update Subscription  - 12 Months</strong></td>
			<td align="right"></td>
			<td align="right">
			<a href="javascript:openPopUp('/Website/pagesProducts/Cart/Table_Country_Update/table_country_CA_12_popup.asp');void(0);" class="btn btn-danger btn-sm">See options</a>
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
	
</div>