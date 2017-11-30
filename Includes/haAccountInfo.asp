<%
' *********************************************************
' Harvest American account information support include file
' *********************************************************

' *********************************************************
' Page Constants
'
Const s_haAcct_BlankData = "&nbsp;"

'
' z2t_GetHAAccountInfo column names
'
Const s_haAcct_FirstName = "FirstName"
Const s_haAcct_MiddleName = "MiddleName"
Const s_haAcct_LastName = "LastName"
Const s_haAcct_Organization = "Organization"
Const s_haAcct_AddressLine1 = "AddressLine1"
Const s_haAcct_AddressLine2 = "AddressLine2"
Const s_haAcct_City = "City"
Const s_haAcct_State = "State"
Const s_haAcct_PostalCode = "PostalCode"
Const s_haAcct_HomePhone = "HomePhone"
Const s_haAcct_Email = "Email"


' *********************************************************
' HA Account Class Object
'
Class CHAAccountInfo

    Private haAcct_FirstName
    Private haAcct_MiddleName
    Private haAcct_LastName
    Private haAcct_FullName
    Private haAcct_Organization
    Private haAcct_AddressLine1
    Private haAcct_AddressLine2
    Private haAcct_City
    Private haAcct_State
    Private haAcct_PostalCode
    Private haAcct_HomePhone
    Private haAcct_Email

    '
    ' Object Construction
    '
    Private Sub Class_Initialize()
        haAcct_FirstName = s_haAcct_BlankData
        haAcct_MiddleName = s_haAcct_BlankData
        haAcct_LastName = s_haAcct_BlankData
        haAcct_FullName = s_haAcct_BlankData
        haAcct_Organization = s_haAcct_BlankData
        haAcct_AddressLine1 = s_haAcct_BlankData
        haAcct_AddressLine2 = s_haAcct_BlankData
        haAcct_City = s_haAcct_BlankData
        haAcct_State = s_haAcct_BlankData
        haAcct_PostalCode = s_haAcct_BlankData
        haAcct_HomePhone = s_haAcct_BlankData
        haAcct_Email = s_haAcct_BlankData
    End Sub

    Property Get FirstName()
        FirstName = haAcct_FirstName
    End Property

    Property Get MiddleName()
        MiddleName = haAcct_MiddleName
    End Property

    Property Get LastName()
        LastName = haAcct_LastName
    End Property

    Property Get FullName()
        FullName = haAcct_FirstName & " " & haAcct_MiddleName & " " & haAcct_LastName
    End Property

    Property Get Organization()
        Organization = haAcct_Organization
    End Property

    Property Get AddressLine1()
        AddressLine1 = haAcct_AddressLine1
    End Property

    Property Get AddressLine2()
        AddressLine2 = haAcct_AddressLine2
    End Property

    Property Get City()
        City = haAcct_City
    End Property

    Property Get State()
        State = haAcct_State
    End Property

    Property Get PostalCode()
        PostalCode = haAcct_PostalCode
    End Property

    Property Get HomePhone()
        HomePhone = haAcct_HomePhone
    End Property

    Property Get Email()
        Email = haAcct_Email
    End Property

    '
    ' This function is internal use only
    '
    Public Sub Load(rsData)

        If (Not (rsData Is Nothing)) And (TypeName(rsData) = "Recordset") Then
            If (rsData.BOF = True) And (rsData.EOF = True) Then Exit Sub
            rsData.MoveFirst
            If Not IsNull(rsData(s_haAcct_FirstName)) Then haAcct_FirstName = rsData(s_haAcct_FirstName)
            If Not IsNull(rsData(s_haAcct_MiddleName)) Then haAcct_MiddleName = rsData(s_haAcct_MiddleName)
            If Not IsNull(rsData(s_haAcct_LastName)) Then haAcct_LastName = rsData(s_haAcct_LastName)
            If Not IsNull(rsData(s_haAcct_Organization)) Then haAcct_Organization = rsData(s_haAcct_Organization)
            If Not IsNull(rsData(s_haAcct_AddressLine1)) Then haAcct_AddressLine1 = rsData(s_haAcct_AddressLine1)
            If Not IsNull(rsData(s_haAcct_AddressLine2)) Then haAcct_AddressLine2 = rsData(s_haAcct_AddressLine2)
            If Not IsNull(rsData(s_haAcct_City)) Then haAcct_City = rsData(s_haAcct_City)
            If Not IsNull(rsData(s_haAcct_State)) Then haAcct_State = rsData(s_haAcct_State)
            If Not IsNull(rsData(s_haAcct_PostalCode)) Then haAcct_PostalCode = rsData(s_haAcct_PostalCode)
            If Not IsNull(rsData(s_haAcct_HomePhone)) Then haAcct_HomePhone = rsData(s_haAcct_HomePhone)
            If Not IsNull(rsData(s_haAcct_Email)) Then haAcct_Email = rsData(s_haAcct_Email)
        End If

    End Sub

End Class


' *********************************************************
' Global Helper function
'
' GetHAAccountInfo(haAccountID)
'
' haAccountID - Harvest American account ID == ni_Accounts.AccountID
'
' Returns a CHAAccountInfo object.
' ***Set to Nothing after use***
'
Function GetHAAccountInfo(haAccountID)

    Const s_ha_AccountData = "ha_AccountData"
    Dim rsData
    Dim infoCount
    Dim accountInfo

    '
    ' Create default account object
    '
    Set accountInfo = New CHAAccountInfo

    '
    ' If valid input, initialize account object
    '
    If (IsNumeric(haAccountID)) AND (haAccountID > 0) Then
        If (TypeName(Session(s_ha_AccountData)) = "Recordset") Then
            '
            ' Use the cached result set
            '
            Set rsData = Session(s_ha_AccountData)
        Else
            '
            ' Lookup account info and cache the result set
            '
            Set rsData = ha_AccountInfo(haAccountID, infoCount)
            Set Session(s_ha_AccountData) = rsData
            If (infoCount = 0) Then
                Response.AppendToLog "AppError[GetHAAccountInfo]: Harvest ID not found (" & haAccountID & ")"
            End If
        End If
        '
        ' Load account object from recordset
        '
        accountInfo.Load(rsData)
    Else
        Response.AppendToLog "AppError[GetHAAccountInfo]: Invalid parameter[haAccountID](" & haAccountID & ")"
    End If
    '
    ' Return subscription object
    '
    Set GetHAAccountInfo = accountInfo
    '
    ' Clean up
    '
    Set accountInfo = Nothing
    Set rsData = Nothing

End Function

%>