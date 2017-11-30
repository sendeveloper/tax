<div id="content" class="account">
  <div class="post">
    <h1 class="title">Tax Table Downloads</h1>
    <div class="entry downloads">
<% 
'if 1 = 2 then 
   Dim MostEffectiveDate
   Dim EffectiveDate
   Dim ReleaseDate

   'Dim sqlText
   Dim sqlStart
   Dim sqlEnd
   Dim rs

   Set rs = server.createObject("ADODB.Recordset")
   sqlText = "z2t_TableDownloadDates(" & cstr(z2tID) & ", '" & viewDate & "')"
   sqlText = "SELECT Value FROM z2t_Types_repl WHERE Class = 'TableDates' AND Description = 'Effective Date'"
   rs.Open sqlText, connPublic, 2, 2
   MostEffectiveDate = rs("Value")
   rs.Close
   
   
   sqlText = "z2t_TableDownloadDates(" & cstr(z2tID) & ", '" & viewDate & "')"
   rs.Open sqlText, connPublic, 3, 3, 4
   If Not (rs is Nothing) Then
     EffectiveDate = rs("EffectiveDate")
     ReleaseDate = rs("ReleaseDate")
   End If
   rs.Close

   sqlText = "z2t_TableDownloadStates(" & cstr(z2tID) & ", '" & viewDate & "')"

   'Response.Write sqlText & "<br>"
   rs.Open sqlText, connPublic, 3, 3, 4
   

   'For Each i in rs.Fields
   '    Response.Write(i) & "<br>"
   'Next
'Response.Write rs.GetString()
   
'    If false then
   If rs is Nothing Then
%>
     <p>Nothing to download.</p>
<%
   ElseIf not rs.eof Then
       PreviousTableTitle = ""
%>
     <p>Available below is the product(s) you purchased. Click the
       download button next to the corresponding table. You may
       download them now, or save this page and return later.  

       These tables
       <!-- The most current tables available -->

       were released
       <%=ReleaseDate%> and are effective <%=EffectiveDate%>.</p>
     <table class="nowrap table-download">
<% 

     Set Latest = server.createObject("ADODB.Recordset")
     Set Latest.ActiveConnection = Nothing
     Latest.CursorLocation = adUseClient
'     Latest.LockType = adLockBatchOptimistic
     Latest.Fields.Append "Date", 202, 99

     Latest.Open

     Dim conn: Set conn = Server.CreateObject("ADODB.Connection")
     'conn.Open "driver=SQL Server;server=dallas01.HarvestAmerican.net;uid=davewj2o;pwd=get2it;database=z2t_Backoffice"
     'conn.Open "driver=SQL Server;server=philly01.HarvestAmerican.net,8143;uid=z2t_Subscription_Admin;pwd=get2subscriptions;database=z2t_Maintenance"
     conn.Open "driver=SQL Server;server=127.0.0.1;uid=z2t_WebUser;pwd=WebUser_z2t;database=z2t_WebPublic"
     Set rsLatest = server.createObject("ADODB.Recordset")
     sqlStart ="z2t_TableDownloadLatest(" & _
                 z2tID & _
                 ", '"
     sqlEnd = "')"

   	   
	


     Do While not rs.eof
       Latest.AddNew

       sqlText = (sqlStart & Session("z2t_UserName") & "', '" & rs("FileName") & sqlEnd)
       rsLatest.Open sqlText, conn, 3, 3, 4
'Response.Write "[" & rsLatest("Date") & "]" & "<br>"
       If IsNull(rsLatest("DownloadDate")) Then
              Latest.Fields("Date") = "Never"
       Else
              Latest.Fields("Date") = rsLatest("DownloadDate")
       End If
       rsLatest.Close
       rs.MoveNext
     Loop

     rs.MoveFirst
     Latest.MoveFirst
       Do While not rs.eof
         TableTitle = rs("Description")
          If PreviousTableTitle <> TableTitle Then
            Response.write("<tr class='table-subheading'><td colspan='3'>" & _
                           TableTitle & "</td></tr>")
            PreviousTableTitle = TableTitle
%>
        <tr><th><%=iif((cint(rs("TableType")) = 17) Or (rs("TableState") = "US"), "Country", "State")%></th><th>File Name</th><th></th><th>Last Download</th></tr>
<%        End If %>

         <tr><td><%=iif(cint(rs("TableType")) = 17 , "Canada", rs("TableState") & " - " & rs("StateName"))%></td>
             <td><%=rs("FileName")%></td>
             <td><a class="redButton" 
                    onclick="this.blur();"
                    href="javascript:clickDownload(<%=rs("TableType")%>, '<%=rs("TableState")%>', <%=rs("Clothing")%>), void(0);">&nbsp;&nbsp;&nbsp;Download&nbsp;&nbsp;&nbsp;</a></td>
             <td><%=Latest("Date")%></td></tr>
<%
          rs.MoveNext
          Latest.MoveNext
       Loop
%>
     </table>
<%
   Else
       Response.Write("<p>No downloads available. (<a href="  + _
                      chr(34) +  "/z2t_services.asp#PageSection3"  + chr(34) + _  
                      ">Purchase a table</a>)</p>")
   End If 
   
  
%>


     <span>
<% 
  Dim viewYear
  Dim prevDate
  Dim nextDate
  Dim prevYear
  Dim nextYear
  Dim viewString
  Dim prevString
  Dim nextString

  viewYear = DatePart("yyyy", viewDate)
  prevDate = DateAdd("m", -1, viewdate)
  prevYear = DatePart("yyyy", prevDate)
  nextDate = DateAdd("m", +1, viewdate)
  nextYear = DatePart("yyyy", nextDate)

  prevString = monthName(DatePart("m", prevDate)) 
  If DatePart("yyyy", Now()) <> prevYear Then
    prevString = prevString & ", " & cstr(prevYear)
  End If
  'If DateDiff("m", prevDate, Now()) < 0 Then
  '  prevDate = ""
  'Else
    prevString = "<a href=" & chr(34) & "z2t_account_TableDownloads.asp?date=" & cstr(prevYear) & "-" & cstr(DatePart("m", prevDate)) & chr(34) & ">" & "&lt;&lt;&nbsp;" & prevString & "</a>"
  'End If

  nextString = monthName(DatePart("m", nextDate)) 
  If DatePart("yyyy", Now()) <> nextYear Then 
    nextString = nextString & ", " & cstr(nextYear)
  End If

  If DateDiff("m", viewDate, MostEffectiveDate) <= 0  Then
    nextString = ""
  Else
    nextString = "<a href="  & chr(34) & "z2t_account_TableDownloads.asp?date=" & cstr(nextYear) & "-" & cstr(DatePart("m", nextDate)) & chr(34) & ">" & nextString & "&nbsp;&gt;&gt</a>"
  End If


viewString = monthName(DatePart("m", viewDate))
If DatePart("yyyy", Now()) <> viewYear Then 
  viewString = viewString & ", " & cstr(viewYear)
End If


%>
       <hr style="margin-top: 1em; margin-bottom: 0.25em;">
       <span style="width: 100%; display: inline-block;">
       <span style="margin: auto; width: 30%; display: inline-block; text-align: left;"><%=prevString%></span>
       <span style="margin: auto;%; width: 38%; display: inline-block; text-align: center;">
         Currently viewing tables for:<br>
         <strong class="first-word"><%=viewString%></strong></span>
       <span style="margin: auto;; width: 30%; display: inline-block; text-align: right;"><%=nextString%></span>
<!-- class="buttonwide" style="display: inline-block; float: right; margin: 20px 0px;" -->
       </span>
       <hr style="margin-top: 0.25em; margin-bottom: 1em;">
     </span>
     <a class="redButton s11" style="float: right;" href="javascript:openPopUp('page_account_TableDownloadHistory_content.asp'), void(0);">&nbsp;&nbsp;&nbsp;Download History&nbsp;&nbsp;&nbsp;</a>

<%
'     rs.Close
 Set rs = Nothing
%>

      
    </div><!-- entry -->
  </div><!-- post -->
</div><!-- content -->

<%


Function iif(test, consequent, alternative)
   If test = True Then iif = consequent Else iif = Alternative
End Function

'end if
%>
