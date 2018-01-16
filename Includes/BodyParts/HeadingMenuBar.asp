<!-- Start of HeadingMenuBar -->
	  <div class="row" id="topNavBar" style="margin: 0 -15px;">
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
<!-- End of HeadingMenuBar -->
