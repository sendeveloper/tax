<%
Response.Write("Into TestLoagin.asp")

if 1=2 then
  If Session("z2t_loggedin") = "" Then
    Dim loginUser, loginPassword
    loginUser = Left(Request("lName"), 20)


    If loginUser = "" Then loginUser = Left(Request("l"), 20)
    loginPassword = Left(Request("pass"), 20)
    If loginPassword = "" Then loginPassword = Left(Request("p"), 20)
    If (loginUser > "") And (loginPassword > "") Then
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
		if rsLogin("status") = "interim" then 
			Session("FreeTrialIntermLogin") = rsLogin("status")
		End If
		'Display Name
		Session("z2t_DisplayName") = rsLogin("DisplayName")
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

		response.Write(Session("z2t_DisplayName"))
		response.End()			
          If Session("NewUser") = "True" Then
		  	response.Write("Failed")
		  Else
	        Session("LoginErrorUrgent") = "Incorrect Login"
		  End If
      End If

      'Response.Redirect pathBase & Session("currentPage")
      Dim loginurl: loginurl = Session("currentPagePath")
	  
      If Session("NewUser") = "True" Then
			Session("NewUser") = ""
			response.Write("Sucess")
	  Else	  		
	  		If loginurl = "" Then 
	  			loginurl = "/index.asp" 
			End If

'			Response.redirect loginurl
      End If
	 End If
  End If
  
end if  
	  
%>
