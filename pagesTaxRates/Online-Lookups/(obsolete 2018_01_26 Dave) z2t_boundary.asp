<!--#include virtual="/Website/Includes/sql.asp"-->
<!--#include virtual="/Website/Includes/config.asp"-->
<%
  sqlConnectionString = connStrPublic
  Dim sqlText: sqlText = "SELECT TOP 1 WKT, ZoomLevel, CenterLongitude, CenterLatitude FROM z2t_BoundariesZipCode WHERE ZipCode = '" & Request("zip") & "'"
  Set rs = Sql(sqlText)

  'Response.ContentType = "application/json"
  Dim polygon: polygon = 0
  
  Do While Not rs.eof
    Response.Write("{")
    Response.Write("""ZoomLevel"":" & rs("ZoomLevel") & ",")
    Response.Write("""CenterLongitude"":" & rs("CenterLongitude") & ",")
    Response.Write("""CenterLatitude"":" & rs("CenterLatitude") & ",")
    Response.Write("""WKT"":""" & rs("WKT") & """")
    Response.Write("}")
    rs.MoveNext()
    
  Loop
  
%>
