<div class="col-lg-6 col-md-9 content">
	<h2>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Renew Online
	</h2>
<% 

    Dim oID, oSup
sqlDebug = False  
sqlConnectionString = "driver=SQL Server; server=66.119.50.228,7843; uid=davewj2o; pwd=get2it; database=ha_prod"
Set rs = Sql("exec ha_prod.dbo.z2t_Web_RenewalOnline_orders " & Session("ha_AccountID"))
%>


<% 
If rs.EOF Then
%>
	<p>
	Your subscription is paid and not due at this time. Please check the <a href="/my-account">Account Information</a> page for expiration dates or call (866) 492-8494 for early renewal options.
	</p>
<%
End If


do while not rs.eof 

   oID = rs("OrderID")
    for i=1 to len(oID)
        oSup = oSup + (asc(mid(oID,i,1)) * i)
    next

%>

<tr style="height:25px;vertical-align:bottom">

<td align="left">
<a style="display:inline-block !important" 
class="button" href="javascript:window.open('<%=PathWebsite%>Includes/OnlineInvoice/boOrderView.asp?OrderID=<%=rs("OrderID")%>&oSup=<%=oSup%>','',
'scrollbars=yes,height=650,width=750,left=25,top=25');void(0)">View</a>
</td>

<td>

<%
Set rs1 = Sql("SELECT * " & _
"FROM [ha_prod].[dbo].[ni_OrderDetails] " & _
"WHERE [OrderID] = " & rs("OrderID") & " " &  _
"AND ([ItemID] < 500 OR ([ItemID] > 799 AND [ItemID] < 900)) " & _
"AND [DeletedDate] IS NULL " & _
"ORDER BY [OrderID] desc")


If rs1.eof then
%>

No Details for this Order

<% Else %>

<FONT FACE="arial">
<%=rs1("Description")%>
</FONT>

<% End If %>
<br /><br />
</td>
</tr>
<%
rs.MoveNext
Loop
Set rs = Nothing
%>
<div class="entry downloads" style="white-space: nowrap;">
</div>

<%
Function iif(test, consequent, alternative)
   If test = True Then iif = consequent Else iif = Alternative
End Function


Function ifNull(value, default)
  If value = "" Then ifNull = default Else ifNull = value
End Function
%>
</div>