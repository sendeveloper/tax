<%
	Dim ColorTab
	'Determines which menu tab to highlight based on the Session("activePage") variable set at the top of each webpage
	Select Case Session("activePage")
	Case "Home", "About Us", "customer_commitment", "Customers", "Testimonials", "Sitemap"
		ColorTab = 0
	Case "Lookup", "Tax Rates"
		ColorTab = 1
	Case "Services", "Widget", "Compatible", "Comparison Chart", "Specialty Tables"
		ColorTab = 2
	Case "Support", "Developers", "resources"
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


        <div class="col-lg-6 ">
          <nav  class="navbar">
            <div class="navbar-header"><span class="visible-xs" id="category">Menu</span>
              <button data-target=".navbar-ex1-collapse" data-toggle="collapse" class="btn btn-navbar navbar-toggle" type="button">
              	<i class="fa fa-bars"></i>
              </button>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                
<%
	End If
%>



<ul class="nav navbar-nav">
  <li <%=activePageClass(0)%> class="dropdown">
  	<a  href="#" data-toggle="dropdown" class="dropdown-toggle" >Home <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li> <a href="/sales-tax-service-providers" style="border-top-width: 0px;">About Us</a></li>
          <li> <a href="/our-commitment">Quality Pledge</a></li>
          <li> <a href="/who-uses-our-services">Customers</a></li>
          <li> <a href="/testimonials">Testimonials</a></li>
          <li> <a href="/Website/pagesHome/z2t_sitemap.asp">Site Map</a></li>
        </ul>
    </li>
    
    <li <%=activePageClass(1)%> class="dropdown">
        <a href="/"
           rel="dropmenuHome" data-toggle="dropdown" class="dropdown-toggle">Tax Rates   

                    <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="/sales-tax-calculator" style="border-top-width: 0px;">ZIP Code Lookup</a></li>
                    <li><a href="/sales-tax-by-zipcode">Spot-On Lookup</a></li>
                    <li><a href="/calculate-sales-tax-rates">Desktop Widget</a></li>
                    <li><a href="/sales-tax-by-state">Taxes By State</a></li>
                    <li><a href="http://blog.zip2tax.com/">News Blog</a></li>
                  </ul>
 
    </li>

    <li <%=activePageClass(2)%> class="dropdown">
        <a href="/how-to-calculate-sales-tax"
           rel="dropmenuLookup" data-toggle="dropdown" class="dropdown-toggle">Products                    <b class="caret"></b></a>

                  <ul class="dropdown-menu">
                    <li><a href="/comparison-chart" style="border-top-width: 0px;">
                    	Compare Services</a></li>
                    <li> <a href="/free-sales-tax-calculator#PageSection1">Online Lookup</a></li>
                    <li><a href="/free-sales-tax-calculator#PageSection2">Database Interface</a></li>
                    <li><a href="/free-sales-tax-calculator#PageSection3">CSV Tax Tables</a></li>                
                  </ul>

    </li>

    <li <%=activePageClass(3)%> class="dropdown">
        <a href="/free-sales-tax-calculator" 
			rel="dropmenuServices" data-toggle="dropdown" class="dropdown-toggle">Support   <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="/frequently-asked-questions">FAQs</a></li>
                    <li><a href="/developers-interface">Developers</a></li>
                    <li><a href="/sample-tables">Sample Tables</a></li>
                    <li><a href="/resources">Resources</a></li>             
                  </ul>
              </li>              
           

 </ul>
            </nav>
          </div> 

<%
  If Session("z2t_loggedin") = "True" Then
%>
      <li <%=activePageClass(4)%> class="dropdown">

        <a href="/my-account"
           title="Information About Your Account"
           rel="dropmenuAccount" data-toggle="dropdown" class="dropdown-toggle">Account   <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="/account-usage">Subscriber Usage</a></li>
                    <li><a href="/account-table-download">Table Download</a></li>
                    <li><a href="/account-renew">Renew Online</a></li>
                    <li><a href="/Website/pagesAccount/z2t_badges.asp">Badges&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>             
                    <li><a href="javascript:clickLogout();">Log Out</a></li>             
                  </ul>
           
           </li>
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

  
<%
  If Session("z2t_loggedin") = "True" Then
%>
  <!-- 4th drop-down menu -->
  <div id="dropmenuAccount" class="dropmenudiv_e" style="width:200px">
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

/
