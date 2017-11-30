<%
' *********************************************************
' ADO constants include file for VBScript [Partial]
'---- ExecuteOptionEnum Values ----
Const adExecuteNoRecords = &H00000080
'---- CursorLocationEnum Values ----
Const adUseClient = 3
'---- DataTypeEnum Values ----
Const adChar = 129
Const adInteger = 3
Const adVarChar = 200
'---- ParameterDirectionEnum Values ----
Const adParamInput = &H0001
Const adParamOutput = &H0002
Const adParamInputOutput = &H0003
Const adParamReturnValue = &H0004
'---- CommandTypeEnum Values ----
Const adCmdStoredProc = &H0004

'Activity Types
Const cActivityZipLookup   = 4
Const cActivityTaxCalc     = 5
Const cActivityDailyMax    = 6
Const cActivityTotalMax    = 7
Const cActivityInvalidZip  = 8
Const cActivityAcctExpired = 9
Const cActivityNotLoggedIn = 13
Const cActivityInvalidAcct = 20
Const cActivityWidgetDownload = 26

'Client Types
Const clientTypeFree = 1
Const clientTypeWeb  = 2
Const clientTypeMobile  = 3


' *********************************************************
' Database Helper Functions
'

' Open and return a Connection object with default connection string
Function OpenDBConn(cursorLocation)

    Set OpenDBConn = OpenDBConnEx(cursorLocation, connStrPublic)

End Function

' Open and return a Connection object with a connection string
Function OpenDBConnEx(cursorLocation, connString)

	Dim objDB

	On Error Resume Next

    Set objDB = Server.CreateObject("ADODB.Connection")
	If objDB Is Nothing Then
		Set OpenDBConnEx = Nothing
        Response.AppendToLog "ADOError[OpenDBConnEx]: (0x" & Hex(Err.number) & ") " & Err.Description
		Exit Function
	End If

    objDB.ConnectionString = connString
    objDB.CursorLocation = cursorLocation
    objDB.Open

	If Err.Number = 0 Then
		Set OpenDBConnEx = objDB
	Else
		Set OpenDBConnEx = Nothing
        Response.AppendToLog "ADOError[OpenDBConnEx]: (0x" & Hex(Err.number) & ") " & Err.Description
	End If

	Set objDB = Nothing

End Function

' Create and return Command object
Function PrepareCommand(dbConn, commandType, commandText)

	Dim objCommand

	On Error Resume Next

    Set objCommand = Server.CreateObject("ADODB.Command")
	If objCommand Is Nothing Then
		Set PrepareCommand = Nothing
        Response.AppendToLog "ADOError[PrepareCommand]: (0x" & Hex(Err.number) & ") " & Err.Description
		Exit Function
	End If

    objCommand.ActiveConnection = dbConn
    objCommand.CommandType = commandType
    objCommand.CommandText = commandText

	Set PrepareCommand = objCommand

	Set objCommand = Nothing

End Function

' Open a connection and return a command object
Function OpenDBCommand(cursorLocation, commandType, commandText)

	Dim objDB, objCommand
	
	Set objDB = OpenDBConn(cursorLocation)
	If objDB Is Nothing Then
		Set OpenDBCommand = Nothing
		Exit Function
	End If

	Set objCommand = PrepareCommand(objDB, commandType, commandText)
	If objCommand Is Nothing Then
		Set OpenDBCommand = Nothing
	Else
		Set OpenDBCommand = objCommand
	End If

	Set objCommand = Nothing
	Set objDB = Nothing

End Function

' *********************************************************
' Database Functions
'
'Executes z2t_VerifyClientTracking stored procedure
'Returns disconnected recordset on success or Nothing on error
Function z2t_VerifyClientTracking(cid, tid, uah)

    Dim bResult
    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim tsqlResult

    'Not to be pessimistic
    Set z2t_VerifyClientTracking = Nothing

    On Error Resume Next

    'z2t_VerifyClientTracking(
	'             @cookieID     int,
	'             @trackingID   int,
	'             @clientIPAddr nvarchar(40),
	'             @clientUAHash nchar(32)
   	')

    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_VerifyClientTracking")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: Verify result
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'Cookie ID
    Set objParam = dbCommand.CreateParameter("@cookieID", adInteger, adParamInput)
    objParam.Value = cid
    dbCommand.Parameters.Append objParam
    'Tracking ID
    Set objParam = dbCommand.CreateParameter("@trackingID", adInteger, adParamInput)
    objParam.Value = tid
    dbCommand.Parameters.Append objParam
    'IP Address
    Set objParam = dbCommand.CreateParameter("@clientIPAddr", adVarChar, adParamInput)
    objParam.Value = Request.ServerVariables("REMOTE_ADDR")
    objParam.Size = Len(objParam.Value)
    dbCommand.Parameters.Append objParam
    'Client User Agent
    Set objParam = dbCommand.CreateParameter("@clientUAHash", adChar, adParamInput)
    objParam.Value = uah
    objParam.Size = Len(uah)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If tsqlResult = 0 Then
            'Success
            Set z2t_VerifyClientTracking = rsResult
            Set rsResult.ActiveConnection = Nothing
        ElseIf tsqlResult < 0 Then
            'TSQL error, returned as a negative value
            Response.AppendToLog "TSQLError: (" & -(errorNumber) & ")"
        Else
            'Some other application error TBD
        End If
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_VerifyClientTracking]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Disconnected recordset is left open
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_GetTracking stored procedure
'Records returned in recordCount parameter, zero indicates no tracking record
'Returns disconnected recordset on success or Nothing on error
Function z2t_GetTracking(trackingID, clientToken, clientIP, clientTypeID, ByRef recordCount)

    Dim dbCommand
    Dim rsResult
    Dim objParam

    On Error Resume Next

    'Not to be pessimistic
    recordCount = 0
    Set z2t_GetTracking = Nothing

    'z2t_GetTracking(
	'    @trackingID    int = 0,
	'    @clientToken   nvarchar(40) = NULL,
	'    @clientIPAddr  nvarchar(40) = NULL,
	'    @clientTypeID  int = 0
    ')

    'Set dbCommand = OpenDBCommand(adUseClient, adCmdStoredProc, "")
    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_GetTracking")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: Row count
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'Tracking ID
    Set objParam = dbCommand.CreateParameter("@trackingID", adInteger, adParamInput)
    objParam.Value = CLng(trackingID)
    dbCommand.Parameters.Append objParam
    'Client Token
    Set objParam = dbCommand.CreateParameter("@clientToken", adVarChar, adParamInput)
    objParam.Value = CStr(clientToken)
    objParam.Size = Len(objParam.Value)
    dbCommand.Parameters.Append objParam
    'Client IP Address
    Set objParam = dbCommand.CreateParameter("@clientIPAddr", adVarChar, adParamInput)
    objParam.Value = clientIP
    objParam.Size = Len(clientIP)
    dbCommand.Parameters.Append objParam
    'Client Type ID
    Set objParam = dbCommand.CreateParameter("@clientTypeID", adInteger, adParamInput)
    objParam.Value = CLng(clientTypeID)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        recordCount = dbCommand.Parameters("@tsqlResult")
        Set z2t_GetTracking = rsResult
        Set rsResult.ActiveConnection = Nothing
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_GetTracking]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Disconnected recordset is left open
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_UpdateTracking stored procedure
'New tracking ID returned in trackingID parameter
'Returns TRUE on success or FALSE if failed
Function z2t_UpdateTracking(ByRef trackingID, activityType, clientToken, clientIP, clientTypeID, accountID, logginIn)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim tsqlResult

    On Error Resume Next

    'Not to be pessimistic
    z2t_UpdateTracking = False

    'z2t_UpdateTracking(
	'   @trackingID		int,
	'   @activityType	int,
	'   @clientToken	nvarchar(40) = NULL,
	'   @clientIPAddr	nvarchar(40) = NULL,
	'   @clientTypeID	int = 0,
	'   @accountID		int = 0,
	'   @LoggedIn		int = 0
    ')

    'Set dbCommand = OpenDBCommand(adUseClient, adCmdStoredProc, "")
    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_UpdateTracking")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: New/Current Tracking ID or < 0 TSQL Error value
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'Tracking ID
    Set objParam = dbCommand.CreateParameter("@trackingID", adInteger, adParamInput)
    objParam.Value = CLng(trackingID)
    dbCommand.Parameters.Append objParam
    'ActivityType ID
    Set objParam = dbCommand.CreateParameter("@activityType", adInteger, adParamInput)
    objParam.Value = CLng(activityType)
    dbCommand.Parameters.Append objParam
    'Client Token
    Set objParam = dbCommand.CreateParameter("@clientToken", adVarChar, adParamInput)
    If IsEmpty(clientToken) Then clientToken = " "
    objParam.Value = CStr(clientToken)
    objParam.Size = Len(objParam.Value)
    dbCommand.Parameters.Append objParam
    'Client IP Address
    Set objParam = dbCommand.CreateParameter("@clientIPAddr", adVarChar, adParamInput)
    objParam.Value = clientIP
    objParam.Size = Len(clientIP)
    dbCommand.Parameters.Append objParam
    'Client Type ID
    Set objParam = dbCommand.CreateParameter("@clientTypeID", adInteger, adParamInput)
    objParam.Value = CLng(clientTypeID)
    dbCommand.Parameters.Append objParam
    'Client account ID
    Set objParam = dbCommand.CreateParameter("@accountID", adInteger, adParamInput)
    objParam.Value = CLng(accountID)
    dbCommand.Parameters.Append objParam
    'Log in flag
    Set objParam = dbCommand.CreateParameter("@loggedIn", adInteger, adParamInput)
    objParam.Value = CLng(logginIn)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If (tsqlResult > 0) Then
            'Update successful
            trackingID = tsqlResult
            z2t_UpdateTracking = True
        Else
            'TSQL error, returned as a negative value
            Response.AppendToLog "TSQLError[z2t_UpdateTracking]: (" & -(errorNumber) & ")"
        End If
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_UpdateTracking]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Also closes Recordset
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_UpdateIPCount stored procedure
'Returns TRUE on success or FALSE if failed
Function z2t_UpdateIPCount(clientIP)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim tsqlResult

    On Error Resume Next

    'Not to be pessimistic
    z2t_UpdateIPCount = False

    'z2t_UpdateIPCount(
	'   @clientIPAddr	nvarchar(40),
    ')

    'Set dbCommand = OpenDBCommand(adUseClient, adCmdStoredProc, "")
    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_UpdateIPCount")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: New/Current Tracking ID or < 0 TSQL Error value
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'Client IP Address
    Set objParam = dbCommand.CreateParameter("@clientIPAddr", adVarChar, adParamInput)
    objParam.Value = clientIP
    objParam.Size = Len(clientIP)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If (tsqlResult = 0) Then
            z2t_UpdateIPCount = True
        Else
            'TSQL error, returned as a negative value
            Response.AppendToLog "TSQLError[z2t_UpdateIPCount]: (" & -(errorNumber) & ")"
        End If
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_UpdateIPCount]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Also closes Recordset
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_Login_v25 stored procedure
'Returns disconnected recordset on success or Nothing on error
Function z2t_Login_v25(userName, password, clientToken, ipAddress, clientType, idSession)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim paramValue
    Dim tsqlResult

    On Error Resume Next

    'Not to be pessimistic
    Set z2t_Login_v25 = Nothing

    'z2t_Login_v25(
    '    @username      nvarchar(20),
    '    @password      nvarchar(20),
	'    @clientToken   nvarchar(40),
	'    @clientIPAddr  nvarchar(40),
	'    @clientType    int,
	'    @SessionID     nvarchar(20)
    ')

    'Set dbCommand = OpenDBCommand(adUseClient, adCmdStoredProc, "z2t_Login_v25")
    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_Login_v25")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: 1 valid login, 0 invalid login or < 0 TSQL Error value
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'Username
    Set objParam = dbCommand.CreateParameter("@username", adVarChar, adParamInput)
    If IsEmpty(userName) Or (Len(userName) = 0) Then userName = " "
    objParam.Value = userName
    objParam.Size = Len(userName)
    dbCommand.Parameters.Append objParam
    'Password
    Set objParam = dbCommand.CreateParameter("@password", adVarChar, adParamInput)
    If IsEmpty(password) Or (Len(password) = 0) Then password = " "
    objParam.Value = password
    objParam.Size = Len(password)
    dbCommand.Parameters.Append objParam
    'Client Token
    Set objParam = dbCommand.CreateParameter("@clientToken", adVarChar, adParamInput)
    paramValue = CStr(clientToken)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam
    'IP Address
    Set objParam = dbCommand.CreateParameter("@clientIPAddr", adVarChar, adParamInput)
    If IsEmpty(ipAddress) Or (Len(ipAddress) = 0) Then ipAddress = " "
    objParam.Value = ipAddress
    objParam.Size = Len(ipAddress)
    dbCommand.Parameters.Append objParam
    'Client Type
    Set objParam = dbCommand.CreateParameter("@clientType", adInteger, adParamInput)
    objParam.Value = clientType
    dbCommand.Parameters.Append objParam
    'Session ID
    Set objParam = dbCommand.CreateParameter("@SessionID", adVarChar, adParamInput)
    paramValue = CStr(idSession)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If (tsqlResult > 0) Then
            'Login successful
            Set z2t_Login_v25 = rsResult
            Set rsResult.ActiveConnection = Nothing
        ElseIf (tsqlResult < 0) Then
            'TSQL error, returned as a negative value
            Response.AppendToLog "TSQLError[z2t_Login_v25]: (" & -(errorNumber) & ")"
        Else
            'Invalid login
        End If
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_Login_v25]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Disconnected recordset is left open
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_Logout_v25 stored procedure
'Returns 0 on success
Function z2t_Logout_v25(userName, clientToken, ipAddress, clientType, idSession)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim paramValue
    Dim tsqlResult

    On Error Resume Next

    'Not to be pessimistic
    z2t_Logout_v25 = -1

    'z2t_Logout_v25(
    '    @username      nvarchar(20),
	'    @clientToken   nvarchar(40),
	'    @clientIPAddr  nvarchar(40),
	'    @clientType    int,
	'    @SessionID     nvarchar(20)
    ')

    'Set dbCommand = OpenDBCommand(adUseClient, adCmdStoredProc, "z2t_Logout_v25")
    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_Logout_v25")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: 0 for success or < 0 TSQL Error value
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'Username
    Set objParam = dbCommand.CreateParameter("@username", adVarChar, adParamInput)
    If IsEmpty(userName) Or (Len(userName) = 0) Then userName = " "
    objParam.Value = userName
    objParam.Size = Len(userName)
    dbCommand.Parameters.Append objParam
    'Client Token
    Set objParam = dbCommand.CreateParameter("@clientToken", adInteger, adParamInput)
    paramValue = CStr(clientToken)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam
    'IP Address
    Set objParam = dbCommand.CreateParameter("@clientIPAddr", adVarChar, adParamInput)
    If IsEmpty(ipAddress) Or (Len(ipAddress) = 0) Then ipAddress = " "
    objParam.Value = ipAddress
    objParam.Size = Len(ipAddress)
    dbCommand.Parameters.Append objParam
    'Client Type
    Set objParam = dbCommand.CreateParameter("@clientType", adInteger, adParamInput)
    objParam.Value = clientType
    dbCommand.Parameters.Append objParam
    'Session ID
    Set objParam = dbCommand.CreateParameter("@SessionID", adVarChar, adParamInput)
    paramValue = CStr(idSession)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If (tsqlResult > 0) Then
            'Logout successful
            z2t_Logout_v25 = 0
        ElseIf (tsqlResult < 0) Then
            'TSQL error, returned as a negative value
            Response.AppendToLog "TSQLError[z2t_Logout_v25]: (" & -(errorNumber) & ")"
        Else
            'NOOP
        End If
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_Logout_v25]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Close connection
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_GetSubscriptions stored procedure
'Sets subscription count in countSubscriptions parameter
'Returns disconnected recordset on success or Nothing on error
Function z2t_GetSubscriptions(userName, ByRef countSubscriptions)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim tsqlResult

    On Error Resume Next

    'Not to be pessimistic
    countSubscriptions = 0
    Set z2t_GetSubscriptions = Nothing

    'z2t_GetSubscriptions(
	'    @username		nvarchar(20)
    ')

    'Set dbCommand = OpenDBCommand(adUseClient, adCmdStoredProc, "")
    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_GetSubscriptions")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: Number of subscriptions or < 0 TSQL Error value
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'Username
    Set objParam = dbCommand.CreateParameter("@username", adVarChar, adParamInput)
    If IsEmpty(userName) Or (Len(userName) = 0) Then userName = " "
    objParam.Value = userName
    objParam.Size = Len(userName)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If (tsqlResult >= 0) Then
            countSubscriptions = tsqlResult
            Set z2t_GetSubscriptions = rsResult
            Set rsResult.ActiveConnection = Nothing
        Else
            'TSQL error, returned as a negative value
            Response.AppendToLog "TSQLError[z2t_GetSubscriptions]: (" & -(errorNumber) & ")"
        End If
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_GetSubscriptions]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Disconnected recordset is left open
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_Activity_add_new stored procedure
'Returns login metadata on success or "" on error
Function z2t_LogActivity(userName, activityType, varData1, varData2, pageURL, referrerURL, idSession, createdByIP, createdBy, idCookie)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim paramValue

    On Error Resume Next

    'Not to be pessimistic
    z2t_LogActivity = ""

    'z2t_Activity_add_new(
    '    @user        nvarchar(50), 
	'    @actType     int, 
	'    @data1       varchar(200), 
	'    @data2       varchar(200),
	'    @PageURL     varchar(200),
	'    @RefURL      varchar(200),
	'    @SessionID   varchar(20),
	'    @CreatedByIP varchar(20), 
	'    @CreatedBy   varchar(20),
	'    @CookieID    int = 0
	')

    'Set dbCommand = OpenDBCommand(adUseClient, adCmdStoredProc, "z2t_Activity_add_new")
    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_Activity_add_new")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Username
    Set objParam = dbCommand.CreateParameter("@user", adVarChar, adParamInput)
    If IsEmpty(userName) Or (Len(userName) = 0) Then userName = " "
    objParam.Value = userName
    objParam.Size = Len(userName)
    dbCommand.Parameters.Append objParam
    'Activity Type
    Set objParam = dbCommand.CreateParameter("@actType", adInteger, adParamInput)
    objParam.Value = activityType
    dbCommand.Parameters.Append objParam
    'Data 1
    Set objParam = dbCommand.CreateParameter("@data1", adVarChar, adParamInput)
    If IsEmpty(varData1) Or (Len(varData1) = 0) Then varData1 = " "
    paramValue = Left(varData1, 100)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam
    'Data 2
    Set objParam = dbCommand.CreateParameter("@data2", adVarChar, adParamInput)
    If IsEmpty(varData2) Or (Len(varData2) = 0) Then varData2 = " "
    paramValue = Left(varData2, 100)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam
    'Page URL
    Set objParam = dbCommand.CreateParameter("@PageURL", adVarChar, adParamInput)
    If IsEmpty(pageURL) Or (Len(pageURL) = 0) Then pageURL = " "
    paramValue = Left(pageURL, 200)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam
    'Referrer URL
    Set objParam = dbCommand.CreateParameter("@RefURL", adVarChar, adParamInput)
    If IsEmpty(referrerURL) Or (Len(referrerURL) = 0) Then referrerURL = " "
    paramValue = Left(referrerURL, 200)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam
    'Session ID
    Set objParam = dbCommand.CreateParameter("@SessionID", adVarChar, adParamInput)
    paramValue = CStr(idSession)
    objParam.Value = paramValue
    objParam.Size = Len(paramValue)
    dbCommand.Parameters.Append objParam
    'Created By IP Address
    Set objParam = dbCommand.CreateParameter("@CreatedByIP", adVarChar, adParamInput)
    If IsEmpty(createdByIP) Or (Len(createdByIP) = 0) Then createdByIP = " "
    objParam.Value = createdByIP
    objParam.Size = Len(createdByIP)
    dbCommand.Parameters.Append objParam
    'Created By
    Set objParam = dbCommand.CreateParameter("@CreatedBy", adVarChar, adParamInput)
    If IsEmpty(createdBy) Or (Len(createdBy) = 0) Then createdBy = " "
    objParam.Value = createdBy
    objParam.Size = Len(createdBy)
    dbCommand.Parameters.Append objParam
    'Cookie ID
    Set objParam = dbCommand.CreateParameter("@CookieID", adInteger, adParamInput)
    objParam.Value = CLng(idCookie)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        z2t_LogActivity = rsResult("KeyWords")
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_LogActivity]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Also closes Recordset
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_LookupNew_v25 stored procedure
'Number of records returned in recordCount parameter, zero indicates no records
'Returns disconnected recordset on success or Nothing on error
Function z2t_Lookup_v25(zipCode, ipAddress, userName, idSession, pageURL, referrerURL, idCookie, ByRef recordCount)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim tsqlResult

    On Error Resume Next

    'Not to be pessimistic
    recordCount = 0
    Set z2t_Lookup_v25 = Nothing

    'z2t_LookUp_v25(
    '    @zipInt    int,
    '    @IP        nvarchar(20),
    '    @UserName  nvarchar(20),
    '    @SessionID nvarchar(20),
    '    @PageURL   nvarchar(200),
    '    @RefURL    nvarchar(200),
    '    @CookieID  int = 0
    ')

    'Set dbCommand = OpenDBCommand(adUseClient, adCmdStoredProc, "")
    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_LookUp_v25")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: Row count
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'ZIP code
    Set objParam = dbCommand.CreateParameter("@zipInt", adInteger, adParamInput)
    objParam.Value = CLng(zipCode)
    dbCommand.Parameters.Append objParam
    'IP Address
    Set objParam = dbCommand.CreateParameter("@IP", adVarChar, adParamInput)
    If IsEmpty(ipAddress) Or (Len(ipAddress) = 0) Then ipAddress = " "
    objParam.Value = ipAddress
    objParam.Size = Len(ipAddress)
    dbCommand.Parameters.Append objParam
    'UserName
    Set objParam = dbCommand.CreateParameter("@UserName", adVarChar, adParamInput)
    If IsEmpty(userName) Or (Len(userName) = 0) Then userName = " "
    objParam.Value = userName
    objParam.Size = Len(userName)
    dbCommand.Parameters.Append objParam
    'Session ID
    Set objParam = dbCommand.CreateParameter("@SessionID", adVarChar, adParamInput)
    objParam.Value = idSession
    objParam.Size = Len(idSession)
    dbCommand.Parameters.Append objParam
    'Page URL
    Set objParam = dbCommand.CreateParameter("@PageURL", adVarChar, adParamInput)
    If IsEmpty(pageURL) Or (Len(pageURL) = 0) Then pageURL = " "
    objParam.Value = pageURL
    objParam.Size = Len(pageURL)
    dbCommand.Parameters.Append objParam
    'Referrer URL
    Set objParam = dbCommand.CreateParameter("@RefURL", adChar, adParamInput)
    If IsEmpty(referrerURL) Or (Len(referrerURL) = 0) Then referrerURL = " "
    objParam.Value = referrerURL
    objParam.Size = Len(referrerURL)
    dbCommand.Parameters.Append objParam
    'Cookie ID
    Set objParam = dbCommand.CreateParameter("@CookieID", adInteger, adParamInput)
    objParam.Value = idCookie
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If (tsqlResult => 0) Then
            'Lookup successful
            recordCount = tsqlResult
            Set z2t_Lookup_v25 = rsResult
        Else
            'TSQL error, returned as a negative value
            Response.AppendToLog "TSQLError[z2t_Lookup_v25]: (" & -(errorNumber) & ")"
        End If
        Set rsResult.ActiveConnection = Nothing
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_Lookup_v25]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Disconnected recordset is left open
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_NotesLookUp_v25 stored procedure
'Number of records returned in recordCount parameter, zero indicates no records
'Returns disconnected recordset on success or Nothing on error
Function z2t_NotesLookUp_v25(zipCode, ByRef recordCount)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim tsqlResult

    On Error Resume Next

    'Not to be pessimistic
    recordCount = 0
    Set z2t_NotesLookUp_v25 = Nothing

    'z2t_LookUpNotes_v25(
    '    @zipInt    int
   	')

    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_LookUpNotes_v25")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: Row count
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'ZIP Code
    Set objParam = dbCommand.CreateParameter("@zipInt", adInteger, adParamInput)
    objParam.Value = CLng(zipCode)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If (tsqlResult => 0) Then
            'Lookup successful
            recordCount = tsqlResult
            Set z2t_NotesLookUp_v25 = rsResult
        Else
            'TSQL error, returned as a negative value
            Response.AppendToLog "TSQLError[z2t_NotesLookUp_v25]: (" & -(errorNumber) & ")"
        End If
        Set rsResult.ActiveConnection = Nothing
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_NotesLookUp_v25]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Disconnected recordset is left open
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_HA_AccountInfo stored procedure on production DB
'Number of records returned in recordCount parameter, zero indicates no records
'Returns disconnected recordset on success or Nothing on error
Function ha_AccountInfo(accountID, ByRef recordCount)

    Dim dbCommand
    Dim rsResult
    Dim objParam
    Dim tsqlResult

    On Error Resume Next

    'Not to be pessimistic
    recordCount = 0
    Set ha_AccountInfo = Nothing

    'z2t_HA_AccountInfo(
    '    @haID int
   	')

    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_HA_AccountInfo")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Return value: Row count
    Set objParam = dbCommand.CreateParameter("@tsqlResult", adInteger, adParamReturnValue)
    dbCommand.Parameters.Append objParam
    'HA accountID
    Set objParam = dbCommand.CreateParameter("@haID", adInteger, adParamInput)
    objParam.Value = CLng(accountID)
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConnEx(adUseClient, connStrHAProd)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        tsqlResult = dbCommand.Parameters("@tsqlResult")
        If (tsqlResult > 0) Then
            'Lookup successful
            recordCount = tsqlResult
            Set ha_AccountInfo = rsResult
        End If
        Set rsResult.ActiveConnection = Nothing
    Else
        'ADO error
        Response.AppendToLog "ADOError[ha_AccountInfo]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Disconnected recordset is left open
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

'Executes z2t_Account_info stored procedure
'Returns disconnected recordset on success or Nothing on error
Function z2t_AccountInfo(accountID)

    Dim dbCommand
    Dim rsResult
    Dim objParam

    On Error Resume Next

    'Not to be pessimistic
    Set z2t_AccountInfo = Nothing

    'z2t_Account_info(
    '    @z2tID as int = 0
   	')

    Set dbCommand = PrepareCommand(Nothing, adCmdStoredProc, "z2t_Account_info")
    If dbCommand Is Nothing Then
        Exit Function
    End If

    'Account ID
    Set objParam = dbCommand.CreateParameter("@z2tID", adInteger, adParamInput)
    objParam.Value = accountID
    dbCommand.Parameters.Append objParam

    Set dbCommand.ActiveConnection = OpenDBConn(adUseClient)
    If dbCommand.ActiveConnection Is Nothing Then Exit Function

    Set rsResult = dbCommand.Execute
    If Err.number = 0 Then
        'Success
        Set z2t_AccountInfo = rsResult
        Set rsResult.ActiveConnection = Nothing
    Else
        'ADO error
        Response.AppendToLog "ADOError[z2t_AccountInfo]: (0x" & Hex(Err.number) & ") " & Err.Description
    End If

    dbCommand.ActiveConnection.Close   'Disconnected recordset is left open
    Set rsResult = Nothing
    Set objParam = Nothing
    Set dbCommand = Nothing

End Function

%>
