<%
	Dim ColorTab
	'Determines which menu tab to highlight based on the Session("activePage") variable set at the top of each webpage
	Select Case Session("activePage")
	Case "Home", "About Us", "customer_commitment", "Customers", "Testimonials", "Sitemap"
		ColorTab = 0
	Case "Lookup", "Tax Rates","Spot-On Lookup","widget","Tax rate level availability"
		ColorTab = 1
	Case "Services", "Widget", "Comparison Chart", "Specialty Tables"
		ColorTab = 2
	Case "Support", "Developers", "resources","faq","Compatible","contact us","Badge"
		ColorTab = 3
	Case "Account"
		ColorTab = 4
	Case Else
		ColorTab = 0
	End Select
  
	Dim ServicesURL
	If Session("ServicesURL") = "Free" Then
		ServicesURL = "/Free/z2t_Services_Free.asp"
	Else
		ServicesURL = "/z2t_services.asp"
	End If

	If Not BottomMenu Then
%>

<div class="menu">
  <div id="moonmenu" class="halfmoon">
  
<%
	End If
%>

    <ul>
      <li <%=activePageClass(0)%>>
        <a href="/"
           rel="dropmenuHome">Home <img src="/website/images/button/open_menu.png" alt="open home menu"></a></li>

      <li <%=activePageClass(1)%>>
        <a href="/how-to-calculate-sales-tax"
           rel="dropmenuLookup">Tax Rates <img src="/website/images/button/open_menu.png" alt="open tax rates menu"></a></li>

      <li <%=activePageClass(2)%>>
        <a href="/free-sales-tax-calculator" 
			rel="dropmenuServices">Products <img src="/website/images/button/open_menu.png" alt="open product menu"></a></li>

      <li <%=activePageClass(3)%>>
        <a href="/contact-us" 
			rel="dropmenuSupport">Support <img src="/website/images/button/open_menu.png" alt="open support menu"></a></li>

<%
  If Session("z2t_loggedin") = "True" Then
%>
      <li <%=activePageClass(4)%>>
        <a href="/my-account"
           title="Information About Your Account"
           rel="dropmenuAccount">Account <img src="/website/images/button/open_menu.png" alt="open menu"></a></li>
<%
  End If
%>
		   
<%
  If BottomMenu Then
%>
      <li<%=activePageClass(0)%>><a href="/Website/pagesHome/z2t_sitemap.asp" title="Index of the Zip2Tax Web Site">Site Map</a></li>
<%
  End If
%>

	</ul>
	
<%
  If Not BottomMenu Then
%>
  <form class="search" action="http://search.freefind.com/find.html" method="get" accept-charset="utf-8" target="_blank" style="float: right; margin-right: 14em">
    <input type="hidden" name="si" value="13834268">
    <input type="hidden" name="pid" value="r">
    <input type="hidden" name="n" value="0">
    <input type="hidden" name="_charset_" value="">
    <input type="hidden" name="bcd" value="&#247;">
    <input type="text" name="query" size="15">
    <input type="submit" value="&nbsp;&nbsp;&nbsp;Search&nbsp;&nbsp;&nbsp;" class="redButton s11">
  </form>

  <!-- 0th drop-down menu -->
  <div id="dropmenuHome" class="dropmenudiv_e" style="width:200px">
    <a href="/sales-tax-service-providers">About Us</a>
    <a href="/our-commitment">Quality Pledge</a>
    <a href="/who-uses-our-services">Customers</a>
    <a href="/testimonials">Testimonials</a>
    <a href="/Website/pagesHome/z2t_sitemap.asp">Site Map</a>
  </div>

  <!-- 1st drop-down menu -->
  <div id="dropmenuLookup" class="dropmenudiv_e" style="width:200px">
    <a href="/sales-tax-calculator">ZIP Code Lookup</a>
    <a href="/sales-tax-by-zipcode">Spot-On Lookup</a>
    <a href="/calculate-sales-tax-rates">Desktop Widget</a>
    <a href="/sales-tax-by-state">Taxes By State</a>
    <a href="http://blog.zip2tax.com/">News Blog</a>
  </div>

  <!-- 2nd drop-down menu -->
  <div id="dropmenuServices" class="dropmenudiv_e" style="width:200px">
    <a href="/comparison-chart">Compare Services</a>
    <a href="/free-sales-tax-calculator#PageSection1">Online Lookup</a>
    <a href="/free-sales-tax-calculator#PageSection2">Database Interface</a>
    <a href="/free-sales-tax-calculator#PageSection3">.CSV Tax Tables</a>
  </div>

  <!-- 3th drop-down menu -->
  <div id="dropmenuSupport" class="dropmenudiv_e" style="width:200px">
    <a href="/frequently-asked-questions">FAQs</a>
    <a href="/developers-interface">Developers</a>
    <a href="/sample-tables">Sample Tables</a>
    <a href="/resources">Resources</a>
    <a href="/badges">Badges&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
  </div>

<%
  If Session("z2t_loggedin") = "True" Then
%>
  <!-- 4th drop-down menu -->
  <div id="dropmenuAccount" class="dropmenudiv_e" style="width:200px">
    <a href="/account-usage">Subscriber Usage</a>
    <a href="/account-table-download">Table Download</a>
    <a href="/account-renew">Renew Online</a>
    <a href="javascript:clickLogout();">Log Out</a>
  </div>
<% 
  End If
%>

<script type="text/javascript" src="/Website/Includes/BodyParts/Menus/content_menu.js"></script>
<script type="text/javascript">
    tabdropdown.init("moonmenu", <%=iif(ColorTab > "", CStr(ColorTab), "1")%>)
</script>
</div>
</div>

<%
  End If

Function activePageClass(s)
	'Determines what color to make the menu selection
    If ColorTab = s Then
        activePageClass = " class='active'"
    Else
        activePageClass = ""
    End If
End Function

Function iif(condition, consequent, alternative)
	If condition Then iif = consequent Else iif = alternative
End Function
%>

