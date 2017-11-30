<script type="text/javascript">
	
$(document).ready(function(){
	$(".services-menu-item").click(function(){
		var link = $(this).attr("data-link");
		window.location.href = link;
	});
});
</script>
<div class="well services-menu">
		<img src="/Website/Images/services.png" alt="Services" class="center-block">
		<p><a href='/comparison-chart'><strong>Side by side comparison</strong></a><strong><br>
		<a href='/Website/Downloads/Other/PrintablePriceList.pdf' target="_blank">Printable subscription price list</a></strong></p>
		
		<div class="services-menu-item" data-link="/free-sales-tax-calculator#PageSection1">
		<p>
			<img src="/Website/Images/ServicesBox/servicesbox_1.png" style="float:left; padding:0 10px 40px 0">
			<h2 class="title">Online Lookup</h2>
			Up to five users can log in to this web site to access the ZIP code to Sales and Use Tax Calculator
		</p>
		</div>
		
		<div class="clearfix"></div>
		
		<div class="services-menu-item" data-link="/free-sales-tax-calculator#PageSection2">
		<p>
			<img src="/Website/Images/ServicesBox/servicesbox_2.png" style="float:left; padding:0 10px 40px 0">
			<h2 class="title">Database Interface</h2>
			Access real-time sales tax data instantly when you link to our SQL or MySQL servers
		</p>
		</div>
		
		<div class="clearfix"></div>

		<div class="services-menu-item" data-link="/free-sales-tax-calculator#PageSection3">
		<p>
			<img src="/Website/Images/ServicesBox/servicesbox_3.png" style="float:left; padding:0 10px 40px 0">
			<h2 class="title">Tax Tables</h2>
			Sales and Use tax data is right at your fingertips with .CSV format tables
		</p>
		</div>
	</div>