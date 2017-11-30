<!--#include virtual="/Website/Includes/Config.asp"-->
<%
	Dim rs
    Dim SQL
	'Dim ConnString
    Dim conn
	Dim HarvestID
	Dim RequestDatabase
	Dim RequestError
	Dim PostStatus
		
	RequestError = 0

	If isnull(Request("HarvestID")) or Request("HarvestID") = "" Then
		RequestError = 1
	Else
		HarvestID = Request("HarvestID")
	End If
		
	If RequestError = 0 Then

		set conn=server.CreateObject("ADODB.Connection")
		'ConnString = "driver=SQL Server;server=68.178.202.54;uid=davewj2o;pwd=get2it;database=ha_Prod"  'Barley
		'ConnString = "driver=SQL Server;server=208.88.49.22,8543;uid=davewj2o;pwd=get2it;database=z2t_WebReporting"  'Philly05
		'ConnString = "driver=SQL Server;server=127.0.0.1,7943;uid=davewj2o;pwd=get2it;database=z2t_WebPublic"  'Casper09		
		'ConnStringValue = "Provider=SQLOLEDB;Data Source=127.0.0.1,7943;Initial Catalog=z2t_WebPublic;UID=z2t_WebUser;PWD=WebUser_z2t;Application Name=Z2T_V2.5;" 'Casper09
		'Connection commented by Humair 16 July 2016, As philly05 went down.
		'conn.Open ConnString
		conn.Open connStrRequestVariables

		'SQL = "z2t_Account_Basic_Info_read(" & HarvestID & ")"
		SQL = "z2t_HA_AccountInfo(" & HarvestID & ")"
				'response.Write(SQL)
	
		set rs=server.createObject("ADODB.Recordset")
		rs.open SQL, conn, 3, 3, 4

		If Not rs.EOF Then
			s = ""
			s = s & "<table class=""table table-bordered"">" & vbCrLf
			s = s & "	<tr valign='top'>" & vbCrLf
			s = s & "	  <td>" & vbCrLf
			s = s & "		<p>" & vbCrLf
			s = s & "		  <font color='red'><b>Registered To:</b></font><br />" & vbCrLf
			s = s & "		  &nbsp;&nbsp;" & rs("AddressLine1") & "<br />" & vbCrLf
			s = s & "		  &nbsp;&nbsp;" & rs("AddressLine2") & "<br />" & vbCrLf
			s = s & "		  &nbsp;&nbsp;" & rs("City") & ",&nbsp;" & rs("State") & ",&nbsp;" & rs("PostalCode") &  "<br />" & vbCrLf
			s = s & "		  <br />" & vbCrLf
			s = s & "		</p>" & vbCrLf
			s = s & "	  </td></tr>" & vbCrLf
			s = s & "	  <tr><td>" & vbCrLf
			s = s & "		<p>" & vbCrLf
			s = s & "		  <font color='red'><b>Phone:</b></font><br />" & vbCrLf
			s = s & "		  &nbsp;&nbsp;" & rs("HomePhone") & "<br />" & vbCrLf
			s = s & "		  <br>" & vbCrLf
			s = s & "		</p>" & vbCrLf
			s = s & "		<p>" & vbCrLf
			s = s & "		  <font color='red'><b>E-mail:</b></font><br />" & vbCrLf
			s = s & "		  &nbsp;&nbsp;" & rs("Email") & "<br />" & vbCrLf
			s = s & "		</p>" & vbCrLf
			s = s & "	  </td>" & vbCrLf
			s = s & "	</tr>" & vbCrLf
			s = s & "  </table>" & vbCrLf
			
			Response.write s
	  
		End If
		
		rs.Close
		set rs = nothing
	End If
	
	
%>

