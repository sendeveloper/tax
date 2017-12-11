<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="includes/Config.asp"-->
<!--#include virtual="includes/Connection.asp"-->

<%
    Session("activePage") = "News"
    Session("currentPage") = "z2t_news.asp"
%>

<!--#include virtual="includes/logout.asp"-->
<!--#include virtual="includes/login.asp"-->


<html>
<head>
    <title>Sales Tax Lookup - Zip Code Sales Tax Search | Sales Tax Rates</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="keywords" content="Sales Tax, Zip Code, Tax Rates">
    <meta name="description" content="Zip Code To Sales Tax Calculator.  Use our handy tool to calculate your sales tax instantly.">
    <meta name="robots" content="index,follow">
    <meta name="verify-v1" content="q0BWCUmQlxYKPjY3G4LpF0lihwZNVwzrEDOWMV4BjpQ=">
<script language="javascript" src="includes/z2t_functions.js" type="text/javascript"></script>
    <script src="SpryAssets/SpryAccordion.js" type="text/javascript"></script>
    <link href="includes/z2t_screen.css" rel="stylesheet" type="text/css" media="screen">
    <link href="includes/z2t_print.css" rel="stylesheet" type="text/css" media="print">

<script language="javascript" type="text/javascript">
    var pathBase = '<%=pathBase%>';
    var currentPage = '<%=Session("currentPage")%>';
    var errorMessage = '<%=Session("LoginErrorUrgent")%>';

    function formLoad()
        {
        // document.getElementById('JavaScriptTest').innerHTML = 'Pass';
        if (errorMessage > '')
            {
            alert(errorMessage);
            }
        }

    function clickLink(n)
        {
        var pageSection = 'z2t_services.asp';
        if (n == 2)
            {
            pageSection = 'z2t_services.asp#PageSection2';
            }
        if (n == 3)
            {
            pageSection = 'z2t_services.asp#PageSection3';
            }

        var URL = pathBase + pageSection;
        window.document.location = URL;
        }

</script>

<style type="text/css">
<!--
.subtitle {
	font-size: 24px;
}
.subtitle1 {	font-size: 24px;
}
-->
</style>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-8941943-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<link href="SpryAssets/SpryAccordion.css" rel="stylesheet" type="text/css">
</head>

<body onLoad="formLoad();">
  <!--#include file="includes/BodyParts/Heading.asp"-->
  <!--#include file="includes/BodyParts/Menu.asp"-->

  <div id="bg">
    <div id="bigpage">

      <div class="NoPrint">
        <div id="sideextraleft">
          <div id="sideextraright" style="margin-top: 30px;">
            <h1>Frequently Asked
              Questions
            </h1>
            <h2><img src="Images/newsite/faq.png" alt='Questions' width="177" height="181" align='top'><span class="boldword">About
              The Data</span></h2>
            <table width="190" height="139" border="0">
              <tr>
                <td width="82" height="32"><span class="boldword"><strong><a href="#breakouts">Breakouts</a></strong></span></td>
                <td width="102"><strong><a href="#shipping">Shipping</a></strong></td>
              </tr>
              <tr>
                <td height="31"><strong><a href="#columns">Columns</a></strong></td>
                <td><strong><a href="#source">Sources</a></strong></td>
              </tr>
              <tr>
                <td height="35"><strong><a href="#countries">Countries</a></strong></td>
                <td><strong><a href="#updates">Updates</a></strong></td>
              </tr>
              <tr>
                <td height="31"><strong><a href="#layout">Layout</a></strong></td>
                <td><strong><a href="#zipcodes">ZIP Codes</a></strong></td>
              </tr>
            </table>
            <h2>&nbsp;</h2>
<h2 class="boldword">Compatibility</h2>
<table width="190" height="35" border="0">
  <tr>
    <td width="82" height="31"><span class="boldword"><strong><a href="#database">Database</a><a href="#breakouts"></a></strong></span></td>
    <td width="97"><strong><a href="#shipping" class="boldword">Tables</a></strong></td>
  </tr>
</table>
<h2 class="boldword">&nbsp;</h2>
<h2><span class="boldword">Free Lookups</span></h2>
<table width="190" height="72" border="0">
  <tr>
    <td height="31"><strong><a href="#extra">Extra</a></strong></td>
    <td width="97"><strong><a href="#quantity">Quantity</a><a href="#shipping" class="boldword"></a></strong></td>
    </tr>
  <tr>
    <td width="82" height="31"><strong><a href="#used">Used</a><a href="#extra"></a></strong></td>
    <td width="97">&nbsp;</td>
  </tr>
</table>
<h4>&nbsp;
</h4>
            <h2><span class="boldword">Logging In</span></h2>
            <table width="190" height="35" border="0">
              <tr>
                <td width="82" height="31"><span class="boldword"><strong><a href="#freelookups">Free
                lookups</a><a href="#database"></a><a href="#breakouts"></a></strong></span></td>
                <td width="97"><strong><a href="#trouble">Trouble</a><a href="#shipping" class="boldword"></a></strong></td>
              </tr>
            </table>
            <h2>&nbsp;</h2>
<h2><span class="boldword">Security</span></h2>
            <table width="190" height="35" border="0">
              <tr>
                <td width="82" height="31"><a href="#cart">Shopping Cart</a></td>
                <td width="97"><strong><a href="#privacy">Privacy</a><a href="#shipping" class="boldword"></a></strong></td>
              </tr>
            </table>
            <h4>&nbsp;</h4>
            <h2 class="boldword">Subscription</h2>
            <table width="190" height="69" border="0">
              <tr>
                <td width="82" height="32"><span class="boldword"><strong><a href="#quantity">Quantity</a><a href="#breakouts"></a></strong></span></td>
                <td width="102"><strong><a href="#shipping"><span class="boldword"><a href="#subscribe">Subscribe</a></span></a></strong></td>
              </tr>
              <tr>
                <td height="31" class="boldword"><strong><a href="#columns">Service</a></strong><a href="#services">s</a></td>
                <td><strong><a href="#users">Users</a><a href="#source"></a></strong></td>
              </tr>
            </table>
            <h4 class="boldword">&nbsp;</h4>
            <h2><span class="boldword">State-Specific Information</span>          </h2>
          </div>
</div>
      </div>

<%
    If Session("NewUser") = "True" Then
%>
      <div class="NoPrint"></div>
<%
    Else
%>
      <div class="NoPrint"></div>
<%
    End If
%>

    <div id="page">
      <div id="content">

        <div id="about" class="post">
          <div class="NoScreen">
            <h2 class="title">Taxing Jurisdictions Are . . . Taxing!</h2>
          </div>
          <div id="content2">
            <div id="about2" class="post">
              <h1 class="title"><strong class="title">About The Data</strong></h1>
              <div class="NoScreen">
                <p>&nbsp;</p>
              </div>
              <div class="entry">
                <div id="Accordion1" class="Accordion" tabindex="0">
                  <div class="AccordionPanel">
                    <div class="AccordionPanelTab"><strong><a name="breakouts"></a>Do you provide breakouts
                        for county and local sales taxes?</strong></div>
                    <div class="AccordionPanelContent">
                      <h4>We now offer breakouts for state, county, city and
                        special districts. <br>
                      </h4>
                      <h4>&nbsp;</h4>
                      <h4>Breakouts are available to our<span class="boldword"> Lookup
                          Service </span>subscribers by hovering your mouse over
                          the tax rate on the Lookup screen. </h4>
                      <h4><br>
                      </h4>
                      <h4>Breakouts are also available to our<span class="boldword"> Tax
                          Table</span> subscribers. New Table subscribers will
                          automatically received the broken-out tables. Current
                          Table Update subscribers will receive both the new
                          and old format tables until October 2010 and then will
                          receive only the new format thereafter.</h4>
                      <h4><br>
                      </h4>
                      <h4>Breakouts are not currently available to our <span class="boldword">Database</span> subscribers,
                        but development is underway. Subscribers will be given
                        the option of staying with the original Database or converting
                        to the breakout version.</h4>
                    </div>
                  </div>
                  <div class="AccordionPanel">
                    <div class="AccordionPanelTab"><strong><a name="columns"></a>Why are some columns
                        in the tax table blank?</strong></div>
                    <div class="AccordionPanelContent">The tax tables have been
                      standardized to work for the entire country. Some columns
                      may be blank because that particular state may have a different
                      taxing structure.</div>
                  </div>
                  <div class="AccordionPanel">
                    <div class="AccordionPanelTab"><strong><a name="countries"></a>Do you provide tax
                        rates for other countries?</strong></div>
                    <div class="AccordionPanelContent">We do not currently offer
                      tax lookups for countries other than the United States.</div>
                  </div>
                </div>
      <h1 class="subtitle">&nbsp;</h1></div></div></div></div></div><p>&nbsp;</p>
      <div id="sidebar">

        <!--#include file="includes/BodyParts/LoginBox.asp"-->
        <!--#include file="includes/BodyParts/LookupBox.asp"-->

        <div class="NoPrint">
        <hr style="color:red;">
          <div id="services" class="services">
            <h2 class="title">Which Sales Tax<br>
            Retrieval Method Is<br>
            Right For You?</h2>

            <div class="content">
              <p>Quick and Easy</p>
                <div id="serviceswrap" onClick="clickLink(1);">
                  <p style="background: url(images/servicesbox/servicesbox_1.png) no-repeat 50% 5px;">
                    ONLINE<BR>LOOKUP<BR>SERVICE<br>
                    <img src="/images/servicesbox/servicesbox_arrow.png">
                  </p>
                </div>
              <p>E-Commerce</p>
                <div id="serviceswrap" onClick="clickLink(2);">
                  <p style="background: url(images/servicesbox/servicesbox_2.png) no-repeat 50% 5px;">
                    DATABASE<BR>INTERFACE<br>
                    <img src="/images/servicesbox/servicesbox_server.png">
                  </p>
                </div>
              <p>Versitile</p>
                <div id="serviceswrap" onClick="clickLink(3);">
                  <p style="padding-bottom: 0px; background: url(images/servicesbox/servicesbox_3.png) no-repeat 50% 5px;">
                    SALES TAX<BR>TABLES<br>
                    <img src="/images/servicesbox/servicesbox_table.png">
                  </p>
                  <p style="padding-top:5px;">W/MONTHLY<BR>UPDATE<BR>
                    OPTION
                  </p>
                </div>
            </div>

          </div>
        </div>
        
        <div class="NoPrint">
          <div id="testimonials" class="box">
            <h2 class="title">Testimonials</h2>
            <div class="content">
                  Wow, did you just make my job easier.  Thanks for your quick look-up service.<br>
                  <i>Brenda W., San Francisco, CA</i><br><br>

                  I was glad to hear you do your own research.  I wanted to be sure you were not just a reseller for the company
                  we were already with.  They have a lot of mistakes.<br> 
                  <i>Mary L., Palm Springs, FL</i><br><br>

                  The way you gave us individual attention in getting our website connected to your database was very impressive.<br>
                  <i>Mark T., Bellview, WA</i><br><br>

                  We handle insurance claims all over the country and found your service to be perfect for our needs.<br> 
                  <i>Barry S., Stamford, CT</i><br><br>

                  Thanks for getting us running right away.<br> 
                  <i>Pam B., Watonga, OK</i><br><br>

                  We collect [sales] tax for three states according to the customer's address.  Our sales people can now give accurate estimates
                  out on the floor.<br>
                  <i>Trina R., Larchmont, NY</i>

            </div>
          </div>
        </div>

      </div>  <!--End of sidebar-->




      <div style="clear: both; height: 20px;">&nbsp;</div>
    </div>  <!--End of page-->

    </div>  <!--End of bigpage-->
  </div>  <!--End of bg-->
<!--#include file="includes/BodyParts/footer.asp"-->
<script type="text/javascript">
<!--
var Accordion1 = new Spry.Widget.Accordion("Accordion1");
//-->
</script>
</body>
</html>
