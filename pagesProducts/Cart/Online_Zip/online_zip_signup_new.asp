<style>
	h5,h4 {display:inline}
	td {vertical-align:center}
	input[type="radio"] { margin:0 5px; padding:0;}
	.special {background:#e1e1e1}
</style>

<div class="col-lg-12 content">
	<h1>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Online Lookup - ZIP Code Resolution
	</h1>
	<hr>

	<img src="/Website/Images/Services/ZIP-code-sm.png" class="left" alt="Zip Code resolution">
    <p>A one-year subscription allows for 1,000 queries per month. For higher or lower query levels per month, please call or Chat!</p>
	
    <hr>
    <h3>Subscription details</h3>
    <p class="noPadding">Allows up to 5 users a maximum of 1,000 queries per month using a single set of credentials. E-mail or call (866) 492-8494 for pricing on higher levels.</p>

<script language="javascript" type="text/javascript">
function initInput(var variable)
	{
	document.forms[0].fid_17.value = variable;
	}
</script>
	
		<script language="javascript" type="text/javascript">
		
		function DetermineProduct(Resolution, TaxType, Term)
		{
			switch (Resolution) {
				case "ZIP":
					switch(TaxType) {
						case "Sales Tax":
							switch(Term) {
								case "1 Month":
									document.getElementById('myDIV').innerHTML='1 <br> <input type="hidden" name="option1|Subscription length" value="1 Month Sales Tax|24.25">';
									break;
									
								case "12 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax|170.95">';
									break;
							}
							break;
						case "Sales Tax With Use Tax":
							switch(Term) {
								case "1 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="1 Month Sales Tax With Use Tax|29.20">';
									break;
									
								case "12 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
							}
							break;
					}
					break;
					
				case "ZIP4":
					switch(TaxType) {
						case "Sales Tax":
							switch(Term) {
								case "1 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
									
								case "12 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
							}
							break;
						case "Sales Tax With Use Tax":
							switch(Term) {
								case "1 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
									
								case "12 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
							}
							break;
					}
					break;
					
				case "SPOT-ON":
					switch(TaxType) {
						case "Sales Tax":
							switch(Term) {
								case "1 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
									
								case "12 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
							}
							break;
						case "Sales Tax With Use Tax":
							switch(Term) {
								case "1 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
									
								case "12 Month":
									document.getElementById('myDIV').innerHTML='<input id ="user_input" type="hidden" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">';
									break;
							}
							break;
					}
					break;
			}
		}
		</script>
	
	<form id="sales popup" method="post" action="http://www.ewebcart.com/17202/cart" accept-charset="utf-8">
		<fieldset>
		
		Select a <span style="color: red">Tax Type</span><br>
		<input type="radio" id="a" checked="checked" name="TaxType" value="Sales Tax" onClick="DetermineProduct(Resolution.value, TaxType.value, Term.value);">Sales Tax<br>
		<input type="radio" id="a" name="TaxType" value="Sales Tax With Use Tax" onClick="DetermineProduct(Resolution.value, TaxType.value, Term.value);">Sales & Use Tax<br><br>
		
		Select a <span style="color: red">Resolution</span><br>
		<input type="radio" checked="checked" id="b" name="Resolution" value="ZIP" onClick="DetermineProduct(Resolution.value, TaxType.value, Term.value);">ZIP Code<br>
		<input type="radio" id="b" name="Resolution" value="ZIP4" onClick="DetermineProduct(Resolution.value, TaxType.value, Term.value);">ZIP+4<br>
		<input type="radio" id="b" name="Resolution" value="SPOT-ON" onClick="DetermineProduct(Resolution.value, TaxType.value, Term.value);">Spot-On&trade;<br><br>
		
		Select a <span style="color: red">Term</span><br>
		<input type="radio" checked="checked" id="c" name="Term" value="1 Month" onClick="DetermineProduct(Resolution.value, TaxType.value, Term.value);">1 Month<br>
		<input type="radio" id="c" name="Term" value="12 Months" onClick="DetermineProduct(Resolution.value, TaxType.value, Term.value);">1 Year<br><br>

		Quantity: <input name="quantity" value="1" size="3"> <br>
		<input type="hidden" name="item_id" value="30">
		
		<div id="myDiv">
			asdf
		</div>
					
		<input type="hidden" name="require" value="option1|Subscription length">
		<input type="submit" name="add" value="Add To Cart"class="btn btn-danger btn-sm" onClick="ga('send', 'event', 'Button', 'Click');">
		</fieldset>
	</form>
    
    <!--<form method="post" action="http://www.ewebcart.com/17202/cart" accept-charset="utf-8">
      <fieldset>
		<table class="table table-condensed popups">
			<thead>
				<tr>
					<th width="33%"><h4><strong class="firstword">Sales Tax</strong></h4></th>
					<th width="12%"><strong>Per Month</strong></th>
					<th width="6%"><strong>Total</strong></th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>
						<input type="radio" name="option1|Subscription length" value="1 Month Sales Tax|24.25">
						<strong>1 Month</strong>
					</td>
					<td>$24.25</td>
					<td><strong>$24.25</strong></td>
				</tr>
				
				<tr>
					<td>
						<input type="radio" name="option1|Subscription length" value="3 Months Sales Tax|62.70">
						<strong>3 Months</strong>
					</td>
					<td>$20.90</td>
					<td><strong>$62.70</strong></td>
				</tr>
				
				<tr>
					<td>
						<input type="radio" name="option1|Subscription length" value="6 Months Sales Tax|105.60">
						<strong>6 Months</strong>
					</td>
					<td>$17.60</td>
					<td><strong>$105.60</strong></td>
				</tr>
				
				<tr class="special">
					<td>
						<input type="radio" name="option1|Subscription length" value="12 Months Sales Tax|170.95" checked="">
						<strong>12 Months</strong>
					</td>
					<td>$14.25</td>
					<td><strong>$170.95</strong></td>
				</tr>
				
				<tr class="special">
					<td colspan="7" class="text-center"><h5><strong class="firstword">Best
					Value:</strong> <strong>Purchase multiple years and save 10%: - Quantity:</strong>
					<input name="quantity" value="1" size="3"><input type="hidden"
					name="item_id" value="30"></h5></td>
				</tr>
				
			</tbody>
		</table>
		
		<table class="table table-condensed popups">
			<thead>
				<tr>
				<th width="33%"><h4><strong class="firstword">Sales &amp; Use Tax</strong></h4></th>
				<th width="12%"><strong>Per Month</strong></th>
				<th width="6%"><strong>Total</strong></th>
				</tr>
			</thead>
				
			<tbody>
				<tr>
					<td>
						<input type="radio" name="option1|Subscription length" value="1 Month Sales Tax With Use Tax|29.20">
						<strong>1 Month</strong>
					</td>
					<td>$29.20</td>
					<td><strong>$29.20</strong></td>
				</tr>
				
				<tr>
					<td>
						<input type="radio" name="option1|Subscription length" value="3 Months Sales Tax With Use Tax|75.45">
						<strong>3 Months</strong>
					</td>
					<td>$25.15</td>
					<td><strong>$75.45</strong></td>
				</tr>
				
				<tr>
					<td>
						<input type="radio" name="option1|Subscription length" value="6	Months Sales Tax With Use Tax|126.60">
						<strong>6 Months</strong>
					</td>
					<td>$21.10</td>
					<td><strong>$126.60</strong></td>
				</tr>
				
				<tr class="special">
					<td>
						<input type="radio" name="option1|Subscription length" value="12 Months Sales Tax With Use Tax|205.20">
						<strong>12 Months</strong>
					</td>
					<td>$17.10</td>
					<td><strong>$205.20</strong></td>
				</tr>
				
				<tr class="special">
					<td colspan="7" class="text-center"><h5><strong class="firstword">Best
					Value:</strong> <strong>Purchase multiple years and save 10%: - Quantity:</strong>
					<input name="quantity" value="1" size="3"><input type="hidden"
					name="item_id" value="30"></h5></td>
				</tr> 
			</tbody>
		</table>
		
		<div class="clearfix"></div>
		<h5><span class="firstword">That's it!</span> No hidden costs, no activation fees, no handling fees, no maintenance fees - ever!</h5>
		<div class="clearfix"></div>

		<input type="hidden" name="require" value="option1|Subscription length" >
		<input type="submit" name="add" value="Add To Cart"class="btn btn-danger btn-sm" onClick="ga('send', 'event', 'Button', 'Click');">
      </fieldset>
    </form>-->
	<div class="clearfix"></div>
	
	<a href="/free-sales-tax-calculator" target="_parent" onClick="closeWin()">Back to shopping</a>
</div>