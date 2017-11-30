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
Const sErrorAcctExpired = "Your subscription has expired, Please call 866-492-8494."
Const sMessageAcctExpiredToday = "Your subscription expires today, Please call 866-492-8494."
Const sMessageAcctExpiredTomorrow = "Your subscription expires tomorrow, Please call 866-492-8494."

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
		'Response.Write(cWebLookup & "  --cWebLookup<br>")
        'Check if account has web lookup access
        If SubscriptionData.IsSubscribed(cWebLookup) or Session("FreeTrialInterimSignupAllowTemp") = "1" Then
			'cWebLookup is a constant who's value = 1
			'IsSubscribed(1) returns true or false
			
			if Session("FreeTrialInterimSignupAllowTemp") = "1" then
				
               LookupResults.ClientType = clientTypeFree
			else
			
			'Valid account for web lookup
            LookupResults.ClientType = clientTypeWeb
			end if
            
        Else
            'Invalid account type for web lookup
            LookupResults.SetActivityInfo cActivityInvalidAcct, sErrorInvalidAcct
            Exit Function
        End If
		
		if Session("FreeTrialInterimSignupDone") = "1"  or Session("FreeTrialInterimSignupAllowTemp") = "1" then
				
               daysDiff = DateDiff("d", Date, DateAdd("d",15,date))
			else
        'Alert user of pending or account expiration
		'Response.Write(cWebLookup)& "cWebLookup<br/>"
        daysDiff = DateDiff("d", Date, SubscriptionData.GetExpirationDate(cWebLookup))
		 End If
		
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
	
	If Session("z2t_loggedin") <> "" Then
	    AccessCheck = True
	End If

End Function

Function LookupSalesTax(zipCode, cID)

    Dim recordCount
    Dim rsLookup

    'Not to be pessimistic
    recordCount = 0
    LookupSalesTax = False
	cID = 1 'Set by Humair - After removing cookies from website
		'response.Write("Here in z2t_Lookup_v25<br/>")
'		
'	response.Write("exec z2t_Lookup_v25 '" & _
'        zipCode & "','" & _
'        reqIPAddress & "','" & _ 
'	    Session("z2t_Username")  & "','" & _ 
'	    Session.SessionID  & "','" & _ 
'	    reqPathInfo     & "','" & _
'		reqReferer & "','" & _
'	    cID     & "','" & _
'	    recordCount     & "'" )
		
		

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
		
		'########################	commented by Humair - Removed Cookies Task - 27 July 2016
        'If (IsEmpty(Request.Cookies("Zip2Tax")("CookieID"))) Then
'            'Invalid access warn user
'            LookupResults.ErrorMessage = "Browser cookies are required to use this service."
'            Response.AppendToLog "AppError[z2t_Lookup.asp]: Lookup request without cookies enabled"
'        Else
		'############ Humair Comment End
		
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
       ' End If
	   '########## Humair- Linked with Above comment
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

Function iif(condition, consequent, alternative)
  If condition Then iif = consequent Else iif = alternative
End Function
	
%>