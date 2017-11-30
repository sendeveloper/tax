<!--#include virtual="/Website/Includes/Config.asp"-->


This is the intial_signup.asp page
<%
  
  If Session("z2t_loggedin") = "" Then
  
    Dim FirstName, Email
    FirstName = Left(Request("fName"), 50)
	Email = Left(Request("Email"), 100)
		
	
	
	If (Email <> "") And (FirstName <> "") Then '2open
		
		
		Dim connPhilly01: Set connPhilly01=server.CreateObject("ADODB.Connection")
  		Dim rs: Set rs=server.createObject("ADODB.Recordset")
		connPhilly01.Open "driver=SQL Server;server=208.88.49.18,8143;uid=davewj2o;pwd=get2it;database=z2t_Subscriptions" ' Philly01

        strSQL = "z2t_Add_Subscriptions_InitialInfo('"& FirstName & "','"& Email &"','"& strWebService &"')"		
		'response.Write(strSQL)
		'connPhilly01.Execute strSQL
		
		rs.open strSQL, connPhilly01, 3, 3, 4
				If Not (rs Is Nothing) Then
					if rs("SubAdded") = 1 Then
						response.Write("InitSignupDone")
					Else
						response.Write("InitSignupDuplicateEmail")
					End If
				
				End IF
		
		
		
	Else		
		response.Write("InitSignupInvalid")
	End If
  End If

  

	  
%>
