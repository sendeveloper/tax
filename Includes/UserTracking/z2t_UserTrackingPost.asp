<%
    Dim rs
    Dim Data1
    Dim Data2
    Dim URL
    Dim Domain
    Dim p
    Dim objcon
    Dim pgeURL

    Data1 = Request("Data1")
    Data2 = Request("Data2")

    set objcon=server.CreateObject("ADODB.Connection") 
    'objcon.Open "driver=SQL Server;server=68.178.202.54;uid=davewj2o;pwd=get2it;database=ha_prod"
    objcon.Open "driver=SQL Server;server=dbWeb.Zip2Tax.com;uid=z2t_WebUser;pwd=WebUser_z2t;database=z2t_WebPublic"

    if isnull(Request("Op")) or Request("Op") = "" then
        Op = 0
    else
        Op = cint(Request("Op"))
    end if

    if Request("Page")="" then
        pgeURL = Request.ServerVariables("path_info")
    else
        pgeURL = Request("Page")
    end if

    if left(pgeURL,1) = "/" then
        pgeURL = mid(pgeURL&"  ",2)
    end if

    pgeURL = trim(pgeURL)

    URL = Request.ServerVariables("HTTP_REFERER")

	UURL = UCASE(URL)

	p = instr(UURL, "S=")
	if p then
	    Source = mid(URL,p+2)
            p = instr(Source, "&")
            if p then
                Source = left(Source,p-1)
            end if
	end if

	p = instr(UURL, "SOURCE=")
	if p then
	    Source = mid(URL,p+7)
            p = instr(Source, "&")
            if p then
                Source = left(Source,p-1)
            end if
	end if

	p = instr(UURL, "?GCLID=")
	if p then
	    Source = "Google"
	end if

	p = instr(UURL, "K=")
	if p then
	    Keyword = mid(URL,p+2)
            p = instr(Keyword, "&")
            if p then
                Keyword = left(Keyword,p-1)
            end if
	end if

	if Data1 = "" then
	    Data1 = Source
	end if

	if Data2 = "" and Keyword <> "" then
	    Data2 = URLDecode(Keyword)
	end if

'CREATE PROCEDURE dbo.z2t_Activity_add_new (@user nvarchar(50), 
'	@actType int, 
'	@data1 varchar(200), 
'	@data2 varchar(200),
'	@PageURL varchar(200),
'	@RefURL varchar(200),
'	@SessionID varchar(20),
'	@CreatedByIP varchar(20), 
'	@CreatedBy varchar(20))

    SQL = "z2t_Activity_add_new('" & Session("z2t_login") & "', " & Op & ", " & _
            "'" & Data1 & "', " & _
            "'" & Data2 & "', " & _
            "'" & pgeURL & "', " & _
            "'" & URL & "', " & _
            "'" & Session.SessionID & "', " & _
            "'" & Request.ServerVariables("REMOTE_ADDR") & "', " & _
            "'z2t_UserTrackingPost.asp')"

    'response.write sql
    objcon.Execute (SQL)
    objcon.close

' -----------------------------------------
' URL decode to retrieve the original value

Function URLDecode(sConvert)
    Dim aSplit
    Dim sOutput
    Dim I
    If IsNull(sConvert) Then
       URLDecode = ""
       Exit Function
    End If
	
    ' convert all pluses to spaces
    sOutput = REPLACE(sConvert, "+", " ")
	
    ' next convert %hexdigits to the character
    aSplit = Split(sOutput, "%")
	
    If IsArray(aSplit) Then
      sOutput = aSplit(0)
      For I = 0 to UBound(aSplit) - 1
        sOutput = sOutput & _
          Chr("&H" & Left(aSplit(i + 1), 2)) &_
          Right(aSplit(i + 1), Len(aSplit(i + 1)) - 2)
      Next
    End If
	
    URLDecode = sOutput
End Function
%>


