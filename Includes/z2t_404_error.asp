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
  Call add(redirect, "/lookup;/Website/pagesTaxRates/Online-Lookups/z2t_lookup.asp")
  Call add(redirect, "/z2t_lookup.asp;/Website/pagesTaxRates/Online-Lookups/z2t_lookup.asp")
  Call add(redirect, "/online-lookups/z2t_lookups.asp;/Website/pagesTaxRates/Online-Lookups/z2t_lookups.asp")
  Call add(redirect, "/z2t  lookup.asp;/Website/pagesTaxRates/Online-Lookups/z2t_lookup.asp")
  Call add(redirect, "/Z2T_LOOKUP.ASP;/Website/pagesTaxRates/Online-Lookups/z2t_lookup.asp")
  

  Call add(redirect, "/Website/pagesCountries/US/States/District-of-Columbia-State-Rates/index.html;/Website/pagesCountries/US/States/Columbia-State-Rates/index.html")
  Call add(redirect, "/z2t_aboutus.asp;/Website/pagesHome/z2t_aboutus.asp")
  Call add(redirect, "/state/United-States-Sales-Tax/index.html;/Website/pagesCountries/US/United-States-Sales-Tax/index.asp")
		
  Call add(redirect, "/account/z2t_account.asp;/Website/pagesAccount/z2t_account.asp")
  Call add(redirect, "/account/z2t_services.asp;/Website/pagesAccount/z2t_account.asp")
		
  Call add(redirect, "/includes/EnterCode.asp;/Website/Includes/BodyParts/PopUps/EnterCode.asp")
		
  Call add(redirect, "/Inbound/z2t_signup.asp;/Website/Inbound/z2t_signup.asp")
  Call add(redirect, "/Inbound/z2t_newsletter.asp;/Website/Inbound/z2t_newsletter.asp")
		
  Call add(redirect, "/z2t_faq.asp;/Website/pagesSupport/z2t_faq.asp")
		
  Call add(redirect, "/free/CartAdOns/z2t_table_formats.asp;/Website/pagesProducts/z2t_table_formats.asp")
  Call add(redirect, "/Free/CartAdOns/z2t_services_online_cart.asp;/Website/pagesProducts/Offers/Free/Cart/z2t_services_online_cart.asp")
  Call add(redirect, "/Free/CartAdOns/z2t_services_table_cart.asp;/Website/pagesProducts/Offers/Free/Cart/z2t_services_table_cart.asp")
  Call add(redirect, "/free/CartAdOns/z2t_table_special.asp;/Website/pagesProducts/Offers/Free/Cart/z2t_services_table_cart.asp")
  Call add(redirect, "/free;/Website/pagesProducts/Offers/Free/z2t_services_free.asp")
  Call add(redirect, "/Free;/Website/pagesProducts/Offers/Free/z2t_services_free.asp")
  Call add(redirect, "/free/;/Website/pagesProducts/Offers/Free/z2t_services_free.asp")
		
  Call add(redirect, "/z2t_contact.asp;/Website/pagesSupport/z2t_contact.asp")
  Call add(redirect, "/services/z2t_widget.asp;/Website/pagesTaxRates/z2t_widget.asp")
  Call add(redirect, "/z2t_eula.asp;/Website/pagesExtra/z2t_eula.asp")
  Call add(redirect, "/Website/pagesCountries/US/States/United-States-Sales-Tax/index.html;/Website/pagesCountries/US/United-States-Sales-Tax/index.asp")
		
  ' developers
  Call add(redirect, "/developers/z2t_developers.asp;/Website/pagesSupport/pagesDev/z2t_developers.asp")
  Call add(redirect, "/developers/z2t_developers_ZIPcode.asp;/Website/pagesSupport/pagesDev/z2t_developers_ZIPcode.asp")
  Call add(redirect, "/developers/z2t_developers_API.asp;/Website/pagesSupport/pagesDev/z2t_developers_API.asp")
  Call add(redirect, "/developers/z2t_developers_ZIP+4.asp;/Website/pagesSupport/pagesDev/z2t_developers_ZIP+4.asp")
  Call add(redirect, "/developers/z2t_developers_RequestVariables.asp;/Website/pagesSupport/pagesDev/z2t_developers_RequestVariables.asp")
  Call add(redirect, "/developers/z2t_developers_TableDownload_HTTP.asp;/Website/pagesSupport/pagesDev/z2t_developers_TableDownload_HTTP.asp")
  Call add(redirect, "/developers/z2t_developers_DirectConnect.asp;/Website/pagesSupport/pagesDev/z2t_developers_DirectConnect.asp")
  Call add(redirect, "/developers/z2t_developers_MySQL.asp;/Website/pagesSupport/pagesDev/z2t_developers_example.asp")
  Call add(redirect, "/developers/z2t_developers_QuickLink.asp;/Website/pagesSupport/pagesDev/z2t_developers_QuickLink.asp")
	
  ' resources
  Call add(redirect, "/resources/z2t_resources.asp;/Website/pagesSupport/pagesResources/z2t_resources.asp")
  Call add(redirect, "/resources/z2t_badges.asp;/Website/pagesAccount/z2t_badges.asp")
  Call add(redirect, "/resources/z2t_resources_shopping.asp;/Website/pagesSupport/pagesResources/z2t_resources_shopping.asp")
  Call add(redirect, "/resources/z2t_resources_shipping.asp;/index.asp")
  Call add(redirect, "/resources/ResSub/Res_CPA_StatesSalesTax.asp;/Website/pagesSupport/pagesResources/Res_CPA_StatesSalesTax.asp")
  Call add(redirect, "/Resources_shopping.asp;/Website/pagesSupport/pagesResources/z2t_resources_shopping.asp")
  Call add(redirect, "/Resources_ecommerce.asp;/Website/pagesSupport/pagesResources/z2t_resources_shopping.asp")			
		
  Call add(redirect, "/z2t_database_link.asp;/Website/pagesSupport/pagesDev/z2t_developers_ZIPcode.asp")

  ' downloads
  Call add(redirect, "/downloads/use_tax_by_state.pdf;/Website/Downloads/Sample_Tables/Use_tax_by_state.pdf")
  Call add(redirect, "/downloads/2012_07_ZIPcode_Changes.pdf;/Website/Downloads/ZIP_code_change/2012_07_ZIPcode_Changes.pdf")
  Call add(redirect, "/downloads/Zip2TaxNYClothingTableDescription.pdf;/Website/Downloads/Sample_Tables/Zip2TaxNYClothingTableDescription.pdf")
  Call add(redirect, "/downloads/Zip2TaxUniqueZipsTableLayoutInformation.pdf;/Website/Downloads/Sample_Tables/Zip2TaxUniqueZipsTableLayoutInformation.pdf")
  Call add(redirect, "/downloads/ZIP_code_change/2013_03_ZIPcodeChanges.pdf;/Website/Downloads/ZIP_code_change/2013_03_ZIPcodeChanges.pdf")
		
  ' 50 state pages
  Call add(redirect, "/State/Alabama-State-Rates/index.html;/Website/pagesCountries/US/States/Alabama-State-Rates/index.html")
  Call add(redirect, "/State/Alaska-State-Rates/index.html;/Website/pagesCountries/US/States/Alaska-State-Rates/index.html")
  Call add(redirect, "/State/Arizona-State-Rates/index.html;/Website/pagesCountries/US/States/Arizona-State-Rates/index.html")
  Call add(redirect, "/State/Arkansas-State-Rates/index.html;/Website/pagesCountries/US/States/Arkansas-State-Rates/index.html")
  Call add(redirect, "/State/California-State-Rates/index.html;/Website/pagesCountries/US/States/California-State-Rates/index.html")
  Call add(redirect, "/State/Colorado-State-Rates/index.html;/Website/pagesCountries/US/States/Colorado-State-Rates/index.html")
  Call add(redirect, "/State/Columbia-State-Rates/index.html;/Website/pagesCountries/US/States/Columbia-State-Rates/index.html")
  Call add(redirect, "/State/Connecticut-State-Rates/index.html;/Website/pagesCountries/US/States/Connecticut-State-Rates/index.html")
  Call add(redirect, "/State/Delaware-State-Rates/index.html;/Website/pagesCountries/US/States/Delaware-State-Rates/index.html")
  Call add(redirect, "/State/Florida-State-Rates/index.html;/Website/pagesCountries/US/States/Florida-State-Rates/index.html")
  Call add(redirect, "/State/Georgia-State-Rates/index.html;/Website/pagesCountries/US/States/Georgia-State-Rates/index.html")
  Call add(redirect, "/State/Hawaii-State-Rates/index.html;/Website/pagesCountries/US/States/Hawaii-State-Rates/index.html")
  Call add(redirect, "/State/Idaho-State-Rates/index.html;/Website/pagesCountries/US/States/Idaho-State-Rates/index.html")
  Call add(redirect, "/State/Illinois-State-Rates/index.html;/Website/pagesCountries/US/States/Illinois-State-Rates/index.html")
  Call add(redirect, "/State/Indiana-State-Rates/index.html;/Website/pagesCountries/US/States/Indiana-State-Rates/index.html")
  Call add(redirect, "/State/Iowa-State-Rates/index.html;/Website/pagesCountries/US/States/Iowa-State-Rates/index.html")
  Call add(redirect, "/State/Kansas-State-Rates/index.html;/Website/pagesCountries/US/States/Kansas-State-Rates/index.html")
  Call add(redirect, "/State/Kentucky-State-Rates/index.html;/Website/pagesCountries/US/States/Kentucky-State-Rates/index.html")
  Call add(redirect, "/State/Louisiana-State-Rates/index.html;/Website/pagesCountries/US/States/Louisiana-State-Rates/index.html")
  Call add(redirect, "/State/Maine-State-Rates/index.html;/Website/pagesCountries/US/States/Maine-State-Rates/index.html")
  Call add(redirect, "/State/Maryland-State-Rates/index.html;/Website/pagesCountries/US/States/Maryland-State-Rates/index.html")
  Call add(redirect, "/State/Massachusetts-State-Rates/index.html;/Website/pagesCountries/US/States/Massachusetts-State-Rates/index.html")
  Call add(redirect, "/State/Michigan-State-Rates/index.html;/Website/pagesCountries/US/States/Michigan-State-Rates/index.html")
  Call add(redirect, "/State/Minnesota-State-Rates/index.html;/Website/pagesCountries/US/States/Minnesota-State-Rates/index.html")
  Call add(redirect, "/State/Mississippi-State-Rates/index.html;/Website/pagesCountries/US/States/Mississippi-State-Rates/index.html")
  Call add(redirect, "/State/Missouri-State-Rates/index.html;/Website/pagesCountries/US/States/Missouri-State-Rates/index.html")
  Call add(redirect, "/State/Montana-State-Rates/index.html;/Website/pagesCountries/US/States/Montana-State-Rates/index.html")
  Call add(redirect, "/State/Nebraska-State-Rates/index.html;/Website/pagesCountries/US/States/Nebraska-State-Rates/index.html")
  Call add(redirect, "/State/Nevada-State-Rates/index.html;/Website/pagesCountries/US/States/Nevada-State-Rates/index.html")
  Call add(redirect, "/State/New-Hampshire-State-Rates/index.html;/Website/pagesCountries/US/States/New-Hampshire-State-Rates/index.html")
  Call add(redirect, "/State/New-Jersey-State-Rates/index.html;/Website/pagesCountries/US/States/New-Jersey-State-Rates/index.html")
  Call add(redirect, "/State/New-Mexico-State-Rates/index.html;/Website/pagesCountries/US/States/New-Mexico-State-Rates/index.html")
  Call add(redirect, "/State/New-York-State-Rates/index.html;/Website/pagesCountries/US/States/New-York-State-Rates/index.html")
  Call add(redirect, "/State/North-Carolina-State-Rates/index.html;/Website/pagesCountries/US/States/North-Carolina-State-Rates/index.html")
  Call add(redirect, "/State/North-Dakota-State-Rates/index.html;/Website/pagesCountries/US/States/North-Dakota-State-Rates/index.html")
  Call add(redirect, "/State/Ohio-State-Rates/index.html;/Website/pagesCountries/US/States/Ohio-State-Rates/index.html")
  Call add(redirect, "/State/Oklahoma-State-Rates/index.html;/Website/pagesCountries/US/States/Oklahoma-State-Rates/index.html")
  Call add(redirect, "/State/Oregon-State-Rates/index.html;/Website/pagesCountries/US/States/Oregon-State-Rates/index.html")
  Call add(redirect, "/State/Pennsylvania-State-Rates/index.html;/Website/pagesCountries/US/States/Pennsylvania-State-Rates/index.html")
  Call add(redirect, "/State/Rhode-Island-State-Rates/index.html;/Website/pagesCountries/US/States/Rhode-Island-State-Rates/index.html")
  Call add(redirect, "/State/South-Carolina-State-Rates/index.html;/Website/pagesCountries/US/States/South-Carolina-State-Rates/index.html")
  Call add(redirect, "/State/South-Dakota-State-Rates/index.html;/Website/pagesCountries/US/States/South-Dakota-State-Rates/index.html")
  Call add(redirect, "/State/Tennessee-State-Rates/index.html;/Website/pagesCountries/US/States/Tennessee-State-Rates/index.html")
  Call add(redirect, "/State/Texas-State-Rates/index.html;/Website/pagesCountries/US/States/Texas-State-Rates/index.html")
  Call add(redirect, "/State/Utah-State-Rates/index.html;/Website/pagesCountries/US/States/Utah-State-Rates/index.html")
  Call add(redirect, "/State/Vermont-State-Rates/index.html;/Website/pagesCountries/US/States/Vermont-State-Rates/index.html")
  Call add(redirect, "/State/Virginia-State-Rates/index.html;/Website/pagesCountries/US/States/Virginia-State-Rates/index.html")
  Call add(redirect, "/State/Washington-State-Rates/index.html;/Website/pagesCountries/US/States/Washington-State-Rates/index.html")
  Call add(redirect, "/State/West-Virginia-State-Rates/index.html;/Website/pagesCountries/US/States/West-Virginia-State-Rates/index.html")
  Call add(redirect, "/State/Wisconsin-State-Rates/index.html;/Website/pagesCountries/US/States/Wisconsin-State-Rates/index.html")
  Call add(redirect, "/State/Wyoming-State-Rates/index.html;/Website/pagesCountries/US/States/Wyoming-State-Rates/index.html")
  Call add(redirect, "/Website/pagesCountries/US/States/;/Website/pagesCountries/US/United-States-Sales-Tax/index.asp")
  Call add(redirect, "/state/United-States-Sales-Tax/;/Website/pagesCountries/US/United-States-Sales-Tax/index.asp")
  Call add(redirect, "/state/New-York-state-rates/index.html;/Website/pagesCountries/US/States/New-York-State-Rates/index.html")
  Call add(redirect, "/Website/pagesCountries/US/States/United-States-Sales-Tax/Website/pagesSupport/z2t_faq.asp;/Website/pagesSupport/z2t_faq.asp#states")
  Call add(redirect, "/Website/pagesCountries/US/States/eta_default.cfm;/Website/pagesCountries/US/United-States-Sales-Tax/index.asp")


  
  Call add(redirect, "/free/cartadons/z2t_table_special.asp;/Website/pagesProducts/z2t_table_formats.asp")
  Call add(redirect, "/free/CartAdOns/z2t_table_standard.asp;/Website/pagesProducts/z2t_compatible.asp")

  Call add(redirect, "/PinPoint/;/Website/pagesTaxRates/Online-Lookups/z2t_lookup.asp")
		
  ' shopping
  Call add(redirect, "/shopping/;/Website/pagesProducts/z2t_services.asp")
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
  Call add(redirect, "/shopping/z2t_table_formats.asp;/Website/pagesProducts/z2t_table_formats.asp")

  Call add(redirect, "//shopping/z2t_services.asp#;/Website/pagesProducts/z2t_services.asp") ' is this a typo? <2013-08-07 Wed nathan>
  Call add(redirect, "/shopping/z2t_services.asp;/Website/pagesProducts/z2t_services.asp") ' add these for good measure, in case it was a typo <2013-08-07 Wed nathan>
  Call add(redirect, "/shopping/z2t_services.asp#;/Website/pagesProducts/z2t_services.asp") ' does the fragment get forwarded through redirection just like query-strings? needs a test case <2013-08-07 Wed nathan>
	
  ' blog	
  Call add(redirect, "/z2t_news_commentary_debt_reduction.asp;http://blog.zip2tax.com/")
  Call add(redirect, "/News_Archive/z2t_NewsArchive.asp;http://blog.zip2tax.com/")
   
  Call add(redirect, "/Backoffice/z2t_login.asp;http://legacy.zip2tax.com/backoffice/z2t_login.asp")
		
  ' External links		
  Call add(redirect, "/z2t_services.asp;/Website/pagesProducts/z2t_services.asp")

  Set redirect = UseTable(redirect, ";", Array("not-found", "redirect"))

  Dim port: port = "80"
  Dim url: url = Replace(Request.ServerVariables("HTTP_URL"), Request.ServerVariables("URL") & "?404;" & Left(pathBase, Len(pathBase) - 1) & ":" & port, "", 1, -1, 1)
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
      Call z2t_LogActivity(Session("z2t_UserName"), _
                           1, _
                           url & queryString, _
                           redirect(url)("redirect") & queryString, _
                           FormatPath(Request.ServerVariables("PATH_INFO")), _
                           Reff, _
                           Session.SessionID, _
                           Request.ServerVariables("REMOTE_ADDR"), _
                           "z2t_404_error.aspConnection.asp", _
                           Session("CookieID"))
      Response.Status = "301 Moved Permanently"
      Response.AddHeader "Location", redirect(url)("redirect") & querystring
    End If
  End If
%>

<html>
<head>
  <title>404 Error - Zip2Tax.com</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <meta name="keywords" content="sales tax rate lookup zip code, Zip Code, Sales and Use Tax Rates, Sales Tax Database">
  <meta name="description" content="Page not found">
  <!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
  <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
  <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
  <script language="javascript" src="/Website/pagesExtra/404Error/page_404_error.js" type="text/javascript"></script>

  <script language="javascript" type="text/javascript">
    var userName = '<%=Session("UserName")%>';
    var ProductID = 0;
    var TaxType = '';
    var TableFormat = '';
  </script>

  <style type="text/css">
    td h3 {vertical-align: middle;}
    .paddedtable1 tr {vertical-align: middle;}
    .paddedtable1 th {padding-left: 1.5em; padding-right: 1.5em; width: 20%; text-align: center; vertical-align: top; height: 50px;}
    .row-mod-0 {background-color: #CCCCCC;}
    .row-mod-1 {background-color: #EAEAEA;}
  </style>
</head>

<body>
    <div id="divMain">

      <div id="divPageTop">
        <!--#include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->


      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!--#include virtual="/Website/pagesExtra/404Error/page_404_error_left_sidebar.asp" -->
        </div><!-- divPageLeft -->

        <div id="divPageCenter" align="center">
          <!--#include virtual="/Website/pagesExtra/404Error/page_404_error_content.asp" -->
        </div><!-- divPageCenter -->

        <div id="divPageRight">
          <!--#include virtual="/Website/pagesExtra/404Error/page_404_error_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->


      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->

    </div><!-- main -->
</body>
</html>
<!--#include virtual="/Website/Includes/z2t_dbFunctions.asp"-->
