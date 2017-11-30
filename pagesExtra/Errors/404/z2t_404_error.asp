<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

 <%
  Session("activePage") = "404 Error"
  Session("currentPage") = "z2t_404_error.asp"

  ' Uses a recordset of delimeter-separated strings to produce a collection indexed by the first column
  Function UseTable(TableStrings, delimiter, columns)
    Dim table: Set table = Server.CreateObject("Scripting.Dictionary")
    Do While Not TableStrings.eof
      Dim tuple: tuple = Split(TableStrings("value"), delimiter)
      Call table.Add(tuple(0), Server.CreateObject("Scripting.Dictionary"))
      Dim column: For column = 0 to Ubound(tuple)
        Call table(tuple(0)).Add(columns(column), tuple(column))
      Next
      TableStrings.MoveNext()
    Loop
    Set UseTable = table
  End Function

  Dim strings: Set strings = Server.CreateObject("ADODB.Recordset")
  
  ' Since ASP-classic has neither lists nor usable arrays, use a ADODB.Resultset
  Function StartList()
    Dim list: Set list = Server.CreateObject("ADODB.Recordset")
    list.CursorLocation = 3
    'list.Fields.Append "id", 12 'adVariant
    list.Fields.Append "value", 12 'adVariant
    list.Open
    Set StartList = list
  End Function

  
  Function add(rs, value)
    If typename(value) = "Variant()" Then
      Dim item: For Each item in value
        rs.AddNew
        rs(0) = item
      Next
    Else 
      rs.AddNew
      rs(0) = value
    End If
    rs.MoveFirst
    Set add = rs
  End Function


  ''''' Redirected links
  Dim redirect: Set redirect = StartList()

  ' Lookup links
  Call add(redirect, "/Support/z2t_report_issue.asp;/Website/pagesSupport/z2t_report_issue.asp")
  Call add(redirect, "/lookup;/sales-tax-by-zipcode")
  Call add(redirect, "/z2t_lookup.asp;/sales-tax-by-zipcode")
  Call add(redirect, "/online-lookups/z2t_lookups.asp;/sales-tax-by-zipcode")
  Call add(redirect, "/z2t  lookup.asp;/sales-tax-by-zipcode")
  Call add(redirect, "/Z2T_LOOKUP.ASP;/sales-tax-by-zipcode")
  

  Call add(redirect, "/Website/pagesCountries/US/States/District-of-Columbia-State-Rates/index.html;/DC/district-of-columbia-sales-tax")
  Call add(redirect, "/z2t_aboutus.asp;/sales-tax-service-providers")
  Call add(redirect, "/state/United-States-Sales-Tax/index.html;/sales-tax-by-state")
		
  Call add(redirect, "/account/z2t_account.asp;/my-account")
  Call add(redirect, "/account/z2t_services.asp;/my-account")
		
  Call add(redirect, "/includes/EnterCode.asp;/Website/Includes/BodyParts/PopUps/EnterCode.asp")
		
  Call add(redirect, "/Inbound/z2t_signup.asp;/Website/Inbound/z2t_signup.asp")
  Call add(redirect, "/Inbound/z2t_newsletter.asp;/Website/Inbound/z2t_newsletter.asp")
		
  Call add(redirect, "/z2t_faq.asp;/frequently-asked-questions")
		
  Call add(redirect, "/free/CartAdOns/z2t_table_formats.asp;/sample-tables")
  Call add(redirect, "/Free/CartAdOns/z2t_services_online_cart.asp;/Website/pagesProducts/Offers/Free/Cart/z2t_services_online_cart.asp")
  Call add(redirect, "/Free/CartAdOns/z2t_services_table_cart.asp;/Website/pagesProducts/Offers/Free/Cart/z2t_services_table_cart.asp")
  Call add(redirect, "/free/CartAdOns/z2t_table_special.asp;/Website/pagesProducts/Offers/Free/Cart/z2t_services_table_cart.asp")
  Call add(redirect, "/free;/Website/pagesProducts/Offers/Free/z2t_services_free.asp")
  Call add(redirect, "/Free;/Website/pagesProducts/Offers/Free/z2t_services_free.asp")
  Call add(redirect, "/free/;/Website/pagesProducts/Offers/Free/z2t_services_free.asp")
		
  Call add(redirect, "/z2t_contact.asp;/contact-us")
  Call add(redirect, "/services/z2t_widget.asp;/calculate-sales-tax-rates")
  Call add(redirect, "/z2t_eula.asp;/Website/pagesExtra/z2t_eula.asp")
  Call add(redirect, "/Website/pagesCountries/US/States/United-States-Sales-Tax/index.html;/sales-tax-by-state")
		
  ' developers
  Call add(redirect, "/developers/z2t_developers.asp;/developers-interface")
  Call add(redirect, "/developers/z2t_developers_ZIPcode.asp;/developers-api-zipcode")
  Call add(redirect, "/developers/z2t_developers_API.asp;/developers-api")
  Call add(redirect, "/developers/z2t_developers_ZIP+4.asp;/developers-api-zip-plus-4")
  Call add(redirect, "/developers/z2t_developers_RequestVariables.asp;/developers-passing-variables")
  Call add(redirect, "/developers/z2t_developers_TableDownload_HTTP.asp;/developers-table-download")
  Call add(redirect, "/developers/z2t_developers_DirectConnect.asp;/Website/pagesSupport/pagesDev/z2t_developers_DirectConnect.asp")
  Call add(redirect, "/developers/z2t_developers_MySQL.asp;/Website/pagesSupport/pagesDev/z2t_developers_example.asp")
  Call add(redirect, "/developers/z2t_developers_QuickLink.asp;/developers-quick-link")
	
  ' resources
  Call add(redirect, "/resources/z2t_resources.asp;/resources")
  Call add(redirect, "/resources/z2t_badges.asp;/badges")
  Call add(redirect, "/resources/z2t_resources_shopping.asp;/resources")
  Call add(redirect, "/resources/z2t_resources_shipping.asp;/resources")
  Call add(redirect, "/resources/ResSub/Res_CPA_StatesSalesTax.asp;/resources")
  Call add(redirect, "/Resources_shopping.asp;/resources")
  Call add(redirect, "/Resources_ecommerce.asp;resources")			
		
  Call add(redirect, "/z2t_database_link.asp;/developers-api-zipcode")

  ' downloads
  Call add(redirect, "/downloads/use_tax_by_state.pdf;/Website/Downloads/Sample_Tables/Use_tax_by_state.pdf")
  Call add(redirect, "/downloads/2012_07_ZIPcode_Changes.pdf;/Website/Downloads/ZIP_code_change/2012_07_ZIPcode_Changes.pdf")
  Call add(redirect, "/downloads/Zip2TaxNYClothingTableDescription.pdf;/Website/Downloads/Sample_Tables/Zip2TaxNYClothingTableDescription.pdf")
  Call add(redirect, "/downloads/Zip2TaxUniqueZipsTableLayoutInformation.pdf;/Website/Downloads/Sample_Tables/Zip2TaxUniqueZipsTableLayoutInformation.pdf")
  Call add(redirect, "/downloads/ZIP_code_change/2013_03_ZIPcodeChanges.pdf;/Website/Downloads/ZIP_code_change/2013_03_ZIPcodeChanges.pdf")
		
  ' 50 state pages
  Call add(redirect, "/State/Alabama-State-Rates/index.html;/AL/alabama-sales-tax")
  Call add(redirect, "/State/Alaska-State-Rates/index.html;/AK/alaska-sales-tax")
  Call add(redirect, "/State/Arizona-State-Rates/index.html;/AZ/arizona-sales-tax")
  Call add(redirect, "/State/Arkansas-State-Rates/index.html;/AR/arkansas-sales-tax")
  Call add(redirect, "/State/California-State-Rates/index.html;/CA/california-sales-tax")
  Call add(redirect, "/State/Colorado-State-Rates/index.html;/CO/colorado-sales-tax")
  Call add(redirect, "/State/Columbia-State-Rates/index.html;/DC/district-of-columbia-sales-tax")
  Call add(redirect, "/State/Connecticut-State-Rates/index.html;/CT/connecticut-sales-tax")
  Call add(redirect, "/State/Delaware-State-Rates/index.html;/DE/delaware-sales-tax")
  Call add(redirect, "/State/Florida-State-Rates/index.html;/FL/florida-sales-tax")
  Call add(redirect, "/State/Georgia-State-Rates/index.html;/GA/georgia-sales-tax")
  Call add(redirect, "/State/Hawaii-State-Rates/index.html;/HI/hawaii-sales-tax")
  Call add(redirect, "/State/Idaho-State-Rates/index.html;/ID/idaho-sales-tax")
  Call add(redirect, "/State/Illinois-State-Rates/index.html;/IL/illinois-sales-tax")
  Call add(redirect, "/State/Indiana-State-Rates/index.html;/IN/indiana-sales-tax")
  Call add(redirect, "/State/Iowa-State-Rates/index.html;/IA/iowa-sales-tax")
  Call add(redirect, "/State/Kansas-State-Rates/index.html;/KS/kansas-sales-tax")
  Call add(redirect, "/State/Kentucky-State-Rates/index.html;/KY/kentucky-sales-tax")
  Call add(redirect, "/State/Louisiana-State-Rates/index.html;/LA/louisiana-sales-tax")
  Call add(redirect, "/State/Maine-State-Rates/index.html;/ME/maine-sales-tax")
  Call add(redirect, "/State/Maryland-State-Rates/index.html;/MD/maryland-sales-tax")
  Call add(redirect, "/State/Massachusetts-State-Rates/index.html;/MA/massachusetts-sales-tax")
  Call add(redirect, "/State/Michigan-State-Rates/index.html;/MI/michigan-sales-tax")
  Call add(redirect, "/State/Minnesota-State-Rates/index.html;/MN/minnesota-sales-tax")
  Call add(redirect, "/State/Mississippi-State-Rates/index.html;/MS/mississippi-sales-tax")
  Call add(redirect, "/State/Missouri-State-Rates/index.html;/MO/missouri-sales-tax")
  Call add(redirect, "/State/Montana-State-Rates/index.html;/MT/montana-sales-tax")
  Call add(redirect, "/State/Nebraska-State-Rates/index.html;/NE/nebraska-sales-tax")
  Call add(redirect, "/State/Nevada-State-Rates/index.html;/NV/nevada-sales-tax")
  Call add(redirect, "/State/New-Hampshire-State-Rates/index.html;/NH/new-hampshire-sales-tax")
  Call add(redirect, "/State/New-Jersey-State-Rates/index.html;/NJ/new-jersey-sales-tax")
  Call add(redirect, "/State/New-Mexico-State-Rates/index.html;/NM/new-mexico-sales-tax")
  Call add(redirect, "/State/New-York-State-Rates/index.html;/NY/new-york-sales-tax")
  Call add(redirect, "/State/North-Carolina-State-Rates/index.html;/NC/north-carolina-sales-tax")
  Call add(redirect, "/State/North-Dakota-State-Rates/index.html;/ND/north-dakota-sales-tax")
  Call add(redirect, "/State/Ohio-State-Rates/index.html;/OH/ohio-sales-tax")
  Call add(redirect, "/State/Oklahoma-State-Rates/index.html;/OK/oklahoma-sales-tax")
  Call add(redirect, "/State/Oregon-State-Rates/index.html;/OR/oregon-sales-tax")
  Call add(redirect, "/State/Pennsylvania-State-Rates/index.html;/PA/pennsylvania-sales-tax")
  Call add(redirect, "/State/Rhode-Island-State-Rates/index.html;/RI/rhode-island-sales-tax")
  Call add(redirect, "/State/South-Carolina-State-Rates/index.html;/SC/south-carolina-sales-tax")
  Call add(redirect, "/State/South-Dakota-State-Rates/index.html;/SD/south-dakota-sales-tax")
  Call add(redirect, "/State/Tennessee-State-Rates/index.html;/TN/tennessee-sales-tax")
  Call add(redirect, "/State/Texas-State-Rates/index.html;/TX/texas-sales-tax")
  Call add(redirect, "/State/Utah-State-Rates/index.html;/UT/utah-sales-tax")
  Call add(redirect, "/State/Vermont-State-Rates/index.html;/VT/vermont-sales-tax")
  Call add(redirect, "/State/Virginia-State-Rates/index.html;/VA/virginia-sales-tax")
  Call add(redirect, "/State/Washington-State-Rates/index.html;/WA/washington-sales-tax")
  Call add(redirect, "/State/West-Virginia-State-Rates/index.html;/WV/west-virginia-sales-tax")
  Call add(redirect, "/State/Wisconsin-State-Rates/index.html;/WI/wisconsin-sales-tax")
  Call add(redirect, "/State/Wyoming-State-Rates/index.html;/WY/wyoming-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/;/sales-tax-by-state")
  Call add(redirect, "/state/United-States-Sales-Tax/;/sales-tax-by-state")
  Call add(redirect, "/state/New-York-state-rates/index.html;/NY/new-york-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/United-States-Sales-Tax/Website/pagesSupport/z2t_faq.asp;/frequently-asked-questions#states")
  Call add(redirect, "/Website/pagesCountries/US/States/eta_default.cfm;/sales-tax-by-state")


  Call add(redirect, "/State/Alabama-State-Rates/index.asp;/AL/alabama-sales-tax")
  Call add(redirect, "/State/Alaska-State-Rates/index.asp;/AK/alaska-sales-tax")
  Call add(redirect, "/State/Arizona-State-Rates/index.asp;/AZ/arizona-sales-tax")
  Call add(redirect, "/State/Arkansas-State-Rates/index.asp;/AR/arkansas-sales-tax")
  Call add(redirect, "/State/California-State-Rates/index.asp;/CA/california-sales-tax")
  Call add(redirect, "/State/Colorado-State-Rates/index.asp;/CO/colorado-sales-tax")
  Call add(redirect, "/State/Columbia-State-Rates/index.asp;/DC/district-of-columbia-sales-tax")
  Call add(redirect, "/State/Connecticut-State-Rates/index.asp;/CT/connecticut-sales-tax")
  Call add(redirect, "/State/Delaware-State-Rates/index.asp;/DE/delaware-sales-tax")
  Call add(redirect, "/State/Florida-State-Rates/index.asp;/FL/florida-sales-tax")
  Call add(redirect, "/State/Georgia-State-Rates/index.asp;/GA/georgia-sales-tax")
  Call add(redirect, "/State/Hawaii-State-Rates/index.asp;/HI/hawaii-sales-tax")
  Call add(redirect, "/State/Idaho-State-Rates/index.asp;/ID/idaho-sales-tax")
  Call add(redirect, "/State/Illinois-State-Rates/index.asp;/IL/illinois-sales-tax")
  Call add(redirect, "/State/Indiana-State-Rates/index.asp;/IN/indiana-sales-tax")
  Call add(redirect, "/State/Iowa-State-Rates/index.asp;/IA/iowa-sales-tax")
  Call add(redirect, "/State/Kansas-State-Rates/index.asp;/KS/kansas-sales-tax")
  Call add(redirect, "/State/Kentucky-State-Rates/index.asp;/KY/kentucky-sales-tax")
  Call add(redirect, "/State/Louisiana-State-Rates/index.asp;/LA/louisiana-sales-tax")
  Call add(redirect, "/State/Maine-State-Rates/index.asp;/ME/maine-sales-tax")
  Call add(redirect, "/State/Maryland-State-Rates/index.asp;/MD/maryland-sales-tax")
  Call add(redirect, "/State/Massachusetts-State-Rates/index.asp;/MA/massachusetts-sales-tax")
  Call add(redirect, "/State/Michigan-State-Rates/index.asp;/MI/michigan-sales-tax")
  Call add(redirect, "/State/Minnesota-State-Rates/index.asp;/MN/minnesota-sales-tax")
  Call add(redirect, "/State/Mississippi-State-Rates/index.asp;/MS/mississippi-sales-tax")
  Call add(redirect, "/State/Missouri-State-Rates/index.asp;/MO/missouri-sales-tax")
  Call add(redirect, "/State/Montana-State-Rates/index.asp;/MT/montana-sales-tax")
  Call add(redirect, "/State/Nebraska-State-Rates/index.asp;/NE/nebraska-sales-tax")
  Call add(redirect, "/State/Nevada-State-Rates/index.asp;/NV/nevada-sales-tax")
  Call add(redirect, "/State/New-Hampshire-State-Rates/index.asp;/NH/new-hampshire-sales-tax")
  Call add(redirect, "/State/New-Jersey-State-Rates/index.asp;/NJ/new-jersey-sales-tax")
  Call add(redirect, "/State/New-Mexico-State-Rates/index.asp;/NM/new-mexico-sales-tax")
  Call add(redirect, "/State/New-York-State-Rates/index.asp;/NY/new-york-sales-tax")
  Call add(redirect, "/State/North-Carolina-State-Rates/index.asp;/NC/north-carolina-sales-tax")
  Call add(redirect, "/State/North-Dakota-State-Rates/index.asp;/ND/north-dakota-sales-tax")
  Call add(redirect, "/State/Ohio-State-Rates/index.asp;/OH/ohio-sales-tax")
  Call add(redirect, "/State/Oklahoma-State-Rates/index.asp;/OK/oklahoma-sales-tax")
  Call add(redirect, "/State/Oregon-State-Rates/index.asp;/OR/oregon-sales-tax")
  Call add(redirect, "/State/Pennsylvania-State-Rates/index.asp;/PA/pennsylvania-sales-tax")
  Call add(redirect, "/State/Rhode-Island-State-Rates/index.asp;/RI/rhode-island-sales-tax")
  Call add(redirect, "/State/South-Carolina-State-Rates/index.asp;/SC/south-carolina-sales-tax")
  Call add(redirect, "/State/South-Dakota-State-Rates/index.asp;/SD/south-dakota-sales-tax")
  Call add(redirect, "/State/Tennessee-State-Rates/index.asp;/TN/tennessee-sales-tax")
  Call add(redirect, "/State/Texas-State-Rates/index.asp;/TX/texas-sales-tax")
  Call add(redirect, "/State/Utah-State-Rates/index.asp;/UT/utah-sales-tax")
  Call add(redirect, "/State/Vermont-State-Rates/index.asp;/VT/vermont-sales-tax")
  Call add(redirect, "/State/Virginia-State-Rates/index.asp;/VA/virginia-sales-tax")
  Call add(redirect, "/State/Washington-State-Rates/index.asp;/WA/washington-sales-tax")
  Call add(redirect, "/State/West-Virginia-State-Rates/index.asp;/WV/west-virginia-sales-tax")
  Call add(redirect, "/State/Wisconsin-State-Rates/index.asp;/WI/wisconsin-sales-tax")
  Call add(redirect, "/State/Wyoming-State-Rates/index.asp;/WY/wyoming-sales-tax")
  Call add(redirect, "/state/New-York-state-rates/index.asp;/NY/new-york-sales-tax")

  
  Call add(redirect, "/free/cartadons/z2t_table_special.asp;/sample-tables")
  Call add(redirect, "/free/CartAdOns/z2t_table_standard.asp;/Website/pagesProducts/z2t_compatible.asp")

  Call add(redirect, "/PinPoint/;/sales-tax-by-zipcode")
		
  ' shopping
  Call add(redirect, "/shopping/;/free-sales-tax-calculator")
  Call add(redirect, "/shopping/z2t_redistribution_agreement.asp;/Website/pagesExtra/z2t_redistribution_agreement.asp")
  Call add(redirect, "/shopping/z2t_compatible.asp;/Website/pagesProducts/z2t_compatible.asp")
  Call add(redirect, "/shopping/cart/table_single_popup.asp;/Website/pagesProducts/Cart/Table_Single/table_single_popup.asp")
  Call add(redirect, "/shopping/cart/table_country_popup.asp;/Website/pagesProducts/Cart/Table_Country/table_country_popup.asp")
  Call add(redirect, "/shopping/cart/online_zip_popup.asp;/Website/pagesProducts/Cart/Online_Zip/online_zip_popup.asp")
  Call add(redirect, "/shopping/z2t_specialty_tables.asp;/Website/pagesProducts/z2t_specialty_tables.asp")
  Call add(redirect, "/shopping/cart/redist_table_single_popup.asp;/Website/pagesProducts/Cart/Redist_Table_Single/redist_table_single_popup.asp")
  Call add(redirect, "/shopping/cart/table_single_update_popup.asp;/Website/pagesProducts/Cart/Table_Single_Update/table_single_update_popup.asp")
  Call add(redirect, "/shopping/cart/redist_table_country_popup.asp;/Website/pagesProducts/Cart/Redist_Table_Country/redist_table_country_popup.asp")
  Call add(redirect, "/shopping/cart/online_PinPoint_popup.asp;/Website/pagesProducts/Cart/Online-PinPoint/online_PinPoint_popup.asp")
  Call add(redirect, "/shopping/cart/online_zip+4_popup.asp;/Website/pagesProducts/Cart/Online_Zip+4/online_zip+4_popup.asp")
  Call add(redirect, "/shopping/z2t_table_formats.asp;/sample-tables")
  Call add(redirect, "/shopping/z2t_services.asp;/free-sales-tax-calculator")
	
  ' blog	
  Call add(redirect, "/z2t_news_commentary_debt_reduction.asp;http://blog.zip2tax.com/")
  Call add(redirect, "/News_Archive/z2t_NewsArchive.asp;http://blog.zip2tax.com/")
   
  'Call add(redirect, "/Backoffice/z2t_login.asp;http://legacy.zip2tax.com/backoffice/z2t_login.asp")
  'Something obsolete? -Jessie
		
  ' External links		
  Call add(redirect, "/z2t_services.asp;/free-sales-tax-calculator")
  
  'Start of new additions as per Google Webmaster Tools
  Call add(redirect, "/developers/z2t_developers_example.asp?language=PHP&file=php&db=mysql;/developers-api-sample-php")
  Call add(redirect, "/m/Website/pagesCountries/US/States/Delaware-State-Rates/;/DE/delaware-sales-tax")
  Call add(redirect, "/m/Website/pagesCountries/US/States/New-Mexico-State-Rates/;/NM/new-mexico-sales-tax")
  Call add(redirect, "/m/Website/pagesCountries/US/States/Oklahoma-State-Rates/;/OK/oklahoma-sales-tax")
  Call add(redirect, "/mobile/Website/pagesCountries/US/States/Delaware-State-Rates/;/DE/delaware-sales-tax")
  Call add(redirect, "/mobile/Website/pagesCountries/US/States/New-Mexico-State-Rates/;/NM/new-mexico-sales-tax")
  Call add(redirect, "/mobile/Website/pagesCountries/US/States/Oklahoma-State-Rates/;/OK/oklahoma-sales-tax")
  Call add(redirect, "/mobile/Website/pagesCountries/US/States/Pennsylvania-State-Rates/;/PA/pennsylvania-sales-tax")
  Call add(redirect, "/mobile/Website/pagesSupport/pagesDev/z2t_developers_new_examples.asp?language=NewC%23.NET&file=cs&db=mssql;/developers-api-sample-c-sharp")
  Call add(redirect, "/mobile/Website/pagesTaxRates/z2t_lookup.asp;/sales-tax-calculator")
  Call add(redirect, "/Website/pagesCountries/US/States/Nebraksa-State-Rates/index.html;/NE/nebraska-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New%20Hampshire-State-Rates/index.html;/NH/new-hampshire-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New%20Jersey-State-Rates/index.html;/NJ/new-jersey-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New%20Mexico-State-Rates/index.html;/NM/new-mexico-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New%20York-State-Rates/index.html;/NY/new-york-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/North%20Carolina-State-Rates/index.html;/NC/north-carolina-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/North%20Dakota-State-Rates/index.html;/ND/north-dakota-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Rhode%20Island-State-Rates/index.html;/RI/rhode-island-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/South%20Carolina-State-Rates/index.html;/SC/south-carolina-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/South%20Dakota-State-Rates/index.html;/SD/south-dakota-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/West%20Virginia-State-Rates/index.html;/WV/west-virginia-sales-tax")
  Call add(redirect, "/Website/pagesProducts/Cart/Online_PinPoint/online_PinPoint_popup.asp;/Website/pagesProducts/Cart/Online_SpotOn/online_SpotOn_popup.asp")
  Call add(redirect, "/Website/pagesSupport/pagesDev/z2t_developers_PinPoint.asp;/developers-api-spot-on")
  Call add(redirect, "/Website/pagesTaxRates/z2t-tax-rates.asp;/sales-tax-calculator")
  Call add(redirect, "/z2t_lookup.asp?debugerror=max%20total;/sales-tax-calculator")
  Call add(redirect, "/z2t_lookup.asp?s=google&gclid=CIr71cj34rACFagbQgodDzYi3g;/sales-tax-calculator")
  Call add(redirect, "/z2t_lookup.asp?s=google&gclid=CK_G8oKFr6oCFQXc4;/sales-tax-calculator")
  Call add(redirect, "/z2t_lookup.asp?s=google&gclid=CLiX_dH6hLcCFQVV4AodcWQAMA;/sales-tax-calculator")
  Call add(redirect, "/z2t_services.asp?AFF=Smith061311;/free-sales-tax-calculator")
  Call add(redirect, "/z2t_sitemap.asp;/Website/pagesHome/z2t_sitemap.asp")
  Call add(redirect, "/Website/pagesCountries/US/States/Delaware-State-Rates/;/DE/delaware-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New-York-State-Rates/; /NY/new-york-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Louisiana-State-Rates/index.html; /LA/louisiana-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Nebraska-State-Rates/; /NE/nebraska-sales-tax")
  Call add(redirect, "/Website/pagesSupport/pagesResources/z2t_resources_shopping.asp; /resources")
  Call add(redirect, "/Website/pagesCountries/US/States/Tennessee-State-Rates/index.html; /TN/tennessee-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Alaska-State-Rates/; /AK/alaska-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Washington-State-Rates/; /WA/washington-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New-Jersey-State-Rates/; /NJ/new-jersey-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Colorado-State-Rates/; /CO/colorado-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/South-Dakota-State-Rates; /SD/south-dakota-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/West-Virginia-State-Rates/; /WV/west-virginia-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Georgia-State-Rates; /GA/georgia-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Maine-State-Rates; /ME/maine-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Tennessee-State-Rates/; /TN/tennessee-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New-Hampshire-State-Rates/; /NH/new-hampshire-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/North-Carolina-State-Rates/; /NC/north-carolina-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Hawaii-State-Rates/; /HI/hawaii-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Kentucky-State-Rates/; /KY/kentucky-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Idaho-State-Rates/index.asp; /ID/idaho-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Pennsylvania-State-Rates; /PA/pennsylvania-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/West-Virginia-State-Rates; /WV/west-virginia-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/District-of-Columbia-State-Rates/; /DC/district-of-columbia-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/North-Carolina-State-Rates/index.asp; /NC/north-carolina-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New-Mexico-State-Rates/index.asp; /NM/new-mexico-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Kansas-State-Rates; /KS/kansas-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Indiana-State-Rates/index.asp; /IN/indiana-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Arkansas-State-Rates/index.asp; /AR/arkansas-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Idaho-State-Rates; /ID/idaho-sales-tax")
  Call add(redirect, "/Nebraksa-sales-tax/; /NE/nebraska-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/North-Carolina-State-Rates/index.html; /NC/north-carolina-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Kentucky-State-Rates/index.html; /KY/kentucky-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Kentucky-State-Rates; /KY/kentucky-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Oregon-State-Rates/; /OR/oregon-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Arizona-State-Rates/; /AZ/arizona-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/California-State-Rates/; /CA/california-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Georgia-State-Rates/; /GA/georgia-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Minnesota-State-Rates/; /MN/minnesota-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Texas-State-Rates/index.asp; /TX/texas-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Oregon-State-Rates/index.asp; /OR/oregon-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Maine-State-Rates/index.asp; /ME/maine-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Arkansas-State-Rates/; /AR/arkansas-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/North-Dakota-State-Rates/; /ND/north-dakota-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Vermont-State-Rates/; /VT/vermont-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Connecticut-State-Rates/; /CT/connecticut-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Virginia-State-Rates/; /VA/virginia-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Florida-State-Rates/; /FL/florida-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/South-Dakota-State-Rates/; /SD/south-dakota-sales-tax")
  Call add(redirect, "/Website/pagesAccount/z2t_badges.asp; /badges")
  Call add(redirect, "/Website/pagesCountries/US/States/Maine-State-Rates/; /ME/maine-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Vermont-State-Rates; /VT/vermont-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Nevada-State-Rates/; /NV/nevada-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Rhode-Island-State-Rates/index.asp; /RI/rhode-island-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Minnesota-State-Rates; /MN/minnesota-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/Arizona-State-Rates/index.asp; /AZ/arizona-sales-tax")
  Call add(redirect, "/Website/pagesCountries/US/States/New-Jersey-State-Rates/index.asp; /NJ/new-jersey-sales-tax")
  Call add(redirect, "/z2t_lookup.asp?inputZip=60067; /sales-tax-calculator")
  Call add(redirect, "/z2t_lookup.asp?inputZip=20001; /sales-tax-calculator")
  Call add(redirect, "/z2t_lookup.asp?inputZip=64105; /sales-tax-calculator")
  
  'End of new additions section------------------------------------------------------------------------------------------------------

  Set redirect = UseTable(redirect, ";", Array("not-found", "redirect"))

  Dim port: port = "443"
  Dim url: url = Replace(Request.ServerVariables("HTTP_URL"), Request.ServerVariables("URL") & "?404;" & Left(pathBase, Len(pathBase) - 1) & ":" & port, "", 1, -1, 1)
  url = Replace(url, "https","http")
    '/Website/pagesExtra/z2t_404_error.asp?404;http://dev.zip2tax.com:80/z2t_lookup.asp
  Dim queryposition: queryposition = Instr(url, "?")
  'Response.Write(queryposition & " - " & url):Response.End
  Dim querystring: querystring = ""
  If queryposition > 0 Then 
    queryString = "?" & Right(url, Len(url) - queryposition)
    url = Left(url, queryposition - 1)
  End If

  If IsObject(redirect(url)) Then
    If Not IsEmpty(redirect(url)) Then
      Response.Status = "301 Moved Permanently"
      Response.AddHeader "Location", redirect(url)("redirect") & querystring
    End If
  End If
%>

<%
    Response.Status = "404 Not Found"
	
	displayURL = url
	displayURL = Replace(displayURL, "?", "|")
%>

<html>
<head>
  <title>404 Error - Zip2Tax - <%response.write(displayURL)%></title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <meta name="description" content="Page not found - <%response.write(displayURL)%>">
  <!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
  <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
  <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
  <script language="javascript" src="/Website/pagesExtra/404Error/page_404_error.js" type="text/javascript"></script>
  <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->


          <!--#include virtual="/Website/pagesExtra/Errors/404/page_404_error_left_sidebar_new.asp" -->
          <!--#include virtual="/Website/pagesExtra/Errors/404/page_404_error_content_new.asp" -->
          <!--#include virtual="/Website/pagesExtra/Errors/404/page_404_error_right_sidebar_new.asp" -->

        <!--#include virtual="/Website/Includes/footer_new.asp"-->
</body>
</html>
