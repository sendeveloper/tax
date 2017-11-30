<%
  
  If Session("z2t_loggedin") = "" Then
  
    Dim loginUser, loginPassword
    loginUser = Left(Request("lName"), 50)
	
	
    If loginUser = "" Then loginUser = Left(Request("l"), 50)
	
	
	loginPassword = Left(Request("pass"), 50)
		
	If loginPassword = "" Then loginPassword = Left(Request("p"), 20)
	
	If (loginUser <> "") And (loginPassword <> "") Then '2open
		
		
		Dim connCasper09: Set connCasper09=server.CreateObject("ADODB.Connection")
  		Dim rs: Set rs=server.createObject("ADODB.Recordset")
		connCasper09.Open "driver=SQL Server;server=66.119.50.229,7943;uid=davewj2o;pwd=get2it;database=z2t_WebPublic" ' casper09

        strSQL = "z2t_Login_v25('" & loginUser & "','"& loginPassword & "','" &  Session("CookieID") & "','" & Request.ServerVariables("REMOTE_ADDR") & "','"&clientTypeWeb &"','"& Session.SessionID &"')"		
        rs.open strSQL, connCasper09, 3, 3, 4

		  'Dim rsLogin

		 ' Set rsLogin = z2t_Login_v25(loginUser, _
			'					  loginPassword, _
			'					  Session("CookieID"), _
			'					  Request.ServerVariables("REMOTE_ADDR"), _
			'					  clientTypeWeb, _
			'					  Session.SessionID)
			'response.Write(strSQL)
      If Not (rs Is Nothing) Then
	  
		  if rs("haAccountID") <> "0" Then
        'Session("z2t_AccountID") = rsLogin("accountID")
        'Session("z2t_AccountType") = rsLogin("accountType")
        'Session("z2t_ExpirationDate") = rsLogin("expirationDate")
			Session("ha_AccountID") = rs("haAccountID")
			Session("z2t_loggedin") = "True"
            Session("NewUser") = ""
			Session("z2t_UserName") = loginUser
			Session("z2t_Password") = loginPassword
			Response.Cookies("Z2Tv25")("un") = loginUser
			Response.Cookies("Z2Tv25").Expires = #December 31, 2030#
			Session("z2t_TrackingID") = rs("trackingID")
			Response.Cookies("Z2Tv25")("tid") = Session("z2t_TrackingID")
			Session("z2t_UserLookupsTotal") = rs("lookupsTotal")
			Session("z2t_UserLookupsDaily") = rs("lookupsDaily")
			Session("LoginErrorPassive") = ""
			Session("LoginErrorUrgent") = ""

			
			'Display Name
			Session("z2t_DisplayName") = rs("DisplayName")
			
			if rs("accountType") = "Interim" then 
				Session("FreeTrialInterimLogin") = rs("accountType")
				Session("z2t_DisplayName") = loginUser
				'Session("LastName") = rs("NameLast")
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
			response.Write("success")
			
			
			
			
			
			
			Else
			response.Write("failed")
			End If	
		Else
				'Session("LoginErrorUrgent") = "Incorrect Login"
				response.Write("failed")
      End If
	  
	 ' 		Response.Write("Into rsLogin TestLoagin.asp 1st If loginUser" & loginUser & " loginPassword" & loginPassword)

				

    End If
	
	
  End If

  

	  
%>
