<!--#include virtual="/Website/Includes/Config.asp"-->
<%
  
  If Session("z2t_loggedin") = "" Then
  
    Dim loginUser, loginPassword
    loginUser = Left(Request("lName"), 50)
	
	
    If loginUser = "" Then loginUser = Left(Request("l"), 50)
	
	
	loginPassword = Left(Request("pass"), 50)
		
	If loginPassword = "" Then loginPassword = Left(Request("p"), 20)
	
	If (loginUser <> "") And (loginPassword <> "") Then '2open
		
		
		Dim rs: Set rs=server.createObject("ADODB.Recordset")
		strSQL = "z2t_Login_v25('" & loginUser & "','"& loginPassword & "','" &  Session("CookieID") & "','" & Request.ServerVariables("REMOTE_ADDR") & "','"&clientTypeWeb &"','"& Session.SessionID &"')"		
        rs.open strSQL, connStrPublic, 3, 3, 4

		
      If Not (rs Is Nothing) Then
	  
		if rs("accountType") <> "anon-user" and rs("accountType") <> "hold" Then
        'Session("z2t_AccountID") = rsLogin("accountID")
        'Session("z2t_AccountType") = rsLogin("accountType")
        'Session("z2t_ExpirationDate") = rsLogin("expirationDate")
			Session("ha_AccountID") = rs("haAccountID")
			Session("z2t_loggedin") = "True"
            Session("NewUser") = ""
			Session("z2t_UserName") = loginUser
			Session("z2t_Password") = loginPassword
'			Response.Cookies("Z2Tv25")("un") = loginUser
'			Response.Cookies("Z2Tv25").Expires = #December 31, 2030#
 			Session("z2t_TrackingID") = rs("trackingID")
'			Response.Cookies("Z2Tv25")("tid") = Session("z2t_TrackingID")
			Session("z2t_UserLookupsTotal") = rs("lookupsTotal")
			Session("z2t_UserLookupsDaily") = rs("lookupsDaily")
			Session("LoginErrorPassive") = ""
			Session("LoginErrorUrgent") = ""
			Session.Timeout=480

			
			'Display Name
			Session("z2t_DisplayName") = rs("DisplayName")
			
			if rs("accountType") = "Interim" then 
				Session("FreeTrialInterimLogin") = rs("accountType")
				Session("z2t_DisplayName") = loginUser
				
				''Humair/19 Feb 16, Code to check if interim signup
				Dim connPhilly01Check: Set connPhilly01Check=server.CreateObject("ADODB.Connection")
  				Dim rscheck: Set rscheck=server.createObject("ADODB.Recordset")
				connPhilly01Check.Open "driver=SQL Server;server=208.88.49.18,8143;uid=davewj2o;pwd=get2it;database=z2t_Subscriptions" ' Philly01
        		strSQLCheck = "z2t_check_Subscriptions_InterimInfo('"&loginUser&"','"&loginPassword&"')"		
				'connPhilly01Check.Execute strSQLCheck
				rscheck.open strSQLCheck, connPhilly01Check, 3, 3, 4
				If Not (rscheck Is Nothing) Then
				Session("LastName") = rscheck("NameLast")
				Session("FirstName") = rscheck("NameFirst")
					If Session("LastName") <> "" Then
					Session("FreeTrialInterimSignupAllowTemp") = "1"
					End If
				End IF
				
				'Session("LastName") = rs("NameLast")
			End If
			'response.Write(rs("accountType"))
			
				If rs("accountType") = "admin" or rs("accountType") = "online" or rs("accountType") = "update" or rs("accountType") = "initial" then 'If not present, have to double click, for Angel's login.
					response.Write("success")
				else
					response.Write(rs("accountType"))
				End If
				'See if the Debug Edit window should be set
			Session("z2t_DebugData") = 0
			Dim p: p = instr(Session("z2t_DisplayName"), "(Debug On)")
			If p Then
				Session("z2t_DebugData") = 1
				Session("z2t_DisplayName") = Left(Session("z2t_DisplayName"), p - 2)
			End If


			rs.close
			Set rs = Nothing
			
			
			
			Else 
			response.Write("failed")
			End If
			
			
			
			Else
			response.Write("failed")
			End If	
		Else
				Session("LoginErrorUrgent") = "Incorrect Login"
				response.Write("failed")
      End If
	  
	 ' 		Response.Write("Into rsLogin TestLoagin.asp 1st If loginUser" & loginUser & " loginPassword" & loginPassword)

				
'	Else
'		response.Write("failed")
'    End If
	
	Else
	
	response.Write("success")
  End If

  

	  
%>
