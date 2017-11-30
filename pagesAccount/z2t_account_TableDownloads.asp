<!doctype html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<!--#include virtual="/Website/Includes/Backoffice/Includes/config.asp"-->
<!--#include virtual="/Website/Includes/Backoffice/Includes/z2t_BackofficeConnection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->


<%
	
    Session("activePage") = "Account"
    Session("acctPage") = "Tax Table Downloads"
    Session("currentPage") = "account/z2t_account_TableDownloads.asp"
%>

<%
    Dim z2tID
    Dim subscriptions
    z2tID = 0
    Set subscriptions = Nothing

    If Session("z2t_loggedin") > "" Then
      Set subscriptions = GetUserSubscriptions(Session("z2t_UserName"))
      z2tID = subscriptions.GetAccountID(cUpdateTable)
      If z2tID = 0 Then
        z2tID = subscriptions.GetAccountID(cInitialTable)
      End If
   End If

   'On error redirect to home page
   If subscriptions Is Nothing Then
     Server.Transfer("/index.asp")
   End If


   Dim viewDate
   viewDate = Request("date")
   If viewDate > "" Then
     If Len(viewDate) < 10 Then
       viewDate = viewDate & "-01"
     End If
     viewDate = cdate(viewDate)
     viewDate = ", '" & viewDate & "'"
   Else
     viewDate = ""
   End If


   'Dim sqlText
   sqlText = "z2t_TableDownloadDates(" & cstr(z2tID) & viewDate & ")"
   'Response.Write(sqlText)
   Set rsDates = server.createObject("ADODB.Recordset")

   rsDates.open sqlText, connStrRequestVariables, 3, 3, 4
   viewDate = rsDates("EffectiveDate")
                        
   AuthText = cstr(z2tID) & Date
   AuthToken = 0
   For i = 1 to Len(AuthText)
     AuthToken = AuthToken + Asc(Mid(AuthText, i, 1))
   Next
%>

<html>
  <head>
    <title>.CSV Tax Table Downloads - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Log in to your account and check back here every month to download the latest .CSV sales or use tax table.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

        <!-- #include virtual="/Website/pagesAccount/TableDownloads/page_account_TableDownloads_left_sidebar.asp" -->
		<!-- #include virtual="/Website/pagesAccount/TableDownloads/page_account_TableDownloads_content.asp" -->
        <!-- #include virtual="/Website/pagesAccount/TableDownloads/page_account_TableDownloads_right_sidebar.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
         
  </body>
</html>
  <script language="javascript" type="text/javascript">
    function formLoad() {
      document.getElementById('JavaScriptTest').innerHTML = 'Pass';}

      window.onload=formLoad;

    function clickDownload(type, state, clothed, a) {
      var URL = "http://tables.zip2tax.com/download.asp" +
                "?id=<%=z2tID%>" +
                "&user=<%=Session("z2t_UserName")%>" +
                "&type=" + type + //download[i][sales] +
                "&c=" + clothed +
                "&state=" + state + //download[i][state] +
                "&date=" + "<%=Right("0000" & year(viewDate), 4) & "-" & Right("00" & month(viewDate), 2)%>" +
                "&a=<%=AuthToken%>";
      openPopUp(URL, 800, 600);
      window.location.reload();}
  </script>


<%
   Set subscriptions = Nothing
%>
