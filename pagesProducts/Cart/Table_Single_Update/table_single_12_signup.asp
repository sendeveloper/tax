<style>
	h5,h4 {display:inline}
	td {vertical-align:center}
	input[type="radio"] { margin:0 5px; padding:0;}
	.special {background:#e1e1e1}
</style>

<div class="col-lg-12 content">
	<h2>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Tax Table - Single State Update Subscription - 12 Months
	</h2>
	<hr>
	<img src="/Website/Images/ServicesBox/CSV-Table.png" class="left" alt=".CSV tax table">
    <p>This versatile and affordable data file provides general sales tax rates and is available in 
	a selection of formats designed to be compatible with a variety of shopping carts, ERP systems 
	and eCommerce platforms.
	</p>
	
    <hr>
	
 <form method="post" action="http://www.ewebcart.com/17202/cart" accept-charset="utf-8">
      <fieldset>
		<table class="table table-condensed table-hover">
		<thead>
			<tr>
				<th width="60%"><h4><strong>Tax type</strong></h4></th>
				<th width="30%"></th>
				<th width="10%"><strong>Total</strong></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input type="radio" name="option1|Tax type" value="Sales Tax|150" checked>
					<a onclick ="javascript:ShowHide('HiddenSummary1')" href="javascript:;">
					Sales tax</a>
					<p id="HiddenSummary1" style="DISPLAY: none" >General sales tax rates.</p>
				</td>
				<td>&nbsp;</td>
				<td>$150.00</td>
			</tr>		
			<tr>
				<td>
					<input type="radio" name="option1|Tax type" value="Use Tax|150">
					<a onclick ="javascript:ShowHide('HiddenSummary2')" href="javascript:;">
					Use tax</a>
					<p id="HiddenSummary2" style="DISPLAY: none" >Use tax is due on any transaction where 
					sales tax has not been collected, including out of state and internet purchases.</p>
				</td>
				<td>&nbsp;</td>
				<td>$150.00</td>
			</tr>		
			<tr>
				<td>
					<input type="radio" name="option1|Tax type" value="Both sales and use Tax|185">
					<a onclick ="javascript:ShowHide('HiddenSummary3')" href="javascript:;">
					Sales and use tax</a>
					<p id="HiddenSummary3" style="DISPLAY: none" >See which states have a
					<a href='/Website/Downloads/Sample_Tables/use_tax_by_state.pdf' 
					title="States with different sales and use Tax"target='_blank'> 
					use tax that is different</a> than the sales tax.
				</td>
				<td>&nbsp;</td>
				<td>$185.00</td>
			</tr>		
		</tbody>
		</table>
		<hr>
		<table class="table table-condensed table-hover">
		<thead>
			<tr>
				<th width="50%"><h4><strong>Table Format</strong></h4></th>
				<th width="29%"></th>
				<th width="21%"></th>
			</tr>
		</thead>
		<tbody>
		  <tr>
			<td>
			  <input type="radio" name="option2|Table format" value="Full Breakout" checked="checked">
			  <a onclick ="javascript:ShowHide('HiddenSummary4')" href="javascript:;">
			  Full Breakout</a>
			  <p id="HiddenSummary4" style="DISPLAY: none" >The full breakout table provide all tax rates 
			  broken down for every jurisdictional level including ZIP code, state, county, city and 
			  special districts along with jurisdiction codes (where applicable). They provide the 
			  Primary Rate which is the location within a ZIP code containing the U.S. post office and 
			  whether shipping is taxable. You will notice multiple rows for ZIP codes encompassing 
			  multiple jurisdictions so you can choose the one that most closely matches the location you 
			  seek.</p>
			</td>
			<td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/zip2tax_Sample.csv" title="U.S. sample table">
			  Sample full breakout table</a>
			</td>
			<td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/Zip2TaxTableLayoutInformation.pdf" title="U.S. table definitions" target="_blank">Layout information</a>
			</td>
		  </tr>
		  <tr>
		    <td>
			  <input type="radio" name="option2|Table format" value="Basic">
			  <a onclick ="javascript:ShowHide('HiddenSummary5')" href="javascript:;">
			  Basic</a>
			  <p id="HiddenSummary5" style="DISPLAY: none" >The basic table provides the total rate for 
			  all jurisdictions combined. It has multiple rows for a single ZIP code if it contains more 
			  than one city.</p>
			</td>
			<td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/Zip2Tax_Basic_Sample.csv" title="downloadable basic sample">Sample basic table</a>
			</td>
			<td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/Zip2TaxBasicSalesTableLayoutInformation.pdf" title="Basic layout information" target="_blank">Layout information</a>
			</td>
		  </tr>
		  <tr>
            <td>
			  <input type="radio" name="option2|Table format" value="Unique ZIPs">
              <a onclick ="javascript:ShowHide('HiddenSummary7')" href="javascript:;">
              Unique ZIPs</a>
              <p id="HiddenSummary7" style="DISPLAY: none" >The unique ZIPs table provides just one row 
			  per ZIP code. This row is the municipality containing the U.S. postal office (also called 
			  the Primary Record) and may or may not be representative of the tax rates of other 
			  communities sharing that ZIP code.</p>
            </td>
            <td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/Zip2Tax_UniqueZip_Sample.csv" title="downloadable Unique ZIPs sample table">Sample Unique ZIPs table</a>
			</td>
            <td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/Zip2TaxUniqueZipsTableLayoutInformation.pdf" title="Unique ZIPs layout information" target="_blank">Layout information</a>
			</td>
          </tr>
          <tr>
            <td valign="top">
			  <input type="radio" name="option2|Table format" value="NY Clothing">
              <a onclick ="javascript:ShowHide('HiddenSummary8')" href="javascript:;">
              New York State clothing</a>
              <p id="HiddenSummary8" style="DISPLAY: none" > 
              <img src="/Website/Images/Logos/NYState.png" alt="New York State Clothing Sales Tax" title="New York State Clothing Sales Tax">
              New York State implemented a year-round exemption from sales and use taxes for certain 
			  clothing, footwear, and items  used to make or repair exempt clothing. There are several 
			  exemptions which may or may not apply to locally imposed sales and use taxes. For more 
			  information on New York&#39;s clothing exemptions, 
              <a href="http://www.tax.ny.gov/pdf/publications/sales/pub718c.pdf" target="blank">click here</a>.</p>
            </td>
            <td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/NY_clothing_sample_table.csv" title="downloadable sample New York State clothing expemption table">Sample N.Y. clothing table</a>
            </td>
          
            <td valign="top" style="text-align: right">
              <a href="/Website/Downloads/Sample_Tables/Zip2TaxNYClothingTableDescription.pdf" title="New York State clothing exemption layout information" target="_blank">Layout Information</a>
            </td>
          </tr>
		<tr>
		  <td>
		    <input type="radio" name="option2|Table format" value="Epicor Prophet 21">
		    <a onclick ="javascript:ShowHide('HiddenSummary16')" href="javascript:;"> Epicor Prophet 21</a>
		    <p id="HiddenSummary16" style="DISPLAY: none" > 
		    Epicor Software Corporation drives business growth. We provide flexible,
			industry-specific software that is designed around the needs of our manufacturing,
			distribution, retail, and service industry customers. For more information about Epicor Prophet 21, 
			<a href="https://www.epicor.com/offers/distribution-inventory-management.aspx?utm_source=google&utm_medium=paidsearch&utm_term=epicor%20prophet%2021&utm_campaign=70134000001Fq3D&utm_content=g-c&kclickid=f750f935-335f-42cc-98f9-abc01319174d&gclid=EAIaIQobChMIi5LXq6vp1gIVkbbACh2UCQehEAAYASAAEgLDi_D_BwE" target="blank">click here</a>.</p>
		  </td>
		  <td valign="top" style="text-align: right">
		    <Strong>*** New Table Format!</strong>
		  </td>
		  <td valign="top" style="text-align: right">
			<strong>Available Now! ***</strong>
		  </td>
		</tr>
          <tr>
            <td>
			  <input type="radio" name="option2|Table format" value="Evolution">
              <a onclick ="javascript:ShowHide('HiddenSummary9')" href="javascript:;">Evolution</a>
              <p id="HiddenSummary9" style="DISPLAY: none" >
              <img src="/Website/Images/logos/Evolution.jpg" alt="Evolution eCommerce Storefront" title="Evolution eCommerce Storefront">
              An eCommerce storefront specially designed for office products vendors. For more information, <a href="http://evolution-ecommerce.net/" target="_blank">click here</a>.</p>
            </td>
            <td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/Zip2Tax_Evolution_Sample.csv" title="downloadable sample Evolution table">Sample Evolution table</a>
			</td>
            <td valign="top" style="text-align: right">
			  <a href="/Website/Downloads/Sample_Tables/Zip2TaxEvolutionTableLayoutInformation.pdf" title="Evolution layout information" target="_blank">Layout information</a>
          </td>
        </tr>
		<tr>
		  <td>
		    <input type="radio" name="option2|Table format" value="Magento Enterprise">
		    <a onclick ="javascript:ShowHide('HiddenSummary14')" href="javascript:;"> Magento</a> <br>(Enterprise/Go/Community v. 1.7.2 and newer)
		    <p id="HiddenSummary14" style="DISPLAY: none" > 
		    <img src="/Website/Images/Logos/Magento.png" alt="Magento Enterprise Shopping Cart" title="Magento Enterprise Shopping Cart">
		    This scalable module helps online merchants fulfill their business goals. This version of 
			the Magento table has ten columns (five of which contain no data) so that it will import 
			seamlessly with the enterprise version. For more information about Magento, 
			<a href="http://www.magentocommerce.com/product/features" target="blank">click here</a>.</p>
		  </td>
		  <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/Zip2Tax_magento_enterprise_sample_table.csv" title="Downloadable sample Magento table">Sample Magento table</a>
		  </td>
		  <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/Zip2TaxMagentoEnterpriseTableLayoutInformation.pdf" title="Magento layout information" target="_blank">Layout information</a>
		  </td>
		</tr>
  
          <tr>
          <td>
		    <input type="radio" name="option2|Table format" value="Magento">
            <a onclick ="javascript:ShowHide('HiddenSummary10')" href="javascript:;">
            Magento</a> <br>(Community - legacy v. 1.7.1 and older)
            <p id="HiddenSummary10" style="DISPLAY: none" >
            <img src="/Website/Images/Logos/Magento.png" alt="Magento Shopping Cart" title="Magento Shopping Cart">
            A widely known player in the eCommerce industry, Magento got its start as an open source 
			technology. Magento now  offers a variety of both free and scalable retail modules to help 
			online merchants fulfill their business goals.  This table version has five columns of 
			data and works with the free version of the Magento Shopping Cart. For more information 
			about Magento,
            <a href="http://www.magentocommerce.com/product/features" target="blank">click here</a>.</p>
          </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/magento_sample_table.csv" title="Downloadable sample Magento table">Sample Magento table</a>
	      </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/MagentoTaxTableTerminology.pdf" title="Magento layout information" target="_blank">Layout information</a>
		  </td>
		</tr>
  
		<tr>
          <td>
		    <input type="radio" name="option2|Table format" value="Sedona">
            <a onclick ="javascript:ShowHide('HiddenSummary11')" href="javascript:;">
            Sedona</a>
            <p id="HiddenSummary11" style="DISPLAY: none" >
            <img src="/Website/Images/logos/Sedona.png"alt="Sedona Office" title="Sedona Office">
            Advertised as the #1 financial software for security companies, this table contains not just the 
			standard sales tax data, but also specifics about the taxability of labor, inventory, service 
			agreements and delivery. For more information about Sedona Office, 
            <a href="http://www.sedonaoffice.com/" target="_blank">click here</a>.</p>
          </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/Zip2Tax_Sedona_Sample.csv" title="downloadable sample Sedona table">Sample Sedona table</a>
		  </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/Zip2TaxSedonaTableLayoutInformation.pdf" title="Sedona layout information" target="_blank">Layout information</a>
          </td>
		</tr>
		<tr>
          <td>
		    <input type="radio" name="option2|Table format" value="Ultracart">
            <a onclick ="javascript:ShowHide('HiddenSummary12')" href="javascript:;">
            Ultracart</a>
            <p id="HiddenSummary12" style="DISPLAY: none" >
            <img src="/Website/Images/Logos/Ultracart.png" alt="Ultracart Shopping Cart" title="Ultracart Shopping Cart">
            In development for over 15 years, the UltraCart platform provides you with state of the art 
			tools to manage every aspect of your e-commerce business. For more information about Ultracart,
            <a href="http://www.ultracart.com/" target="_blank">click here</a>.</p>
          </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/ultracart_sample_table.csv" title="downloadable sample Ultracart table">Sample Ultracart table</a>
		  </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/UltracartTaxTableTerminology.pdf" title="Ultracart layout information">Layout information</a>
          </td>
		</tr>
		<tr>
		  <td>
		    <input type="radio" name="option2|Table format" value="Volusion">
		    <a onclick ="javascript:ShowHide('HiddenSummary13')" href="javascript:;">
		    Volusion</a>
            <p id="HiddenSummary13" style="DISPLAY: none" >
            <img src="/website/images/logos/Volusion.png" alt="Volusion Shopping Cart" title="Volusion Shopping Cart">
            An out-of-the-box shopping cart solution, Volusion hosts a variety of e-commerce options 
			designed to help new retailers get started quickly, painlessly, and affordably. We have 
			specially formatted tax tables designed to be compatible with the Volusion Shopping Cart. 
			For more information about Volusion, 
			<a href="http://www.volusion.com/online-store-builder/" target="_blank">click here</a>.</p>
          </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/Zip2Tax_volusion_sample_table.csv" title="downloadable sample Volusion table">Sample Volusion table</a>
		  </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/VolusionTaxTableTerminology.pdf" title="Volusion layout information" target="_blank">Layout information</a>
		  </td>
		</tr> 
        <tr>
          <td>
		    <input type="radio" name="option2|Table format" value="Oracle">
            <a onclick ="javascript:ShowHide('HiddenSummary15')" href="javascript:;">
            Oracle*</a> <br>
            (*Additional 3rd party software purchase required)
            <p id="HiddenSummary15" style="DISPLAY: none" >
            <img src="/Website/Images/logos/oracle.png"alt="Oracle eBusiness Suite" title="Oracle eBusiness Suite">
            For releases 11i and 12 (EBS-11i and EBS-12): A third party* has written a Zip2APPS integrator 
			that makes the Sedona format table compatible with the Oracle eBusiness Suite. For more 
			information, contact 
			<a href="mailto:murthy.subramanyamurthy@lantronix.com">murthy.subramanyamurthy@lantronix.com</a>, 
			call (949) 450-7281 or (949) 453-3990.

            *Not affiliated with Zip2Tax.
          </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/Zip2Tax_Sedona_Sample.csv" title="downloadable sample Sedona table">Sample Sedona table</a>
		  </td>
          <td valign="top" style="text-align: right">
		    <a href="/Website/Downloads/Sample_Tables/Zip2TaxSedonaTableLayoutInformation.pdf" title="Sedona layout information" target="_blank">Layout information</a>
          </td>
        </tr> 
		</tbody>
      </table>
<div class="clearfix"></div>
Add a second table in another format for<strong> $60</strong>
	  <select name="option3|Second format">
	    <option value="No Thanks|0">No Thanks</option>
	    <option value="Full Breakout|60">Full Breakout</option>
	    <option value="Basic|60">Basic</option>
	    <option value="Unique ZIPs|60">Unique ZIPs</option>
	    <option value="NY Clothing|60">NY Clothing</option>
	    <option value="Evolution|60">Evolution</option>
	    <option value="Magento|60">Magento</option>
	    <option value="Magento Enterprise|60">Magento Enterprise</option>
	    <option value="Sedona|60">Sedona</option>
	    <option value="Ultracart|60">Ultracart</option>
	    <option value="Volusion|60">Volusion</option>
	    <option value="Oracle|60">Oracle</option>
	  </select>
      <br>
<hr>
      <h3>Select a state*</h3>
  
	<select name="option4|State">
	  <option value="novalue">- Please Select -</option>
	  <option value="AL - Alabama">AL - Alabama</option>
	  <option value="AK - Alaska">AK - Alaska</option>
	  <option value="AZ - Arizona">AZ - Arizona</option>
	  <option value="AR - Arkansas">AR - Arkansas</option>
	  <option value="CA - California">CA - California</option>
	  <option value="CO - Colorado">CO - Colorado</option>
	  <option value="CT - Connecticut">CT - Connecticut</option>
	  <option value="DE - Delaware">DE - Delaware</option>
	  <option value="DC - District of Columbia">DC - District of Columbia</option>
	  <option value="FL - Florida">FL - Florida</option>
	  <option value="GA - Georgia">GA - Georgia</option>
	  <option value="HI - Hawaii">HI - Hawaii</option>
	  <option value="ID - Idaho">ID - Idaho</option>
	  <option value="IL - Illinois">IL - Illinois</option>
	  <option value="IN - Indiana">IN - Indiana</option>
	  <option value="IA - Iowa">IA - Iowa</option>
	  <option value="KS - Kansas">KS - Kansas</option>
	  <option value="KY - Kentucky">KY - Kentucky</option>
	  <option value="LA - Louisiana">LA - Louisiana</option>
	  <option value="ME - Maine">ME - Maine</option>
	  <option value="MD - Maryland">MD - Maryland</option>
	  <option value="MA - Massachusetts">MA - Massachusetts</option>
	  <option value="MI - Michigan">MI - Michigan</option>
	  <option value="MN - Minnesota">MN - Minnesota</option>
	  <option value="MS - Mississippi">MS - Mississippi</option>
	  <option value="MO - Missouri">MO - Missouri</option>
	  <option value="MT - Montana">MT - Montana</option>
	  <option value="NE - Nebraska">NE - Nebraska</option>
	  <option value="NV - Nevada">NV - Nevada</option>
	  <option value="NH - New Hampshire">NH - New Hampshire</option>
	  <option value="NJ - New Jersey">NJ - New Jersey</option>
	  <option value="NM - New Mexico">NM - New Mexico</option>
	  <option value="NY - New York">NY - New York</option>
	  <option value="NC - North Carolina">NC - North Carolina</option>
	  <option value="ND - North Dakota">ND - North Dakota</option>
	  <option value="OH - Ohio">OH - Ohio</option>
	  <option value="OK - Oklahoma">OK - Oklahoma</option>
	  <option value="OR - Oregon">OR - Oregon</option>
	  <option value="PA - Pennsylvania">PA - Pennsylvania</option>
	  <option value="RI - Rhode Island">RI - Rhode Island</option>
	  <option value="SC - South Carolina">SC - South Carolina</option>
	  <option value="SD - South Dakota">SD - South Dakota</option>
	  <option value="TN - Tennessee">TN - Tennessee</option>
	  <option value="TX - Texas">TX - Texas</option>
	  <option value="UT - Utah">UT - Utah</option>
	  <option value="VT - Vermont">VT - Vermont</option>
	  <option value="VA - Virginia">VA - Virginia</option>
	  <option value="WA - Washington">WA - Washington</option>
	  <option value="WV - West Virginia">WV - West Virginia</option>
	  <option value="WI - Wisconsin">WI - Wisconsin</option>
	  <option value="WY - Wyoming">WY - Wyoming</option>
	  <option value="AA - Armed Forces Americas">AA - Armed Forces Americas</option>
	  <option value="AE - Armed Forces: Europe, Canada, Middle East, Africa">AE - Armed Forces: Europe, Canada, Middle East, Africa</option>
	  <option value="AP - Armed Forces: Pacific">AP - Armed Forces: Pacific</option>
	  <option value="AS - American Samoa">AS - American Samoa</option>
	  <option value="FM - Federated States of Micronesia">FM - Federated States of Micronesia</option>
	  <option value="GU - Guam">GU - Guam</option>
	  <option value="MH - Marshall Islands">MH - Marshall Islands</option>
	  <option value="MP - Northern Mariana Islands">MP - Northern Mariana Islands</option>
	  <option value="PR - Puerto Rico">PR - Puerto Rico</option>
	  <option value="PW - Palau">PW - Palau</option>
	  <option value="VI - Virgin Islands">VI - Virgin Islands</option>
	</select> 
	*Required field
		<div class="clearfix"></div>
		<p class="noPadding">What software are you integrating this with? <input name="option5|Integration" size="35"></p>	
		<div class="clearfix"></div>
		<h5><span class="firstword">That's it!</span> No hidden costs, no activation fees, no handling fees, no maintenance fees - ever!</h5>
		<div class="clearfix"></div>
		<input type="hidden" name="item_id" value="50">
		<input type="hidden" name="require" value="option4|State:">
		<input type="submit" name="add" value="Add To Cart"class="btn btn-danger btn-sm" onClick="ga('send', 'event', 'Button', 'Click');">
		</fieldset>	
		<div class="clearfix"></div>
	</form>
To add another state just click &quot;Back to Shopping&quot; from the next screen.
<div class="clearfix"></div>
<a href="/free-sales-tax-calculator" target="_parent" onClick="closeWin()">Back to shopping</a>

</div>	
