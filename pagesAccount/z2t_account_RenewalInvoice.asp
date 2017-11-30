<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<!--#include virtual="/Website/Includes/Backoffice/Includes/config.asp"-->
<!--#include virtual="/Website/Includes/Backoffice/Includes/z2t_BackofficeConnection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->
<!--#include virtual="/Website/pagesTaxRates/Online-Lookups/sql.asp"-->
<%
    Session("activePage") = "Account"
    Session("acctPage") = "Renew Online"
    Session("currentPage") = "account/z2t_account_RenewalInvoice.asp"
%>

<%
   'If z2tID = "" Then
    '  Server.Transfer("/index.asp")
    'End If

    
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
   rsDates.open sqlText, connpublic, 3, 3, 4
   viewDate = rsDates("EffectiveDate")
                        
   AuthText = cstr(z2tID) & Date
   AuthToken = 0
   For i = 1 to Len(AuthText)
     AuthToken = AuthToken + Asc(Mid(AuthText, i, 1))
   Next
%>

<html>
  <head>
    <title>Subscription Renewal Invoice - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Log in to your account and pay for your subscription here through our secure online renewal system.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_popup_functions.js" type="text/javascript"></script>
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

  <style>
    #usage-statistics * {margin: 0em;
	padding: 0em;}
    ul.resultset {height: 14.3em;}
    ul.resultset li {line-height: 1.3em; width: 15em;}

    ul.resultset li.top {margin-top: -14.3em;}
    ul.resultset li.hr {line-height: 0px; border-bottom: 1px solid black; width: 45em;}
    ul.resultset li..header {font-weight: bold;}
    ul.resultset li.column-0 {margin-left: 0em;}
    ul.resultset li.column-1 {margin-left: 15em;}
    ul.resultset li.column-2 {margin-left: 30em;}
  </style>

        <!-- #include virtual="/Website/pagesAccount/RenewalInvoice/page_account_RenewalOnline_left_sidebar_new.asp" -->
		<!-- #include virtual="/Website/pagesAccount/RenewalInvoice/page_account_RenewalOnline_content_new.asp" -->
        <!-- #include virtual="/Website/pagesAccount/RenewalInvoice/page_account_RenewalOnline_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
         
  </body>
</html>

  