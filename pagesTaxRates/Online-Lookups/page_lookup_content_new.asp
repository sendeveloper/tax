<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&callback=initialize"></script>

<div class="col-md-9 content">
	<h1>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Spot-On&trade; Sales And Use Tax Rates With 
Sales Tax Calculator
	</h1>
	<p>
		Quickly find the general sales tax and use tax rates for every door step, ZIP+4, or ZIP code in every state, county, city and special district in the United States.
	</p>
	
	<script type="text/javascript">
		function timeStringToFloat(time) {
				  var hoursMinutes = time.split(/[.:]/);
				  var minutes = parseInt(hoursMinutes[0], 10);
				  var seconds = hoursMinutes[1] ? parseInt(hoursMinutes[1], 10) : 0;
				  var meconds = hoursMinutes[2] ? parseInt(hoursMinutes[2], 10) : 0;
				  //seconds = seconds/60;
				  
				 var res = seconds + '.' + meconds;
				  
				  return  res;//seconds.toFixed(2);
		}
	
	$(function(){
			<% if Session("z2t_username")="" then%>
			$("#getRate").prop('disabled', true);
			<%end if%>
			$('.form-control').keydown(function(event){
				 if (event.keyCode === 10 || event.keyCode === 13)  {
					 event.preventDefault();
				   }		
			});
			
			$('#zip, #plus4, #calculateAmount').keyup(function(e)
											{
			  var $this = $(this);
    $this.val($this.val().replace(/[^\d.]/g, ''));   
			});
			$("#getRate").click(function(){
				
				var reqAddress1 = $("#AddressLine1").val();
				var reqAddress2 = $("#AddressLine2").val();
				var reqCity = $("#city").val();
				var reqState = $("#strState").val();
				var reqZip = $("#zip").val();
				var reqPlusfour = $("#plus4").val();
				if (reqPlusfour !== "") {
					reqZip = reqZip + "-" + reqPlusfour;
				}
				$userEntries = {
						//strPage: 'http://dev.api.zip2tax.com/TaxRate-USA.web',
						username: '<%=Session("z2t_username")%>',
						password: '<%=Session("z2t_password")%>',
						addressLine1: reqAddress1,
						addressLine2: reqAddress2,
						city: reqCity,
						state: reqState,
						zip: reqZip
					};
				//console.log($userEntries);

				var theUrl = "/website/pagestaxrates/online-lookups/z2t_Ajax.asp";

				$.get(theUrl, $userEntries)
				.always(function() {
					$("div[class*= ph], #specialRules, #salesTax, #useTax").empty();
				})
				.done(function(data){
					$(".myAlert").empty().hide();
					var obj = jQuery.parseJSON(data);
					var errorInfo = obj.z2tLookup.errorInfo.errorCode;
					var strServerName = obj.z2tLookup.errorInfo.ServerName;
					var strVersion = obj.z2tLookup.errorInfo.Version;
					var strTime  = obj.z2tLookup.errorInfo.elapsedTime;
					
					if (errorInfo == '0') {
					var passiveMessage=obj.z2tLookup.errorInfo.passiveMessages[0].message;
					if (passiveMessage.length > 0) {
						$(".myAlert").empty().show().append(passiveMessage);
						}
					
					var lookupLevel=obj.z2tLookup.addressInfo.addressResolution;
					var resultLevel ='';
					if (lookupLevel === "PinPoint") {
						curImage = "SpotOn.png";
						resultLevel = "Spot-On";
						}
					else if (lookupLevel === "ZIP+4") {
						curImage = "ZIP+4.png";
						resultLevel = "ZIP+4";
						}
					else if (lookupLevel === "ZIP code") {
						curImage = "ZIP-code.png";
						resultLevel = "ZIP code";
						}
					$("#mainImage").attr('src','/Website/Images/Services/'+curImage);
					$("#currentLevel").empty().append("Results level is:<h3>" +resultLevel+"</h3>" );
					
					var taxRate=obj.z2tLookup.addressInfo.addresses[0].address.salesTax.rateInfo.taxRate;
					var isUseTaxRate=obj.z2tLookup.addressInfo.addresses[0].address.useTax;
					if (isUseTaxRate) {
						var useTaxRate = obj.z2tLookup.addressInfo.addresses[0].address.useTax.rateInfo.taxRate;
						}
					var AddressLine1 = obj.z2tLookup.addressInfo.addresses[0].address.addressLine1 + ' ';
					var AddressLine2 = obj.z2tLookup.addressInfo.addresses[0].address.addressLine2 + ' <br>';
					var place = obj.z2tLookup.addressInfo.addresses[0].address.place;
					var zipCode = obj.z2tLookup.addressInfo.addresses[0].address.zipCode + ' ';
					var county = obj.z2tLookup.addressInfo.addresses[0].address.county + ' ';
					var strState = obj.z2tLookup.addressInfo.addresses[0].address.state + ' ';
					var latitude = obj.z2tLookup.addressInfo.addresses[0].address.Latitude;
					latitude = parseFloat(latitude);
					var longitude = obj.z2tLookup.addressInfo.addresses[0].address.Longitude;
					longitude = parseFloat(longitude);
					//console.log( latitude + "|" + longitude);
					if (zipCode !== '' && latitude !== '' && longitude !== '') {
						
						var uluru = {lat: latitude, lng: longitude};
						var map = new google.maps.Map(document.getElementById('resultGoogleMap'), {
						  zoom: 11,
						  center: uluru
						});
						var marker = new google.maps.Marker({
						  position: uluru,
						  map: map
						});
						
						mapSetup($("#resultGoogleMap")[0], obj.z2tLookup.addressInfo.addresses[0].address.zipCode, latitude, longitude);
						$("#resultGoogleMap").css('visibility','visible').show();
						
						
					}

					
					var crlf = '';
					if (obj.z2tLookup.addressInfo.addresses[0].address.addressLine1 || obj.z2tLookup.addressInfo.addresses[0].address.addressLine2 ) {
						crlf = '<br>';
						}
					
					$(".phSalesTaxRate").empty().append(taxRate + "%" + " (" + parseFloat(taxRate,2) + "%)" );
					if (isUseTaxRate) {
						$(".phUseTaxRate").empty().append(useTaxRate+ "%" + " (" + parseFloat(useTaxRate,2) + "%)");
						}
					$(".phAddr").empty().append(reqAddress1 + ' ' + reqAddress2 + crlf + place + ', ' + strState + zipCode);
					$(".phPlace").empty().append(place);
					$(".phCounty").empty().append(county);
					$(".phState").empty().append(strState);
					$(".formHide").show();
					$("#hidTaxRate").val(taxRate);
					$("#hidUseTaxRate").val(useTaxRate);
					
					var objSalesTaxDetail = obj.z2tLookup.addressInfo.addresses[0].address.salesTax.rateInfo.rateDetails;
					var stTRate = '';
					for (var j = 0 ; j < objSalesTaxDetail.length; j++) {
						if (objSalesTaxDetail[j].rateDetail.taxRate > 0) {
							stTRate += "<div class=\"col-md-6\">" + objSalesTaxDetail[j].rateDetail.authorityName + "</div><div class=\"col-md-6\">" + objSalesTaxDetail[j].rateDetail.taxRate + "%</div>";
							}
						}
							stTRate += "<div class=\"col-md-2 col-md-offset-4\">Total</div><div class=\"col-md-6\">" + obj.z2tLookup.addressInfo.addresses[0].address.salesTax.rateInfo.taxRate + "%</div>";

					if (isUseTaxRate) {
					var objUseTaxDetail = obj.z2tLookup.addressInfo.addresses[0].address.useTax.rateInfo.rateDetails;
					var utTRate = '';
						for (var j = 0 ; j < objUseTaxDetail.length; j++) {
							if (objUseTaxDetail[j].rateDetail.taxRate > 0) {
								utTRate += "<div class=\"col-md-6\">" + objUseTaxDetail[j].rateDetail.authorityName + "</div><div class=\"col-md-6\">" + objUseTaxDetail[j].rateDetail.taxRate + "%</div>";
								}
							}
							utTRate += "<div class=\"col-md-2 col-md-offset-4\">Total</div><div class=\"col-md-6\">" + obj.z2tLookup.addressInfo.addresses[0].address.useTax.rateInfo.taxRate + "%</div>";
					}

					var objNotes = obj.z2tLookup.addressInfo.addresses[0].address.notes;
					var utNotes = '';
					for (var j = 0 ; j < objNotes.length; j++) {
						if (objNotes[j].noteDetail.jurisdiction.length > 0) {
							utNotes += "<div class=\"col-md-12\"><p class=\"noPadding\">"+ (j+1) + ". " + objNotes[j].noteDetail.jurisdiction +", " + objNotes[j].noteDetail.category + ": " + objNotes[j].noteDetail.note + "</p></div>";
							}
						}

					$('#salesTax').empty().append(stTRate);
					$('#useTax').empty().append(utTRate);
					$('#specialRules').empty().append(utNotes);
					$('#serverInfo').empty().append('Server: ' + strServerName + ' Version: ' + strVersion + ' Time: ' + timeStringToFloat(strTime) + 's');
					$('.mywell').show();
				} else {
					$(".myAlert").empty().show().append(obj.z2tLookup.errorInfo.errorMessage);
					$('.mywell').show();
					$(".formHide").hide();
					$("#resultGoogleMap").hide();
				}	
				})
				.fail(function(){
					$(".myAlert").empty().show().append('Something went wrong, please try again');
					$('.mywell').show();
					$(".formHide").hide();
					$("#resultGoogleMap").hide();
				});

			});

var formatter = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD"
});
			
			
			$("#calculateButton").click(function(){
				var dAmount = $("#calculateAmount").val();
				dAmount = parseFloat(dAmount,5);
				var taxRate = $("#hidTaxRate").val();
				var useTaxRate = $("#hidUseTaxRate").val();
				var dTaxRateCalc = ((dAmount * taxRate) / 100 );
				var dUseTaxRateCalc = ((dAmount * useTaxRate) / 100 );
				$(".phSalesTaxAmount").empty().append(formatter.format(dAmount));
				$(".phSalexTaxTax").empty().append(formatter.format(dTaxRateCalc));
				$(".phSalesTaxTotal").empty().append(formatter.format(dAmount + dTaxRateCalc));
				$(".phUseTaxAmount").empty().append(formatter.format(dAmount));
				$(".phUseTaxTax").empty().append(formatter.format(dUseTaxRateCalc));
				$(".phUseTaxtotal").empty().append(formatter.format(dAmount + dUseTaxRateCalc));
				
				});
			});

			</script>
			<style>
			.padded { margin-bottom:5px !important; padding: 5px 5px !important;}
			.col-md-3, .col-md-4 {padding-right:8px !important; }
			#inputZip {left:0 !important}
			
			</style>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-star" aria-hidden="true"> </span>Online Lookup</h3>
		</div>
		<div class="panel-body">
			<% if Session("z2t_username")="" then%>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="alert alert-dismissible alert-danger alert-sm">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						In order to use this feature, you need to be logged in. Click <a href="javascript:();" id="lookupOpener">here</a> to Log In
					</div>				
				</div>
			</div>
			<%end if%>
			<div class="row">
				<div class="col-lg-3 text-center">
				<img src="/Website/Images/Services/SpotOn-all.png" alt="Spot-On and ZIP+4 Sales tax calculator" class="img-responsive" id="mainImage">
				<br>
				<div id="currentLevel" class="text-center"></div>
				</div>
				<div class="col-lg-9">
					<form>
					<fieldset>
						<div class="form-group form-group-sm">
							<div class="col-md-12">
								<input type="text" class="form-control padded" id="AddressLine1" placeholder="Street Address" />
							</div>
						</div>
						<div class="form-group form-group-sm">
							<div class="col-md-12">
								<input type="text" class="form-control padded" id="AddressLine2" placeholder="Apt / Suite / Other" />
							</div>
						</div>
						<div class="form-group form-group-sm">
							<div class="col-md-4">
								<input type="text" class="form-control padded" id="city" placeholder="City" />
							</div>
							<div class="col-md-3">
								<select class="form-control padded" id="strState">
								<option value="" class="placeholder placeholder-hidden">ST</option>
								 <%
									  Dim states: states = Array(_
										"AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FM", "FL", "GA", "GU", "HI", "ID", "IL", _
										"IN", "IA", "KS", "KY", "LA", "ME", "MH", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", _
										"NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PW", "PA", "PR", "RI", "SC", "SD", "TN", "TX", _
										"UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY", "AA", "AE", "AE", "AE", "AE", "AP")

									  Dim State: For Each State In States
								%>
														  <option value="<%=state%>"><%=state%></option>
								<%
								  Next
								%>
								</select>
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control padded" id="zip" placeholder="Zip"  maxlength="5" />
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control padded" id="plus4" placeholder="+4" maxlength="4" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-3">
								<button type="button" id="getRate" class="btn btn-danger btn-sm padded">Get Rate</button>
							</div>
							<div class="col-lg-3 ">
								<button type="reset" class="btn btn-default btn-sm padded">Clear</button>
							</div>
						</div>
						<div class="formHide">
						<div class="clearfix"></div>
						<div class="col-lg-12 phSalesTaxRate text-center" style="font-size:24px !important; font-weight:bold !important"></div>
						<input type="hidden" id="hidTaxRate"><input type="hidden" id="hidUseTaxRate">
						<div class="clearfix"></div>
						<div class="form-group form-group-sm">
							<div class="col-lg-6">
								<input type="text" class="form-control padded" id="calculateAmount" placeholder="Enter Dollar Amount"  maxlength="9" />
							</div>
							<div class="col-lg-6">
								<button type="button" id="calculateButton" class="btn btn-danger btn-sm">Calculate</button>
							</div>
						</div>
						</div>
					</fieldset>
					</form>
				</div>
			</div>
			<hr>
			<div class="mywell">
				<div class="alert alert-dismissible alert-danger alert-sm myAlert">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<div class="myAlertContent"></div>
				</div>
				<div class="row">
					<div class="col-lg-7">
							<div class="row">
								<div class="col-lg-5">Sales Tax Rate:</div>
								<div class="col-lg-7 phSalesTaxRate redFont"></div>
							</div>
							<div class="row">
								<div class="col-lg-5">Use Tax Rate:</div>
								<div class="col-lg-7 phUseTaxRate redFont"></div>
							</div>
							<div class="row">
								<div class="col-lg-5">Mailing Address:</div>
								<div class="col-lg-7 phAddr"></div>
							</div>
							<div class="clearfix"></div>
							<div class="row">
								<div class="col-lg-12">Geographic Location:</div>
							</div>
							<div class="row">
								<div class="col-lg-5">Place:</div>
								<div class="col-lg-7 phPlace"></div>
							</div>
							<div class="row">
								<div class="col-lg-5">County:</div>
								<div class="col-lg-7 phCounty"></div>
							</div>
							<div class="row">
								<div class="col-lg-5">State:</div>
								<div class="col-lg-7 phState"></div>
							</div>
							
								
					</div>
					<div class="col-lg-5">
							<div class="row">
								<div class="col-lg-6">Dollar Amount:</div>
								<div class="col-lg-6 phSalesTaxAmount text-right">$amount</div>
							</div>
							<div class="row">
								<div class="col-lg-6 redFont">Sales Tax:</div>
								<div class="col-lg-6 phSalexTaxTax text-right redFont">$salextax</div>
							</div>
							<hr class="unpadded">
							<div class="row">
								<div class="col-lg-6">Total Sale:</div>
								<div class="col-lg-6 phSalesTaxTotal text-right">$totalSale</div>
							</div>
							<div class="clearfix"></div>
							<div class="row">
								<div class="col-lg-6">Dollar Amount:</div>
								<div class="col-lg-6 phUseTaxAmount text-right">$amount</div>
							</div>
							<div class="row">
								<div class="col-lg-6 redFont">Use Tax:</div>
								<div class="col-lg-6 phUseTaxTax text-right redFont">$usetax</div>
							</div>
							<hr class="unpadded">
							<div class="row">
								<div class="col-lg-6">Total Sale:</div>
								<div class="col-lg-6 phUseTaxtotal text-right">$totalSale</div>
							</div>
					
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-12"><div class="redFont">Sales Tax Breakout</div></div>
					<div id="salesTax"> </div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-12"><div class="redFont">Use Tax Breakout</div></div>
					<div id="useTax"> </div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-12"><div class="redFont">Special Rules</div></div>
					<div id="specialRules"> </div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="blueFont" id="serverInfo"></div>
					</div>
				</div>
				<hr>
					
					
<div id="resultGoogleMap"></div>
			</div>
						
		</div>
	</div>
	
	<h2>
		<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		How to Use Our Spot-On&trade; Sales Tax Calculator
	</h2>
	<p>
		Our Spot-On&trade; Sales Tax Calculator is a very powerful tool. There are three modes in which it can operate.<br><br>
		
		The first is to do a sales tax lookup by ZIP code. In order to do this, enter your five digit ZIP code into the Sales Tax Calculator.
		Then click "Get Rate" to return the results at a ZIP code level. If you check out our <a href="/sales-tax-calculator">ZIP code Sales Tax Calculator</a> 
		where you will also be able to calculate exact dollar amounts with the sales tax information.<br><br>
		
		The second mode will allow you to run a sales tax lookup on a ZIP+4 level. To do this just enter the five digit ZIP code like 
		before and then add the specific four digit postal code. Then click "Get Rate" to get even more specific sales tax information.<br><br>
		
		The final mode is our Spot-On&trade; lookup. For this enter in a full address into the sales tax calculator just like you would in a GPS.
		It's not necessary to enter the four digit postal code for this mode, but you are more than welcome to if you would like. Then just click 
		"Get Rate" to aquire the sales tax rates for that very door step!<br>
	</p>

</div>