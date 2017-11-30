<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/z2t_userSubscriptions.asp"-->
<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/sql-dev.asp"-->

<%
    Response.buffer = True

    Session("activePage") = "Lookup"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
%>

<%

' *********************************************************
' Page Variables
'
Const cMaxDailyFree   = 10
Const cMaxTotalFree   = 50

Const cBlankData    = ""

'Activity Messages
Const sPhone = "<br/>Please call 1-866-492-8494"
Dim sSalesInfo: sSalesInfo = sPhone & " to purchase a subscription or click on the Services link to order using our secure on-line system."
Dim sErrorMaxDaily: sErrorMaxDaily = "This IP address has reached the maximum number of free lookups for today.<br/>You are allowed " & cMaxDailyFree & " per day until a total of " & cMaxTotalFree & " is reached." & sSalesInfo
Dim sErrorMaxTotal: sErrorMaxTotal = "This IP address has reached the maximum number of free lookups.  " & sPhone & " to extend your free trial."
Const sErrorInvalidZip = "Invalid ZIP Code. The ZIP Code you have entered does not exist.<br/>Please try again."
Const sErrorNotLoggedIn = "Please log into your account."
Const sErrorInvalidAcct = "Your subscription is not set for the Web Lookup service."
Const sErrorAcctExpired = "Your subscription has expired."
Const sMessageAcctExpiredToday = "Your subscription expires today."
Const sMessageAcctExpiredTomorrow = "Your subscription expires tomorrow."

'Get tracking column names
Const sTrackingID       = "TrackingID"
Const sLoginStatus      = "LoginStatus"
Const sLookupsTotal     = "LookupsTotal"
Const sLookupsMonthly   = "LookupsMonthly"
Const sLookupsDaily     = "LookupsDaily"
Const sCalcsTotal       = "CalcsTotal"
Const sCalcsMonthly     = "CalcsMonthly"
Const sCalcsDaily       = "CalcsDaily"
Const sLastActivityDate = "LastActivityDate"

'Lookup column names
Const sZipInput      = "Zip"
Const sSalesRate     = "Rate"
Const sUseRate       = "UseRate"
Const sRatePercent   = "RatePercent"
Const sUseRatePercent   = "UseRatePercent"
Const sCity          = "City"
Const sCounty        = "County"
Const sState         = "State"
Const sJurisdiction  = "Jurisdiction"
Const sDisplayCity   = "DisplayCity"
Const sBreakoutHTML  = "BreakoutHTML"
Const sUseTaxBreakoutHTML  = "UseTaxBreakoutHTML"
Const sSpm_Path      = "spm_Path"
Const sCategory      = "Category"
Const sNote          = "Note"

Dim reqIPAddress     'Request IP Address (REMOTE_ADDR)
Dim reqPathInfo      'Request Path (PATH_INFO)
Dim reqReferer       'Request referrer (HTTP_REFERER)
Dim LookupResults    'Class instance for primary lookup results
Dim SubscriptionData 'Class instance for user account data

'
' Lookup Class object
'
Class CLookupResults

    Public ZipInput
    Public SalesRate
    Public UseRate
    Public RatePercent
    Public UseRatePercent
    Public City
    Public County
    Public State
    Public Jurisdiction
    Public DisplayCity
    Public BreakoutHTML
    Public UseTaxBreakoutHTML
    Public Spm_Path
    Public Category
    Public RateNote

    Public ClientType
    Public UserLookupsDaily
    Public UserLookupsTotal
    Public PercentSign
    Public Count
    Public NotesCount
    Public HasSalesTax
    Public ActivityType
    Public ErrorMessage

    Private rsLookup     'Sales tax rate lookup recordset
    Private rsTaxNotes   'Sales tax rate notes recordset

    Private Sub Class_Initialize()
        ZipInput      = cBlankData
        SalesRate     = cBlankData
        UseRate       = cBlankData
        RatePercent   = cBlankData
        UseRatePercent   = cBlankData
        City          = cBlankData
        County        = cBlankData
        State         = cBlankData
        Jurisdiction  = cBlankData
        DisplayCity   = cBlankData
        BreakoutHTML  = cBlankData
        UseTaxBreakoutHTML  = cBlankData
        Spm_Path      = cBlankData
        Category      = cBlankData
        RateNote      = cBlankData

        ClientType    = clientTypeFree
        UserLookupsDaily = 0
        UserLookupsTotal = 0
        PercentSign   = cBlankData
        Count         = 0
        NotesCount    = 0
        HasSalesTax   = True
        ActivityType  = cActivityZipLookup
        ErrorMessage  = cBlankData

        Set rsLookup = Nothing
        Set rsTaxNotes = Nothing
    End Sub

    Private Sub Class_Terminate()
        If Not (rsLookup Is Nothing) Then
            rsLookup.Close
            Set rsLookup = Nothing
        End If
        If Not (rsTaxNotes Is Nothing) Then
            rsTaxNotes.Close
            Set rsTaxNotes = Nothing
        End If
    End Sub

    Public Sub SetActivityInfo(typeID, actMsg)
        ActivityType = typeID
        ErrorMessage = actMsg
    End Sub

    Public Sub SetLookupResults(zip, rs, recordCount)
        ZipInput = zip
        If (rs Is Nothing) Then Exit Sub
        Set rsLookup = rs
        Count = recordCount
        If (recordCount > 0) Then SetLookupData(True)
    End Sub

    Public Function NextTaxRecord()
        NextTaxRecord = False
        If (rsLookup Is Nothing) Then Exit Function
        rsLookup.MoveNext
        If (rsLookup.EOF = True) Then Exit Function
        SetLookupData(False)
        NextTaxRecord = True
    End Function

    Public Sub SetTaxNotes(rs, recordCount)
        If (rs Is Nothing) Then Exit Sub
        Set rsTaxNotes = rs
        NotesCount = recordCount
        If (recordCount > 0) Then SetNoteData
    End Sub

    Public Function NextTaxNote()
        NextTaxNote = False
        If (rsTaxNotes Is Nothing) Then Exit Function
        rsTaxNotes.MoveNext
        If (rsTaxNotes.EOF = True) Then Exit Function
        SetNoteData
        NextTaxNote = True
    End Function

    Private Sub SetLookupData(initialLoad)
        SalesRate     = rsLookup(sSalesRate)
        UseRate       = rsLookup(sUseRate)
        RatePercent   = rsLookup(sRatePercent)
        UseRatePercent   = rsLookup(sUseRatePercent)
        City          = rsLookup(sCity)
        County        = rsLookup(sCounty)
        State         = rsLookup(sState)
        DisplayCity   = rsLookup(sDisplayCity)
        BreakoutHTML  = rsLookup(sBreakoutHTML)
        UseTaxBreakoutHTML  = rsLookup(sUseTaxBreakoutHTML)
        Spm_Path      = rsLookup(sSpm_Path)
        If Not initialLoad Then Exit Sub
        'Do these only on initial load
        Jurisdiction  = rsLookup(sJurisdiction)
        If SalesRate > 0 Then
            PercentSign = "%"
        Else
            PercentSign = cBlankData
        End If
        If InStr(1, Jurisdiction, "No Sales Tax", vbTextCompare) = 1 Then
            'No sales tax levied, no note lookup
            HasSalesTax = False
        Else
            'Sales tax levied, lookup notes
            HasSalesTax = True
        End If
    End Sub

    Private Sub SetNoteData
        Jurisdiction  = rsTaxNotes(sJurisdiction)
        Category      = rsTaxNotes(sCategory)
        RateNote      = rsTaxNotes(sNote)
    End Sub

End Class


' *********************************************************
' Page Functions
'

Function AccessCheck(cID, tID)

    Dim daysDiff

    'Not to be pessimistic
    AccessCheck = False

    'Force login
    If Session("z2t_UserName") <> "" And Session("z2t_loggedin") = "" Then
        Session("LoginErrorUrgent") = sErrorNotLoggedIn
        LookupResults.SetActivityInfo cActivityNotLoggedIn, sErrorNotLoggedIn
        Exit Function
    End If

    'Check account validity
    If Session("z2t_loggedin") = "True" Then
		'Response.write Session("z2t_loggedin") & "<br>"
		'Response.write SubscriptionData.IsSubscribed(1) & "<br>"
        'Check if account has web lookup access
        If SubscriptionData.IsSubscribed(cWebLookup) Then
			'cWebLookup is a constant who's value = 1
			'IsSubscribed(1) returns true or false

            'Valid account for web lookup
            LookupResults.ClientType = clientTypeWeb
        Else
            'Invalid account type for web lookup
            LookupResults.SetActivityInfo cActivityInvalidAcct, sErrorInvalidAcct
            Exit Function
        End If
        'Alert user of pending or account expiration
        daysDiff = DateDiff("d", Date, SubscriptionData.GetExpirationDate(cWebLookup))
        Select Case True
            Case (daysDiff < 0)
                LookupResults.SetActivityInfo cActivityAcctExpired, sErrorAcctExpired & sSalesInfo
                Session("LoginErrorUrgent") = sErrorAcctExpired
                Exit Function
            Case (daysDiff = 0)
                Session("LoginErrorPassive") = sMessageAcctExpiredToday
            Case (daysDiff = 1)
                Session("LoginErrorPassive") = sMessageAcctExpiredTomorrow
            Case (daysDiff > 1) And (daysDiff < 31)
                Session("LoginErrorPassive") = "Your Subscription Expires in " & daysDiff & " Days."
        End Select
    End If

    'Check lookup counts for anon users
    If (LookupResults.ClientType = clientTypeFree) Then
        If (LookupResults.UserLookupsDaily >= cMaxDailyFree) Then
            LookupResults.SetActivityInfo cActivityDailyMax, sErrorMaxDaily
            Exit Function
        ElseIf (LookupResults.UserLookupsTotal >= cMaxTotalFree) Then
            LookupResults.SetActivityInfo cActivityTotalMax, sErrorMaxTotal
            Exit Function
        End If
    End If

    AccessCheck = True

End Function

Function LookupSalesTax(zipCode, cID)

    Dim recordCount
    Dim rsLookup

    'Not to be pessimistic
    recordCount = 0
    LookupSalesTax = False

    Set rsLookup = z2t_Lookup_v25(zipCode, _
                                    reqIPAddress, _
                                    Session("z2t_Username"), _
                                    Session.SessionID, _
                                    reqPathInfo, _
                                    reqReferer, _
                                    cID, _
                                    recordCount)

    If Not (rsLookup Is Nothing) Then
        If (recordCount <> 0) Then
            LookupResults.SetLookupResults zipCode, rsLookup, recordCount
            '
            ' Increment lookup counts
            '
            Session("z2t_UserLookupsDaily") = (LookupResults.UserLookupsDaily + 1)
            Session("z2t_UserLookupsTotal") = (LookupResults.UserLookupsTotal + 1)
            LookupSalesTax = True
        Else
            LookupResults.SetActivityInfo cActivityInvalidZip, "[" & zipCode & "]&nbsp;" & sErrorInvalidZip
        End If
    Else
        LookupResults.ErrorMessage = "Lookup Failed. (z2t:3)"
    End If

    Set rsLookup = Nothing

End Function

Function LookupNotes(zipCode)

    Dim recordCount
    Dim rsLookup

    'Not to be pessimistic
    recordCount = 0
    LookupNotes = False

    Set rsLookup = z2t_NotesLookup_v25(zipCode, recordCount)

    If Not (rsLookup Is Nothing) Then
        If (recordCount > 0) Then
            LookupResults.SetTaxNotes rsLookup, recordCount
        End If
        LookupNotes = True
    Else
        LookupResults.ErrorMessage = "Notes Lookup Error. (z2t:4)"
    End If

    Set rsLookup = Nothing

End Function

Function ProcessRequest(zipCode, cID, tID)

    Dim loggedIn

    'Not to be pessimistic
    ProcessRequest = False

    If Session("z2t_loggedin") = "True" Then
        loggedIn = 1
    Else
        loggedIn = 0
    End If

    Do
        '
        ' Validate input
        '
        If (Not IsNumeric(zipCode)) Or (Len(zipCode) <> 5) Then
            'Malformed request, set error and exit
            LookupResults.SetActivityInfo cActivityInvalidZip, "[" & zipCode & "]&nbsp;" & sErrorInvalidZip
            Exit Do
        End If
        '
        ' Verify access
        '
        If (AccessCheck(cID, tID) = False) Then Exit Do
        '
        ' Lookup sales tax
        '
        If (LookupSalesTax(zipCode, cID) = False) Then Exit Do
        '
        ' Update IP lookup count for anonymous requests
        '
        If (LookupResults.ClientType = clientTypeFree) Then
            If (z2t_UpdateIPCount(reqIPAddress) = False) Then Exit Do
        End If
        '
        ' Record lookup, a trackingID is returned for new user
        '
        If (z2t_UpdateTracking(tID, _
                                cActivityZipLookup, _
                                cID, _
                                reqIPAddress, _
                                LookupResults.ClientType, _
                                SubscriptionData.GetAccountID(cWebLookup), _
                                loggedIn) = False) Then
            LookupResults.ErrorMessage = "Lookup Failed. (z2t:2)"
            Exit Do
        End If
        '
        ' Set session trackingID if necessary and set cookie data
        '
        If (CLng(Session("z2t_TrackingID")) = 0) Then
            Session("z2t_TrackingID") = tID
        End If
        Response.Cookies("Z2Tv25")("tid") = tID
        Response.Cookies("Z2Tv25").Expires = #December 31, 2030#
        '
        ' If applicable lookup tax note(s)
        '
        If (LookupResults.HasSalesTax = True) Then
            'If sales tax lookup notes
            LookupNotes zipCode
        End If
        '
        ' Got this far, flag lookup successful
        '
        ProcessRequest = True

    Loop While (False)

End Function

' *********************************************************
' Page Code
'
    Dim zipInput
    Dim cookieID
    Dim trackingID

    reqIPAddress = Request.ServerVariables("REMOTE_ADDR")
    reqPathInfo = FormatPath(Request.ServerVariables("PATH_INFO"))
    reqReferer = Unescape(Request.ServerVariables("HTTP_REFERER"))

    cookieID = Session("CookieID")
    trackingID = Session("z2t_TrackingID")

    'Instantiate a lookup result object
    Set LookupResults = New CLookupResults
    'Set counts in lookup result object
    LookupResults.UserLookupsDaily = Session("z2t_UserLookupsDaily")
    LookupResults.UserLookupsTotal = Session("z2t_UserLookupsTotal")
    'Get subscription data object
    Set SubscriptionData = GetUserSubscriptions(Session("z2t_UserName"))

    'Check for a lookup request
    If Not IsEmpty(Request("inputZip")) Then
        'Protect against injection attacks
        zipInput = Left(Request("inputZip"), 5)
        'Check for rogue lookups
        If (IsEmpty(Request.Cookies("Zip2Tax")("CookieID"))) Then
            'Invalid access warn user
            LookupResults.ErrorMessage = "Browser cookies are required to use this service."
            Response.AppendToLog "AppError[z2t_Lookup.asp]: Lookup request without cookies enabled"
        Else
            'Valid interactive request, process it
            If (ProcessRequest(zipInput, cookieID, trackingID) = False) Then
                'Log lookup error
                z2t_LogActivity Session("z2t_UserName"), _
                                LookupResults.ActivityType, _
                                zipInput, _
                                " ", _
                                reqPathInfo, _
                                reqReferer, _
                                Session.SessionID, _
                                reqIPAddress, _
                                "z2t_Lookup.asp", _
                                cookieID
            End If
        End If
    End If

    ' Test Error Messages
    Dim Errors: Set Errors = Server.CreateObject("Scripting.Dictionary")
    Errors.add "daily max", sErrorMaxDaily
    Errors.add "total max", sErrorMaxTotal

    Dim ErrorCodes: Set ErrorCodes = Server.CreateObject("Scripting.Dictionary")
    ErrorCodes.add "daily max", "cErrorMaxDaily"
    ErrorCodes.add "total max", "cErrorMaxTotal"

    If Request("DebugError") <> "" Then
      LookupResults.ErrorMessage = Errors(Request("DebugError"))
    End If
%>


  <head>
    <title>ZIP Code Lookup of Sales and Use Tax Rates Plus Calculator</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="ZIP Code To Sales Tax Calculator.  Use our handy tool to calculate your sales tax instantly.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/JavaScript/z2t_functions.js" type="text/javascript"></script>
    <script language="javascript" src="/Website/Includes/UserTracking/z2t_UserTrackingPost.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
      var pathBase = '<%=pathBase%>';
      var currentPage = '<%=Session("currentPage")%>';
      var errorMessage = '<%=Session("LoginErrorUrgent")%>';
      var userName = '<%=Session("UserName")%>';
      var totalrate = '<%=LookupResults.SalesRate%>';

    function altOn(obj, t, b, e)
        {
        if ( (totalrate != '') && (parseInt(totalrate) > 0) )
            {
            var altScreen = document.getElementById('mouseoverDiv');
            var cursor = getPosition(e);

            altScreen.style.top = (cursor.y - 20) + 'px';
            if (cursor.x < 700)
                {
                altScreen.style.left = (cursor.x + 100) + 'px';
                }
            else
                {
                altScreen.style.left = (cursor.x - 400) + 'px';
                }

            document.getElementById('mouseoverTitle').innerHTML = t;

            b = b.replace(/~/g,"<br>");
            b = b.replace('<TD total','<TD Style="border-top: 1px solid #C0C0C0;"');
            b = b.replace('<TD total','<TD Style="border-top: 1px solid #C0C0C0;"');
            b = b.replace('<TD total','<TD Style="border-top: 1px solid #C0C0C0;"');
            document.getElementById('mouseoverBody').innerHTML = b

            altScreen.style.visibility = 'visible';
            }
        }

    function altOff()
        {
        document.getElementById('mouseoverDiv').style.visibility = 'hidden';
        }

    function blurField(f) {
       if (f == 'zip') {
             /*
                if (zLen == 5)
                    {
                    var URL = '<%=pathBase%>' + currentPage +
                        '?inputZip=' + document.getElementById('inputZip').value;
                    window.document.location = URL;
                    }
                else if (zLen != 0)
                    {
                    alert('ZIP Code must have 5 numerals');
                    }
             */
        }}


    function clickGetRate() {
      var zLen = document.getElementById('inputZip').value.length
      if (zLen == 5) {
        var URL = '<%=pathBase%>' + currentPage + '?inputZip=' + document.getElementById('inputZip').value;
        window.document.location = URL;}
      else if (zLen != 0) {
        alert('ZIP Code must have 5 numerals');}}


    function clickGetTax(f) {
         //   if ((f == 'amt') || (f == 'useTax')) {
            if (f == 'calc') {
              if ((document.getElementById('inputAmt').value.length > 0) && (document.getElementById('inputAmt').value !== 'Enter Dollar Amount')) {
                if ('<%=LookupResults.BreakoutHTML%>' === '') {
                  alert('To calculate the tax, first you must enter a ZIP code.')}
                else {
                  getTax(f);
                  document.getElementById('inputAmt').value = 'Enter Dollar Amount';}}}}

    function focusField(f)
        {
        foc=f;
        }

    function formLoad()
        {
        document.getElementById('JavaScriptTest').innerHTML = 'Pass';
        if (errorMessage > '')
            {
            alert(errorMessage);
            }
            //document.getElementById('inputZip').focus();
        }

    function getTax(taxType)
        {
        var amt = RoundUp(Number(document.getElementById('inputAmt').value));
        if(isNaN(amt))
            { amt = 0; }

        if (amt == 0)
            {
            amt = parseFloat(document.getElementById('result_amt').innerHTML);
            }

        if(isNaN(amt))
            { amt = 0; }

        if (amt == 0)
            {
            document.getElementById('result_amt').innerHTML = formatCurrency(0,'');
            document.getElementById('result_tax').innerHTML = formatCurrency(0,'');
            document.getElementById('result_tsale').innerHTML = formatCurrency(0,'');
            //document.getElementById('inputAmt').focus();
                //starting of use tax fields
                if (document.getElementById('use_result_tax') != null) {
                    document.getElementById('use_result_amt').innerHTML = formatCurrency(0, '');
                    document.getElementById('use_result_tax').innerHTML = formatCurrency(0, '');
                    document.getElementById('use_result_tsale').innerHTML = formatCurrency(0, '');
                }
            }
        else
            {
                document.getElementById('result_amt').innerHTML = formatCurrency(amt, '$');

                if (document.getElementById('use_result_tax') != null) {
                    document.getElementById('use_result_amt').innerHTML = formatCurrency(amt, '$');
                }

            data1 = amt;
            var r;
            var use_r;

//            if (taxType == 'amt') { // Sales tax
//                r = parseFloat(document.getElementById('result_rate').innerHTML);
//                document.getElementById('result_taxlable').innerHTML = "<b>Sales&nbsp;Tax:<\/b>";
//            }
//            else { // Use Tax
//                r = parseFloat(document.getElementById('use_rate').innerHTML);
//                document.getElementById('result_taxlable').innerHTML = "<b>Use&nbsp;Tax:\<b>";
//            }

            if (taxType == 'calc') { // Calculate Sales and Use Tax
                r = parseFloat(document.getElementById('result_rate').innerHTML);

                if (document.getElementById('use_result_tax') != null) {
                    use_r = parseFloat(document.getElementById('use_rate').innerHTML);
                }

            }
            
            var tot = RoundUp(Number(amt * r) / 100);
            data2 = tot;
            document.getElementById('result_tax').innerHTML = formatCurrency(tot, '');
            tot += RoundUp(Number(amt));
            document.getElementById('result_tsale').innerHTML = formatCurrency(tot, '$');

            if (document.getElementById('use_result_tax') != null) {
                var use_tot = RoundUp(Number(amt * use_r) / 100);
                document.getElementById('use_result_tax').innerHTML = formatCurrency(use_tot, '');
                use_tot += RoundUp(Number(amt));
                document.getElementById('use_result_tsale').innerHTML = formatCurrency(use_tot, '$');
            }

            document.getElementById('inputAmt').value = '';
            //document.getElementById('inputAmt').focus();
            
            
            //z2t_UserTracking('5', currentPage, data1, data2);

            var state = document.getElementById('result_state').innerHTML;
            if (state == 'FL' && amt > 5000 && r > 6)
                {
                var remRetail = amt - 5000
                var msg ='Attention Sales Within Florida!\n\n' +
                  'Counties in FL are authorized to levy surtax. Only the first $5,000 of a single sale of tangible\n' +
                  'personal property is subjected to the sales surtax. Any amounts over $5,000 are taxed at the\n' +
                  'state rate of 6%.\n\n' +
                  'If this case exists for you then the ' + formatCurrency(amt,'$') + ' ' +
                  'sale should be charged a total tax of ' +
                  formatCurrency(RoundUp(RoundUp(Number(r * 5000) + RoundUp(6 * remRetail))/100),'$') + '.';
                alert(msg);
                }
            }
        }

        function numbersonly(myfield, e, dec)
        {
        var key;
        var keychar;

        if (window.event != null)
            {
            key = window.event.keyCode;
            }
        else if (e != null)
            {
            key = e.which;
            }
        else
            {
            return true;
            }

        keychar = String.fromCharCode(key);

        // Enter key hit
        if (key == 13) {
            foc = myfield.id.toString();
            //document.getElementById('inputAmt').focus();
            if (foc == 'inputAmt')
            {
                //causes getTax() to fire
                //document.getElementById('inputZip').focus();
                clickGetTax('calc');
                myfield.blur();
            }
            else
            {
                //causes getRate() to fire
                //document.getElementById('inputAmt').focus();
                var zLen = document.getElementById('inputZip').value.length
                if (zLen == 5)
                    {
                    var URL = '<%=pathBase%>' + currentPage +
                        '?inputZip=' + document.getElementById('inputZip').value;
                    window.document.location = URL;
                    }
                else if (zLen != 0)
                    {
                    alert('Zip Code must have 5 numerals');
                    }
            } 
        }

        // control keys
        if ((key==null) || (key==0) || (key==8) ||
            (key==9) || (key==27) )
           return true;

        // numbers
        else if ((("0123456789").indexOf(keychar) > -1))
           return true;

        // decimal point jump
        else if (dec && (keychar == "."))
           {
           return true;
           }
        else
           return false;
        }

    function RoundUp(num)
        {
        num += .0005
        return Math.round(num*100)/100
        }

    function formatCurrency(num, dsign)
        {
            num = num.toString().replace(/\$|\,/g,'');
            if(isNaN(num))
                num = "0";
            sign = (num == (num = Math.abs(num)));
            num = Math.floor(num*100+0.50000000001);
            cents = num%100;
            num = Math.floor(num/100).toString();
            if(cents<10)
                cents = "0" + cents;
            for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
            num = num.substring(0,num.length-(4*i+3))+','+
            num.substring(num.length-(4*i+3));
            return (((sign)?'':'-') + dsign + num + '.' + cents);
        }

      window.onload=formLoad;
    </script>


    <script type="text/javascript" src="/Website/pagesTaxRates/LookupZipCode/switchcontent.js" >
      /* following scripts and styles are used for breakout in the lookup html page */
    </script>

    <script type="text/javascript" src="/Website/pagesTaxRates/LookupZipCode/switchicon.js">
    </script>

    <style type="text/css">

        /*Default style for SPAN icons. Edit if desired: */

        .iconspan{
        float: right;
        margin: 3px;
        cursor:hand;
        cursor:pointer;
        font-weight: bold;
        }

        /*CSS used to style the examples. Remove if desired: */

        .eg-bar{
        background-color: #FFFFFF;
        font-weight: bold;
        padding: 3px;
        }

        div.eg-bar{
        width: 500px;
        }

        .icongroup1{
        width: 500px;
        }
        
        table#salestax_breakout, table#usetaxbreakout {border: none !important; width: 100% !important;}
    </style>

       <style type="text/css">
          html { height: 100% }
          body { height: 100%; margin: 0; padding: 0 }
          #map_canvas2 { height: 100% }
        </style>
    
    <style type="text/css">
    .style1 {background-color:#ffffff;font-weight:bold;border:2px #006699 solid;}
    </style>


	
    <script type="text/javascript"
        src="http://maps.googleapis.com/maps/api/js?key=AIzaSyACJstxRGIbX8Mv_I2-a8tOLN0d620APjo&amp;sensor=false">
    </script>


    <script type="text/javascript">
            function initialize() 
        {
            formLoad();
             <% If (LookupResults.zipInput <> "") Then %>
              <% sqlConnectionString = connStrPublic

                Dim rs
                Dim sqlText: sqlText = "SELECT * FROM z2t_WebPublic.dbo.z2t_ZipCodes_boundaries with(nolock) WHERE ZipCode = " & LookupResults.zipInput & " ORDER BY polygonId, colid"
                Set rs = Sql(sqlText)
                
                        If not rs.eof then %>
              
                                  <% If (rs("Latitude") <> "0" ) then%>

                                        <% 
                                            sqlConnectionString = connStrPublic
                                            sqlText = "select COUNT(distinct polygonid) AS polygon_count from z2t_WebPublic.dbo.z2t_ZipCodes_boundaries with(nolock) where ZipCode = " & LookupResults.zipInput
                                            Dim rs1
                                            Set rs1 = Sql(sqlText)
                                            Dim polygonCount: polygonCount = rs1("polygon_count")
                                            For i = 1 to polygonCount
                                        %>
                                                
                                                 <% sqlConnectionString = connStrPublic
													Dim rs2
                                                    sqlText = "SELECT * FROM z2t_WebPublic.dbo.z2t_ZipCodes_boundaries with(nolock) WHERE ZipCode = " & LookupResults.zipInput & " and polygonId = " & i & " ORDER BY colid"
                                                    Set rs2 = Sql(sqlText)
                                                 %>

                                                  var triangleCoords<%=i%> = [  

                                                    <%  
                                                        Do While not rs2.eof
                                                    %>
                                                            new google.maps.LatLng(<%=rs2("Latitude") %>, <%=rs2("Longitude") %>)
                                                    <%        
                                                            rs2.MoveNext
                                                            If rs2.eof then Exit Do
                                                    %>
                                                           ,
                                                    <%    
                                                        Loop
                                                     %>
                                                             ];
                                        

                                        <%  Next
                                        %> 
                                        
                                        
                                        
                                         

                                         <% 
                                            sqlConnectionString = connStrPublic
                                            sqlText = "SELECT * FROM z2t_WebPublic.dbo.z2t_ZipCodes_boundaries with(nolock) WHERE ZipCode = " & LookupResults.zipInput & " ORDER BY polygonId, colid"
                                            Set rs = Sql(sqlText)
                                        %>
                            
                                        <%  
                                            Dim minx
                                            Dim maxx
                                            Dim miny
                                            Dim maxy

                                            Dim xco
                                            Dim yco

                                            minx=rs("Latitude")
                                            maxx=rs("Latitude")
                                            miny=rs("Longitude")
                                            maxy=rs("Longitude")

                                            Do While not rs.eof
                                                xco = rs("Latitude")
                                                yco = rs("Longitude")

                                                If xco < minx Then
                                                    minx = xco
                                                End If

                                                If xco > maxx Then
                                                    maxx = xco
                                                End If

                                                If yco < miny Then
                                                    miny = yco
                                                End If

                                                If yco > maxy Then
                                                    maxy = yco
                                                End If

                                                rs.MoveNext
                                                If rs.eof then Exit Do
                                            Loop
                                        %>
                                         
                                         var min_x = <%=minx%>
                                         var max_x = <%=maxx%>

                                         var min_y = <%=miny%>
                                         var max_y = <%=maxy%>

                                         var diff_x = max_x - min_x;
                                         var diff_y = max_y - min_y;

                                         var zoom_level;
                                         
                                         if(diff_x < 0)
                                         {
                                            diff_x = diff_x * (-1);
                                         }

                                         if(diff_y < 0)
                                         {
                                            diff_y = diff_y * (-1);
                                         }

                                         
                                         
                                         if(diff_y > 0.3)
                                         {
                                            zoom_level = 8;
                                         }
                                         else if((diff_y > 0.2) && (diff_y <= 0.3))
                                         {
                                            zoom_level = 9;
                                         }
                                          else if((diff_y > 0.1) && (diff_y <= 0.2))
                                         {
                                            zoom_level = 10;
                                         }
                                          else if((diff_y > 0.05) && (diff_y <= 0.1))
                                         {
                                            zoom_level = 11;
                                         }
                                          else if((diff_y > 0.03) && (diff_y <= 0.05))
                                         {
                                            zoom_level = 12;
                                         }
                                          else if((diff_y > 0.02) && (diff_y <= 0.03))
                                         {
                                            zoom_level = 13;
                                         }
                                          else if((diff_y > 0) && (diff_y <= 0.02))
                                         {
                                            zoom_level = 14;
                                         }

                                         var myx = ((min_x + max_x)/2);
                                         var myy = ((min_y + max_y)/2);

                                         var myLatLng = new google.maps.LatLng(myx, myy);

                                        var myOptions = {
                                            center: myLatLng,
                                            zoom: zoom_level,
                                            mapTypeId: google.maps.MapTypeId.ROADMAP
                                        };
            
                                        var map = new google.maps.Map(document.getElementById("map_canvas2"),
                                        myOptions);

                                        var marker = new google.maps.Marker({
                                          position: myLatLng,
                                          map: map,
                                          title:"ZIP Code : <%=LookupResults.zipInput%>"
                                      });


                                        
                                        
                                        <% 
                                            For i = 1 to polygonCount
                                        %>
                                        
                                                var zip_polygon<%=i%>;

                                                zip_polygon<%=i%> = new google.maps.Polygon({
                                                    paths: triangleCoords<%=i%>,
                                                    strokeColor: "#FF0000",
                                                    strokeOpacity: 0.8,
                                                    strokeWeight: 2,
                                                    fillColor: "#FF0000",
                                                    fillOpacity: 0.35
                                                });

                                                zip_polygon<%=i%>.setMap(map);   
                                        
                                        <%  Next
                                        %> 
                                        
                                        
                                        
                                         

                                <% Else %>
                                        
                                         <% 
                                            sqlConnectionString = connStrPublic
                                            sqlText = "SELECT * FROM z2t_WebPublic.dbo.z2t_ZipCodes with(nolock) WHERE Zip_Code = " & LookupResults.zipInput 
                                            Set rs = Sql(sqlText)

                                            If (rs("Latitude") <> "0" ) then
                                        %>
                                                 var triangleCoords = [ new google.maps.LatLng(<%=rs("Latitude") %>, <%=rs("Longitude") %>) ];
                                                 var myLatLng = new google.maps.LatLng(<%=rs("Latitude") %>, <%=rs("Longitude") %>);

                                                 var myOptions = {
                                                    center: myLatLng,
                                                    zoom: 11,
                                                    mapTypeId: google.maps.MapTypeId.ROADMAP
                                                };
            
                                                var map = new google.maps.Map(document.getElementById("map_canvas2"),
                                                myOptions);

                                                 var marker = new google.maps.Marker({
                                                      position: myLatLng,
                                                      map: map,
                                                      title:"ZIP Code : <%=LookupResults.zipInput%>"
                                                  });

                                                var zip_polygon;

                                                zip_polygon = new google.maps.Polygon({
                                                    paths: triangleCoords,
                                                    strokeColor: "#FF0000",
                                                    strokeOpacity: 0.8,
                                                    strokeWeight: 2,
                                                    fillColor: "#FF0000",
                                                    fillOpacity: 0.35
                                                });

                                                zip_polygon.setMap(map);

                                            <% End If %>

                                <% End If %>

                    <% Else %>

                        <% 
                            sqlConnectionString = connStrPublic
                            sqlText = "SELECT * FROM z2t_WebPublic.dbo.z2t_ZipCodes with(nolock) WHERE Zip_Code = " & LookupResults.zipInput 
                            Set rs = Sql(sqlText)

                            If not rs.eof then
                                If (rs("Latitude") <> "0" ) then
                        %>

                            var triangleCoords = [ new google.maps.LatLng(<%=rs("Latitude") %>, <%=rs("Longitude") %>) ];
                            var myLatLng = new google.maps.LatLng(<%=rs("Latitude") %>, <%=rs("Longitude") %>);

                            var myOptions = {
                                center: myLatLng,
                                zoom: 11,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            };
            
                            var map = new google.maps.Map(document.getElementById("map_canvas2"),
                            myOptions);

                            var marker = new google.maps.Marker({
                                position: myLatLng,
                                map: map,
                                title:"ZIP Code : <%=LookupResults.zipInput%>"
                            });

                            var zip_polygon;

                            zip_polygon = new google.maps.Polygon({
                                paths: triangleCoords,
                                strokeColor: "#FF0000",
                                strokeOpacity: 0.8,
                                strokeWeight: 2,
                                fillColor: "#FF0000",
                                fillOpacity: 0.35
                            });

                            zip_polygon.setMap(map);

                            <%   End If
                             End If%>
                             
                    
                    <% End If %>
            
           

            <% Else %>
                var triangleCoords = [ new google.maps.LatLng(40.714352, -74.005973) ];
                var myLatLng = new google.maps.LatLng(40.714352, -74.005973); 

                var myOptions = {
                    center: myLatLng,
                    zoom: 11,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
            
                var map = new google.maps.Map(document.getElementById("map_canvas2"),
                myOptions);

                var zip_polygon;

                zip_polygon = new google.maps.Polygon({
                    paths: triangleCoords,
                    strokeColor: "#FF0000",
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor: "#FF0000",
                    fillOpacity: 0.35
                });

                zip_polygon.setMap(map);

            <% End If %>
    
        }
    </script>

	<!--[if lt IE 8]>
	  <link href="/Website/includes/css/z2t_lookup_lt8.css" rel="stylesheet" type="text/css">
    <![endif]-->
	
	<!--[if IE]>
	  <link href="/Website/Includes/css/z2t_lookup.css" rel="stylesheet" type="text/css">
    <![endif]-->
	
	<!--[if !IE]><!-->
	  <link href="/Website/Includes/css/z2t_lookup.css" rel="stylesheet" type="text/css">
	<!--<![endif]-->
	
	
	

  </head>

  <body onload="initialize()">

    <div id="divMain">

      <div id="divPageTop">
        <!--#include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->

      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!--#include virtual="/Website/pagesTaxRates/LookupZipCode/page_lookup_left_sidebar.asp"-->
        </div><!-- divPageLeft -->
        <div id="divPageCenter" style="clear: none;">
          <!--#include virtual="/Website/pagesTaxRates/LookupZipCode/page_lookup_content.asp" -->
        </div><!-- divPageCenter -->
        <div id="divPageRight">
          <!--#include virtual="/Website/pagesTaxRates/LookupZipCode/page_lookup_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->
     
      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->
  
    </div><!-- main -->
  </body>
</html>

<%
    'Delete lookup result instance
    Set LookupResults = Nothing
%>
