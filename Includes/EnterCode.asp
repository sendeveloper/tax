<%
' FIXME: If the user-agent's cookies have been cleared, a MS error will be displayed, because "Users shouldn't be on the internet without cookies enabled"

  message = ""
  accepted = "<em>Code accepted - 10 additional lookups granted</em>"
  close = "Close"
  display = True
  disabled = ""
  disabledText = " disabled = 'disabled'"
  cancel = "Cancel"
  submit = "Submit"
  z2tDailyOverrideCode = DateCode

'  If Session("z2t_LookupDailyOverrideCode") = "used" Then
'    message = accepted
'    cancel = close
'    disabled = disabledText
'  Else_
If Request("submit") = submit Then
'Response.Write("&lt;" & Request(submit) & "&gt;")
    If Ucase(Request("code")) = z2tDailyOverrideCode Then
      'Set rs = Server.CreateObject("ADODB.RecordSet")
      'rs.Open "z2t_LookupExtraCode_verify", connPublic, 3, 3, 4
      'If rs.eof Then
        message = accepted
        cancel = close
        disabled = disabledText
        display = False
'        Session("z2t_LookupDailyOverrideCode") = "used"

        
        tid = iif(Session("z2t_TrackingID") = "", 0, clng(Session("z2t_TrackingID")))

        Set cmd = Server.CreateObject("ADODB.Command")
        
'        Set cmd = PrepareCommand(Nothing, adCmdStoredProc, "z2t_bo_ResetTracking")
'        If cmd Is Nothing Then
'            Response.End
'        End If

        '---- ExecuteOptionEnum Values ----
        Const adExecuteNoRecords = &H00000080
        '---- CursorLocationEnum Values ----
        Const adUseClient = 3
        '---- DataTypeEnum Values ----
        Const adChar = 129
        Const adInteger = 3
        Const adVarChar = 200
        '---- ParameterDirectionEnum Values ----
        Const adParamInput = &H0001
        Const adParamOutput = &H0002
        Const adParamInputOutput = &H0003
        Const adParamReturnValue = &H0004
        '---- CommandTypeEnum Values ----
        Const adCmdStoredProc = &H0004
        Const adNVarchar = 202

        cmd.CommandText = "z2t_bo_ResetTracking"
        cmd.CommandType = 4
'        cmd.CommandTimeout = 10 '10 seconds

        Set param = cmd.CreateParameter("RecordCount", adInteger, adParamReturnValue)
        cmd.Parameters.Append param

        Set param = cmd.CreateParameter("@trackingID", adInteger, adParamInput)
'        Dim tid
'   Response.Write("&lt;" & isNull(tid) & "-"& param.Value & "&gt;" & Len(param.Value) & "<br>")
'   Response.Write("&lt;" & tid & "&gt;")
        param.Value = tid
'        param.Size = Len(param.Value)
        cmd.Parameters.Append param

        Set param = cmd.CreateParameter("@newLookupCount", adInteger, adParamInput)
        param.Value = 40
'        param.Size = Len(param.Value)
        cmd.Parameters.Append param

        Set param = cmd.CreateParameter("@clientToken", adNVarchar, adParamInput)
        param.Value = Session("CookieID")
        param.Size = 40 'Len(param.Value)
'        Response.Write("&lt;" & param.Value & "&gt;" & Len(param.Value) & "<br>")
        cmd.Parameters.Append param

        Set param = cmd.CreateParameter("@clientIPAddr", adVarChar, adParamInput)
        param.Value = Request.ServerVariables("remote_addr")
        param.Size = 40 'Len(param.Value)
        cmd.Parameters.Append param

        Set param = cmd.CreateParameter("@SessionID", adVarChar, adParamInput)
        param.Value = Session.SessionID
        param.Size = 20 'Len(param.Value)
        cmd.Parameters.Append param

        cmd.ActiveConnection = connPublic
        cmd.Execute

'
'        retval = cmd.Parameters("RecordCount")
'
'        If retval > 0 then
'          message = "<span class='firstword' style='color:red; margin-left: auto; margin-right: auto;margin-bottom: 15px;'>There was an error processing your code.</span>"
'        Else
'          Session("z2t_TrackingID") = rs("z2t_TrackingID")
'        End If




'        rs = connPublic.Execute("z2t_bo_ResetTracking_no " & _
'                                  tid & ", " & _
'                                  "40, '" & _
'                                  cstr(Session("CookieID")) & "', '" & _
'                                  Session.SessionID & "', '" & _
'                                  Request.ServerVariables("remote_addr") & "'")
'        Session("z2t_TrackingID") = rs("z2t_TrackingID")
        Session("z2t_UserLookupsDaily") = 0
        Session("z2t_UserLookupsTotal") = 40
      'Else
      '  message = "Expired code"
      'End If
    Else
      message = "<span class='firstword' style='color:red; margin-left: auto; margin-right: auto;margin-bottom: 15px;'>Invalid Code</span>"
    End If
  End If

Function DateCode
    DateCode = Right(Day(Date), 1) & _
        Left(Right("00" & day(Date), 2),1) & _
        Right(Ucase(MonthName(Month(Date))), 1) & _
        Left(Ucase(MonthName(Month(Date))), 1)
End Function
%>
<html>
<head><title>Enter the Code</title>
  <link href="/includes/z2t_screen.css" rel="stylesheet" type="text/css" media="screen"></link>
  <link href="/includes/z2t_print.css" rel="stylesheet" type="text/css" media="print"></link>
  <script type="text/javascript" language="javascript"x>
function SetScreen(w, h)
    {
    window.resizeTo(w, h);
    CenterScreen(w, h);
    }

function CenterScreen(w, h)
    {
    var leftprop, topprop;

    var leftvar = (window.screen.availWidth - w) / 2;
    var rightvar = (window.screen.availHeight - h) / 2;

    if(navigator.appName == "Microsoft Internet Explorer")
        {
        leftprop = leftvar;
        topprop = rightvar;
        }
    else
        {
        leftprop = (leftvar - pageXOffset);
        topprop = (rightvar - pageYOffset);
        }

    window.moveTo(leftprop,topprop);
    }

function openPopUp(URL)
    {
    window.open(URL,'',
        'scrollbars=yes,fullscreen=no,resizable=yes,height=10,width=10,left=10,top=10');
    }

function openPopUpSize(URL, w, h)
    {
    window.open(URL,'',
        'scrollbars=yes,fullscreen=no,resizable=yes,height=' + h + ',width=' + w + ',left=10,top=10');
    }

function loadEnterCode()
    {
    SetScreen(250, 330);
    }

  window.onload = loadEnterCode;
</script>
</head>
<body class="popup">
  <form class="box" method="post" action="<%=pathIncludes%>EnterCode.asp" style="line-height: 200%; margin: 25px; display: inline-block;">
    <h2 class="title">Zip2Tax Code</h2>
    <div class="content">
      <%=message%><br>
      <label for="code"<%=iif(display, "", " style=""visibility: hidden;""")%>>Enter the Code:</label><br>
      <input type="text" name="code" style="margin-bottom: 25px;<%=iif(display, "", " visibility: hidden;")%>"<%=disabled%>></input><br>
      <input class="popup-button" type="submit" name="submit" value=<%=submit%><%=disabled%> <%=iif(display, "", " style=""visibility: hidden;""")%>></input>
      <script>document.write('<input class="popup-button" type="submit" name="cancel" value=<%=cancel%> onclick="window.close();window.opener.location.href = window.opener.location.href;"></input>')</script>
      <noscript><a class="popup-button" href="<%=Request.ServerVariables("HTTP_REFERER")%>">Back</a></noscript>
      </div>
  </form>
</body>
</html>

<%
Function iif(test, consequent, alternative)
   If test Then iif = consequent Else iif = Alternative
End Function
%>
