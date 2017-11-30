<div id="content">
  <div id="about" class="post">
  <a id="maincontent" name="maincontent"></a>
    <h2 class="title" style="font-weight: bold;">Spot-On™ Sales And Use Tax Rates With <br>Sales Tax Calculator</h2>
<%
  'Dim userAgent: userAgent = Request.ServerVariables("HTTP_USER_AGENT")
  userAgent = Request.ServerVariables("HTTP_USER_AGENT")
  Dim usrAgentFlg: usrAgentFlg = InStr(userAgent,"Mobile")
  'usrAgentFlg: usrAgentFlg = InStr(userAgent,"Mobile")
  If usrAgentFlg <> "0" Then
%>
    <center><font size="3"><a href="http://z2t.mobi/">Using A Mobile Device? Click Here</a></font></center>
<%
  End If
  'Response.Write("<p>Lookups are unavailable at this time due to system maintenance. Back shortly, sorry for the inconvienence.</p>"): Response.End
%>
    <div class="entry">
      <!--<p><span class="firstword">This product is in the final stages of beta testing and Zip2Tax does not guarantee information provided here to be complete or error free. Please use the<a href='<%=pathWebsite%>pagesTaxRates/z2t_lookup.asp'> ZIP Code Lookup</a> if this data is to be used for reporting purposes.</span><p> -->
      <p>Quickly find the general sales tax and use tax rates for every door step, ZIP+4, or ZIP code in every state, county, city and special district in the United States.</p>
	  <p>Not sure how this works? Watch our three-minute <a href="http://www.youtube.com/watch?v=aR-CRbOhgNY" target="_new">video tutorial</a>, or <a href="/Website/Downloads/Other/How to use SpotOn manual.pdf" target="_new">download a PDF manual</a>.</p>
      <div class="tabs-box-model" style="margin-left: 20px;">
        <div class="table tab-headings">
          <div id="lookupTab" class="tablecell lookup selected">
              <img src="/Website/Images/Services/Online-lookup-icon.png" alt="Online Tax Lookup">
              <div>
                  Online Lookup
              </div>
          </div>
          <div id="zipTab" class="tablecell Zip unselected">
              <img src="/Website/Images/Services/ZIP-code-icon.png" alt="Details on ZIP code Tax Lookups">
              <div>
                  ZIP Code
              </div>
          </div>
          <div id="zipFourTab" class="tablecell Zip4 unselected">
              <img src="/Website/Images/Services/ZIP-plus-4-icon.png" alt="Details on Zip + 4 Tax Lookups">
              <div>
                  ZIP+4
              </div>
          </div>
          <div id="spotOnTab" class="tablecell SpotOn unselected">
              <img src="/Website/Images/Services/SpotOn-icon.png" alt="Details on Spot-On&trade; Tax Lookups">
              <div>
                  Spot-On™
              </div>
          </div>
        </div><!-- tab-headings -->
		
        <div  class="table tab-body">
          <div id="lookupBody" class=" lookup tab selected" 
		    title="You must have an account and be logged in to use these features.  Call 866-492-8494 to inquire about a free trial.">
            <div class="box-model">
              <div class="granularity">
                <img id="granularity-image" src="/Website/Images/Services/SpotOn-all.png" alt="Indication of result accuracy">
                <div id="address-resolution" class="address-resolution None">
                  <span>Current results level is:</span>
                  <div id="resultLevel"></div>
                </div>
              </div>
              <div id="frmLookupSalesTax" class="tablecell">
                  <a id="main_tax_lookup" name="main_tax_lookup"></a>
                  <div id="addr1">
                      <label for="inputAddr1" class="placeholder placeholder-hidden">
                          Street Address
                      </label>
                      <input id="inputAddr1"
                           name="inputAddr1"
                           type="Text"
                           title="Street Address"
                           tabindex="1"
                           size="65"
                           value=""
                           <%=iif(maxSubscriptionServiceLevel < 3, "class=""disabled"" ", "")%>

                           <%=iif(maxSubscriptionServiceLevel < 3, "disabled=""disabled""", "")%>
                      >
                  </div>
                  <div id="addr2">
                      <label for="inputAddr2" class="placeholder placeholder-hidden">
                          Apt / Suite / Other
                      </label>
                      <input id="inputAddr2"
                           name="inputAddr2"
                           type="Text"
                           title="Apt / Suite / Other"
                           tabindex="2"
                           size="65"
                           <%=iif(maxSubscriptionServiceLevel < 3, "class=""disabled"" ", "")%>

                           <%=iif(maxSubscriptionServiceLevel < 3, "disabled=""disabled""", "")%>

                           value="<%=iif(Request("clear") = "", Request("inputAddr2"), "")%>"
                      >
                  </div>
                  <div id="cityStateZipRow">
                      <label for="inputCity"  class="placeholder placeholder-hidden">
                          City
                      </label>
                      <input id="inputCity"
                             name="inputCity"
                             type="Text"
                             title="City"
                             tabindex="3"
                             size="27"
                             <%=iif(maxSubscriptionServiceLevel < 3, "class=""disabled"" ", "")%>

                             <%=iif(maxSubscriptionServiceLevel < 3, "disabled=""disabled""", "")%>
                             value=""
                      >
                      <span>,</span>
                      <label for="inputState" class="NoScreen NoPrint">
                          State
                      </label>
                      <select id="inputState"
                              name="inputState"
                              title="State"
                              tabindex="4"
                              <%=iif(maxSubscriptionServiceLevel < 3, "class=""disabled"" ", "")%>

                              <%=iif(maxSubscriptionServiceLevel < 3, "disabled=""disabled""", "")%> >
                          <option value="" class="placeholder placeholder-hidden">ST</option>

    <%
      Dim states: states = Array(_
        "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FM", "FL", "GA", "GU", "HI", "ID", "IL", _
        "IN", "IA", "KS", "KY", "LA", "ME", "MH", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", _
        "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PW", "PA", "PR", "RI", "SC", "SD", "TN", "TX", _
        "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY", "AA", "AE", "AE", "AE", "AE", "AP")

      Dim State: For Each State In States
    %>
                          <option value="<%=state%>"><%=state%></option>
<%
  Next
%>
                      </select>
                      <label for="inputZip"  class="placeholder-zip placeholder-hidden">
                          ZIP
                      </label>
                      <input id="inputZip"
                             name="inputZip"
                             type="Text"
                             title="ZIP code"
                             size="5"
                             maxlength="5"
                             tabindex="5"
                             <%=iif(maxSubscriptionServiceLevel < 1, "class=""disabled"" ", "")%>

                             <%=iif(maxSubscriptionServiceLevel < 1, "disabled=""disabled""", "")%>
                             value=""
                      >
                      <span class="placeholder-shift">-</span>
                      <label for="inputZip4"  class="placeholder-zip-4 placeholder-hidden">
                          +4
                      </label>
                      <input id="inputZip4"
                             name="inputZip4"
                             type="Text"
                             title="+4"
                             tabindex="6"
                             size="4"
                             maxlength="4"
                             <%=iif(maxSubscriptionServiceLevel < 2, "class=""disabled"" ", "")%>

                             <%=iif(maxSubscriptionServiceLevel < 2, "disabled=""disabled""", "")%>
                             value=""
                      >
                  </div>
                  <div id="rate-buttons" class="table" style="background:none !important">
                      <div>
                          <button id="get-rate-button"
                                tabindex="7"
                                class="redButton w100 get-rate-button disabled"
                                title="Jurisdictional accuracy depends on input. At minimum, enter a ZIP code. For finer resolution, enter ZIP+4.  A full street address with city and state is required for Spot-On&trade; granularity.">
                            Get Rate
                          </button>
                      </div>
                      <div id="big_rate_box">
                          <div id="loading_animation"></div>
                          <div id="big_result"></div>
                          <div id="detail_link"></div>
                      </div>
                      <div>
                          <button id="clear-button"
                                tabindex="8"
                                class="redButton w100">
                            Clear
                          </button>
                      </div>
                </div>
                  <div>
                      <hr class="calculator">
                  </div>
                  <div>
                      After a rate is determined, enter a dollar amount for tax calculation.
                  </div>
                  <div class="calculator">
                      <label for="inputAmt" class="placeholder-input-amt placeholder-hidden">
                          Enter Dollar Amount
                      </label>
                        <input id="inputAmt"
                               name="inputAmt"
                               type="Text"
                               tabindex="9"
                               title="Enter Dollar Amount"
                               size="25"
                               maxlength="10"
                               <%=iif(maxSubscriptionServiceLevel < 1, "class=""disabled"" ", "")%>

                               <%=iif(maxSubscriptionServiceLevel < 1, "disabled=""disabled""", "")%>
                               value="" >
                        <button id="calculate-button"
                            tabindex="10"
                            class="redButton w100 disabled">
                        Calculate
                    </button>
                  </div>
              </div>
          </div><!-- box-model -->
          <!-- input -->
          <hr>
          <a id="detail_results" name="detail_results"></a>
          <div id="resultsArea" class="results">
              Please log into your account or try the <a href="/sales-tax-calculator">free lookups</a>.
          </div>
          <!-- results -->
          </div><!-- Lookup tab -->

          <div id="zipBody" class="tablerow Zip tab unselected">
            <div class="box-model">
              <div class="granularity">
                  <img src="/Website/Images/Services/ZIP-code.png" alt="Details on ZIP code online tax lookups">
              </div>
              <div class="instructions">
                <p>The most economical service for companies wanting
                  to improve efficiency while maintaining
                  affordability. City and town names with sales tax
                  detail are provided for every locality within a ZIP
                  code, giving the operator the ability to choose the
                  jurisdiction they want.</p>

                <a class="redButton wauto" href="javascript:openPopUp('/Website/pagesProducts/Cart/Online_Zip/online_zip_popup.asp'); void(0);" style="float: left;">See Subscription Options</a>
				
				<a class="redButton wauto" href="javascript:openPopUp('/Website/pagesProducts/Offers/Free/Cart/z2t_services_online_cart.asp'); void(0);" style="float: right;">Request Free Trial</a>
				
              </div><!-- instructions -->
            </div><!-- box-model -->
          </div><!-- Zip tab -->

          <div id="zipFourBody" class="tablerow Zip4 tab unselected">
            <div class="box-model">
              <div class="granularity">
                  <img src="/Website/Images/Services/ZIP-plus-4.png" alt="Details on ZIP plus four onine tax lookups ">
              </div>
              <div class="instructions">
                <p>A very high level of jurisdictional certainty at an
                  affordable price.  Sometimes referred to as the
                  9-digit ZIP code, the first 5 digits determine a
                  delivery area, such as a town and state, and the
                  additional 4 digits target the location to within
                  one side of a street within a range of addresses,
                  such as 100 to 120 East Main St.</p>

                <a class="redButton wauto" href="javascript:openPopUp('/Website/pagesProducts/Cart/Online_Zip+4/online_zip+4_popup.asp'); void(0);" style="float: left;">See Subscription Options</a>
				
				<a class="redButton wauto" href="javascript:openPopUp('/Website/pagesProducts/Offers/Free/Cart/z2t_services_online_cart.asp'); void(0);" style="float: right;">Request Free Trial</a>
				
              </div><!-- instructions -->
            </div><!-- box-model -->
          </div><!-- Zip4 tab -->

          <div id="spotOnBody" class="tablerow SpotOn tab unselected">
             <div class="box-model">
              <div class="tablecell granularity">
                  <img src="/Website/Images/Services/SpotOn.png" alt="Details on Spot-On&trade;, (exact address level), online lookups">
              </div>
              <div class="tablecell instructions">
                <p>The most accurate sales tax jurisdiction
                  granularity for companies needing precision
                  data. Spot-On™ validates U.S. postal address and
                  converts street address into latitude and longitude
                  coordinates (also known as geocoding) to provide the
                  highest level of resolution available.</p>

                <a class="redButton wauto" href="javascript:openPopUp('/Website/pagesProducts/Cart/Online_SpotOn/online_SpotOn_popup.asp'); void(0);" style="float: left;">See Subscription Options</a>
				
				<a class="redButton wauto" href="javascript:openPopUp('/Website/pagesProducts/Offers/Free/Cart/z2t_services_online_cart.asp'); void(0);" style="float: right;">Request Free Trial</a>
				
              </div><!-- instructions -->
             </div><!-- box-model -->
          </div><!-- SpotOn tab -->
        </div><!-- tab-body -->
      </div><!-- tabs-box-model -->
      <div id="resultGoogleMap"></div>
    </div><!-- entry -->
  </div><!-- #about.post -->
</div><!-- content -->

<%
Function iif (condition, consequent, alternative)
  If condition Then iif = consequent Else iif = alternative
End Function
%>
