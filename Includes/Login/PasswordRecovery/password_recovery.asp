<!--#include virtual="/Website/Includes/config.asp"-->
<%
  
  If Session("z2t_loggedin") = "" Then

  
    Dim passrEmail,AccountID
    'ftintFirstName = Left(Request("ftintFirstName"), 50)
	passrEmail = Left(Request("email"), 100)
	
				
		' strSQL = "z2t_Update_Subscriptions_InterimInfo('"& ftintFirstName & "','"& ftintlname &"','"& ftintcompanyname &"','"& ftintphone &"','"& ftintusername &"','"& ftintpass &"')"

	
	If (passrEmail <> "")  Then '2open
		Dim connFrank03: Set connFrank03=server.CreateObject("ADODB.Connection")
  		Dim rs: Set rs=server.createObject("ADODB.Recordset")
		'connCasper09.Open "driver=SQL Server;server=66.119.50.229,7943;uid=davewj2o;pwd=get2it;database=z2t_WebPublic" ' casper09
		connFrank03.Open connStrRequestVariables ' 

        strSQL = "z2t_VerifyEmail('"&passrEmail&"')"		
        rs.open strSQL, connFrank03, 3, 3, 4
		
		      If Not (rs Is Nothing) Then
			  
			  	AccountID = rs("EmailExist")
			  	If AccountID <> "0" Then
			  		Dim connPhilly01: Set connPhilly01=server.CreateObject("ADODB.Connection")
  					Dim rspassrec: Set rspassrec=server.createObject("ADODB.Recordset")
					connPhilly01.Open "driver=SQL Server;server=208.88.49.18,8143;uid=davewj2o;pwd=get2it;database=z2t_Subscriptions" ' Philly01
        			strSQLpassrec = "z2t_UsernamePassword_email('"&AccountID&"')"		
				
					rspassrec.open strSQLpassrec, connPhilly01, 3, 3, 4
					
					Response.Write("passrecovered")
			  	Else
			  
			  		Response.Write("IncorrectEmail")
			  			  
			  	End If
		
			Else
		
				response.Write("IncorrectEmail")
			End If
			
		Else
			response.Write("IncorrectEmail")
  		End If

  End If

	  
%>
