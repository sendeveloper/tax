<%
	Response.buffer=true
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
 	objcon.Open "driver=SQL Server;server=68.178.202.54;uid=davewj2o;pwd=get2it;database=ha_prod"

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

    SQL = "ha_UserTracking_add('" & Session.SessionID & "', " & _
            "'" & Session("z2t_Login") & "', " & _
            "'" & pgeURL & "', " & _
            "'" & Request.ServerVariables("REMOTE_ADDR") & "', " & _
            "'" & URL & "', " & _
            "'" & Domain & "', " & _
            "'" & Session("RequestSource") & "', " & _
            "'" & Session("IPBigInt") & "', " & _
            "'', " & _
            "'" & Request("Op") & "', " & _
            "'" & Data1 & "', " & _
            "'" & Data2 & "')"

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


