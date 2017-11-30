<%

    dim objcon
    set objcon=server.CreateObject("ADODB.Connection")
    objcon.Open "driver=SQL Server;server=66.119.50.228,7843;uid=davewj2o;pwd=get2it;database=ha_prod"

    'dim connAdmin
    'set connAdmin=server.CreateObject("ADODB.Connection")
    'connAdmin.Open "driver=SQL Server;server=barley2.HarvestAmerican.net;uid=z2t_WebAdmin;pwd=WebAdmin_z2t;database=z2t_WebBackoffice"
    'fix'connAdmin.Open "driver=SQL Server;server=philly05.HarvestAmerican.net,8543;uid=davewj2o;pwd=get2it;database=tempdb"
	'Update by Humair - 16 June, 2016, As Barley2 Has been Depricated , Shifted connection to local server
	'connAdmin.Open "driver=SQL Server;server=127.0.0.1;uid=z2t_WebAdmin;pwd=WebAdmin_z2t;database=z2t_WebBackoffice"
    dim connPublic
    set connPublic=server.CreateObject("ADODB.Connection")
    'connPublic.Open "driver=SQL Server;server=barley2.HarvestAmerican.net;uid=z2t_WebUser;pwd=WebUser_z2t;database=z2t_WebPublic"
	connPublic.Open "driver=SQL Server;server=127.0.0.1;uid=z2t_WebUser;pwd=WebUser_z2t;database=z2t_WebPublic"
    'fix'
	'connPublic.Open "driver=SQL Server;server=philly05.HarvestAmerican.net,8543;uid=davewj2o;pwd=get2it;database=z2t_WebPublic"

    'dim connUpdateRates
'    set connUpdateRates=server.CreateObject("ADODB.Connection")
'    connUpdateRates.Open "driver=SQL Server;server=philly05.HarvestAmerican.net,8543;uid=davewj2o;pwd=get2it;database=z2t_UpdateRates"
'
'
'	

    dim connBackoffice
    set connBackoffice=server.CreateObject("ADODB.Connection")
    'connBackoffice.Open "driver=SQL Server;server=208.109.189.101;uid=davewj2o;pwd=get2it;database=z2t_WebBackOffice"
	'Update by Humair - 16 June, 2016, As Barley2 Has been Depricated , Shifted connection to local server
	connBackoffice.Open "driver=SQL Server;server=philly03.HarvestAmerican.net,8343;uid=davewj2o;pwd=get2it;database=z2t_WebBackOffice"


	set rs=server.createObject("ADODB.Recordset")
    set rs2=server.createObject("ADODB.Recordset")
    set rs3=server.createObject("ADODB.Recordset")


    'Post the page load into activity

    Dim Data2
    Dim Data1
    Data2 = ""
    Data1 = ""

    pgeURL = Request.ServerVariables("path_info")

    if left(pgeURL,1) = "/" then
        pgeURL = mid(pgeURL&"  ",2)
    end if

    pgeURL = trim(pgeURL)

'response.write 'at line 46 dave'
    URL = Request.ServerVariables("HTTP_REFERER")

    Dim cookie: cookie = Session("CookieID")
    If cookie = "" Then cookie = 0
    Dim sqlText
    sqlText = "z2t_Activity_add_new '" & Session("z2t_UserName") & "', 17, " & _
            "'" & Data1 & "', " & _
            "'" & Data2 & "', " & _
            "'" & pgeURL & "', " & _
            "'" & URL & "', " & _
            "'" & Session.SessionID & "', " & _
            "'" & Request.ServerVariables("REMOTE_ADDR") & "', " & _
            "'z2t_Connection.asp', " & _
            cookie & ""
    'Response.Write(sqlText)
    connPublic.Execute(sqlText)
	


%>
