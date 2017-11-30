<%
	If Session("z2t_DebugData") = 1 Then
%>

	<div class="NoPrint">
		<div class="col-lg-8 col-lg-offset-2 center">


	<table width="800" Border="0" Cellspacing="2" Cellpadding="2">
		<tr>
			<td>
				&nbsp;  <!--Just wanted to move this down-->
			</td>
		</tr>
	</table>
	
	<table width="800" Border="1" Cellspacing="2" Cellpadding="2">
		<tr>
			<td width="100%" colspan="2" align="Center"><b>Debug Window</b> (Only appears if you have the Debug Option turned on.)</td>
		</tr>
		
		<tr>
			<td>Server Name:</td>
			<td><%=Request.ServerVariables("LOCAL_ADDR")%></td>
		</tr>
		<tr>
			<td>Database String:</td>
			<td><%=connStrPublic%></td>
		</tr>
		<tr>
			<td>Session("ha_AccountID"):</td>
			<td><%=Session("ha_AccountID")%></td>
		</tr>
		<tr>
			<td>Session("z2t_DisplayName"):</td>
			<td><%=Session("z2t_DisplayName")%></td>
		</tr>
		<tr>
			<td>Session("z2t_UserName"):</td>
			<td><%=Session("z2t_UserName")%></td>
		</tr>
		<tr>
			<td>Session("z2t_Password"):</td>
			<td><%=Session("z2t_Password")%></td>
		</tr>
		<tr>
			<td>Session("z2t_LoggedIn"):</td>
			<td><%=Session("z2t_LoggedIn")%></td>
		</tr>
		<tr>
			<td>Session("sSubscriptionData"):</td>
			<td><%=Session("sSubscriptionData")%></td>
		</tr>
		<tr>
			<td>Session("z2t_DebugData"):</td>
			<td><%=Session("z2t_DebugData")%></td>
		</tr>
		<tr>
			<td>Session("activePage"):</td>
			<td><%=Session("activePage")%></td>
		</tr>
		<tr>
			<td>Session("currentPage"):</td>
			<td><%=Session("currentPage")%></td>
		</tr>
		<tr>
			<td>Session("currentPagePath"):</td>
			<td><%=Session("currentPagePath")%></td>
		</tr>
		<tr>
			<td>Session.Contents.Count:</td>
			<td><%=Session.Contents.Count%></td>
		</tr>
		<tr>
			<td>Session("DaveChecking"):</td>
			<td><%=Session("HumairBotHashDecr123")%>123</td>
		</tr>
		<tr>
			<td>User Agent Hash:</td>
			<td><%=Session("UserAgentHash")%></td>
		</tr>
		<tr>
			<td>Cookie: Z2Tv25</td>
			<td><%=Request.Cookies("Z2Tv25")%></td>
		</tr>
		<tr>
			<td>Cookie: Zip2Tax</td>
			<td><%=Request.Cookies("Zip2Tax")%></td>
		</tr>
		<tr>
			<td>Session("z2t_TrackingID"):</td>
			<td><%=Session("z2t_TrackingID")%></td>
		</tr>
		<tr>
			<td>Tracking Information:</td>
			<td><%=Session("Tracking")%></td>
		</tr>
		<tr>
			<td>SessionID:</td>
			<td><%=Session.SessionID%></td>
		</tr>
		<tr>
			<td>Clear Session:</td>
			<td><a href="/index.asp?Abandon=Yes">Click Here</a></td>
		</tr>
	</table>
	
		</div>
	</div>
	
	
<%
	End If
%>
