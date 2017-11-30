<!-- Place this render call where appropriate -->
<script type="text/javascript">
  // google
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);})();
</script>

<%
    Dim PrintedSubHead
    Select Case Session("activePage")
    Case "Home"
        PrintedSubHead = "Lorman Sale Tax"
    Case "Lookup"
        PrintedSubHead = "Online Lookup"
    Case "Services"
        PrintedSubHead = "Services / Price List"
    Case "Contact"
        PrintedSubHead = "Contact Information"
    Case "Developers"
        PrintedSubHead = "Developers Information"
    Case "Account"
        PrintedSubHead = "Account Information"
	Case "Prices"
        PrintedSubHead = "Zip2Tax Price Structure"
	Case "DatabaseFree"
        PrintedSubHead = ""	
    Case Else
        PrintedSubHead = "ZIP Code Lookup of Sales Tax Jurisdictions"
    End Select
%>



<div id="divPageHeading" class="NoPrint" style="width: 100%">
  
  <div style="width: 1300px; height: 147px; overflow: hidden; margin: 0;">
  
    <div style="width: 225px; float: left; padding-left: 1em; vertical-align: top;">
      &nbsp;
      <!--Comm100 Live Chat - REMOVE THE WORDS virtual= to disable the chat-->
      <!--#include virtual="/Website/Includes/BodyParts/LiveChat.inc"-->
	    
	  <div id="google_translate_element" style="width: 170px; padding-top: .5em; text-align: center;"></div>
	  
	    <script type="text/javascript">
  
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, gaTrack: true, gaId: 'UA-8941943-2'}, 'google_translate_element');
}
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    </div>
	
    <div style="width: 680px; float: left;
                padding: 15px 0 0 0; text-align: center;">
      <img src="/Website/Images/logo-header.png" alt="Zip2Tax Logo"
           Title="Zip2Tax, LLC Tax Data Providers">
    </div>
	
    <div style="width: 300px; float: left; color: #FFFFFF;
                padding: 20px 0 0 0px;
                font-size: 18px;">
      <div style="height: 25px; overflow: hidden;">Sales & Use Tax Rates</div>
      <div style="height: 25px; overflow: hidden;">for State, County, City</div>
      <div style="height: 25px; overflow: hidden;">and Special Districts</div>
    </div>
    <div style="display: inline-block; margin-top: 1em; margin-right: .5em; white-space: nowrap;font-weight: bold;font-size: 20px;color: #FFFFFF;">
      1-866-492-8494
    </div>
	
  </div>
</div>



<div class="NoScreen">
  <div style="text-align: center;">
    <img src="/Website/Images/logo-header.png" alt="Zip2Tax Logo"><br>
  </div>
  
  <hr>
  
  <div style="text-align: center;
              font-weight: bold; 
              font-size: 24px;">
    <%=PrintedSubHead%>
  </div>

  <hr>
<% 
  Dim bottomMenu
  bottomMenu = false 
%>
</div>
