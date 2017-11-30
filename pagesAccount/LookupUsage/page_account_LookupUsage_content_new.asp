<script type="text/javascript">
$(function(){
$.get( "/Website/pagesAccount/LookupUsage/page_account_LookupUsage_content_calendar.asp", { HarvestID: "<%=Session("ha_AccountID")%>", Now: escape(Date()), Year : "<%=currentYear%>", Month: "<%=currentMonth%>" } )
	.done(function( data ) {
		var r = data;
		//snip off total count from response
		var n = r.indexOf('TL:');
		var c = r.substring(n + 3);
		r = r.substring(0, n - 1);
		//$("#AccountInfoBox").empty().append(data);
		$('#spanTotalLookups').empty().append(c + 'Total Lookups');
		$('#LookupUsageBox').empty().append(r);
	});
});
</script>
<div class="col-lg-6 col-md-9 content">
	<h2>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Subscriber Usage
	</h2>
	<div class="clearfix"></div>

	<form method="Post" action="/account-usage" name="frm">
	<input type="hidden" name="Year1" value="SelectYear">
	<input type="hidden" name="Month1" value="SelectMonth">

	<div class="row">
		<div class="col-lg-5">
			Year: <select ID="SelectYear" name="SelectYear" onChange="javascript:frm.submit()">
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
		</div>
		<div class="col-lg-5 text-right" id="spanTotalLookups">
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="row">
		<div class="col-lg-12 text-center">
			<a href="javascript:clickMovePrevious();" class="btn btn-danger">< Previous</a>
			<a href="javascript:clickMoveCurrent();" class="btn btn-danger">Current</a>
			<a href="javascript:clickMoveNext();" class="btn btn-danger">Next   ></a>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 text-center">
			<h2><%=MonthName(currentMonth)%>&nbsp;<%=currentYear%></h2>
		</div>
	</div>
	
	  
	  <div id="LookupUsageBox" class="table-responsive">
		<table width="100%" align="center">
		  <tr valign="top">
		    <td align="center" style="padding-top: 6em;">
			  <img src="/Website/Images/AjaxLoading.gif" alt="Ajax Loasing gif">
			</td>
		  </tr>
		</table>
	  </div>

	</form>
</div>