 
<%
	'----- Open Database -----
	dim objcon

	set objcon=server.CreateObject("ADODB.Connection")

 	objcon.Open "driver=SQL Server;server=66.119.50.228,7843;uid=davewj2o;pwd=get2it;database=ha_prod"


	'----- Function To Display Navigation Bar -----
	sub displayNavigationbar(str)
		percentfound=instr(str,"%")
		if cint(percentfound)=0 then
			colonfound=instr(str,":")
			if cint(colonfound)<>0 then
				secondarray=split(str,":")
				texttoshow=secondarray(0)
				response.write("<table width='80%'><tr><td>	<font size='2'  >"&texttoshow&"</font></td></tr></table>")
			end if
		else
			firstarray=split(str,"%")
			response.write("<table width='80%'><tr><td><font size='2'>")
			for i=0 to ubound(firstarray)
				secondarray=split(firstarray(i),":")
				texttoshow=secondarray(0)
				hreflink=secondarray(1)
				if trim(cstr(hreflink))="last" then
					response.write(texttoshow)
				else
					response.write("<A HREF='"&hreflink&"'><font size='2'>"&texttoshow&"</font></A>&nbsp;&gt;&gt;&nbsp;")
				end if
			next
			response.write("</font></td></tr></table>")
		end if
	end sub

	'----- Function to fix the Quotes -----
	FUNCTION fixQuotes( ByVal theString )
		fixQuotes = Replace( theString, "'", "''" )
	END FUNCTION

      Session("IPBigInt") = IPConvert(Request.ServerVariables("REMOTE_ADDR"))


	'----- Function to look-up Country's IP -----
      FUNCTION findCountry()
          DIM rs
          SET rs = Server.CreateObject("ADODB.Recordset")
          rs.open "ni_read_CountryByBigInt(" & Session("IPBigInt") & ")", objCon, 3, 3, 4

          if not rs.eof then
              Session("CountryAbr3") = rs("Abr3")
              findCountry = rs("Name")
          else
              Session("CountryAbr3") = "USA"
              findCountry = "UNITED STATES"
          end if

          if Session("CountryAbr3") = "ZZZ" then
              Session("CountryAbr3") = "USA"
              findCountry = "UNITED STATES"
          end if

          rs.Close
      END FUNCTION

    SUB readCurrency

	dim con, str
        dim rs, SQL

	set con=server.CreateObject("ADODB.Connection")
        str="driver=SQL Server;server=68.178.202.54;uid=cbs_web_user;pwd=web_user_cbs;database=ha_prod"

 	con.Open str

        set rs = Server.CreateObject("ADODB.Recordset")
        rs.open "ni_read_Currency(" & Session("CountryAbr3") & ")", con, 3, 3, 4

        if not rs.eof then
            Session("Currency") = rs("Name")
            Session("Bid") = rs("Bid")
            Session("Symbol") = rs("Symbol")
        else
            Session("Currency") = "United States Dollar"
            Session("Bid") = 1
            Session("Symbol") = "USD"
        end if
        rs.Close
        con.close
        set con = nothing
    END SUB

	'----- Function to convert IP addresses -----
      Public Function IPConvert(IPAddress)

          Dim x
          Dim Pos
          Dim PrevPos
          Dim Num

          If IsNumeric(IPAddress) Then
              IPConvert = "0.0.0.0"
              For x = 1 To 4
                  Num = Int(IPAddress / 256 ^ (4 - x))
                  IPAddress = IPAddress - (Num * 256 ^ (4 - x))
                  If Num > 255 Then
                      IPConvert = "0.0.0.0"
                      Exit Function
                  End If
      
                  If x = 1 Then
                      IPConvert = Num
                  Else
                      IPConvert = IPConvert & "." & Num
                  End If
              Next
          ElseIf UBound(Split(IPAddress, ".")) = 3 Then
              For x = 1 To 4
                  Pos = InStr(PrevPos + 1, IPAddress, ".", 1)
                  If x = 4 Then Pos = Len(IPAddress) + 1
                  Num = Int(Mid(IPAddress, PrevPos + 1, Pos - PrevPos - 1))
                  If Num > 255 Then
                      IPConvert = "0"
                      Exit Function
                  End If
                  PrevPos = Pos
                  IPConvert = ((Num Mod 256) * (256 ^ (4 - x))) + IPConvert
              Next
          End If

      End Function

	'----- User Tracking -----
	Dim URL
	Dim Domain
	Dim p

	URL = Request.ServerVariables("HTTP_REFERER")
        if len(URL) > 250 then
            URL = Left(URL, 250)
        end if

	'p = instr(URL,"?s=google")
	'If p > 0 then
        '    Domain = "Google Pay-Per-Click"
        'Else
	    p = instr(URL,"//")
	    If p > 0 then
	        Domain = Right(URL,Len(URL) - (p + 1))
	    Else
	        Domain = URL
            End If
	'End If

	p = instr(Domain,"/")
	If p > 0 then
	    Domain = Left(Domain,p - 1)
	End If

    if Session("RequestKeyword") <> "" then
        Session("RequestSource") = Session("RequestSource") & "/" & Session("RequestKeyword")
    end if

    sql = "ni_add_UserTracking('" & Session.SessionID & "', " & _
        "'" & Session("Login") & "', " & _
        "'" & Request.ServerVariables("PATH_INFO") & "', " & _
        "'" & Request.ServerVariables("REMOTE_ADDR") & "', " & _
        "'" & URL & "', " & _
        "'" & Domain & "', " & _
	"'" & Session("RequestSource") & "', " & _
        "'" & Session("IPBigInt") & "')"
	'response.write sql
	'response.end

    set rs = objcon.Execute(sql)

    Session("RequestSource") = ""
    Session("RequestKeyword") = ""
Session("TestString") = sql

%>
 
