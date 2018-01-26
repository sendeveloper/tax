<!--#include virtual="/Website/Includes/sql.asp"-->
<!--#include virtual="/Website/Includes/config.asp"-->
<%
  sqlConnectionString = connStrPublic
  Dim sqlText: sqlText = "exec z2t_WebPublic.dbo.z2t_Boundary_lookup '" & Request("zip") & "'"
  Set rs = Sql(sqlText)

  'Response.ContentType = "application/json"
  Dim separator1: separator = "" 
  Dim separator2: separator = "[" 
  Dim separator3: separator = "" 
  Dim polygon: polygon = 0
  Response.Write("[" & separator1 & "[")
  Do While Not rs.eof
    If rs("polygonid") <> polygon Then 
      polygon = rs("polygonid")
      separator3 = ""
      Response.Write(separator2)
    End If
    separator2 = "], ["
    Response.Write(separator3 & "[" & rs("Latitude") & ", " & rs("Longitude") & "]")
    separator3 = ", "
    rs.MoveNext
  Loop
  Response.Write("]]")
%>
