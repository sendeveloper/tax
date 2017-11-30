
<%''' Change log 
  ' Modified: <2011-07-06 Wed nathan>
  ' Description: Centered "No history." message.
  '
  ' Modified: <2011-07-11 Wed nathan>
  ' Description: Dirty fixup login/account chages.
  '
  'Modified: <2016-June-07 Thu Humair>
  'Description: Included z2t_Backofficeconnection.asp in order to use local server History SP instead of Philly01 and removed connection creation on this page
%>

<!--#include virtual="/Website/Includes/Backoffice/Includes/z2t_BackofficeConnection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->


<%
   Dim RowMod
   RowMod = 2
   Dim sql
   Dim rs


    Dim z2tID
    Set subscriptions = GetUserSubscriptions(Session("z2t_UserName"))
    If subscriptions is Nothing Then Server.Transfer("/index.asp")
    z2tID = subscriptions.GetAccountID(cUpdateTable)
    If z2tID = 0 Then
      z2tID = subscriptions.GetAccountID(cInitialTable)
    End If

   sql = "z2t_TableDownloadHistory(" & cstr(z2tID) & ", '" & Session("z2t_UserName") & "')"
   Set rs = server.createObject("ADODB.Recordset")
   rs.open sql, connPublic, 3, 3, 4
%>
<html>
  <head>
    <title>Table Download History - Zip2Tax</title>
    <!-- z2t Popup Styles -->
    <style>
@charset "utf-8";

*
        {
        margin: 0;
        padding: 0;
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        }

body
        {
        background: #FFFFFF
        font-size: 13px;
        color: #4A5157;
        }

h1, h2, h3
        {
        color: #292929;
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        }

h1
        {
        letter-spacing: -1px;
        font-size: 30px;
        }

h2
        {
        font-size: 20px;
        color: #292929;
        }

h3
        {
        font-size: 13px;
        color: #292929;
        }

p, ul, ol
        {
        margin-bottom: 2em;
        text-align: justify;
        line-height: 200%;
        }

/* Table Download History */

body
        {
text-align: center;
        }

h1
        {
        text-align: center;
        margin: auto;
        }

hr
        {
        display: inline-block;
        margin: auto;
        margin: 20px 0px;
        /*
        width: 600px;
        */
        min-width: 70%;
        }

table.download-history
        {
        margin: auto;
        margin-bottom: 20px;
        /*
        width: 600px;
        */
        width: 70%;
        min-width: 70%;
        }

.download-history td, .download-history th
        {
        text-align: left;
        padding: 0px;
        padding-right: 15px;
        }
 .download-history th
        {
        text-decoration: underline;        
        }

a.button
        {
        margin: auto;
        font-weight: bold;
        font-size: 10px;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        color: #FFFFFF;
        padding: 1px 2px;
        background-color: red;
        border-top: 2px solid #C0C0C0;
        border-right: 2px solid black;
        border-bottom: 2px solid black;
        border-left: 2px solid #C0C0C0;
        display: block;
        text-align: center;
        text-decoration: none;
        width: 70px;
        }

a.button:hover
        {
        font-weight: bold;
        font-size: 10px;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        color: #C0C0C0;
        background-color: red;
        border-color: black #C0C0C0 #C0C0C0 black;
        }

.resultset tr.rowmod-1 {background-color: lightgreen;}
    </style>
    <script language="javascript" src="/Website/Includes/Javascript/z2t_popup_functions.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
      window.onload = function()
                      {
                        SetScreen(1024, 768);
                        //SetScreen(window.innerwidth, window.innerheight);
                      }
    </script>
  </head>
<body>
<span style="margin-top: 2em; margin-bottom: 2em; min-width: 1024px; width: 100%; display: block;">
<h1>Table Download History</h1>
<hr>
<% If (rs is Nothing) Or rs.eof Then %>
     <p style="text-align: center;">No history.</p>
<% Else %>
<table class='download-history resultset'>
<tr><th>Date/Time</th><th>Table Name</th><th>Status</th></tr>
<%
  Dim count
  count = 0
  Do While not rs.eof %>
    <tr class="rowmod-<%=count Mod RowMod%>"><td style="width: 30%;"><%=rs("DownloadDate")%></td><td style="width: 45%;"><%=rs("TableName")%></td><td style="width: 25%;"><%=rs("Status")%></td></tr>
<%
     rs.MoveNext
     count = count + 1
   Loop
%>
</table>
<!-- more not displayed? -->
<a class='button' href='javascript:window.close();'>Close</a>
</span>
</body>
</html>
<% End If %>
