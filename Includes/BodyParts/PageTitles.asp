<%
PageTitle =  "Zip2Tax | "
PageTitle1 =  "Zip2Tax LLC"
PageDescription = ""
PageKeyWord= "" 
Canonical= ""

Select Case Session("activePage")

	Case "Home" 

		PageTitle =  "Sales Tax Calculator by State | " &  "Online Tax Software | " & PageTitle1
		PageDescription="Sales Tax Solutions for business. The Zip2Tax Sales Tax Calculator Instantly Provides Sales And Use Tax Rates For Every Jurisdiction in the U.S. and Canada."
		PageKeyWord= "Sales Tax For Zip Code, Sales and Use Tax Rates, Sales Tax Database, Sales Tax, tax calculator, tax software, Zip Code"    
		Canonical= "https://www.zip2tax.com"
		
		If instr(Request.ServerVariables("URL"),"z2t_account.asp") Then
			'Add text when calling My-Account (when not logged in) to avoid duplicate title
			PageTitle = PageTitle & " | My-Account"
			Canonical= "https://www.zip2tax.com/my-account"
		End If

	CASE "Account"
		Select Case Session("acctPage")
			CASE "Account Information"
				Canonical= "https://www.zip2tax.com/my-account"
			CASE "Subscriber Usage"
				Canonical= "https://www.zip2tax.com/account-usage"
			CASE "Tax Table Downloads"
				Canonical= "https://www.zip2tax.com/account-table-download"
			CASE "Renew Online"
				Canonical= "https://www.zip2tax.com/account-renew"
		END SELECT
	Case "About Us" 

		PageTitle = PageTitle &  "About Us"
		PageDescription="Zip2Tax provides businesses with accurate and timely sales and use tax data. We are dedicated professionals committed to providing superior services."
		PageKeyWord= "Zip2Tax, Sales and use tax rates for commerce"
		Canonical= "https://www.zip2tax.com/sales-tax-service-providers"
		
				
	Case "customer_commitment" 
	
		PageTitle = PageTitle &  "Customer Commitment"
		PageDescription="Learn how Zip2Tax is committed to providing superior service to all of our valued customers."
		PageKeyWord = "Zip2Tax, customer commitment, valued customers" 
		Canonical= "https://www.zip2tax.com/our-commitment"
	
	Case "Customers" 

		PageTitle = PageTitle &  "Customers"
		PageDescription="Zip2Tax has many clients that rely on our unbeatable data, pricing, and superior customer service."
		PageKeyWord = "Zip2Tax, customers, pricing, superior customer service" 
		Canonical= "https://www.zip2tax.com/who-uses-our-services"
		
	Case "Testimonials" 
	
		PageTitle = PageTitle &  "Customer Testimonials"		
		PageDescription="Read what many Zip2Tax customers have to say about their experience using our services."
		PageKeyWord = "Zip2Tax, testimonials, customer experience, customer service" 
		Canonical= "https://www.zip2tax.com/testimonials"
	Case "Sitemap" 
	
		PageTitle = PageTitle &  "Sitemap"		
		PageDescription="Use this handy sitemap to navigate the www.zip2tax.com site."
		PageKeyWord = "Zip2Tax, sitemap" 
		Canonical= "https://www.zip2tax.com/website/pageshome/z2t_sitemap.asp"
	Case "Lookup" 
	
		PageTitle = "Sales Tax Calculator | Sales Tax By Zipcode | " & PageTitle1		
		PageDescription="ZIP Code To Sales Tax Calculator.  Use our handy tool to calculate your sales tax instantly."
		PageKeyWord = "Zip2Tax, lookup, sales tax calculator, taxes 2017, tax estimator, tax calculator, sales tax, Zip Code" 
		Canonical= "https://www.zip2tax.com/sales-tax-calculator"
	Case "Spot-On&trade; Lookup" 
	
		PageTitle = "Sales Tax Calculator | Sales Tax Rate by State | "	& PageTitle1	
		PageDescription="Lookup Sales And Use Tax Rates For Every U.S. Jurisdiction, Plus A Sales Tax Calculator."
		PageKeyWord = "Zip2Tax, Spot-On&trade; lookup, sales tax for U.S., jurisdiction, taxes 2017, tax estimator, tax calculator, sales tax, Spot-on" 
		Canonical= "https://www.zip2tax.com/sales-tax-by-zipcode"
	Case "widget" 
	
		PageTitle = "Desktop Application | Sales Tax by Zipcode"	
		PageDescription="Zip Code To Sales Tax Calculator Desktop Application.  Use our handy tool to calculate your sales tax instantly without keeping a web browser open."
		PageKeyWord = "Zip2Tax, tax widget, sales tax calculator, sales tax calculator software, sales tax, tax calculator, tax estimator, tax software, car tax calculator, desktop app" 
		Canonical= "https://www.zip2tax.com/desktop-application"
	Case "Tax rate level availability"
	
		PageTitle = "How to Calculate Sales Tax | "  & PageTitle1
		PageDescription="Explaination of subscription levels to help you match the right service to your needs."
		PageKeyWord = "Zip2Tax, Tax rate level, Tax rate availability, Tax rate subscriptions" 
		Canonical= "https://www.zip2tax.com/how-to-calculate-sales-tax"
		
	Case "Tax Rates" 
		PageTitle = "Sales Tax by State | Sales Tax Rate By Zipcode | " & PageTitle1		
		PageDescription="Quickly find sales tax by state and use our free tax calculator."
		PageKeyWord = "Zip2Tax, sales tax by county,sales tax for,sales tax calculator,state sales tax rate, state sales tax rates,sales tax rate,what is the sales tax for,what is the sales tax in,tax for zip code, county sales tax,sales tax table,sales tax rates by,sales tax amount,sales tax rates for,sales tax zip code, local tax rates,local sales tax rates,sales tax charts,sale tax rate by zip code,how much is the sales tax, sales tax lookup,sales tax by city,sales tax rates by,sales tax rates by zip code"
		Canonical= "https://www.zip2tax.com/sales-tax-by-state"
		
	Case "Canadian Tax Rates" 
		PageTitle = "Sales Tax by Province | Sales Tax Rate By Provincal Code | " & PageTitle1		
		PageDescription="Quickly find sales tax by province and use our free tax calculator."
		PageKeyWord = "Zip2Tax, sales tax by province"
		Canonical= "https://www.zip2tax.com/canada-sales-tax"
		
	Case "Comparison Chart" 
	
		PageTitle = PageTitle &  "Compare Zip2Tax Services Side By Side"		
		PageDescription="A side-by-side comparison chart of the different services available, including Online Lookups, Database Interface, and .CSV tables."
		PageKeyWord = "Zip2Tax, comparison chart, compare tax products, online tax lookups, tax database interface, tax .CSV tables" 
		Canonical= "https://www.zip2tax.com/comparison-chart"
	Case "Services" 
		'There are so many Services for active page
		PageTitle = "Sales Tax Rates | " & PageTitle1		
		PageDescription="Zip2Tax services include manual Online Lookups, automated Database Interface, and downloadable .CSV Tax Tables. Learn more."
		PageKeyWord = "Zip2Tax, Services and Prices, online tax lookups, tax database interface, tax .CSV tables" 
		If Session("currentPage") = "z2t_services.asp" Then
			Canonical= "https://www.zip2tax.com/free-sales-tax-calculator"
		End If
	Case "Database Connections Information"
	
		PageTitle = "Sales Tax API | Database Connections"
		PageDescription = "Zip2Tax&rsquo;s sales tax API will easily integrate with your system allowing you to not worry about Sales Tax. Learn more."
		PageKeyWord = "Zip2Tax, Services and Prices, tax database interface, sales tax calculator, tax calculator, sales tax, taxes 2017, tax estimator, Spot-On, Zip Code, tax software, sales tax api"
		Canonical= "https://www.zip2tax.com/sales-tax-api"
	Case "Online Lookup Information"
	
		PageTitle = "Sales Tax Lookup | Online Sales Tax"
		PageDescription = "Zip2Tax provides a simple solution to sales tax lookup available right in your browser. Learn more."
		PageKeyWord = "Zip2Tax, Services and Prices, online tax lookups, sales tax calculator, tax calculator, sales tax, taxes 2017, sales tax lookup, Spot-On, Zip Code"
		Canonical= "https://www.zip2tax.com/sales-tax-lookup"
	Case ".CSV Table Information"
	
		PageTitle = "Sales Tax Tables &amp; Use Tax Tables | .CSV Tables"
		PageDescription = "Zip2Tax has a variety of Sales Tax Tables &amp; Use Tax Tables suited for your many needs. Learn more."
		PageKeyWord = "Zip2Tax, Services and Prices, tax .CSV tables, sales tax tables, use tax tables"
		Canonical= "https://www.zip2tax.com/sales-tax-tables"
	Case "faq" 
	
		PageTitle = PageTitle &  "faq - Answers to Sales and Use Tax Questions"		
		PageDescription="Sales and use tax can be hard to get right. Zip2Tax answers some of the most frequently asked questions."
		PageKeyWord = "Zip2Tax, Tax faq, sales tax, zip code, tax rates" 
		Canonical= "https://www.zip2tax.com/frequently-asked-questions"
	Case "contact us" 
	
		PageTitle = PageTitle &  "Contact Information"
		PageDescription="Sales and use tax can be hard. Contact Zip2Tax and get help with your Sales and Use Tax problems."
		PageKeyWord = "sales tax, zip code, tax rates, sales tax database"
		Canonical= "https://www.zip2tax.com/contact-us"
	Case "Badge"
	
		PageTitle = PageTitle &  "Badges"
		PageDescription="Some simple badges available to show you can be confident in your sales tax rates."
		PageKeyWord = "badge, zip2tax, social media"
		Canonical= "https://www.zip2tax.com/badges"
	Case "Compatible" 
	
		PageTitle = PageTitle &  ".CSV Tax Table Formats"		
		PageDescription="Find out which .CSV table format will work best for you risk free. Download a sample table now or read the table layout information."
		PageKeyWord = "Zip2Tax, .CSV tax files, sales tax, zip code, tax rates" 		
		Canonical= "https://www.zip2tax.com/sample-tables"
	Case "resources" 
	
		PageTitle = PageTitle &  "Recommended Business Resources"		
		PageDescription="Recommended sales tax and eCommerce professionals to help your business."
		PageKeyWord = "Zip2Tax, tax resources, sales tax, zip code, tax rates, eCommerce professionals"
		Canonical= "https://www.zip2tax.com/resources"

	Case "Developers" 
	
		PageTitle = PageTitle &  "Developer Information | " & Session("devPage")	
		PageDescription="Database Interface API code in " & Session("devPage") & " for developers integrating sales tax with web sites, eCommerce or ERP databases."
		PageKeyWord = "Zip2Tax, developers, tax interface API, sales tax API, zip code API, tax rates API integration, eCommerce ERP database" 
		Canonical= "https://www.zip2tax.com/developers-interface"

	Case "EULA"
		
		PageTitle = PageTitle & "EULA"
		PageDescription = "Zip2Tax end user license agreement for our Sales and Use Tax products"
		PageKeyWord = "Zip2Tax, EULA"
		Canonical= "https://www.zip2tax.com/Website/pagesExtra/z2t_eula.asp"
	Case "Privacy"
	
		PageTitle = PageTitle & "Privacy Policy"
		PageDescription = "Zip2Tax privacy policy for our Sales and Use Tax product"
		PageKeyWord = "Zip2Tax, Privacy Policy"
		' Canonical= "www.zip2tax.com/Website/pagesExtra/Errors/500/z2t_500_error_create.asp"
		Canonical= "www.zip2tax.com/Website/pagesExtra/z2t_privacypolicy.asp"

	Case "Redistribution Agreement"
		PageTitle = PageTitle & "Redistribution Agreement"
		PageDescription = "Zip2Tax Redistribution Agreement for our Sales and Use Tax product"
		PageKeyWord = "Zip2Tax, Redistribution Agreement"
		Canonical= "www.zip2tax.com/Website/pagesExtra/z2t_redistribution_agreement.asp"
	Case "Specialty Tables - Evolution"
		PageTitle = "Evolution | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Evolution"
		PageKeyWord = "Zip2Tax, Evolution"
		Canonical= "/evolution"
	Case "Specialty Tables - Fleapay"
		PageTitle = "Fleapay | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Fleapay"
		PageKeyWord = "Zip2Tax, Fleapay"
		Canonical= "/fleapay"
	Case "Specialty Tables - Kamp-Data"
		PageTitle = "Kamp-Data | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Kamp-Data"
		PageKeyWord = "Zip2Tax, Kamp-Data"
		Canonical= "/kamp-data"
	Case "Specialty Tables - Cirkuit"
		PageTitle = "Cirkuit Commerce | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Cirkuit Commerce"
		PageKeyWord = "Zip2Tax, Cirkuit Commerce"
		Canonical= "/cirkuit-commerce"
	Case "Specialty Tables - Chargeover"
		PageTitle = "Chargeover | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Chargeover"
		PageKeyWord = "Zip2Tax, Chargeover"
		Canonical= "/chargeover"
	Case "Specialty Tables - Ultracart"
		PageTitle = "Ultracart | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Ultracart"
		PageKeyWord = "Zip2Tax, Ultracart"
		Canonical= "/ultracart"
	Case "Specialty Tables - Volusion"
		PageTitle = "Volusion | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Volusion"
		PageKeyWord = "Zip2Tax, Volusion"
		Canonical= "/volusion"
	Case "Specialty Tables - Magento Newer Version"
		PageTitle = "Magento v1.7.2 | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Magento v1.7.2 and above"
		PageKeyWord = "Zip2Tax, Magento"
		Canonical= "/magento-enterprise"
	Case "Specialty Tables - Magento Older Version"
		PageTitle = "Magento v1.7.1 | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Magento v1.7.1 and older"
		PageKeyWord = "Zip2Tax, Magento"
		Canonical= "/magento-enterprise-older"
	Case "Specialty Tables - Oracle"
		PageTitle = "Oracle | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Oracle"
		PageKeyWord = "Zip2Tax, Oracle"
		Canonical= "www.zip2tax.com/Website/pagesProducts/z2t_specialty_tables_oracle.asp"
	Case "Specialty Tables - NY Clothing"
		PageTitle = "NY Clothing | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are unique to specific tax rulings including NY clothing"
		PageKeyWord = "Zip2Tax, NY Clothing"
		Canonical= "www.zip2tax.com/Website/pagesProducts/z2t_specialty_tables_ny_clothing.asp"
	Case "Specialty Tables - Sedona"
		PageTitle = "Sedona | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Sedona"
		PageKeyWord = "Zip2Tax, Sedona"
		Canonical= "/sedona-office"
	Case "Compatibility - Tradepoint"
		PageTitle = "Tradepoint | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Tradepoint"
		PageKeyWord = "Zip2Tax, Tradepoint"
		Canonical= "/tradepoint-enterprise"
	Case "Compatibility - Smith Cart"
		PageTitle = "Smith Cart | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Smith Cart"
		PageKeyWord = "Zip2Tax, Smith Cart"
		Canonical= "/smith-cart"
	Case "Compatibility - Upshot"
		PageTitle = "Upshot | " & PageTitle1
		PageDescription = "Zip2Tax delivers specialty tables that are compatible with many systems including Upshot"
		PageKeyWord = "Zip2Tax, Upshot"
		Canonical= "www.zip2tax.com/upshot-commerce"
	Case Else
		PageTitle = ""
		PageDescription = ""
		PageKeyWord = ""
		
END SELECT

if instr(lcase(request.servervariables("script_name")),"/us/states/")>0 or instr(lcase(request.servervariables("script_name")),"states.asp")>0 or instr(lcase(request.servervariables("script_name")),"/canada/provinces/")>0 or instr(lcase(request.servervariables("script_name")),"provinces.asp")>0 then
	PageTitle = statePageTitle 
	PageDescription = statePageDescription
	PageKeyWord = statePageKeyWord & ", sales tax calculator, tax calculator, sales tax, taxes 2017, tax estimator, Zip Code"
	Select Case Statefullname
		' US States
		Case "Alabama"
			Canonical = "https://www.zip2tax.com/al/alabama-sales-tax"
		CASE "Alaska"
			Canonical = "https://www.zip2tax.com/ak/alaska-sales-tax"
		CASE "Arizona"
			Canonical = "https://www.zip2tax.com/az/arizona-sales-tax"
		CASE "Arkansas"
			Canonical = "https://www.zip2tax.com/ar/arkansas-sales-tax"
		CASE "California"
			Canonical = "https://www.zip2tax.com/ca/california-sales-tax"
		CASE "Colorado"
			Canonical = "https://www.zip2tax.com/co/colorado-sales-tax"
		CASE "Connecticut"
			Canonical = "https://www.zip2tax.com/ct/connecticut-sales-tax"
		CASE "Delaware"
			Canonical = "https://www.zip2tax.com/de/delaware-sales-tax"
		CASE "District of Columbia"
			Canonical = "https://www.zip2tax.com/dc/district-of-columbia-sales-tax"
		CASE "Florida"
			Canonical = "https://www.zip2tax.com/fl/florida-sales-tax"
		CASE "Georgia"
			Canonical = "https://www.zip2tax.com/ga/georgia-sales-tax"
		CASE "Hawaii"
			Canonical = "https://www.zip2tax.com/hi/hawaii-sales-tax"
		CASE "Idaho"
			Canonical = "https://www.zip2tax.com/id/idaho-sales-tax"
		CASE "Illinois"
			Canonical = "https://www.zip2tax.com/il/illinois-sales-tax"
		CASE "Indiana"
			Canonical = "https://www.zip2tax.com/in/indiana-sales-tax"
		CASE "Iowa"
			Canonical = "https://www.zip2tax.com/ia/iowa-sales-tax"
		CASE "Kansas"
			Canonical = "https://www.zip2tax.com/ks/kansas-sales-tax"
		CASE "Kentucky"
			Canonical = "https://www.zip2tax.com/ky/kentucky-sales-tax"
		CASE "Louisiana"
			Canonical = "https://www.zip2tax.com/la/louisiana-sales-tax"
		CASE "Maine"
			Canonical = "https://www.zip2tax.com/me/maine-sales-tax"
		CASE "Maryland"
			Canonical = "https://www.zip2tax.com/md/maryland-sales-tax"
		CASE "Massachusetts"
			Canonical = "https://www.zip2tax.com/ma/massachusetts-sales-tax"
		CASE "Michigan"
			Canonical = "https://www.zip2tax.com/mi/michigan-sales-tax"
		CASE "Minnesota"
			Canonical = "https://www.zip2tax.com/mn/minnesota-sales-tax"
		CASE "Mississippi"
			Canonical = "https://www.zip2tax.com/ms/mississippi-sales-tax"
		CASE "Missouri"
			Canonical = "https://www.zip2tax.com/mo/missouri-sales-tax"
		CASE "Montana"
			Canonical = "https://www.zip2tax.com/mt/montana-sales-tax"
		CASE "Nebraska"
			Canonical = "https://www.zip2tax.com/ne/nebraska-sales-tax"
		CASE "Nevada"
			Canonical = "https://www.zip2tax.com/nv/nevada-sales-tax"
		CASE "New Hampshire"
			Canonical = "https://www.zip2tax.com/nh/new-hampshire-sales-tax"
		CASE "New Jersey"
			Canonical = "https://www.zip2tax.com/nj/new-jersey-sales-tax"
		CASE "New Mexico"
			Canonical = "https://www.zip2tax.com/nm/new-mexico-sales-tax"
		CASE "New York"
			Canonical = "https://www.zip2tax.com/ny/new-york-sales-tax"
		CASE "North Carolina"
			Canonical = "https://www.zip2tax.com/nc/north-carolina-sales-tax"
		CASE "North Dakota"
			Canonical = "https://www.zip2tax.com/nd/north-dakota-sales-tax"
		CASE "Ohio"
			Canonical = "https://www.zip2tax.com/oh/ohio-sales-tax"
		CASE "Oklahoma"
			Canonical = "https://www.zip2tax.com/ok/oklahoma-sales-tax"
		CASE "Oregon"
			Canonical = "https://www.zip2tax.com/or/oregon-sales-tax"
		CASE "Pennsylvania"
			Canonical = "https://www.zip2tax.com/pa/pennsylvania-sales-tax"
		CASE "Rhode Island"
			Canonical = "https://www.zip2tax.com/ri/rhode-island-sales-tax"
		CASE "South Carolina"
			Canonical = "https://www.zip2tax.com/sc/south-carolina-sales-tax"
		CASE "South Dakota"
			Canonical = "https://www.zip2tax.com/sd/south-dakota-sales-tax"
		CASE "Tennessee"
			Canonical = "https://www.zip2tax.com/tn/tennessee-sales-tax"
		CASE "Texas"
			Canonical = "https://www.zip2tax.com/tx/texas-sales-tax"
		CASE "Utah"
			Canonical = "https://www.zip2tax.com/ut/utah-sales-tax"
		CASE "Vermont"
			Canonical = "https://www.zip2tax.com/vt/vermont-sales-tax"
		CASE "Virginia"
			Canonical = "https://www.zip2tax.com/va/virginia-sales-tax"
		CASE "Washington"
			Canonical = "https://www.zip2tax.com/wa/washington-sales-tax"
		CASE "West Virginia"
			Canonical = "https://www.zip2tax.com/wv/west-virginia-sales-tax"
		CASE "Wisconsin"
			Canonical = "https://www.zip2tax.com/wi/wisconsin-sales-tax"
		CASE "Wyoming"
			Canonical = "https://www.zip2tax.com/wy/wyoming-sales-tax"

		' Canada States
		Case "Alberta"
			Canonical = "https://www.zip2tax.com/alberta-sales-tax"
		Case "British Columbia"
			Canonical = "https://www.zip2tax.com/british-columbia-sales-tax"
		Case "Manitoba"
			Canonical = "https://www.zip2tax.com/manitoba-sales-tax"
		Case "New Brunswick"
			Canonical = "https://www.zip2tax.com/new-brunswick-sales-tax"
		Case "Newfoundland Labrador"
			Canonical = "https://www.zip2tax.com/newfoundland-labrador-sales-tax"
		Case "Northwest Territories"
			Canonical = "https://www.zip2tax.com/northwest-territories-sales-tax"
		Case "Nova Scotia"
			Canonical = "https://www.zip2tax.com/nova-scotia-sales-tax"
		Case "Nunavut"
			Canonical = "https://www.zip2tax.com/nunavut-sales-tax"
		Case "Ontario"
			Canonical = "https://www.zip2tax.com/ontario-sales-tax"
		Case "Prince Edward Island"
			Canonical = "https://www.zip2tax.com/prince-edward-island-sales-tax"
		Case "Quebec"
			Canonical = "https://www.zip2tax.com/quebec-sales-tax"
		Case "Saskatchewan"
			Canonical = "https://www.zip2tax.com/saskatchewan-sales-tax"
		Case "Yukon"
			Canonical = "https://www.zip2tax.com/yukon-sales-tax"
		Case Else
			Canonical = ""
	END SELECT
end if

%>
