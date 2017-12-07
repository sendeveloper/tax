<!DOCTYPE html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->

<%
    Session("activePage") = "Account"
    Session("acctPage") = "Subscriber Usage"
    Session("currentPage") = "/Website/pagesAccount/z2t_account_LookupUsage.asp"
%>

<%
    Dim z2tID
	Dim SQL
	Dim rs
	Dim MostEffectiveDate
    Dim subscriptions
	Dim currentMonth
	Dim currentYear
    Dim viewDate
	
  
	If isNull(Request("selectmonth")) or Request("selectmonth") = "" Then
		currentMonth = Month(Now())
	Else
		currentMonth = cint(Request("selectmonth"))
	End If

	If isNull(Request("selectyear")) or Request("selectyear") = "" Then
		currentYear = Year(Now())
	Else
		currentYear = cint(Request("selectyear"))
	End If
	
    If currentYear = 0 Then
		viewDate = MostEffectiveDate
		currentYear = Year(viewDate)
		currentMonth = 0
	Else
		If currentMonth = 0 Then
			viewDate = cdate(cstr(currentYear) & "-01-01")
		Else
			viewDate = cdate(cstr(currentYear) & "-" & cstr(currentMonth) & "-01")
		End If
	End If

%>

<html lang="en">
  <head>
	<title>Online Lookup Usage - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Log in to your account and check out your daily and monthly usage of your subscription service.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
	
	<script type="text/javascript" src="/Website/pagesAccount/LookupUsage/page_account_LookupUsage.js"></script>
	</head>
  
  	<body>	
    <div class="container-fluid" style="padding: 0px;">
      <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
      <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
	  
      <div class="mainBody">
        <div class="clearfix"></div>
        <div class="container">

        <!-- #include virtual="/Website/pagesAccount/LookupUsage/page_account_LookupUsage_left_sidebar.asp" -->
		<!-- #include virtual="/Website/pagesAccount/LookupUsage/page_account_LookupUsage_content.asp" -->
        <!-- #include virtual="/Website/pagesAccount/LookupUsage/page_account_LookupUsage_right_sidebar.asp" -->
    	</div>
		</div>
    </div>
	
	<!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
    <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->	
  </body>
</html>

	<script type="text/javascript">
		var currentYear = <%=currentYear%>;
		var currentMonth = <%=currentMonth%>;
		var currentMonthName = '<%=MonthName(currentMonth)%>';
		var nowYear = <%=Year(now())%>;
		var nowMonth = <%=Month(now())%>;
		var HarvestID = <%=Session("ha_AccountID")%>;
	</script>
