<%
  If Session("z2t_loggedin") = "" Then
    Dim loginUser, loginPassword,ftlogin
	
    loginUser = Left(Request("lName"), 20)
	
	ftlogin = 0
	If  request("ftlogin") = 1 then ftlogin = 1
    If loginUser = "" Then loginUser = Left(Request("l"), 20)
		loginPassword = Left(Request("pass"), 20)
		If loginPassword = "" Then loginPassword = Left(Request("p"), 20)
	
		If (loginUser <> "") And (loginPassword <> "") Then '2open

		  Dim rsLogin

		  Set rsLogin = z2t_Login_v25(loginUser, _
								  loginPassword, _
								  Session("CookieID"), _
								  Request.ServerVariables("REMOTE_ADDR"), _
								  clientTypeWeb, _
								  Session.SessionID)
		
      If Not (rsLogin Is Nothing) Then
        'Session("z2t_AccountID") = rsLogin("accountID")
        'Session("z2t_AccountType") = rsLogin("accountType")
        'Session("z2t_ExpirationDate") = rsLogin("expirationDate")
			Session("ha_AccountID") = rsLogin("haAccountID")
			Session("z2t_loggedin") = "True"
            Session("NewUser") = ""
			Session("z2t_UserName") = loginUser
			Session("z2t_Password") = loginPassword
			Response.Cookies("Z2Tv25")("un") = loginUser
			Response.Cookies("Z2Tv25").Expires = #December 31, 2030#
			Session("z2t_TrackingID") = rsLogin("trackingID")
			Response.Cookies("Z2Tv25")("tid") = Session("z2t_TrackingID")
			Session("z2t_UserLookupsTotal") = rsLogin("lookupsTotal")
			Session("z2t_UserLookupsDaily") = rsLogin("lookupsDaily")
			Session("LoginErrorPassive") = ""
			Session("LoginErrorUrgent") = ""
			
			'Display Name
			Session("z2t_DisplayName") = rsLogin("DisplayName")
			
			if rsLogin("accountType") = "Interim" and Session("LastName") = "" then 
			
				Session("FreeTrialInterimLogin") = rsLogin("accountType")
				Session("z2t_DisplayName") = loginUser
			
				''Humair/19 Feb 16, Code to check if interim signup
				Dim connPhilly01Check: Set connPhilly01Check=server.CreateObject("ADODB.Connection")
  				Dim rscheck: Set rscheck=server.createObject("ADODB.Recordset")
				connPhilly01Check.Open "driver=SQL Server;server=philly01.HarvestAmerican.net,8143;uid=davewj2o;pwd=get2it;database=z2t_Subscriptions" ' Philly01
        		strSQLCheck = "z2t_check_Subscriptions_InterimInfo('"&loginUser&"','"&loginPassword&"')"		
				'connPhilly01Check.Execute strSQLCheck
				rscheck.open strSQLCheck, connPhilly01Check, 3, 3, 4
				If Not (rscheck Is Nothing) Then
				Session("LastName") = rscheck("NameLast")
				Session("FirstName") = rscheck("NameFirst")
				End IF
				if ftlogin = 1 then	  	response.Write("success")
			End If
				'See if the Debug Edit window should be set
			Session("z2t_DebugData") = 0
			Dim p: p = instr(Session("z2t_DisplayName"), "(Debug On)")
			If p Then
				Session("z2t_DebugData") = 1
				Session("z2t_DisplayName") = Left(Session("z2t_DisplayName"), p - 2)
			End If


			rsLogin.close
			Set rsLogin = Nothing
			
			
			
			
		Else
				Session("LoginErrorUrgent") = "Incorrect Login"
				if ftlogin = 1 then	  	response.Write("failed")
      End If

      'Response.Redirect pathBase & Session("currentPage")
	  
      Dim loginurl: loginurl = Session("currentPagePath")
				If loginurl = "" Then 	 loginurl = "/index.asp" 
	  
		
		if ftlogin = 0 then	  	Response.redirect loginurl
    End If
  End If
 															%>
