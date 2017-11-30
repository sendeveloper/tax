<%
''''' Change Log
'
' <2011-07-22 Fri nathan> allow logins via URL query string
' <2011-07-28 Thu nathan> remove cached subscription date on logout
'                         This is mostly for staff testing purposes.          
'
    If (Request("Logout") > "") Or (Request("lname") > "") Or (Request("pass") > "") Then
        z2t_LogActivity Session("z2t_Login"), _
                                    3, _
                                    "", _
                                    "", _
                                    "", _
                                    "", _
                                    Session.SessionID, _
                                    Request.ServerVariables("REMOTE_ADDR"), _
                                    Session("z2t_Login"), _
                                    Session("CookieID")

        Session("z2t_status") = ""
        Session("z2t_AccountID") = ""
        Session("z2t_loggedin") = ""
        Session("z2t_login") = ""
        Session("z2t_password") = ""
        Session("z2t_Company") = ""
        Session("z2t_DisplayName") = ""
        Session("Timeout") = ""
        Session("LoginErrorPassive") = ""
		Session("FreeTrialInterimLogin")=""
		Session("LastName") = ""
		Session("FreeTrialInterimSignupDone") = ""
		Session("FreeTrialInterimSignupAllowTemp") = ""

        '''These seem to be the new session variables --no
        Session("z2t_UserName") = ""
        Session("z2t_loggedin") = ""
        Set Session("z2t_SubscriptionData") = Nothing
        Set Session("ha_AccountData") = Nothing
		
      If Request("Logout") > "" Then
        Dim logouturl: logouturl = pathBase
        If logouturl = "" Then logouturl = "/index.asp"
			  Response.redirect logouturl
      ElseIf Request("lname") > "" Then
        Session("z2t_UserName") = Request("lname")
      End If
    End If
%>
