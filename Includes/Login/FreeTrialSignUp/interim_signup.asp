<%
  
  If Session("FreeTrialInterimLogin") = "Interim" Then
  
    Dim ftintFirstName, ftintlname,ftinttitle,ftintcompanyname,ftintphone
    'ftintFirstName = Left(Request("ftintFirstName"), 50)
	ftintlname = Left(Request("ftintlname"), 50)
	ftinttitle = Left(Request("ftinttitle"), 50)
	ftintcompanyname = Left(Request("ftintcompanyname"), 100)
	ftintphone = Left(Request("ftintphone"), 50)
	ftintusername=Session("z2t_UserName")
	ftintpass= Session("z2t_Password")
				
		' strSQL = "z2t_Update_Subscriptions_InterimInfo('"& ftintFirstName & "','"& ftintlname &"','"& ftintcompanyname &"','"& ftintphone &"','"& ftintusername &"','"& ftintpass &"')"

	
	If (ftintlname <> "") And (ftinttitle <> "") And (ftintcompanyname <> "") And (ftintphone <> "") Then '2open
		
		
		Dim connPhilly01: Set connPhilly01=server.CreateObject("ADODB.Connection")
  		Dim rs: Set rs=server.createObject("ADODB.Recordset")
		connPhilly01.Open "driver=SQL Server;server=208.88.49.18,8143;uid=davewj2o;pwd=get2it;database=z2t_Subscriptions" ' Philly01

        strSQL = "z2t_Update_Subscriptions_InterimInfo('"& ftinttitle & "','"& ftintlname &"','"& ftintcompanyname &"','"& ftintphone &"','"& ftintusername &"','"& ftintpass &"')"		
		
		'response.Write(strSQL)
		'response.End()
		connPhilly01.Execute strSQL
		Session("FreeTrialInterimLogin") = ""
		Session("FreeTrialInterimSignupDone") = "1"
		Session("FreeTrialInterimSignupAllowTemp") = "1"
		response.Write("InterimSignupDone")
		
	Else
	'response.Write(strSQL)		
		response.Write("InterimSignupInvalid")
	End If
  End If

  

	  
%>
