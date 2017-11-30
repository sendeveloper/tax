<div class="col-md-9 content">
<div  class="post">
	<h1>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	<%=Statefullname%> Sales Tax and Use Tax
	</h1>
	
	
	<h3>
		<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		What is the <%=Statefullname%> sales tax?
	</h3>
	<p>
	</p>	

	<p>
	<span id="img-small" class="imgRight" style="text-align: center; cursor: pointer; display: block;">
		<a id="single_1" href="/Website/Images/States/<%=State%>-lg.png" title="[<%=Statefullname%> sales tax rates for each jurisdiction]">
			<img src="/Website/Images/States/<%=State%>.png" alt="[<%=Statefullname%> sales tax rates for each jurisdiction]" />
		</a><br>
		<span style="cursor: pointer; font-size: .75em;">Click for larger image</span>
	  </span>
	  <span class="firstword">The <%=Statefullname%> sales tax rate</span> is currently <%=StateRate%>%. In <%=Statefullname%>, <%=Jurisdictions_Text%> can add sales taxes on top of the state rate.</p>
    
	<p><span class="firstword">Taxes in <%=Statefullname%></span> are <%=OriginText%>, meaning the <%=Statefullname%> sales tax rate is based, or determined from, the <%=SourceText%></p>
      
    <p><span class="firstword">To see a full breakout</span> of <%=Statefullname%> sales tax rates by state, county, city and special district, use our easy <%=Statefullname%> <a href="/sales-tax-calculator">sales tax calculator</a>.  After putting in any ZIP code, you can enter a retail price to calculate <%=Statefullname%> sales tax totals.</p>
	<script type="text/javascript">
	function newPopup(url) {
		popupWindow = window.open(url,'popUpWindow','height=700,width=900,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes');
	}
	</script>
	<p><a href="JavaScript:newPopup('/Website/Inbound/z2t_signup.asp');"> <img src="/Website/Images/marketing/tax-essentials-small-business-sm.jpg" alt='Essential Guide to Sales and Use Tax for Small Business' width="75" height="95" style="vertical-align:middle" class="imgLeft">
		Download "The Essential Guide to Sales and Use Tax for Small Business" 
		<br> FREE today and quickly get a handle on what the states are expecting 
		<br>from a business today.</a>
	</p>
	<div class="clearfix"></div>

	<h3>
		<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		What is the <%=Statefullname%> use tax?
	</h3>

	<p><span class="firstword">The <%=Statefullname%> state</span> use tax rate is <%=useTaxBaseText%>.</p>
	
	<p><span class="firstword">If you reside in <%=State%></span>, use tax is due to the state on any and all transactions where sales tax has not been paid, even out-of-state internet sales.</p>
      
	<h3>
		<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		Who has to pay <%=Statefullname%> sales tax or use tax?
	</h3>

	<p><span class="firstword">In general</span>, a business must collect and remit all applicable <%=Statefullname%> sales taxes if that business has nexus, a physical presence such as a brick-and-mortar location, within a given state. The presence of an employee or salesperson, delivery by the seller's vehicle, and storage of materials usually establishes nexus as well.</p>
      
    <p><span class="firstword"><%=Statefullname%> says</span> that an out-of-state seller is required to collect tax if they can be defined as <%=NexusDefText%>. <%=Statefullname%>&nbsp;<%=NexusText%> additional laws establishing nexus for other reasons such as out-of-state businesses using in-state affiliates, advertisers or vendors, or businesses that make internet sales or mail catalogs.</p>
      
    <p><span class="firstword">If you are not sure</span> if you have established nexus in <%=Statefullname%>, you can usually get free help by contacting the <%=Statefullname%>&nbsp;<%=ContactText%>. <a href="/frequently-asked-questions#states">Click here</a> for an updated listing of direct phone numbers. You could also contact a qualified certified public accountant or lawyer who specializes in tax law in <%=Statefullname%>.
		<a href="/resources">Click here</a> for listing of recommended resources.
	</p>

	<h2 class="title">Special rules applying to <%=Statefullname%> sales tax and use taxes</h2>
	<ul style="list-style-type: disc !important; list-style-position: outside !important;">
	<li>Shipping <%=ShippingText%>.</li>
	<li>Finance charges are <%=FinanceText%>.</li>
	<li>Clothing is <%=ClothingText%>.</li>
	<li><%=Statefullname%> Sales tax holidays <%=HolidayText%>.</li></ul>

	<p><span class="firstword">Since <%=Statefullname%> legislators</span> can vote to change the <%=Statefullname%> sales tax and use tax rates at any time, it is very difficult for individuals to keep track of the changes. The population of <%=State%> state is also rapidly changing, which can cause frequent updates to the ZIP codes and local municipality names and complicates the job of keeping track of <%=Statefullname%> sales tax jurisdictions.</p>

	<p>
	<%for i=1 to 4
	if eval("linkName"&i)<>"" then%>
	<a href="<%=eval("linkURL"&i)%>" target="_blank"><%=eval("linkName"&i)%></a><br>
	<%
	end if
	next
	%>
	</p>
	  
	  
	
</div>
</div>