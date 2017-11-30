<%
	Dim dDate     ' Date we're displaying calendar for
	Dim iDIM      ' Days In Month
	Dim iDOW      ' Day Of Week that month starts on
	Dim iCurrent  ' Variable we use to hold current day of month as we write table
	Dim iPosition ' Variable we use to hold current position in table

	If IsDate(Request.QueryString("date")) Then
		dDate = CDate(Request.QueryString("date"))
	Else
		If IsDate(Request.QueryString("month") & "-01-" & Request.QueryString("year")) Then
			dDate = CDate(Request.QueryString("month") & "-01-" & Request.QueryString("year"))
		Else
			dDate = Date()

			If Request.QueryString.Count <> 0 Then
				Response.Write "The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>"
				Response.Write  Request.QueryString("month") & "<br><br>"
			End If
		End If
	End If

	iDIM = GetDaysInMonth(Month(dDate), Year(dDate))
	iDOW = GetWeekdayMonthStartsOn(Month(dDate), Year(dDate))
	
	
	Set rs = server.createObject("ADODB.Recordset")
	
	'Open table
	set connWebReporting=server.CreateObject("ADODB.Connection") 
 	connWebReporting.Open "driver=SQL Server;server=208.88.49.22,8543;uid=davewj2o;pwd=get2it;database=z2t_Backoffice" ' philly05

	If isnull(Request("HarvestID")) or Request("HarvestID") = "" Then
		Response.Write "Invalid customer ID<br><br>"
		Response.End
	Else
		SQL = "z2t_Activity_Lookup_Counts_month(" & Year(dDate) & ", " & Month(dDate) & ", " & Request("HarvestID") & ")"
		rs.Open SQL, connWebReporting, 3, 3, 4
	End If

%>
  
<table class="table table-hover table-condensed">	
	
	<tr style="background-color: #DDD; font-weight: bold; text-align: center; height: 30px;">
		<td width="14%" style="border: 1px solid #898989;">S<div class="hidden-xs" style="display:inline">unday</div></td>
		<td width="14%" style="border: 1px solid #898989;">M<div class="hidden-xs" style="display:inline">onday</div></td>
		<td width="14%" style="border: 1px solid #898989;">T<div class="hidden-xs" style="display:inline">uesday</div></td>
		<td width="15%" style="border: 1px solid #898989;">W<div class="hidden-xs" style="display:inline">ednesday</div></td>
		<td width="15%" style="border: 1px solid #898989;">T<div class="hidden-xs" style="display:inline">hursday</div></td>
		<td width="14%" style="border: 1px solid #898989;">F<div class="hidden-xs" style="display:inline">riday</div></td>
		<td width="14%" style="border: 1px solid #898989;">S<div class="hidden-xs" style="display:inline">aturday</div></td>
	</tr>
	
<%
	'Blanks at start of month
	If iDOW <> 1 Then
		Response.Write(vbTab & "<tr>" & vbCrLf)
		iPosition = 1
		Do While iPosition < iDOW
			Response.Write(vbTab & vbTab & "<td style='background-color: #DDD;'>&nbsp;</td>" & vbCrLf)
			iPosition = iPosition + 1
		Loop
	End If

	'-- Write days of month in proper day slots --

	iCurrent = 1
	iPosition = iDOW

	Do While iCurrent <= iDIM

		'-- open the table row --
		If iPosition = 1 Then
			Response.Write(vbTab & "<tr bgcolor='white'>" & vbCrLf)
		End If
		
		If rs.EOF Then 
			HitCount= 0 
		Else
			HitCount = rs("StatDay" & cstr(iCurrent))
		End If
	
%>

		<!-- Day contents -->
		<td style="border: 1px solid #898989;">
			<div style="text-align: left; padding: 1px; font-size: 14pt; font-weight: bold;"><%=iCurrent%></div>
			<div class="clearfix"></div>
			<div class="text-right">
			<div style="text-align: right; font-size: 10pt;">
				<a href="javascript:clickDay(<%=iCurrent%>, <%=HitCount%>);" style="color: red; font-weight: bold;"><%=HitCount%></a>
			</div>
		</td>

<%		

		'-- Close the table row --
		If iPosition = 7 Then
			Response.Write vbTab & "</tr>" & vbCrLf
			iPosition = 0
		End If

		
		'-- Increment variables --
		iCurrent = iCurrent + 1
		iPosition = iPosition + 1
	Loop

	'Blanks at end of month
	If iPosition <> 1 Then
		Do While iPosition <= 7
			Response.Write(vbTab & vbTab & "<td style='background-color: #DDD;'>&nbsp;</td>" & vbCrLf)
			iPosition = iPosition + 1
		Loop
		Response.Write vbTab & "</TR>" & vbCrLf
	End If
%>

</table>

<table cellspacing="0" cellpadding="0">	
  <tr>
    <td align="right">
    
	  TL: <% 
	  	
		If rs.EOF Then 
			response.Write(0 )
		Else
			response.Write(rs("StatMonthTotal"))
		End If
		
	  	
	  
	  %>
	</td>
  </tr>
</table>

  </div><!-- centered1 -->
</div>

<%
	Function GetDaysInMonth(iMonth, iYear)
		Select Case iMonth
			Case 1, 3, 5, 7, 8, 10, 12
				GetDaysInMonth = 31
			Case 4, 6, 9, 11
				GetDaysInMonth = 30
			Case 2
				If IsDate("February 29, " & iYear) Then
					GetDaysInMonth = 29
				Else
					GetDaysInMonth = 28
				End If
		End Select
	End Function

	Function GetWeekdayMonthStartsOn(iMonth, iYear)
		GetWeekdayMonthStartsOn = WeekDay(CDate(iMonth & "/1/" & iYear))
	End Function
%>
