
<% 
    Dim oID, oSup
  sqlDebug = False  
'  sqlConnectionString = "driver=SQL Server; server=barley1.harvestamerican.net; uid=davewj2o; pwd=get2it; database=ha_prod"
sqlConnectionString = "driver=SQL Server; server=66.119.50.228,7843; uid=davewj2o; pwd=get2it; database=ha_prod"
  'Response.Write(Sql("select @@servername"))
  Set rs = Sql("exec ha_prod.dbo.z2t_Web_RenewalOnline_orders " & Session("ha_AccountID"))
  'SQL = "select * from [ha_prod].[dbo].[ni_Orders] where AccountID=" & Session("ha_AccountID") & "AND Status='Mock' AND DeletedBy IS NULL ORDER BY OrderID desc"
  'set rs = objcon.Execute(SQL)
  

%>

<div id="content" class="account">
    <h1 class="title">Renew Online</h1>

    <div class="entry">

    <% 
      If rs.EOF Then


    %>
      Your subscription is paid and not due at this time. Please check the <a href="z2t_account.asp">Account Information</a> page for expiration dates or call (866) 492-8494 for early renewal options.
    <%
      End If
    
	
    do while not rs.eof


     oID = rs("OrderID")
    for i=1 to len(oID)
        oSup = oSup + (asc(mid(oID,i,1)) * i)
    next
response.write(oSUp)
response.end()
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
     %>

     </div>

    <div class="entry downloads" style="white-space: nowrap;">

    


  
<%
 Set rs = Nothing
%>

      
    </div><!-- entry -->
</div><!-- content -->

<%
Function iif(test, consequent, alternative)
   If test = True Then iif = consequent Else iif = Alternative
End Function


Function ifNull(value, default)
  If value = "" Then ifNull = default Else ifNull = value
End Function
%>
