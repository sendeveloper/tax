<%
If Session("z2t_loggedin") = "True"  Then
	whereTo1="<a href=""javascript:clickGetRate();"" class=""btn btn-danger btn-sm"" id=""getratebutton"">Get Rate</a>"
	whereTo2="<a href=""javascript:clickGetTax('calc');"" class=""btn btn-danger btn-sm"" id=""getSaleUseTaxbutton"">Calculate</a>"
else
	whereTo1="<button type=""button"" class=""btn btn-danger btn-sm"" id=""lookupOpener"">Get Rate</button>"
	whereTo2="<button type=""button"" class=""btn btn-danger btn-sm"" id=""lookupOpener2"">Calculate</button>"
end if


%>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACJstxRGIbX8Mv_I2-a8tOLN0d620APjo&v=3.exp&callback=initialize"></script>

<div class="col-md-9 content">
	<%=HeadingH1("ZIP Code Lookup with Sales Tax Calculator")%>
	<table class="table table-bordered" style="margin: 40px; width: 95%;">
	  <tr style="vertical-align:top;"> 
		<td>
		  <form id="frmLookupSalesTax" method="Post" name="frmLookupSalesTax">
		  <div class="row">
			<div class="col-md-12 left">
				<a href="https://en.wikipedia.org/wiki/Sales_taxes_in_the_United_States" 
					target="_blank" style="text-decoration:none!important;color:#4A5157!important;">Use</a> 
				this handy sales tax calculator to determine the general
				sales tax rate used for a particular ZIP code. Click on [Show] to see details about the sales tax rate at the state,
				county, city, and special district levels.			
			</div>
		  </div>
          <div class="clearfix"></div>
		  <div class="row">
			<div class="col-md-3" style="padding-bottom:5px">
				<INPUT class="form-control input-sm" TYPE="Text" NAME="inputZip" ID="inputZip" placeholder="Enter ZIP Code"  MaxLength="5" onKeyPress="return numbersonly(this, event);" tabindex="1">
			</div>
			<div class="col-md-3" style="padding-bottom:5px">
				<%=whereTo1%>
			</div>
			<div class="col-md-3" style="padding-bottom:5px">
				<INPUT class="form-control input-sm" TYPE="Text" NAME="inputAmt" ID="inputAmt" placeholder="Enter Dollar Amount"  maxLength="10" onKeyPress="return numbersonly(this, event, true);" tabindex="2">
			</div>
			<div class="col-md-3" style="padding-bottom:5px">
				<%=whereTo2%>
			</div>
		  </div>


		  </form>
		</td>
	  </tr>

	  <tr style="vertical-align:top;"> 
		<td style="text-align:center;">
		  <table style="width: 100%; padding: 3px;">

			<tr style="vertical-align:top;">
			  <td style="width: 55%;">
				<table style="width: 100%; padding: 3px;">

				  <tr>
					<td class="lookupLabel" style="width: 33%;">
					  ZIP Code:
					</td>
					<td class="lookupResult" style="width: 67%; text-align: left;">
					  <%=LookupResults.zipInput%>&nbsp;
					</td>
				  </tr>

				  <tr>
					<td class="lookupLabel">
					  Sales Tax Rate:
					</td>
					<td class="lookupResult" style="text-align: left;">
					  <span 
						onMouseOver='altOn(this, "Sales Tax Breakout For <%=LookupResults.DisplayCity%>",
						"<%=LookupResults.BreakoutHTML%>", event);'
						onMouseOut='altOff();'>

						<span ID="result_rate" style="font-size: 16px; color: red;"><%=LookupResults.SalesRate%></span>
						<span style="font-size: 12px; color: red;"><%=LookupResults.PercentSign%></span>&nbsp;&nbsp;&nbsp;
						<%=LookupResults.RatePercent%>&nbsp;
					  </span>
					</td>
				  </tr>

				  <tr>
					<td class="lookupLabel">
					  Use Tax Rate:
					</td>
					<td class="lookupResult" style="text-align: left;">
					<% If SubscriptionData.HasSubscriptionAddon(cWebLookup, cLookupUseTax) Then%>
					  <span 
						onMouseOver='altOn(this, "Use Tax Breakout For <%=LookupResults.DisplayCity%>",
						"<%=LookupResults.UseTaxBreakoutHTML%>", event);'
						onMouseOut='altOff();'>

						<span ID="use_rate" style="font-size: 16px; color: red;"><%=LookupResults.UseRate%></span>
						<span style="font-size: 12px; color: red;"><%=LookupResults.PercentSign%></span>&nbsp;&nbsp;&nbsp;
						<%=LookupResults.UseRatePercent%>&nbsp;
					  </span>
					<% ElseIf Not IsEmpty(Request.QueryString("inputZip")) Then %>
					<span style="font-size: 12px; color: red;"><a href="/free-sales-tax-calculator">Purchase</a></span>&nbsp;&nbsp;&nbsp;
					<% Else
						Response.Write("&nbsp;")
					   End If %>
					</td>
				  </tr>

				  <tr>
					<td class="lookupLabel">
					  City:
					</td>
					<td class="lookupResult" style="text-align: left;">
					<%
						'If (Len(LookupResults.Spm_Path) <> 0) Then
						 '   Response.Write("<a href=""" & LookupResults.Spm_Path & ".html"" target=""_blank"">" & LookupResults.City & "</a>&nbsp;")
						'Else
							Response.Write(LookupResults.City & "&nbsp;")
						'End If
										Dim MainCity: MainCity = LookupResults.City

						Dim city
						city = LookupResults.City

					%>
					</td>
				  </tr>

				  <tr>
					<td class="lookupLabel">
					  County:
					</td>
					<td class="lookupResult" style="text-align: left;">
					  <%=LookupResults.County%>&nbsp;
					</td>
				  </tr>

				  <tr>
					<td class="lookupLabel">
					  State:
					</td>
					<td class="lookupResult" style="text-align: left;">
					  <span ID="result_state"><%=LookupResults.State%></span>&nbsp;
					</td>
				  </tr>
				</table>
			  </td>

			  <td style="width: 45%;">
				<table style="width: 45%; padding: 3px;">

				  <tr style="vertical-align:top;">
					<td class="lookupLabel" style="width: 40%;">
					  Dollar&nbsp;Amount:
					</td>
					<td class="lookupResultTax" style="width: 60%;">
					  <span id="result_amt">&nbsp;</span>&nbsp;
					</td>
				  </tr>

				  <tr>
					<td class="lookupLabel" style="color: red;">
					  Sales Tax:
					</td>
					<td class="lookupResultTax" style="border-bottom: 1px solid gray;">
					  <span id="result_tax">&nbsp;</span>&nbsp;
					</td>
				  </tr>

				  <tr>
					<td class="lookupLabel">
					  Total&nbsp;Sale:
					</td>
					<td class="lookupResultTax">
					  <span id="result_tsale">&nbsp;</span>&nbsp;
					</td>
				  </tr>

				  <% If SubscriptionData.HasSubscriptionAddon(cWebLookup, cLookupUseTax) Then%>

				  <tr>
					  <td>
						<br>
					  </td>
				  </tr>

				  <tr>
					  <td class="lookupLabel" style="width: 40%;">
							Dollar Amount:
					  </td>
					  <td class="lookupResultTax" style="width: 35%;">
							<span id="use_result_amt">&nbsp;</span>
					  </td>
				  </tr>

				   <tr>
					  <td class="lookupLabel" style="color: red;">
					    Use Tax:
					  </td>
					  <td class="lookupResultTax" style="border-bottom: 1px solid gray;">
						   <span id="use_result_tax">&nbsp;</span>
					  </td>
				  </tr>

				   <tr>
					<td class="lookupLabel">
							Total Sale:
					  </td>
					  <td class="lookupResultTax">
							<span id="use_result_tsale">&nbsp;</span>
					  </td>
				  </tr>

					  <% End If %>

				</table>
			  </td>
			</tr>

		  </table>
		</td>
	  </tr>

	  <% If (LookupResults.Count > 0) Then %>

	   <tr>
		<td>
		  <table style="width: 100%; padding: 2px;">
		   <font size="2">
			<tr>
			  <td class="eg-bar" style="color: red;" colspan="2">
				<span id="faqtable1-title" class="iconspan">Show</span>
				<div style="text-align: center;">Sales Tax Breakout For <% Response.Write(LookupResults.City & "&nbsp;") %></div>
			  </td>
			</tr>
			<tr>
			  <td style="color: black;" colspan="2">
				<div id="faqtable1" class="icongroup2">
				<%=replace(replace(replace(LookupResults.BreakoutHTML, """<TABLE>", "'<TABLE>"), "</TABLE>""", "</TABLE>'"), "\""", """")%>
				</div>
			  </td>
			</tr>
			</font>
		  </table>

		   <script type="text/javascript">                       //beginning of Java Script for breakout HTML
			   var faqtable = new switchicon("icongroup2", "div") //Limit scanning of switch contents to just "div" elements
			   faqtable.setHeader('[Hide]', '[Show]') //Set header HTML
			   faqtable.collapsePrevious(false) //Allow more than 1 content to be open simultanously
			   faqtable.setPersist(false) //Enable persistence to remember last switch content states for 7 days
			   faqtable.init()
			</script>

		</td>
	  </tr>

	  <% If SubscriptionData.HasSubscriptionAddon(cWebLookup, cLookupUseTax) Then%>

	  <tr>
		<td>
		  <table style="width: 100%; padding: 2px;">
		  <font size="2">
		  <tr>
			  <td class="eg-bar" style="color: red;" colspan="2">
				<span id="faqtable2-title" class="iconspan">Show</span>
				<div style="text-align: center;">Use Tax Breakout For <% Response.Write(LookupResults.City & "&nbsp;") %></div>
			  </td>
			</tr>
			<tr>
			  <td style="color: black;" colspan="2">
				<div id="faqtable2" class="icongroup2">
				<%=replace(replace(replace(LookupResults.UseTaxBreakoutHTML, """<TABLE>", "'<TABLE>"), "</TABLE>""", "</TABLE>'"), "\""", """")%>
				</div>
			  </td>
			</tr>
			</font>
		  </table>

		   <script type="text/javascript">                       //beginning of Java Script for breakout HTML
			   var faqtable = new switchicon("icongroup2", "div") //Limit scanning of switch contents to just "div" elements
			   faqtable.setHeader('[Hide]', '[Show]') //Set header HTML
			   faqtable.collapsePrevious(false) //Allow more than 1 content to be open simultanously
			   faqtable.setPersist(false) //Enable persistence to remember last switch content states for 7 days
			   faqtable.init()
			</script>

		</td>
	  </tr>

	  <% End If %>


	  <% End If %>



<%
'Other Communities
If (LookupResults.Count > 1) Then
%>

	  <tr>
		<td>
		  <table style="width: 100%; padding: 2px;">
			<tr>
			  <td style="color: red;" colspan="4">
				<div style="text-align: center;">Other Communities Using <%=LookupResults.zipInput%></div>
			  </td>
			</tr>
<%
While (LookupResults.NextTaxRecord)
%>
		   
			<tr>
			  <td width="30%">
				&nbsp;&nbsp;&nbsp;&nbsp;<%=LookupResults.DisplayCity%>
			  </td>
			  <td width="30%">
				<%=LookupResults.County%> County
			  </td>
			  <td width="20%">
				<span 
				  onMouseOver='altOn(this, "Sales Tax Breakout For <%=LookupResults.DisplayCity%>",
				  "<%=LookupResults.BreakoutHTML%>", event);'
				  onMouseOut='altOff();'>

				  <%=LookupResults.SalesRate%>% &nbsp;&nbsp; 
				  <span style="font-size: 10px;"><%=LookupResults.RatePercent%></span>
				</span>
			  </td>
			  <td width="20%">
				<font size="1" style="color: red;">
					<span id="<%=LookupResults.DisplayCity%>-title" class="iconspan">Show</span>
				</font>
			  </td>
			</tr>

			<tr>
				<td colspan="4">
				   <font size="1">
					  <div id="<%=LookupResults.DisplayCity%>" class="icongroup2">
					  <table style="width: 100%;">
						<tr>
							<td style="color: red; text-align: center;">
							  Sales Tax Breakout For <%=LookupResults.DisplayCity%>
							</td>
						</tr>
						<tr>
							<td>
			  <%=replace(replace(replace(iif(isNull(LookupResults.BreakoutHTML), "", LookupResults.BreakoutHTML), """<TABLE>", "'<TABLE>"), """</TABLE>", "'</TABLE>"), "\""", """")%>
							</td>
						</tr>
					  </table>
					  </div>
				   </font>
				</td>
			</tr>


<%
Wend
%>

		  </table>

		  <script type="text/javascript">
			  var faqtable = new switchicon("icongroup2", "div") //Limit scanning of switch contents to just "div" elements
			  faqtable.setHeader('[Hide]', '[Show]') //Set header HTML
			  faqtable.collapsePrevious(false) //Allow more than 1 content to be open simultanously
			  faqtable.setPersist(false) //Enable persistence to remember last switch content states for 7 days
			  faqtable.init()
		  </script>

		</td>
	  </tr>

<%
End If

'Special Notes
If (LookupResults.HasSalesTax = True) Then
Dim PreviousJurisdiction
PreviousJurisdiction = ""

If (LookupResults.NotesCount > 0) Then        
%>

	  <tr>
		<td>
		  <table style="width: 100%; padding: 2px;">
<%
	Do
		Jurisdiction = "Special Rules For The " & LookupResults.Jurisdiction
		If Jurisdiction <> PreviousJurisdiction Then
%>
			<tr>
			  <td style="color: red; text-align: center;" colspan="2">
				<%=Jurisdiction%>
			  </td>
			</tr>

<%
			PreviousJurisdiction = Jurisdiction
		End If
%>

			<tr style="vertical-align:top;">
			  <td width="25%">
				&nbsp;&nbsp;&nbsp;&nbsp;<%=LookupResults.Category%>:
			  </td>
			  <td width="75%">
				<%=LookupResults.RateNote%>
			  </td>
			</tr>
<%
	Loop While (LookupResults.NextTaxNote)
%>
		  </table>
		</td>
	  </tr>

<%
End if
End If

'Tax Maps
TaxMapName = ""
If UCase(MainCity) = "ATLANTA" and UCase(LookupResults.State) = "GA" Then
TaxMapName = "Atlanta_GA.png"
End If

If TaxMapName <> "" Then
TaxMapText = "Tax Map For " & MainCity & ", " & LookupResults.State & " <br>(Click on Map for Pop-up Image)<br>"
TaxMapImage = "<img src='" & pathBase & "Website/pagesTaxRates/Maps/images/" & _
	MainCity & "_" & LookupResults.State & ".png' " & _
	"Align='center' Height='50%' Width='50%' Alt='Click for pop-up image' Title='Click for pop-up image'>"
TaxMapPath = "javascript:openPopUp('" & pathBase & "Website/pagesTaxRates/Maps/TaxMapPopUp.asp" & _
	"?city=" & MainCity & _
	"&state=" & LookupResults.State & "');"
%>

	  <tr>
		<td colspan="2">
		  <table style="width: 100%; padding: 2px;">
			<tr>
			  <td style="color: red; text-align: center;">
				<%=TaxMapText%>
			  </td>
			</tr>
			<tr>
			  <td style="text-align: center;">
				<a href="<%=TaxMapPath%>">
				  <%=TaxMapImage%></a>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>

<%
End If

If (LookupResults.HasSalesTax = False) And (LookupResults.Count > 0) Then
%>


	  <tr>
		<td>
		  <table style="width: 100%; padding: 2px;">
			<tr>
			  <td style="color: red;">
				<%=LookupResults.Jurisdiction%>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>

<%
End If

If (LookupResults.ErrorMessage <> cBlankData) Then
%>


	  <tr>
		<td>
		  <table style="width: 100%; padding: 2px;">
			<tr>
			  <td style="color: red; text-align: center;">
				<%=LookupResults.ErrorMessage%>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
<%
	End If
%>
	</table>

<% 
    If LookupResults.zipInput <> "" Then 
      Set rs = Sql(sqlText)
      If not rs.eof Then
          Set rs = Sql(sqlText)
          %>
            <div style="border: 1px solid black; width: 95%; height: 20em; margin-left: 40px;">
              <div id="map_canvas2"></div>
            </div>
<%
          Else
%>
            <p>
            <img border="0" src="//maps.googleapis.com/maps/api/staticmap?center=<%=LookupResults.zipInput%>,<%=city%>,<%=LookupResults.State%>&markers=color:red%7C<%=LookupResults.zipInput%>,<%=city%>,<%=LookupResults.State%>&zoom=13&size=570x250&maptype=roadmap&sensor=false&key=AIzaSyACJstxRGIbX8Mv_I2-a8tOLN0d620APjo">
             </p><br><br>
<%
      End If
%>
           
<% 
    End If 
%>
	<div class="clearfix"></div>
	
	<div class="fb-like" data-href="https://www.facebook.com/Zip2Tax/" 
		data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true" style="margin-left: 40px;">
	</div>
	
	<div class="clearfix"></div>

	<%=HeadingH2("How to Use Our Sales Tax Calculator")%>
	
	<p style="margin-left: 40px;">
		Our sales tax calculator is easy to use. We offer two easy ways to estimate sales tax costs with our sales tax calculator.<br><br>
		
		One way is to simply punch in the applicable ZIP code for your transaction, click "Get Rate" and you'll be provided with the applicable sales tax rate. 
		We also allow you to enter a dollar amount, click "Calculate," and we'll provide you with the total sales tax cost and total sale cost, based off of 
		your provided information.<br>
	</p>
	
	<div class="clearfix"></div>
	
	<div style="padding-left: 60px; width: 97%;">
		<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/SpotOnBanner.asp" -->
	</div>
</div>