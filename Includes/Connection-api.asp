<% 
  ' Ensure that we always use http://Zip2Tax.com
  Dim z2tUrl: z2tUrl = Request.ServerVariables("SERVER_NAME")
  'Dim offensive: offensive = "www.zip2tax.com"
  Dim offensive: offensive = "zip2tax.com"
  Dim OffensiveLength: OffensiveLength = Len(offensive)
  If Left(z2tUrl, offensiveLength) = offensive Then
    'Response.Redirect(Right(z2tUrl, Len(z2tUrl) - OffensiveLength)) 'strip "www."
    Response.Redirect("http://www." & z2tUrl & "/" & Request.ServerVariables("URL")) 'append "www."
  End If
%>
<!--#include virtual="/Website/Includes/z2t_dbFunctions-api.asp"-->
<!--#include virtual="/Website/Includes/haAccountInfo.asp"-->
<%
'
' *********************************************************
' Page Functions
'
Function FormatPath(path)

    If Left(path, 1) = "/" Then
        FormatPath = Trim(Mid(path, 2))
    Else
        FormatPath = Trim(path)
    End If

End Function

Function InitSession()

    Dim cookieValue
    Dim cookieID
    Dim trackingID
    Dim userAgentHash
    Dim userName
    Dim reqUserAgent
    Dim rsVerify

    'Set defaults as new user
    cookieID = 0
    trackingID = 0
    userName = ""
    Set rsVerify = Nothing
    Session("NewUser") = "True"
    Session("z2t_loggedin") = ""
    Session("z2t_UserLookupsDaily") = 0
    Session("z2t_UserLookupsTotal") = 0

    reqUserAgent = Trim(Request.ServerVariables("HTTP_USER_AGENT"))

    'Rogue access not allowed, must have a user agent string
    If reqUserAgent = "" Then
        'Response.Write("<html><body>HTTP header invalid. Request Denied. (z2t:0)</body></html>")
        Response.AppendToLog "Bot_attack:NoUser-Agent"
	Response.Status = "400 Bad Request (z2t:0)"
        Session.Abandon
        Response.End
    End If

    'Block bot attacks
    If (Request.QueryString("inputZip").Count <> 0) _
        And (Instr(1, Request.ServerVariables("HTTP_COOKIE"), "Zip2Tax", 1) = 0) _
	And (InStr(1, Request.ServerVariables("HTTP_REFERER"), "http", 1) = 0) Then
        Response.AppendToLog "Bot_attack:InvalidRequest"
        'Response.AppendToLog Request.ServerVariables("ALL_RAW")
	Response.Status = "400 Bad Request - Open Zip2Tax home page and try the request again. (z2t:0.1)"
        Session.Abandon
        Response.End
    End If

    'Hash user agent string
    With Server.CreateObject("CAPICOM.HashedData")
        .Algorithm = 3 'CAPICOM_HASH_ALGORITHM_MD5
        .Hash reqUserAgent
        userAgentHash = .Value
    End With

    If (UserAgentHash = "4102B001A866743F423446890A7BFAFF") Then
        Response.AppendToLog "Bot_attack:monitor:"
        Response.AppendToLog Request.ServerVariables("ALL_RAW")
        Response.Status = "400 Bad Request"
        Session.Abandon
        Response.End
    End If

    If (Request.Cookies("Z2Tv25") <> "") And Request.Cookies("Z2Tv25").HasKeys Then
        cookieValue =  Request.Cookies("Z2Tv25")("tid")
        If Not IsEmpty(cookieValue) And IsNumeric(cookieValue) Then trackingID = CLng(cookieValue)
        userName = Request.Cookies("Z2Tv25")("un")
    ElseIf (Request.Cookies("Z2T_V2.5") <> "") And Request.Cookies("Z2T_V2.5").HasKeys Then
        cookieValue =  Request.Cookies("Z2T_V2.5")("tid")
        If Not IsEmpty(cookieValue) And IsNumeric(cookieValue) Then trackingID = CLng(cookieValue)
        userName = Request.Cookies("Z2T_V2.5")("un")
        'Stop using this cookie, the cookie above replaces this
        Response.Cookies("Z2T_V2.5").Expires = #January 1, 1980#
    End If

    If (Request.Cookies("Zip2Tax")("CookieID") <> "") Then
        cookieValue = Request.Cookies("Zip2Tax")("CookieID")
        If Not IsEmpty(cookieValue) And IsNumeric(cookieValue) Then cookieID = CLng(cookieValue)
    End If

    Set rsVerify = z2t_VerifyClientTracking(cookieID, trackingID, userAgentHash)

    If Not (rsVerify Is Nothing) Then
        'Set session variables
        Session("z2t_TrackingID") = rsVerify("trackingID")
        Session("CookieID") = rsVerify("cookieID")
        If (cookieID = 0) Then
            'Update cookie with cookie ID
            Response.Cookies("Zip2Tax")("CookieID") = Session("CookieID")
            Response.Cookies("Zip2Tax").Expires = #December 31, 2030#
        End If
        'Session("z2t_AccountID") = rsVerify("accountID")
        Session("ha_AccountID") = rsVerify("haAccountID")
        Session("z2t_UserName") = rsVerify("userName")
        Session("z2t_Password") = rsVerify("password")
        If Session("z2t_UserName") <> "" Then Session("NewUser") = "False"
        If (rsVerify("loginStatus") <> 0) Then Session("z2t_loggedin") = "True"
        'Session("z2t_AccountType") = rsVerify("accountType")
        'Session("z2t_ExpirationDate") = rsVerify("expirationDate")
        Session("z2t_UserLookupsDaily") = rsVerify("lookupsDaily")
        Session("z2t_UserLookupsTotal") = rsVerify("lookupsTotal")
        'Session("Company") = rsVerify("Company")
        'Session("ErrorMessagePassive") = rsVerify("ErrorMessagePassive")
        Set rsVerify = Nothing
    Else
        Session("z2t_TrackingID") = 0
        Session("CookieID") = 0
        'Session("z2t_AccountID") = 0
        Session("ha_AccountID") = 0
        Session("z2t_UserName") = ""
        Session("z2t_Password") = ""
        'Session("z2t_AccountType") = "anon-user"
        'Session("z2t_ExpirationDate") = CDate("1/1/1980")
        'Session("Company") = ""
        'Session("ErrorMessagePassive") = ""
    End If
End Function


' *********************************************************
' Page Code
'
    Dim PageKeyWords

    If ((Session.Contents.Count = 0) Or ((Session("z2t_loggedin") <> "") And (Session("z2t_Password") = ""))) Then
        InitSession
    End If

    if Request("AFF") <> "" then
        Session("RequestAffiliate") = Request("AFF")
    end if

    If Session("RequestAffiliate") > "" Then
        Reff = "AFF=" & Session("RequestAffiliate")
    Else
        Reff = unescape(Request.ServerVariables("HTTP_REFERER"))
    End If

    'Post the page load into activity
    PageKeyWords = z2t_LogActivity(Session("z2t_UserName"), _
                                    1, _
                                    "", _
                                    "", _
                                    FormatPath(Request.ServerVariables("PATH_INFO")), _
                                    Reff, _
                                    Session.SessionID, _
                                    Request.ServerVariables("REMOTE_ADDR"), _
                                    "Connection.asp", _
                                    Session("CookieID"))

'Response.Write("This site is temporarily down for maintenance.")
'Response.Write("Cookie: " & Session("cookieId") & " Tracking: " & Session("z2t_TrackingId") & " loggedin? " & Session("z2t_loggedin") & " ")
'Response.Write(Session("z2t_UserName") & ":" & Session("z2t_Password")): Response.End


'If Session("z2t_UserName") = "nathan" Then
'If Request.ServerVariables("HTTP_REFERER") = "http://www.zip2tax.com/z2t_lookup-api.asp" Then

'If (Request.ServerVariables("REMOTE_ADDR") = "72.43.236.2") Or _
'   (Request.ServerVariables("REMOTE_ADDR") = "24.103.166.106") Then
'End If

%>
