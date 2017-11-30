<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

 <%
  Session("activePage") = "404 Error"
  Session("currentPage") = "z2t_500_error.asp"
  
    Dim port: port = "443"
  Dim url: url = Replace(Request.ServerVariables("HTTP_URL"), Request.ServerVariables("URL") & Left(pathBase, Len(pathBase) - 1) & ":" & port, "", 1, -1, 1)
  
  url = Replace(url, "/Website/pagesExtra/Errors/500/z2t_500_error.asp?500;https://dev.zip2tax.com:443","")
  
  displayURL = url
  displayURL = Replace(displayURL, "?", "|")

  ' Uses a recordset of delimeter-separated strings to produce a collection indexed by the first column
  Function UseTable(TableStrings, delimiter, columns)
    Dim table: Set table = Server.CreateObject("Scripting.Dictionary")
    Do While Not TableStrings.eof
      Dim tuple: tuple = Split(TableStrings("value"), delimiter)
      Call table.Add(tuple(0), Server.CreateObject("Scripting.Dictionary"))
      Dim column: For column = 0 to Ubound(tuple)
        Call table(tuple(0)).Add(columns(column), tuple(column))
      Next
      TableStrings.MoveNext()
    Loop
    Set UseTable = table
  End Function

  Dim strings: Set strings = Server.CreateObject("ADODB.Recordset")
  
  ' Since ASP-classic has neither lists nor usable arrays, use a ADODB.Resultset
  Function StartList()
    Dim list: Set list = Server.CreateObject("ADODB.Recordset")
    list.CursorLocation = 3
    'list.Fields.Append "id", 12 'adVariant
    list.Fields.Append "value", 12 'adVariant
    list.Open
    Set StartList = list
  End Function

  
  Function add(rs, value)
    If typename(value) = "Variant()" Then
      Dim item: For Each item in value
        rs.AddNew
        rs(0) = item
      Next
    Else 
      rs.AddNew
      rs(0) = value
    End If
    rs.MoveFirst
    Set add = rs
  End Function


  ''''' Redirected links
  Dim redirect: Set redirect = StartList()

%>

<html>
<head>
  <title>500 Error - Zip2Tax.com - <%response.write(displayURL)%></title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <meta name="keywords" content="sales tax rate lookup zip code, Zip Code, Sales and Use Tax Rates, Sales Tax Database">
  <meta name="description" content="We apologize, we've run into a problem with <%response.write(displayURL)%>">
  <!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
  <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
  <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
  <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->


          <!--#include virtual="/Website/pagesExtra/Errors/500/page_500_error_left_sidebar_new.asp" -->
          <!--#include virtual="/Website/pagesExtra/Errors/500/page_500_error_content_new.asp" -->
          <!--#include virtual="/Website/pagesExtra/Errors/500/page_500_error_right_sidebar_new.asp" -->



        <!--#include virtual="/Website/Includes/footer_new.asp"-->

</body>
</html>
