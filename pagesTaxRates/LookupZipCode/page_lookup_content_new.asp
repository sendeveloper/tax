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
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&callback=initialize"></script>

<div class="col-md-9 content">
	<h1>
	<span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	ZIP Code Lookup with Sales Tax Calculator
	</h1>
<div class="clearfix"></div>
<table class="table table-bordered">
	  <tr valign="top"> 
		<td align="center">
		  <form id="frmLookupSalesTax" method="Post" name="frmLookupSalesTax">
		  <div class="row">
			<div class="col-md-12 center">
				<a href="http://en.wikipedia.org/wiki/Sales_taxes_in_the_United_States" target="_blank" style="text-decoration:none!important;color:#4A5157!important;">Use</a> this handy sales tax calculator to determine the general
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

	  <tr valign="top"> 
		<td align="center">
		  <table width="100%" border="0" cellspacing="3" cellpadding="3">

			<tr valign="top">
			  <td width="60%">
				<table width="100%" border="0" cellspacing="3" cellpadding="3">

				  <tr>
					<td width="33%" align="right">
					  ZIP Code:
					</td>
					<td width="67%" align="left" class="lookupResult">
					  <%=LookupResults.zipInput%>&nbsp;
					</td>
				  </tr>

				  <tr>
					<td align="right">
					  Sales Tax Rate:
					</td>
					<td align="left" class="lookupResult">
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
					<td align="right">
					  Use Tax Rate:
					</td>
					<td align="left" class="lookupResult">
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
					<td align="right">
					  City:
					</td>
					<td align="left" class="lookupResult">
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
					<td align="right">
					  County:
					</td>
					<td align="left" class="lookupResult">
					  <%=LookupResults.County%>&nbsp;
					</td>
				  </tr>

				  <tr>
					<td align="right">
					  State:
					</td>
					<td align="left" class="lookupResult">
					  <span ID="result_state"><%=LookupResults.State%></span>&nbsp;
					</td>
				  </tr>
				</table>
			  </td>

			  <td width="40%">
				<table width="100%" border="0" cellspacing="3" cellpadding="3">

				  <tr valign="top">
					<td width="40%" align="right">
					  Dollar&nbsp;Amount:
					</td>
					<td width="35%" class="lookupResultTax">
					  <span id="result_amt">&nbsp;</span>&nbsp;
					</td>
				  </tr>

				  <tr>
					<td align="right">
					  <font color="red">
						Sales Tax:
					  </font>
					</td>
					<td class="lookupResultTax" style="border-bottom: 1px solid gray;">
					  <span id="result_tax">&nbsp;</span>&nbsp;
					</td>
				  </tr>

				  <tr>
					<td align="right">
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
					  <td width="40%" align="right">
							Dollar Amount:
					  </td>
					  <td width="35%" class="lookupResultTax">
							<span id="use_result_amt">&nbsp;</span>
					  </td>
				  </tr>

				   <tr>
					  <td align="right">
						 <font color="red">
							   Use Tax:
						</font>
					  </td>
					  <td class="lookupResultTax" style="border-bottom: 1px solid gray;">
						   <span id="use_result_tax">&nbsp;</span>
					  </td>
				  </tr>

				   <tr>
					  <td align="right">
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
		  <table width="100%" border="0" cellspacing="2" cellpadding="2">
		   <font size="2">
			<tr>
			  <td class="eg-bar" style="color: red;" colspan="2">
				<span id="faqtable1-title" class="iconspan">Show</span>
				 <center>Sales Tax Breakout For <% Response.Write(LookupResults.City & "&nbsp;") %></center>
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
		  <table width="100%" border="0" cellspacing="2" cellpadding="2">
		  <font size="2">
		  <tr>
			  <td class="eg-bar" style="color: red;" colspan="2">
				<span id="faqtable2-title" class="iconspan">Show</span>
				<center>Use Tax Breakout For <% Response.Write(LookupResults.City & "&nbsp;") %></center>
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
		  <table width="100%" border="0" cellspacing="2" cellpadding="2">
			<tr>
			  <td style="color: red;" colspan="4">
				<center>Other Communities Using <%=LookupResults.zipInput%></center>
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
					  <table width="100%">
						<tr>
							<td>
								<font style="color: red;">
									<center>Sales Tax Breakout For <%=LookupResults.DisplayCity%></center>
								</font>
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
		  <table width="100%" border="0" cellspacing="2" cellpadding="2">
<%
	Do
		Jurisdiction = "Special Rules For The " & LookupResults.Jurisdiction
		If Jurisdiction <> PreviousJurisdiction Then
%>
			<tr>
			  <td style="color: red;" colspan="2">
				<center><%=Jurisdiction%></center>
			  </td>
			</tr>

<%
			PreviousJurisdiction = Jurisdiction
		End If
%>

			<tr valign="top">
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
		  <table width="100%" border="0" cellspacing="2" cellpadding="2">
			<tr>
			  <td align="left" style="color: red;">
				<center>
				  <%=TaxMapText%>
				</center>
			  </td>
			</tr>
			<tr>
			  <td align="center">
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
		  <table width="100%" border="0" cellspacing="2" cellpadding="2">
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
		  <table width="100%" border="0" cellspacing="2" cellpadding="2">
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

<div class="clearfix"></div>
<% 
    If LookupResults.zipInput <> "" Then 
      Set rs = Sql(sqlText)
      If not rs.eof Then
          Set rs = Sql(sqlText)
          %>
            <div style="border: 1px solid black; width: 100%; height: 20em;">
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

<div class="fb-like" data-href="https://www.facebook.com/Zip2Tax/" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>

	<h2>
		<span class="glyphicon glyphicon-star redFont" aria-hidden="true"></span>
		How to Use Our Sales Tax Calculator
	</h2>
	
	<p>
		Our sales tax calculator is easy to use. We offer two easy ways to estimate sales tax costs with our sales tax calculator.<br><br>
		
		One way is to simply punch in the applicable ZIP code for your transaction, click "Get Rate" and you'll be provided with the applicable sales tax rate. 
		We also allow you to enter a dollar amount, click "Calculate," and we'll provide you with the total sales tax cost and total sale cost, based off of 
		your provided information.<br>
	</p>
<div class="clearfix"></div>
<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/SpotOnBanner_new.asp" -->
</div>