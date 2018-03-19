<%
If Session("ServicesURL") = "Free" Then
	ServicesURL = "http://www.Zip2Tax.com/Free/z2t_Services_Free.asp"
Else
	ServicesURL = "http://www.Zip2Tax.com/z2t_services.asp"
End If
%>

  <div class="footerlinkscolumn1">
    <p class="footerlinks">
    <a href="/" title="Zip2Tax.com Home Page" class="footerlinks"><b>Home</b></a><br><br>
    <a href="/sales-tax-service-providers" title="Learn more about Zip2Tax" class="footerlinks">About Us</a><br>    
    <a href="/our-commitment" title="Quality, reliable data" class="footerlinks">Quality pledge</a><br>
    <a href="/who-uses-our-services" title="Learn who uses Zip2Tax services" class="footerlinks">Customers</a><br>  
    <a href="/testimonials" class="footerlinks">Testimonials</a><br>
    <a href="/Website/pagesHome/z2t_sitemap.asp" title="Index of the Zip2Tax Web Site" class="footerlinks">Site Map</a><br> 
    </p>
  </div>
  
  <div class="footerlinkscolumn1">
    <p class="footerlinks">
    <a href="/how-to-calculate-sales-tax" class="footerlinks"><b>Tax Rates</b></a><br><br>
    <a href="/sales-tax-calculator" title="Use our lookup service" class="footerlinks">ZIP Code Lookup</a><br>
    <a href="/sales-tax-by-zipcode"  class="footerlinks">Spot-On&trade; Lookup</a><br>
    <a href="/desktop-application" class="footerlinks">Desktop Widget</a><br>
    <a href="/sales-tax-by-state" class="footerlinks">Taxes By State</a><br>
    <a href="http://blog.zip2tax.com/" class="footerlinks">News Blog</a> 
    </p>
  </div>
  
  <div class="footerlinkscolumn1">
    <p class="footerlinks">
    <a href="/free-sales-tax-calculator" class="footerlinks"><b>Products</b></a><br><br>
    <a href="/comparison-chart" class="footerlinks">Compare Services</a><br>
    <a href="/free-sales-tax-calculator#PageSection1" title="Zip2Tax online lookup service" class="footerlinks">Online Lookup</a><br>
    <a href="/free-sales-tax-calculator#PageSection2" title="Zip2Tax database interface" class="footerlinks">Database Interface</a><br>
    <a href="/free-sales-tax-calculator#PageSection3" title="Zip2Tax sales and use tax tables" class="footerlinks">.CSV Tax Tables</a><br>
    </p>
  </div>
  
  <div class="footerlinkscolumn1">
    <p class="footerlinks">
    <a href="/contact-us" title="Learn how to contact us" class="footerlinks"><b>Support</b></a><br><br>
    <a href="/frequently-asked-questions" class="footerlinks">FAQs</a><br>
    <a href="/developers-interface" title="Learn how to connect to our database" class="footerlinks">Developers</a><br> 
    <a href="/sample-tables" class="footerlinks">Sample Tables</a><br>
    <a href="/resources" title="Value-added business resources" class="footerlinks">Resources</a><br>
    </p>
  </div>
  
  <%
    If Session("z2t_loggedin") = "True" Then
  %>
  <div class="footerlinkscolumn1">
   <p class="footerlinks">
   <a href="/my-account" class="footerlinks"><b>My Account</b></a><br /><br>
   <a href="/account-usage" class="footerlinks">Subscriber Usage</a><br>
   <a href="/account-table-download" class="footerlinks">Table Download</a><br>
   <a href="/account-renew" class="footerlinks">Renew Online</a><br>
   <a href="/Website/pagesAccount/z2t_badges.asp" class="footerlinks">Badges</a><br>
   <a href="javascript:clickLogout();void(0);" class="footerlinks">Log Out</a>
   </p>
  </div>
  <%
    End If
  %>  
  
  <!-- Creates a 10px white space between the footer and the very bottom footer -->
  <div class="whitespace1"></div>  

<%
function activePage(s)
    if Session("activePage") = s then
        activePage = " class='active'"
    else
        activePage = ""
    end if
end function
%>

