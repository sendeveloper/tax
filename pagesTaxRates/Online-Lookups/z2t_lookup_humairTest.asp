
<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--I'm not sure why there is a separate Connection-api.asp? but using it for now-->
<!--#include virtual="/Website/Includes/Connection-api.asp"-->



<%
    Response.buffer = True

    Session("activePage") = "Spot-On Lookup"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /

	Dim Reff
	'Dim PrintedSubHead
	'Dim ServicesURL
	Dim userAgent
	'Dim ServerXmlHttp
	'Dim State
	'Dim selected
	'Dim cOnlineLookup
%>

<!--It turns out userSubscriptions.asp is a shared file so it should be indide includes but keeping it where it is for now-->
<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/z2t_userSubscriptions.asp"-->
                      
					  
<script type="text/vbscript" src="/Website/pagesTaxRates/Online-Lookups/sql.vbs" language="VBScript" runat="server"></script>
<script type="text/vbscript" src="/Website/pagesTaxRates/Online-Lookups/z2t_lookup.vbs" language="VBScript" runat="server"></script>
<% ServerInitialize %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/Website/Includes/yui/build/cssreset/cssreset-min.css">
	<!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
    <link type="text/css" rel="stylesheet" href="/Website/Includes/yui/build/cssgrids/cssgrids.css">
    <link type="text/css" rel="stylesheet" href="/Website/pagesTaxRates/Online-Lookups/z2t_Lookup.css">
    <!--#include virtual="/Website/pagesTaxRates/Online-Lookups/z2t_legacy_browsers.inc"-->

	<!--[if  ie 9]>
      <style type="text/css" media="screen">
          #divPageCenter .button {
              background: #910707 !important;
              filter: none !important;
              border-radius: 0 !important;
          }
          #divPageCenter .button:hover {
              background: #ED2828 !important;
          }
      </style>
      <![endif]-->
    <!--[if lt IE 8]>
      <link rel="stylesheet" type="text/css"
            href="z2t_lookup_ie_7.css">
      <![endif]-->
    <!-- script-ASP variable cannot be abstracted away-->
    <script type="text/javascript" language="javascript" src="/Website/pagesTaxRates/LookupZipCode/map.js"></script>
    <script type="text/javascript" language="javascript" src="maps.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAptBhnQg4zQMZPim2KLfbJguUyFBIjj9I&sensor=false"></script>
    <script type="text/javascript" language="javascript" src="/Website/Includes/yui/build/yui/yui-min.js"></script>
    <script type="text/javascript">
        // page variables
        var URL = "<%=Request.ServerVariables("URL")%>";
        var userName = "<%=Session("z2t_username")%>";
        var z2tp = "<%=Session("z2t_password")%>";
        var totalrate = "<% If TypeName(LookupResults) <> "Nothing" Then Response.Write(LookupResults.SalesRate) %>";
        var clear = "<%=Request("clear")%>" == "";
        var maxSubscriptionServiceLevel = "<%=iif(maxSubscriptionServiceLevel <> "", maxSubscriptionServiceLevel, 0)%>";
        var z2tUserName = "<%=Session("z2t_UserName")%>";


    </script>
  </head>

  <body class="yui3-skin-night">
  <a href="#maincontent" class="NoScreen NoPrint">Skip Navigation</a><a href="#main_tax_lookup" class="NoScreen NoPrint">Skip To Lookup</a>
    <div id="divMain">
      <div id="divPageTop">
        <!--#include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->

      <div id="divPageMiddle" class="whitespace-fix">
        <div id="divPageLeft">
          <!-- #include virtual="/Website/pagesTaxRates/Online-Lookups/page_lookup_left_sidebar.asp" -->
        </div><!-- divPageLeft -->
		
        <div id="divPageCenter">
          <!--#include virtual="/Website/pagesTaxRates/Online-Lookups/page_lookup_content.inc" -->
        </div><!-- divPageCenter -->
		
        <div id="divPageRight">
          <!-- #include virtual="/Website/pagesTaxRates/Online-Lookups/page_lookup_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/BodyParts/footer.asp"-->
      </div><!-- divPageBottom -->


    </div><!-- main -->
	
    <script id="z2tLookup" type="text/x-handlers-template">
      <div id="current-result">
        <div id="errorInfo" class="yui3-g">
            <div id="errorMessage" class="yui3-1"><span>{{non_empty errorInfo.errorCode errorInfo.errorMessage}}</span></div>
            {{#errorInfo.messages}}
            <div class="yui3-1"><span>{{non_empty message}}</span></div>
            {{/errorInfo.messages}}

            {{#if errorInfo.passiveMessages}}
            {{#errorInfo.passiveMessages}}
            <div class="yui3-1"><span>{{non_empty message}}</span></div>
            {{/errorInfo.passiveMessages}}
            {{/if}}
        </div>
      <form id="hidden_vals" class="None">
        {{#if addressInfo.addressResolution}}
        <input id="cur-granularity"
               type="hidden"
               value="{{addressInfo.addressResolution}}">
        {{/if}}
        {{#if errorInfo.urgentMessages}}
        {{#errorInfo.urgentMessages}}
        <input class="urgent-message"
               type="hidden"
               value="{{non_empty message}}">
        {{/errorInfo.urgentMessages}}
        {{/if}}
      </form>
      {{#addressInfo}}
      <div>
        {{#if primary.address}}
        {{#primary.address}}
        <div id="primary-address" class="yui3-g bordered">
            <!-- left col -->
            <div class="yui3-u-5-8">
                <!-- row 1 -->
                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right yui3-label">
                        Sales Tax Rate :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-rate-result">
                            <span id="actual-sales-tax">
                                {{#if salesTax.rateInfo.taxRate}}
                                    {{salesTax.rateInfo.taxRate}}<span class="percent text-red">%</span>
                                {{else}}
                                    
                                {{/if}}
                            </span>
                            {{#if salesTax.rateInfo.taxRate}}
                            <span class="percent text-red">({{getFractionForDecimal salesTax.rateInfo.taxRate}}<span class="percent text-red">%</span>)</span>
                            {{/if}}
                        </span>
                    </div>
                </div>
                <!-- row 2 -->
                {{#if useTax}}
                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right yui3-label">
                        Use Tax Rate :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-rate-result">
                            <span id="actual-use-tax">
                                {{useTax.rateInfo.taxRate}}<span class="percent text-red"> %</span>
                            </span>
                            <span class="percent text-red">({{getFractionForDecimal useTax.rateInfo.taxRate}}<span class="percent text-red">%</span>)</span>
                        </span>
                    </div>
                </div>
                {{else}}
                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right yui3-label">
                        Use Tax Rate :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold">
                            <a href="/z2t_services.asp">
                                Add Use Tax
                            </a>
                        </span>
                    </div>
                </div>
                {{/if}}

                <!-- row 2.5 -->
                <div class="yui3-g">
                  <div class="yui3-u-1-3 text-right">
                    Mailing Address :
                  </div>
                  <div class="yui3-u-2-3">
				  	{{#if addressLine1}}
                    <span class="text-bold" style="display:block;"> &nbsp;{{addressLine1}} {{addressLine2}}<%=debug(" ({{tooltipize addressSource}})")%></span>
					{{/if}}
					<span class="text-bold" style="display:block;"> &nbsp;{{place}}, {{state}} {{zipCode}}</span>
                  </div>
                </div>

                <!-- row 2.5 
                <div class="yui3-g">
                  <div class="yui3-u-1-3 text-right">&nbsp;</div>
                  <div class="yui3-u-2-3">
                    <span class="text-bold"> {{place}}, {{state}} {{zipCode}}</span>
                  </div>
                </div>
                -->

                <div class="yui3-g" style="margin-top: 1em;">
                    <div class="yui3-u-1-3 text-right">
                        Geographic Location :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold">&nbsp;</span>
                    </div>
                </div>

<!-- 
                <div class="yui3-g" style="margin-top: 1em;">
                    <div class="yui3-u-1-3 text-right">&nbsp;</div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold"> {{place}}, {{state}} ({{county}} County)</span>
                    </div>
                </div>

                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right">
                        Address :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold"> {{addressLine1}}<%=debug("  ({{tooltipize addressSource}})")%></span>
                    </div>
                </div>

                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right">
                        Address 2 :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold"> {{addressLine2}}</span>
                    </div>
                </div>
 -->
                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right">
                        {{lsad}} :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold"> &nbsp;{{place}}<%=debug(" ({{tooltipize placeSource}})")%></span>
                    </div>
                </div>

                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right">
                        County :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold"> &nbsp;{{county}}<%=debug(" ({{tooltipize countySource}})")%></span>
                    </div>
                </div>

                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right">
                        State :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold"> &nbsp;{{state}}<%=debug(" ({{tooltipize stateSource}})")%></span>
                    </div>
                </div>
<!-- 
                <div class="yui3-g">
                    <div class="yui3-u-1-3 text-right">
                        ZIP code :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold"> &nbsp;{{zipCode}}</span>
                    </div>
                </div>
 -->

            </div>
            <!-- right col -->
            <div id="primary-calculator" class="yui3-u-3-8">
                <div class="yui3-g text-right">
                    <div class="yui3-u-1-3">
                        Dollar Amount :
                    </div>
                    <div class="yui3-u-2-3">
                        <span id="dollar-amount-sales-tax" class="text-bold"></span>
                    </div>
                </div>
                <div class="yui3-g text-red text-right">
                    <div class="yui3-u-1-3">
                        Sales Tax :
                    </div>
                    <div class="yui3-u-2-3">
                        <span id="sales-tax" class="text-bold"></span>
                    </div>
                </div>
                <div class="yui3-g text-right overlined">
                    <div class="yui3-u-1-3">
                        Total Sale :
                    </div>
                    <div class="yui3-u-2-3">
                        <span id="total-sale-sales-tax" class="text-bold"></span>
                    </div>
                </div>
                <div class="yui3-g text-right">
                    <div class="yui3-u-1-3">
                        Dollar Amount :
                    </div>
                    <div class="yui3-u-2-3">
                        <span id="dollar-amount-use-tax" class="text-bold"></span>
                    </div>
                </div>
                {{#if useTax}}
                <div class="yui3-g text-red text-right">
                    <div class="yui3-u-1-3">
                        Use Tax :
                    </div>
                    <div class="yui3-u-2-3">
                        <span id="use-tax" class="text-bold"></span>
                    </div>
                </div>
                <div class="yui3-g text-right overlined">
                    <div class="yui3-u-1-3">
                        Total Sale :
                    </div>
                    <div class="yui3-u-2-3">
                        <span id="total-sale-use-tax" class="text-bold"></span>
                    </div>
                </div>
                {{else}}
                <div class="yui3-g text-red text-right">
                    <div class="yui3-u-1-3">
                        Use Tax :
                    </div>
                    <div class="yui3-u-2-3">
                        <span class="text-bold">
                            <a href="/z2t_services.asp">
                                Add Use Tax
                            </a>
                        </span>
                    </div>
                </div>
                <div class="yui3-g text-right overlined">
                    <div class="yui3-u-1-3">
                        Total Sale :
                    </div>
                    <div class="yui3-u-2-3">
                        <span></span>
                    </div>
                </div>
                {{/if}}
            </div>
        </div>
        {{#if salesTax.rateInfo.rateDetails}}
        <div id="primary-sales-tax-breakout" class="yui3-g bordered">
            <div class="yui3-u-2-3 heading">
                Sales Tax Breakout
            </div>
            <div class="yui3-u-1-3 text-right">
                <button id="{{alpha_only place}}sales" class="redButton w80 s9 sub-breakout" value="Show">Hide</button>
            </div>
            <div id="{{alpha_only place}}salesbreak_out" class="yui3-g">
                {{#salesTax.rateInfo.rateDetails}}
                <div class="yui3-g break-out" style="{{non_zero_value rateDetail.taxRate}}">
                    <div class="yui3-u-1-2 tabbed-in">
                        {{rateDetail.authorityName}}
                    </div>
                    <div class="yui3-u-1-2">
                        {{rateDetail.taxRate}}<span class="percent"> %</span>
                        <span class="percent">({{getFractionForDecimal rateDetail.taxRate}}<span class="percent">%</span>)</span>
                    </div>
                </div>
                {{/salesTax.rateInfo.rateDetails}}
                <div class="yui3-g break-out">
                    <div class="yui3-u-1-2 text-right">
                        Total:
                    </div>
                    <div class="yui3-u-1-2  tabbed-in">
                        {{#if salesTax.rateInfo.taxRate}}
                          {{salesTax.rateInfo.taxRate}}
                        {{else}}
                          0
                        {{/if}}
                        <span class="percent"> %</span>
                        {{#if salesTax.rateInfo.taxRate}}
                        <span class="percent">({{getFractionForDecimal salesTax.rateInfo.taxRate}}<span class="percent">%</span>)</span>
                        {{/if}}
                    </div>
                </div>
            </div>
        </div>
        {{/if}}
        {{#if useTax.rateInfo.rateDetails}}
        <div id="primary-use-tax-breakout" class="yui3-g bordered">
            <div class="yui3-u-2-3 heading">
                Use Tax Breakout
            </div>
            <div class="yui3-u-1-3 text-right">
                <button id="{{alpha_only place}}use" class="redButton w80 s9 sub-breakout" value="Show">Hide</button>
            </div>
            <div id="{{alpha_only place}}usebreak_out" class="yui3-g">
                {{#useTax.rateInfo.rateDetails}}
                <div class="yui3-g break-out" style="{{non_zero_value rateDetail.taxRate}}">
                    <div class="yui3-u-1-2 tabbed-in">
                        {{rateDetail.authorityName}}
                    </div>
                    <div class="yui3-u-1-2">
                        {{rateDetail.taxRate}}<span class="percent"> %</span>
                        <span class="percent">({{getFractionForDecimal rateDetail.taxRate}}<span class="percent">%</span>)</span>
                    </div>
                </div>
                {{/useTax.rateInfo.rateDetails}}
                <div class="yui3-g break-out">
                    <div class="yui3-u-1-2 text-right">
                        Total:
                    </div>
                    <div class="yui3-u-1-2  tabbed-in">
                        {{#if useTax.rateInfo.taxRate}}
                        {{useTax.rateInfo.taxRate}}
                        {{else}}
                        0
                        {{/if}}
                        <span class="percent"> %</span>
                        {{#if useTax.rateInfo.taxRate}}
                        <span class="percent">({{getFractionForDecimal useTax.rateInfo.taxRate}}<span class="percent">%</span>)</span>
                        {{/if}}
                    </div>
                </div>
            </div>
        </div>
        {{/if}}
        {{/primary.address}}
        {{/if}}
        {{#if others}}
        <div id="other-communities" class="yui3-g bordered">
            <div class="yui3-u-3-4 heading">
                Other Communities Using {{primary.address.zipCode}}
            </div>
            <div class="yui3-u-1-4 text-right">
              <button id="all-other" class="redButton w80 s9" value="Collapse All">Expand All</button>
            </div>
        </div>
        <div id="all-other-break-outs" class="yui3-u-1">
            {{#others}}
            {{#address}}
            {{#if salesTax.rateInfo.taxRate}}
            <div class="yui3-g {{stripes}}">
                <div class="yui3-u-1-3">
                  {{place}}, {{state}}
                </div>
                <div class="yui3-u-1-3">
                    {{county}} County
                </div>
                <div class="yui3-u-1-3 text-right">
                    {{salesTax.rateInfo.taxRate}}
                    <span class="percent"> %</span>
                    {{#if salesTax.rateInfo.taxRate}}
                    <span class="percent">({{getFractionForDecimal salesTax.rateInfo.taxRate}}<span class="percent">%</span>)</span>
                    {{/if}}
                    <button id="{{alpha_only place}}" class="redButton w80 s9 sub-breakout break-all" value="Hide">Show</button>
                </div>
                <div id="{{alpha_only place}}break_out" class="yui3-g break-all text-x-small" style="display: none;">
                    <div class="yui3-u-1 text-bold breakout-bordered">Detailed Breakdown:
                       {{#salesTax.rateInfo.rateDetails}}
                        {{#if rateDetail.taxRate}}
                        <div class="yui3-u-1" style="{{non_zero_value rateDetail.taxRate}}">
                            <div class="yui3-u-1-2 text-right">
                                {{rateDetail.authorityName}}:
                            </div>
                            <div class="yui3-u-1-2 tabbed-in">
                                {{rateDetail.taxRate}}<span class="percent"> %</span>
                                {{#if rateDetail.taxRate}}
                                <span class="percent">({{getFractionForDecimal rateDetail.taxRate}}<span class="percent">%</span>)</span>
                                {{/if}}
                            </div>
                        </div>
                        {{/if}}
                    {{/salesTax.rateInfo.rateDetails}}
                    </div>
                    <div class="yui3-ga">
                        <div class="yui3-u-1-2 text-right">
                            Total:
                        </div>
                        <div class="yui3-u-1-2 tabbed-in">
                            {{#if salesTax.rateInfo.taxRate}}
                            {{salesTax.rateInfo.taxRate}}
                            {{else}}
                            0
                            {{/if}}
                            <span class="percent"> %</span>

                            {{#if salesTax.rateInfo.taxRate}}
                            <span class="percent">({{getFractionForDecimal salesTax.rateInfo.taxRate}}<span class="percent">%</span>)</span>
                            {{/if}}
                        </div>
                    </div>
                </div>
            </div>
            {{/if}}
        {{/address}}
        {{/others}}
        </div>
        {{/if}}
        {{#if primary.address.notes}}
        <div id="specialRules" class="bordered">
            <div class="yui3-g">
                <div class="yui3-u-1 heading">
                    Special Rules
                </div>
                <ol>
                {{#primary.address.notes}}
                {{#noteDetail}}
                <li class="note-section">
                    {{jurisdiction}}, {{category}} : {{note}}
                </li>
                {{/noteDetail}}
                {{/primary.address.notes}}
                </ol>
            </div>
        </div>
        {{/if}}
      </div>
      {{/addressInfo}}
     

	   <div id="ServerName" class="yui3-1">
	   			<div style="float:left">
	   			 <a href="#main_tax_lookup">Back To Top</a>
				 </div>
				 <div style="float: right;
    color: blue;
    font-size: 12px;
    font-weight: bold;">
		    	 <span>Server:{{errorInfo.ServerName }}</span>
				 <span>Version:{{errorInfo.Version }}</span>
				 <span>Time: {{	timeStringToFloat errorInfo.elapsedTime }}s</span>
 				 
				 </div>
				 
	   </div>

      </div>
	  
	  
    </script>
    <script type="text/javascript" language="javascript" src="z2t_lookup.js"></script>

</body>
</html>


<script language="VBScript" runat="server">
  'Delete lookup result instance
  Set LookupResults = Nothing
</script>

<%
Function debug(text)
  debug = "" 'iif(Session("z2t_DebugData") = 1, text, "")
End Function

Function iif(test, consequent, alternative)
  If test Then iif = consequent Else iif = alternative
End Function
%>

