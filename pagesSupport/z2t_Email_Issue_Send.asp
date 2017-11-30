<!--#include virtual="/Website/Includes/config.asp"-->
<!--#include virtual="/Website/Includes/connection.asp"-->
<html>
<head>
    <title>Send E-mail</title>
</head>

<%
    Dim SQL, ObjCon, vbCr
    vbCr = chr(13)
    Set ObjCon = Server.CreateObject("ADODB.Connection")
    ObjCon.Open "driver=SQL Server;server=barley1.harvestamerican.net;uid=davewj2o;pwd=get2it;database=ha_Prod"

    'Send E-mail
    SQL = "util_SendMail '" & Request("Email") & "', " & _
        "'support@zip2tax.com', " & _
	"'" & Request("Copy") & "', " & _
	"'" & Request("selSubject") & " - " & Request("Subject") & "', " & _
        "'" & fixAps(Request("Body")) & vbCr & vbCr & "Sincerely," & vbCr & vbCr & Request("Name") & "'"
    ObjCon.Execute SQL

    'Report to Activity
    SQL = "INSERT INTO ni_Activity " & _
        "(UserName, ActivityType, Data1, Data2, ForAccountID, SessionID, CreatedByIP, CreatedBy, CreatedDate) " & _
        "VALUES " & _
            "('" & Session("Login") & "', " & _
            "'Email Sent', " & _
            "'" & Request("Subject") & "', " & _
            "'Issue Reporting', " & _
            "'" & Session("AccountID") & "', " & _
            "'', " & _
            "'', " & _
            "'z2t_Email_Issue_Send.asp', " & _
            "GETDATE())"
    ObjCon.Execute SQL
    
    Response.Write("Thank you for submitting this helpful information. Our staff will look into this issue and let you know when it has been resolved.")

    FUNCTION fixAps( ByVal theString )
      fixAps = Replace( theString, "'", "''" )
    END FUNCTION
%>

<script type="text/javascript">
    window.opener.location.href = window.opener.location.href;
    window.close()
</script>
<body></body>
</html>

