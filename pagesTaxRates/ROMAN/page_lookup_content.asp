    <div id="content">
        <div id="about" class="post">
          <h1 class="title">Zip Code Lookup of Sales and Use Tax Rates Plus Calculator</h1>
          <div class="NoScreen">
            <p>&nbsp;</p>
          </div>

          <% Dim userAgent
             userAgent = Request.ServerVariables("HTTP_USER_AGENT") 
             
             Dim usrAgentFlg
             usrAgentFlg = InStr(userAgent,"Mobile")
             
             If usrAgentFlg <> "0" then
             %>

             <center><font size="3"><a href="http://z2t.mobi/">Using A Mobile Device ? Click Here</a></font></center>

             <% End If %>

<%
'Response.Write("<p>Lookups are unavailable at this time due to system maintenance. Back shortly, sorry for the inconvienence.</p>")
%>
          <div class="entry" style="visibility: visible;">
				<style type="text/css">.post > h1.title {background: url(/website/images/star.gif) no-repeat 0px 5px !important;}</style>
					<table width="570" border="10" cellspacing="0" cellpadding="0" class="heavyborder">

              <tr valign="top"> 
                <td align="center">
                  <form id="frmLookupSalesTax" method="Post" name="frmLookupSalesTax" action="<%=Request.ServerVariables("URL")%>">

                  <table width="100%" border="0" cellspacing="5" cellpadding="5">

                    <tr valign="top"> 
                      <td align="center" valign="top" colspan="4"> 
                        <font size="2">
                          <a href="http://en.wikipedia.org/wiki/Sales_taxes_in_the_United_States" target="_blank" style="text-decoration:none!important;color:#4A5157!important;">Use</a> this handy sales tax calculator to determine the general
                          sales tax rate used for a particular ZIP code. Click on [Show] to see details about the sales tax rate at the state,
                          county, city, and special district levels.</font></td>
                    </tr>

                    <tr> 
                      <td align="center" style="Height: 90px;">
                          <INPUT TYPE="Text" NAME="inputZip" ID="inputZip"
                          Value="Enter ZIP Code"
                          Size="18"
                          MaxLength="5"
                          onKeyPress="return numbersonly(this, event);"
                          onblur="if(this.value == '') this.value = this.defaultValue; blurField('zip');"
                          onfocus="if(this.value == this.defaultValue) this.value = ''"
                          tabindex="1">
                      </td>
                      <td>
                        <a href="javascript:clickGetRate();" class="redButton w80" id="getratebutton">Get Rate</a>
                      </td>
                      <td align="center" style="Height: 90px;">
                        <INPUT TYPE="Text" NAME="inputAmt" ID="inputAmt"
                          Value="Enter Dollar Amount"
                          Size="18"
                          MaxLength="10"
                          onKeyPress="return numbersonly(this, event, true);"
                          tabindex="2"
                          onfocus="if(this.value == this.defaultValue) this.value = ''"
                          onblur="blurField('amt'); if(this.value == '') this.value = this.defaultValue; ">
                      </td>
                      <td>
                        <a href="javascript:clickGetTax('calc');" class="redButton w80" id="getSaleUseTaxbutton">Calculate</a>
                        <!--<a href="javascript:clickGetTax('amt');" class="button" id="gettaxbutton" accesskey="s" title="Press ATL+S Enter to calculate Sales Tax">Get Sales Tax</a>-->
                        <% If SubscriptionData.HasSubscriptionAddon(cWebLookup, cLookupUseTax) Then%>
                        <!--<span>&nbsp;</span>-->
                        <!--<a href="javascript:clickGetTax('useTax');" class="button" id="getusetaxbutton" accesskey="u" title="Press ATL+U Enter to calculate Use Tax">Get Use Tax</a>-->
                        <% End If %>
                       </td>
                    </tr>

                  </table>

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
            </table><br>
<% 
    If LookupResults.zipInput <> "" Then 
      Set rs = Sql(sqlText)
      If not rs.eof Then
        If (Len(rs("Center")) > 0  ) then%>
            <div style="border: 1px solid black; width: 43.7em; height: 20em;">
              <div id="map_canvas2" style="width:500; height:200"></div>
            </div>
<% 
        Else 
          Set rs = Sql(sqlText)
          If (Len(rs("Center")) > 0  ) then%>
            <div style="border: 1px solid black; width: 43.7em; height: 20em;">
              <div id="map_canvas2" style="width:500; height:200"></div>
            </div>
<%
          Else
%>
            <p>
            <img border="0" src="//maps.googleapis.com/maps/api/staticmap?center=<%=LookupResults.zipInput%>,<%=city%>,<%=LookupResults.State%>&markers=color:red%7C<%=LookupResults.zipInput%>,<%=city%>,<%=LookupResults.State%>&zoom=13&size=570x250&maptype=roadmap&sensor=false&key=AIzaSyACJstxRGIbX8Mv_I2-a8tOLN0d620APjo">
<%
          End If
        End If
      Else 
        Set rs = Sql(sqlText)
        If not rs.eof Then
          If (Len(rs("Center")) > 0 ) Then
%>
            <div style="border: 1px solid black; width: 43.7em; height: 20em;">
              <div id="map_canvas2" style="width:500; height:200"></div>
            </div>
<%
          Else
%>
            <p>
            <img border="0" src="//maps.googleapis.com/maps/api/staticmap?center=<%=LookupResults.zipInput%>,<%=city%>,<%=LookupResults.State%>&markers=color:red%7C<%=LookupResults.zipInput%>,<%=city%>,<%=LookupResults.State%>&zoom=13&size=570x250&maptype=roadmap&sensor=false&key=AIzaSyACJstxRGIbX8Mv_I2-a8tOLN0d620APjo">
<%
          End If
        Else
%>
            <p>
            <img border="0" src="//maps.googleapis.com/maps/api/staticmap?center=<%=LookupResults.zipInput%>,<%=city%>,<%=LookupResults.State%>&markers=color:red%7C<%=LookupResults.zipInput%>,<%=city%>,<%=LookupResults.State%>&zoom=13&size=570x250&maptype=roadmap&sensor=false&key=AIzaSyACJstxRGIbX8Mv_I2-a8tOLN0d620APjo">
<%
        End If
      End If
%>
            </p><br><br>
<% 
    End If 
%>
          </div>
        </div>
    </div>


      
<% 
Function iif(condition, consequent, alternative)
  If condition Then iif = consequent Else iif = alternative
End Function
%>


	<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/SpotOnBanner.asp" -->
