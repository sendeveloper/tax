<%
	set con = server.createobject("adodb.connection")
	con.open connStrPublic
	Set cmd = Server.CreateObject("ADODB.Command")   
	cmd.CommandTimeout = 120
	cmd.ActiveConnection = con
				
	sqlstr="z2t_EntityPages_US_State_list"
	cmd.CommandText = sqlstr
	cmd.CommandType  = 4
	set rs=cmd.execute()		
	Dim stateName(51), stateNameSEO(51), stateCoords(51), stateCoords2(51), stateCode(51)
	i=0
	do while not rs.eof
	i=i+1 
		stateName(i)=rs(1):		stateNameSEO(i)=rs(2):		stateCoords(i)=rs(3):  stateCoords2(i)=rs(4) : stateCode(i)=rs(0)
	rs.movenext
	loop
	%>
	
	
<%
	For i = 1 to 51
		stateList = stateList & "'" & stateName(i) & "', " 
	Next
	stateList = left(stateList, Len(stateList) - 2)
%>
<script language="javascript" type = "text/javascript">

    var stateName = new Array('', <%=stateList%>)
		  
    function stateMouseover(i)
        {
        document.getElementById('mapMouseover').innerHTML = 'Click for additional sales tax information about ' + stateName[i];
        }

    function stateMouseout()
        {
        document.getElementById('mapMouseover').innerHTML = 'Click any state for additional information';
        }

		$(function(){
		});
		
</script>
<style type="text/css">
      ul#myList li {margin-left: 2em;}	   
      h1 {text-align: left; margin-top: 1em; margin-bottom: 1em;}
      h2 {margin-bottom: .5em;}
      ul.disc {list-style: disc outside none !important;}

      .box h1 {margin-bottom: 0em; margin-top: 0em;}
      .box h2 {margin-bottom: 0em;}
      .post > h1.title {
        margin: 45px 0 20px 0;
        padding-left: 33px;
        background: url(/Website/Images/star.gif) no-repeat left top !important;}

      .post h2.title {
        margin: 45px 0 20px 0;
        padding-left: 33px;
        margin-left: -33px;
        background: url(/Website/Images/star.gif) no-repeat left top !important;}

      /* h2.title {margin-left: -5em;} */
    </style>

	<div class="col-lg-6 col-md-9 content">
	<h2>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Sales and Use Tax Rates By State <span style="white-space: nowrap;">And The Details You Need To Know</span>
	</h2>
	<h3>
		<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		What are sales taxes?
	</h3>	
	
	<p><span class="firstword">Sales taxes are a state-imposed fee</span> that is collected on most retail purchases. 
      Individual states  determine what percentage of a retail sale is to be collected, and what types of sales can be exempted. 
	  While the buyer is  responsible for paying the tax, it is the seller who is normally tasked with collecting the tax from 
	  the buyer and remitting it to the state in a timely fashion. 
	</p>
	<p><span class="firstword">Tax rates and tax codes</span> vary considerably from state to state across the United States, 
	  the District of Columbia and the various possessions. Most states don't levy a state-wide flat tax rate, but rather, allow 
	  each county, city, and special district to add on an additional tax of their own. To see detailed information about the 
	  general sales tax rates and laws for any given state, click on the map below or use this pull down menu.
	
	<!-- State Dropdown Menu -->
	<select name="URL" onchange="location = this.options[this.selectedIndex].value;">
		<option value="Select a State">Select a State</option>
		<%
			For i = 1 to 51
			Response.Write vbTab & vbTab & _
					"<option value='/"&stateCode(i)&"/" & stateNameSEO(i) &"'>" & _
					stateName(i) & "</option>" & vbCrLf
			Next
		%>
	</select>
	  <!-- Map -->
	</p>
	
<img src="/Website/Images/States/US-sales-tax-map.png" 
		alt="clickable US Map" name="US-sales-tax-map" width="600" height="400" border="0" 
		usemap="#m_US-sales-tax-map" onMouseout='stateMouseout();'>
		
      <p><map name="m_US-sales-tax-map">
		  
		<%
			For i = 1 to 51
				Response.Write vbTab & _		                    
					"<area shape='poly' " & _
					"coords='" & stateCoords(i) & "' " & vbCrLf & _
					vbTab & vbTab & _
					"href='/"&stateCode(i)&"/" & stateNameSEO(i) &"' " & vbCrLf & _
					vbTab & vbTab & _
					"alt='" & stateName(i) & " Sales Tax Information' title='Sales Tax Information for " & stateName(i) & "' " & vbCrLf & _
					vbTab & vbTab & _
					"onMouseover='stateMouseover(" & i & ");'>" & vbCrLf
				If stateCoords2(i) <> "" Then
					Response.Write vbTab & _
						"<area shape='poly' " & _
						"coords='" & stateCoords2(i) & "' " & vbCrLf & _
						vbTab & vbTab & _
						"href='/"&stateCode(i)&"/" & stateNameSEO(i) &"' " & vbCrLf & _
						vbTab & vbTab & _
						"alt='" & stateName(i) & " Sales Tax Information' title='Sales Tax Information for " & stateName(i) & "' " & vbCrLf & _
						vbTab & vbTab & _
						"onMouseover='stateMouseover(" & i & ");'>" & vbCrLf		
				End If
			Next
		%>
      </map>
	  <span id="mapMouseover" style="display: inline-block; font-weight: bold; font-size: 12pt; width: 100%; text-align: center;">
	    Click any state for additional information
	  </span>
	  </p>	
	
	<p><span class="firstword">To see a full breakout</span> of sales tax rates for the entire country by state, county, city 
	  and special district, use our easy United States <a href="/sales-tax-calculator">sales tax calculator</a>. 
	  After putting in any ZIP code, you can enter a retail price to calculate sales tax totals.</p>

    <p><span class="firstword">Taxes in the U.S.</span> are either destination-based, meaning the sales tax rate is based, or 
	  determined from, the destination an item is shipped to, or origin-based, meaning the rate is determined by the location 
	  the sale took place. It is critical for a retailer to know if the states they are selling product in and/or too are 
	  destination or origin based. This makes it complicated for retailers who need to have the exact and up-to-date sales tax 
	  rate for a "moving target".</p>

	<h3>
		<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		What is use tax?
	</h3>	
	  
    
	<p><span class="firstword">In most states,</span> use tax is due on every retail purchase that was not charged sales tax, 
	  excluding tax-exempt sales. Many, but not all, states charge use tax at the same percentage as sales tax. In some states, 
	  use tax rates differ from sales tax rates at the state, county, city and/or special district levels.</p>
      
    <p><span class="firstword">Many U.S. tax payers</span> do not realize that use tax is due to the state you reside in on 
	  ALL transactions where sales tax has not been paid, even out-of-state internet sales.</p>
      
	<h3>
		<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		How do you know who has to pay whom?
	</h3>	

      <p><span class="firstword">In general</span>, a business must collect and remit all applicable sales taxes if that business 
	  has nexus, a physical presence such as a brick-and-mortar location, within a given state. The presence of an employee or 
	  salesperson, delivery by the seller's vehicle, and storage of materials usually establishes nexus.</p>
      
      <p><span class="firstword">Nexus definitions vary</span> from state to state. Many states say that an out-of-state seller 
	  is required to collect tax if they can be defined as "doing substantial business" in a given state. "Substantial business" 
	  can sometimes include: out-of-state businesses using in-state affiliates, advertisers or vendors, or businesses that make 
	  internet sales or mail catalogs.</p>
      
      <p><span class="firstword">If you are not sure</span> if you have established nexus in a given state, you can usually get 
	  free help by contacting the state's <a href="/frequently-asked-questions#states"> Department of Revenue.</a> You 
	  could also contact a qualified <a href="/resources">certified public 
	  accountant or lawyer who specializes in sales tax.</a> 
	</p>
	
	<h3>
		<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		Special rules applying to sales and use taxes in the United States
	</h3>	
	
      <ul style="list-style-type: disc !important; list-style-position: outside !important;" id="myList">
        <li>Shipping is frequently not taxable if stated separately on the invoice.</li>
        <li>Finance charges are often exempt from sales tax, when stated separately.</li>
        <li>Often, non-discretionary items, such as food and clothing, are taxed at a rate which is not the same as the general sales tax.</li>
        <li>Frequently, some items are exempted from sales tax for short periods of time, usually called sales tax holidays.</li>
      </ul>
	  
      <p><span class="firstword">Sales taxes are but one of a mixture</span> of different types of taxes that are used to maintain 
	  government, infrastructure, and state-run programs. Other types of taxes include income, corporate, payroll, excise, and more.</p>
	  
      <p><span class="firstword">Since state legislators</span> can vote to change sales and use tax rates at any time, it is very 
	  difficult for individuals to keep track of the changes. The population of most states is also rapidly changing, which can 
	  cause frequent updates to the ZIP codes as well as local municipality names, which complicates the job of keeping track of 
	  sales tax jurisdictions.</p>
   
   		<a href="http://taxfoundation.org/tax-topics/state-taxes" target="_new">The Tax Foundation</a><br>
   		<a href="http://en.wikipedia.org/wiki/United_States" target="_new">The United States</a><br>
   		<a href="http://blog.zip2tax.com/state-sales-tax-holidays/" target="_new">State Sales Tax Holidays</a><br>
		
		
</div>