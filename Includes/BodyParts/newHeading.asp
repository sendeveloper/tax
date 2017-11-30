    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=yes, width=device-width, height=device-height">
    <meta name="author" content="Zip2Tax">
			<script>
				$(document).ready(function() {
					var checkTimer = setInterval(function() {checkChatDiv()}, 500);
					function checkChatDiv() {
						var atag = $('.topChatImg').find('a');
						if (atag != undefined && atag.length)
						{
							$('.phoneDiv').show();
							clearInterval(checkTimer);
						}
					}
					function checkMobile()
					{
						var isMobile = false; //initiate as false
						// device detection
						if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
						    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) isMobile = true;
   						return isMobile;
					}				
					$('#bs-example-navbar-collapse-1 li').on('click', function() {
						
    					if (checkMobile() == false){
    						var atag = $(this).find('a.dropdown-toggle');
							document.location.href = atag.attr('href');
    					}
					})
					function changeWindow()
					{
						var scroll = $(window).scrollTop();
					    var topArea = 86;
					    if (scroll >= topArea)
					    {
					    	var width = parseFloat($(window).width());
					    	$('#topArea').css('position', 'fixed');
					    	$('#topArea').css('top', '0px');
					    	$('#topArea').css('width', '100%');
					    	$('#topArea').css('z-index', '100');
					    	$('#topNavBar').css('position', 'fixed');
					    	$('#topNavBar').css('width', '100%');
					    	$('#topNavBar').css('z-index', '100');
					    	$('.scrollHide').hide();
					    	$('.scrollShow').show();
					    	$('.phoneDiv').attr('class','col-sm-3 fontWhite18Bold phoneDiv');
					    	$('#topArea').css('background-color', '#FFF');
					    	$('#topArea').css('background-image', 'none');
					    	$('#topArea').css('min-height', 'auto');
					    	$('#topArea').css('padding-bottom', '5px');
					    	$('.topAreaBack').css('background-image','linear-gradient(180deg,#0b0c0c,#3d3d3d)');
					    	$('.chatDiv').attr('class','col-sm-3 hidden-xs chatDiv');
					    	$('.chatDiv .topChatImg').css('margin-top','14px');
					    	$('#topArea .container').css('padding','0 30px');
					    	$('.phoneDiv').css('margin', '10px auto 0');

					    	topArea = $('#topArea').height();
					    	$('#topNavBar').css('top', (topArea) + 'px');
					    	$('.mainBody').css('padding-top', (topArea + 52) + 'px');
					    }
					    else
					    {
					    	$('#topArea').css('position', 'inherit');
					    	$('#topArea').css('top', '0px');
					    	$('#topArea').css('width', 'auto');
					    	$('#topArea').css('z-index', 'inherit');
					    	$('#topNavBar').css('position', 'inherit');
					    	$('#topNavBar').css('top', '0px');
					    	$('#topNavBar').css('width', 'auto');
					    	$('#topNavBar').css('z-index', 'inherit');
					    	$('.scrollHide').show();
					    	$('.scrollShow').hide();
					    	$('.phoneDiv').attr('class','col-lg-3 col-md-3 col-sm-3 fontWhite18Bold phoneDiv');
					    	$('#topArea').css('background-color', '');
					    	$('#topArea').css('background-image', 'linear-gradient(180deg,#0b0c0c,#3d3d3d)');
					    	$('#topArea').css('padding-bottom', '0px');
					    	$('#topArea').css('min-height', '140px');
					    	$('.topAreaBack').css('background-image','transparent');
					    	$('.chatDiv').attr('class','col-lg-2 hidden-md hidden-sm hidden-xs chatDiv chatDiv');
					    	$('.chatDiv .topChatImg').css('margin-top','20px');
					    	$('#topArea .container').css('padding','0 30px');
					    	$('.phoneDiv').css('margin', 'auto');
					    	$('.mainBody').css('padding-top', '0px');
					    }
					}
    				$(window).scroll(function (event) {
					    changeWindow();
					});
    				$('#menuInputZip').keydown(function(event){
						if (event.keyCode === 10 || event.keyCode === 13)  {
						 	event.preventDefault();
						}		//event.preventDefault();
					});
					
					$('input[name="menuInputZip"]').keyup(function(e)
													{
						if (/\D/g.test(this.value))
						{
							// Filter non-digits from input value.
							this.value = this.value.replace(/\D/g, '');
						}
					});
					$('#menuInputZip').keyup(function(e) {
						var code = e.which;
						if(code==13){
							e.preventDefault();
							clickZipLookup();
						}
						
					})
					function clickZipLookup(){
						var a=document.getElementById("menuInputZip");
						if(a.value.length>5&&(a.value=a.value.substr(0,5)),5==a.value.length)
						{
							var b="/Website/pagesTaxRates/z2t_lookup.asp?inputZip="+a.value;
							window.document.location=b;
						}
						else alert("Zip Code Must Contain 5 Characters");
					}
					$('.login_menu').on('click', function(e) {
						$('.modal-backdrop').remove();
    					$('<div class="modal-backdrop" style="opacity: 0.6; background-color: #FFF;"></div>').appendTo(document.body);
						$( "#dialog-form2" ).dialog( "close" );
      					$( "#dialog-form" ).dialog( "open" );
      					$('#dialog-form').parent().css('z-index', 1100);

					})
				});
			</script>
			<link href="/css/bootstrap.min.css" rel="stylesheet">
			<link href="/css/style.css" rel="stylesheet">
			
  </head>
  <body>

    <div class="container-fluid">
	<div class="row" id="topArea">
		<div style="width: 100%;" class="topAreaBack">
			<div class="container">
				<div class="col-lg-2 hidden-md hidden-sm hidden-xs chatDiv">
					<div class="topChatImg" style="margin-top: 20px;">
					<!--#include virtual="/Website/Includes/BodyParts/LiveChat.inc"-->
					</div>
				</div>
				<div class="col-lg-7 col-md-9 col-sm-9 scrollHide text-center">
					<div class="topLogo" style="margin-top:20px; margin-bottom: 40px;"><a href="/"><img src="/website/images/logo-header.png" alt="Zip2Tax.com" class="image-responsive"></a></div>
				</div>
				<div class="col-sm-6 hidden-xs text-center scrollShow" style="display: none;">
					<div class="topLogo" style="margin-top:10px; margin-bottom: 10px;">
						<a href="/"><img src="/website/images/logo-small.png" alt="Zip2Tax.com" class="image-responsive"></a></div>
				</div>
				<div class="col-lg-3 col-md-3 fontWhite18Bold hidden-sm hidden-xs scrollHide">
					<p style="margin: 0 0 10px;">	</p>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;Sales & Use Tax Rates<br>
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;for State, County, City<br>
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;and Special Districts
					</div>
					<p style="margin: 0 0 10px;"> </p>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 fontWhite18Bold phoneDiv" style="display: none;">
					<p style="margin: 0 0 10px;"> </p>
					<div style="border-radius: 25px;
								border: 2px solid #9CE53C;
								padding: 6px 10px;
								width: 200px;
								height: 45px;
								font-size: 17pt;
								margin: auto;">
						<a href="tel:+18664928494" onclick="ga('send', 'event', 'Phone Leads', 'Mobile Interaction', 'Headerclicked');"
							style="color: #98e428;">1-866-492-8494</a>
					</div>
					<p style="margin: 0 0 10px;"> </p>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="topNavBar">
		<input type="hidden" id="loggedin" value="<%=Session("z2t_loggedin")%>" />
		<div class="container">
		<div class="col-lg-12">
			<nav class="navbar navbar-default">
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav">
					<li class="dropdown">
					  <a href="/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Home <span class="caret"></span></a>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="/sales-tax-service-providers">About Us</a></li>
						<li><a href="/our-commitment">Quality Pledge</a></li>
						<li><a href="/who-uses-our-services">Customers</a></li>
						<li><a href="/testimonials">Testimonials</a></li>
						<li><a href="/Website/pagesHome/z2t_sitemap.asp">Site Map</a></li>
					  </ul>
					</li>
					<li class="dropdown">
					  <a href="/sales-tax-by-state" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Tax Rates <span class="caret"></span></a>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="/sales-tax-calculator">Sales Tax Calculator</a></li>
						<li><a href="/sales-tax-by-zipcode">ZIP+4 Lookup</a></li>
						<li><a href="/sales-tax-by-zipcode">Spot-On Lookup</a></li>
						<li><a href="/calculate-sales-tax-rates">Desktop Widget</a></li>
						<li><a href="/sales-tax-by-state">Taxes by State</a></li>
						<li><a href="http://blog.zip2tax.com/category/tax-rate-changes/">Tax Rate Changes</a></li>
					  </ul>
					</li>
					<li class="dropdown mainLink">
					  <a href="/free-sales-tax-calculator" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Products <span class="caret"></span></a>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="/comparison-chart">Compare Services</a></li>
						<li><a href="/Website/pagesProducts/z2t_services_online_lookup.asp">Online Lookup</a></li>
						<li><a href="/Website/pagesProducts/z2t_services_db_connection.asp">Database Interface</a></li>
						<li><a href="/Website/pagesProducts/z2t_services_tables.asp">.CSV Tax Tables</a></li>
					  </ul>
					</li>
					<li class="dropdown mainLink">
					  <a href="/contact-us" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Support <span class="caret"></span></a>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="/frequently-asked-questions">FAQs</a></li>
						<li><a href="/developers-interface">Developers</a></li>
						<li><a href="/sample-tables">Sample Tables</a></li>
						<li><a href="/resources">Resources</a></li>
						<li><a href="/badges">Badges</a></li>
					  </ul>
					</li>
					<li class="dropdown mainLink">
					  <a href="https://blog.zip2tax.com" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Blog <span class="caret"></span></a>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="https://blog.zip2tax.com/category/tax-rate-changes/">Monthly Tax Rate Changes</a></li>
						<li><a href="https://blog.zip2tax.com/category/sales-tax-news/">Sales &amp; Use Tax News</a></li>
						<li><a href="https://blog.zip2tax.com/state-sales-tax-holidays/">Sales Tax Holidays By State</a></li>
						<li><a href="https://blog.zip2tax.com/category/z2t-company-news/">Zip2Tax Company News</a></li>
					  </ul>
					</li>
	<%
Function DisplayCompanyName()

    Dim loginBox_haAccountInfo

    DisplayCompanyName = "nbsp;"
    
	If Session("z2t_DisplayName") > "" Then
		DisplayCompanyName = Session("z2t_DisplayName")
	Else
		If Session("ha_AccountID") <> 0 Then
			Set loginBox_haAccountInfo = GetHAAccountInfo(Session("ha_AccountID"))
			DisplayCompanyName = loginBox_haAccountInfo.Organization
		End If
	End If
		
End Function
%>
<%
  If Session("z2t_loggedin") = "True" Then
%>

					<li class="dropdown">
					  <a href="/my-account" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My Account<span class="caret"></span></a>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="/account-usage">Subscriber Usage</a></li>
						<li><a href="/account-table-download">Table Download</a></li>
						<li><a href="/account-renew">Renew Online</a></li>
						<li><a href="javascript:clickLogout();">Log Out</a></li>
					  </ul>
					</li>
<%
else
%>
					<li class="dropdown">
					  <a href="#" class="dropdown-toggle login_menu" data-toggle="dropdown" role="button" aria-expanded="false">Login</a>
					</li>
<%
end if
%>
					</ul>
<%
  If Session("z2t_loggedin") = "True" Then
%>
					<div class="hidden-sm" style="float: left; margin-left: 5px;">
						<label style="padding-top: 7px; color: #FFF">Welcome<br/><% Response.Write DisplayCompanyName() %></label>
					</div>
<%
end if
%>
					<div class="hidden-sm" style="float: right; width: 310px; height: 50px; padding-top: 9px;">
						<div class="form-group">
						  	<label for="menuInputZip" class="col-md-7 control-label" style="padding: 4px 0 0; color: #EEE; font-weight: 700; font-size: 18px; text-align: right;">
						  		<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						  		Look Up the Tax
						  	</label>
						  	<div class="col-md-5" style="padding: 0 10px;">
								<input type="text" class="form-control" name="menuInputZip" id="menuInputZip" placeholder="Zip Code" maxlength="5">
						  </div>
						</div>
					</div>
				  	<ul class="nav navbar-nav navbar-right hidden-xs">


				  	</ul>
				</div>
			</nav>
		</div>
	</div>
	</div>
	</div>
	<div class="mainBody">
	<div class="clearfix"></div>
		<div class="container">
		<!--Original content-->