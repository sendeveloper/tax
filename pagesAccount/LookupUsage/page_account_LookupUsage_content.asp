
<div id="content" class="account">
  <form method="Post" action="z2t_account_LookupUsage.asp" name="frm">
	<input type="hidden" name="Year1" value="SelectYear">
	<input type="hidden" name="Month1" value="SelectMonth">
	
  <div class="post">
    <h1 class="title">Subscriber Usage</h1>
	
	<div style="margin-left: 40px; width: 600px;">
	
	  <table width="600" border="0" cellspacing="2" cellpadding="2">
	    <tr>
		  <td width="60%">
			Year:
			<select ID="SelectYear" name="SelectYear" onChange="javascript:frm.submit()">
<%
	yearNow = Year(now())
	For i = yearNow to yearNow - 9 Step -1
		iStr = cstr(i)
		If i = currentYear Then Selected=" Selected" Else Selected=""
		
		Response.write "<option value='" & iStr & "'" & Selected & ">" & iStr & "</option>" & vbCrLf
	Next
%>
			</select>&nbsp;&nbsp;
	  	  
			Month:
			<select ID="SelectMonth" name="SelectMonth" onChange="javascript:frm.submit()">
<%
	For i = 1 to 12
		If i = currentMonth Then Selected=" Selected" Else Selected=""
		Response.write "<option value='" & i & "'" & Selected & ">" & MonthName(i) & "</option>" & vbCrLf
	Next
%>
				
			</select>
		  </td>
		  <td width="40%" align="right">
			<span id="spanTotalLookups">&nbsp;</span>
		  </td>
		</tr>
		
		<tr><td>&nbsp;</td></tr>
	  
		<tr>
	      <td colspan="2" align="center">
			<div>
			  <a href="javascript:clickMovePrevious();" class="redButton w80">< Previous</a>
			  <a href="javascript:clickMoveCurrent();" class="redButton w80">Current</a>
			  <a href="javascript:clickMoveNext();" class="redButton w80">Next ></a>
			</div>
		  </td>
		</tr>
  
		<tr><td>&nbsp;</td></tr>
		
		<tr>
		  <td colspan="2" align="center">
			<h2><%=MonthName(currentMonth)%>&nbsp;<%=currentYear%></h2>
		  </td>
		</tr>

	  </table>
	  
	  <div id="LookupUsageBox" style="height: 500px; width: 600px;">
		<table width="100%" align="center">
		  <tr valign="top">
		    <td align="center" style="padding-top: 6em;">
			  <img src="/Website/Images/AjaxLoading.gif" alt="Ajax Loasing gif">
			</td>
		  </tr>
		</table>
	  </div>

	</div>
  
  </div><!-- post -->
  </form>
</div>
