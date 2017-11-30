<%

' *********************************************************
' Page Variables
'

'
' Z2T Subscription IDs
'
Const cSubscriptionUndefined = -1
Const cAdministrator = 0
Const cWebLookup     = 1
Const cOnlineLookup  = 1
Const cLinkLookup    = 2
Const cInitialTable  = 3
Const cUpdateTable   = 4

' This MUST be equal to the last type defined
Const cSubscriptionArraySize = 4

'
' Z2T Subscription Names
'
Const sAdministrator = "Administrator"
Const sWebLookup     = "Online Lookup Service"
Const sLinkLookup    = "Database Interface"
Const sInitialTable  = "Initial Sale and Use Tax Tables"
Const sUpdateTable   = "Monthly Sale and Use Tax Tables"
Const sOnlineLookup  = "Online Lookup Service"

'
' Z2T Lookup Add-on IDs
'
Const cLookupUndefined = -1
Const cLookupAll       = 0
Const cLookupSalesTax  = 1
Const cLookupUseTax    = 2

' This MUST be equal to the last type defined
Const cLookupAddonArraySize = 2

'
' Z2T Add-on Names
'
Const sAddonUndefined  = "None"
Const sAddonAll        = "All Add-ons"
Const sAddonSalesTax   = "Sales Tax"
Const sAddonUseTax     = "Use Tax"

'
' z2t_GetSubscription column names
'
Const sAccountID        = "AccountID"
Const sHarvestID        = "HarvestID"
Const sExpirationDate   = "ExpirationDate"
Const sSubscriptionType = "SubscriptionType"
Const sAddonType        = "AddonType"

'
' Z2T Subscription Class object
'
Class CSubscriptionData

    Public NumAddons

    Private acctID
    Private haID
    Private expDate
    Private subID
    Private rgAddons
    Private locked

    '
    ' Object Construction
    '
    Private Sub Class_Initialize()
        NumAddons = 0
        acctID = 0
        haID = 0
        expDate = CDate("1/1/1980")
        subID = cSubscriptionUndefined
        'rgAddons = vbEmpty
        locked = False
    End Sub

    '
    ' Property accessors
    '
    Public Property Get AccountID()
        AccountID = acctID
    End Property

    Public Property Get HarvestID()
        HarvestID = haID
    End Property

    Public Property Get ExpirationDate()
        ExpirationDate = expDate
    End Property

    Public Property Get SubscriptionType()
        SubscriptionType = subID
    End Property

    Public Property Get SubscriptionName()
        Select Case subID
            Case cAdministrator
                SubscriptionName = sAdministrator
            Case cWebLookup
                SubscriptionName = sWebLookup
            Case cLinkLookup
                SubscriptionName = sLinkLookup
            Case cInitialTable
                SubscriptionName = sInitialTable
            Case cUpdateTable
                SubscriptionName = sUpdateTable
            Case cOnlineLookup
                SubscriptionName = sOnlineWebLookup
            Case Else
                SubscriptionName = "Undefined"
        End Select
    End Property

    Public Property Get AddonName(addonID)
        Select Case addonID
            Case cLookupUndefined
                AddonName = sAddonUndefined
            Case cLookupAll
                AddonName = sAddonAll
            Case cLookupSalesTax
                AddonName = sAddonSalesTax
            Case cLookupUseTax
                AddonName = sAddonUseTax
            Case Else
                AddonName = "Undefined"
        End Select
    End Property

    '
    ' Public methods
    '
    Public Function HasAddon(addonType)
        HasAddon = False
        If (IsEmpty(rgAddons)) Or (Not IsValidIndex(addonType)) Then Exit Function
        HasAddon = rgAddons(addonType)
    End Function

    '
    ' Private helper methods
    '
    Private Function IsValidIndex(index)
        IsValidIndex = False
        If (index >= 0) And (index <= cLookupAddonArraySize) Then
            IsValidIndex = True
        End If
    End Function

    '
    ' These functions are internal use only
    '
    Public Sub SetData(aID, hID, exDate, subType, isAdmin)
        If (locked) Then Exit Sub
        acctID = aID
        haID = hID
        expDate = exDate
        subID = subType
        ' Initialize add-on array
        Select Case subType
            Case cWebLookup, cOnlineLookup, cAdministrator
                NumAddons = cLookupAddonArraySize + 1
                rgAddons = Array(isAdmin, isAdmin, isAdmin) 'array size == NumAddons
            Case Else
                'NoOp
        End Select
        locked = True
    End Sub

    Public Sub SetAddonData(addonType)
        If (Not IsValidIndex(addonType)) Or (Not IsArray(rgAddons)) Then Exit Sub
        'Enable add-on
        rgAddons(addonType) = True
    End Sub

End Class

'
' Z2T Subscription Collection class
'
Class CSubscriptionCollection

    Public NumSubscriptions

    Private enumIndex
    Private rgSubscriptions()
    Private nullSubscription
    '
    ' Object Construction/Destructor
    '
    Private Sub Class_Initialize()
        Dim i
        NumSubscriptions = cSubscriptionArraySize + 1
        enumIndex = 0
        ReDim rgSubscriptions(cSubscriptionArraySize)

        Set nullSubscription = New CSubscriptionData
        For i = 0 To cSubscriptionArraySize
            Set rgSubscriptions(i) = New CSubscriptionData
        Next
    End Sub

    Private Sub Class_Terminate()
        Erase rgSubscriptions
        Set nullSubscription = Nothing
    End Sub

    '
    ' Public methods
    '

    '
    ' Returns TRUE if user is subscribed and subscription has not expired
    '
    Public Function HasCurrentSubscription(subscriptionID)
        Dim itemData
        HasCurrentSubscription = False
        Set itemData = GetItem(subscriptionID)
        If (subscriptionID = itemData.SubscriptionType Or subscriptionID = cAdministrator) _
            And (itemData.ExpirationDate >= Date) Then
            HasCurrentSubscription = True
        End If
        Set itemData = Nothing
    End Function

    '
    ' Returns TRUE if user is subscribed and subscription has not expired
    ' and has addon to the subscription
    '
    Public Function HasSubscriptionAddon(subscriptionID, addonID)
        Dim itemData
        HasSubscriptionAddon = False
        Set itemData = GetItem(subscriptionID)
        If (subscriptionID = itemData.SubscriptionType) _
            And (itemData.ExpirationDate >= Date) _
            And (itemData.HasAddon(addonID) = True) Then
            HasSubscriptionAddon = True
        End If
        Set itemData = Nothing
    End Function

    Public Function HasOnlineLookups(subscriptionID)
      Dim itemData: Set itemData = GetItem(subscriptionID)
      HasOnlineLookups = (itemData.SubscriptionName = sOnlineLookup) Or (itemData.SubscriptionType = sAdministrator)
    End Function

    Public Function GetAccountID(subscriptionID)
        Dim itemData
        Set itemData = GetItem(subscriptionID)
        GetAccountID = itemData.AccountID
        Set itemData = Nothing
    End Function

    Public Function GetHarvestID(subscriptionID)
        Dim itemData
        Set itemData = GetItem(subscriptionID)
        GetHarvestID = itemData.HarvestID
        Set itemData = Nothing
    End Function

    Public Function GetExpirationDate(subscriptionID)
        Dim itemData
        Set itemData = GetItem(subscriptionID)
        GetExpirationDate = itemData.ExpirationDate
        Set itemData = Nothing
    End Function

    Public Function IsSubscribed(subscriptionID)
        Dim itemData
        Set itemData = GetItem(subscriptionID)
        IsSubscribed = (itemData.SubscriptionType = subscriptionID)
        Set itemData = Nothing
    End Function

    Public Sub EnumReset()
        enumIndex = 0
    End Sub

    Public Function EnumSubscriptions()
        Dim checkIndex
        Set EnumSubscriptions = Nothing
        'Loop through subscribed services
        Do While (enumIndex <= cSubscriptionArraySize)
            'Get current index value
            checkIndex = enumIndex
            'Increment index
            enumIndex = (enumIndex + 1)
            'Check for subscription
            If IsSubscribed(checkIndex) Then
                'Found one, return object and bail out
                Set EnumSubscriptions = GetItem(checkIndex)
                Exit Do
            End If
        Loop
    End Function

    '
    ' Private helper methods
    '
    Private Function IsValidIndex(index)
        IsValidIndex = False
        If (index >= 0) And (index <= UBound(rgSubscriptions)) Then
            IsValidIndex = True
        End If
    End Function

    Private Function GetItem(index)
        If IsValidIndex(index) Then
            Set GetItem = rgSubscriptions(index)
        Else
            Set GetItem = nullSubscription
            Response.AppendToLog "AppError[CSubscriptionCollection::GetItem]: Invalid subscription type(" & index & ")"
        End If
    End Function

    '
    ' This function is internal use only
    '
    Public Sub LoadSubscriptions(rsData)
        Dim subType, addonType

        subType = cSubscriptionUndefined

        If (Not (rsData Is Nothing)) And (TypeName(rsData) = "Recordset") Then
            If (rsData.BOF = True) And (rsData.EOF = True) Then Exit Sub
            rsData.MoveFirst
            If (rsData(sSubscriptionType) = cAdministrator) Then
                'Administrator initialize each subscription with admin data
                For subType = 0 To cSubscriptionArraySize
                    rgSubscriptions(subType).SetData rsData(sAccountID), _
                                                        rsData(sHarvestID), _
                                                        rsData(sExpirationDate), _
                                                        subType, _
                                                        True
                Next
            Else
                'Non-adminsitrator loop through records
                While (rsData.EOF = False)
                    subType = rsData(sSubscriptionType)
                    If IsValidIndex(subType) Then
                        rgSubscriptions(subType).SetData rsData(sAccountID), _
                                                            rsData(sHarvestID), _
                                                            rsData(sExpirationDate), _
                                                            subType, _
                                                            False
                        If Not IsNull(rsData(sAddonType)) Then
                            rgSubscriptions(subType).SetAddonData rsData(sAddonType)
                        End If
                    Else
                        Response.AppendToLog "AppError[CSubscriptionCollection::LoadSubscriptions]: Invalid subscription type(" & subType & ")"
                    End If
                    rsData.MoveNext
                Wend
            End If
        End If
    End Sub

End Class

'
' Global Helper function
'
' GetUserSubscriptions(userName)
'
' userName - Login name of user typically == Session("z2t_UserName")
'
' Returns a CSubscriptionCollection object.
' ***Set to Nothing after use***
'
Function GetUserSubscriptions(userName)

    Const sSubscriptionData = "z2t_SubscriptionData"
    Dim rsData
    Dim subCount
    Dim subscriptions

    subCount = 0
    '
    ' Create default subscription object
    '
    Set subscriptions = New CSubscriptionCollection

    '
    ' If valid input, initialize subscription object
    '
    If (Not IsEmpty(userName)) AND (Len(userName) <> 0) Then
        If (TypeName(Session(sSubscriptionData)) = "Recordset") Then
            '
            ' Use the cached result set
            '
            Set rsData = Session(sSubscriptionData)
        Else
            '
            ' Lookup subscriptions and cache the result set
            '
            Set rsData = z2t_GetSubscriptions(userName, subCount)
            Set Session(sSubscriptionData) = rsData
            If (subCount = 0) Then
                Response.AppendToLog "AppError[GetUserSubscriptions]: User has zero subscriptions(" & userName & ")"
            End If
        End If
        '
        ' Initialize subscription object
        '
        subscriptions.LoadSubscriptions(rsData)
    End If
    '
    ' Return subscription object
    '
    Set GetUserSubscriptions = subscriptions
    '
    ' Clean up
    '
    Set subscriptions = Nothing
    Set rsData = Nothing
End Function

Function OnlineLooker()
  Dim subscriptions: Set subscriptions = GetUserSubscriptions(Session("z2t_UserName"))
  Dim isOnlineLooker: isOnlineLooker = False  
  For i = 1 To subscriptions.NumSubscriptions
    isOnlineLooker =  subscriptions.HasOnlineLookups(i)
    If isOnlineLooker Then Exit For
  Next
  OnlineLooker = isOnlineLooker
End Function
%>
