<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include file="ha/config.asp"-->
<!--#include file="ha/connection.asp"-->
<!--#include file="ha/functions.asp"-->

<%
    Dim strColor
    Dim LineCount
    Dim s, o
    Dim oID, oSup
    dim strHeading

dim oSupRequest 

oSupRequest = Request("oSup") 
    strHeading = "Order View"
    Session("CurrentPage") = "boOrderView.asp"    

    'IF session("loggedin")<>"True" OR isNULL(session("loggedin")) THEN
	'Response.Redirect "bologin.asp"
    'END IF

    If Request("OrderID")="" or isnull(Request("OrderID")) then
	If Session("OrderID")="" or isnull(Session("OrderID")) then
	    Response.Redirect "boAccountView.asp"
	end if
    Else
	Session("OrderID")=Request("OrderID")
    End If
	
	

    Session("oMode")="null"
	'response.Write("<br>OrderID")
	'response.Write(Session("OrderID"))

    oID = Session("OrderID")
    for i=1 to len(oID)
        oSup = oSup + (asc(mid(oID,i,1)) * i)
    next
'response.Write(oSup)
'response.Write("oSup Request: "&  trim(oSupRequest) &", oSup Calculated: "&oSup )
'response.End()   
	
'response.Write("<br>oMode="	+ Request("oMode"))
'response.Write("<br>")
if cint(oSupRequest) =  cint(oSup)  then

    If Request("oMode")="Ship" then
        SQL = "ni_Orders_Pull_ShipTo_From_BillTo(" & Session("OrderID") & ")"
        set rs = objcon.Execute(sql)
	Response.Redirect "boOrderView.asp"
    End If


    If Request("oMode")="Up" then
	'Going to move an order detail up 1 line
	SQL="SELECT [OrderID], [OrderSeq] " & _
	    "FROM ni_OrderDetails " & _
	    "WHERE [ODID] = " & Request("ODID")
	set RS=server.createObject("ADODB.Recordset")
	RS.open SQL,objcon,2,3

	if not rs.EOF then
	    'First find the order and sequence
	    o = rs("OrderID")
	    s = rs("OrderSeq")
	    rs.close

	    'Go to the order before and change sequence
	    SQL="SELECT [OrderID], [OrderSeq] " & _
	        "FROM ni_OrderDetails " & _
	        "WHERE [OrderID] = " & o & " " & _
	        "AND [OrderSeq] = " & s - 1
	    RS.open SQL,objcon,1,3
	    if not rs.EOF then
	        rs("OrderSeq") = s
	        rs.update
	    End If
	    rs.close

	    'Go back to the original detail and change sequence
	    SQL="SELECT [OrderID], [OrderSeq] " & _
		"FROM ni_OrderDetails " & _
		"WHERE [ODID] = " & Request("ODID")
	    RS.open SQL,objcon,2,3
	    if not rs.EOF then
	        rs("OrderSeq") = s - 1
	        rs.update
	    End If
        End if

        rs.close
        set rs = nothing
	Response.Redirect "boOrderView.asp"
    End If

    If Request("oMode")="Down" then
	'Going to move an order detail down 1 line
	SQL="SELECT [OrderID], [OrderSeq] " & _
	    "FROM ni_OrderDetails " & _
	    "WHERE [ODID] = " & Request("ODID")
	set RS=server.createObject("ADODB.Recordset")
	RS.open SQL,objcon,2,3

	if not rs.EOF then
	    'First find the order and sequence
	    o = rs("OrderID")
	    s = rs("OrderSeq")
	    rs.close

	    'Go to the order after and change sequence
	    SQL="SELECT [OrderID], [OrderSeq] " & _
	        "FROM ni_OrderDetails " & _
	        "WHERE [OrderID] = " & o & " " & _
	        "AND [OrderSeq] = " & s + 1
	    RS.open SQL,objcon,1,3
	    if not rs.EOF then
	        rs("OrderSeq") = s
	        rs.update
	    End If
	    rs.close

	    'Go back to the original detail and change sequence
	    SQL="SELECT [OrderID], [OrderSeq] " & _
		"FROM ni_OrderDetails " & _
		"WHERE [ODID] = " & Request("ODID")
	    RS.open SQL,objcon,2,3
	    if not rs.EOF then
	        rs("OrderSeq") = s + 1
	        rs.update
	    End If
        End if

        rs.close
        set rs = nothing
	Response.Redirect "boOrderView.asp"
    End If

'    If Request("oMode")="BusinessChange" then
'        SQL = "ni_Order_Business_Change(" & Session("OrderID") & ", '" & Request("busName") & "')"
'        objcon.Execute(sql)
'        Response.Redirect "boOrderView.asp"
'    End If

'    If Request("oMode")="ToggleBusiness" then
'        SQL = "ni_Order_ToggleBusiness(" & Session("OrderID") & ")"
'        objcon.Execute(sql)
'	Response.Redirect "boOrderView.asp"
'    End If

    function setDescription(d)
      d = d & " "
      If Not IsNull(rs("Version")) then
	d = d & "Ver " & rs("Version") & " "
      End If
      If Not IsNull(rs("CCNumber")) then
	d = d & rs("CCNumber") & " "
      End If
      If Not IsNull(rs("CCExpiration")) then
        if trim(rs("CCExpiration")) <> "" then
	  d = d & "x-" & rs("CCExpiration")
        end if
      End If
      If Not IsNull(rs("ShipVia")) then
	d = d & "Via " & rs("ShipVia") & " "
      End If
      setDescription = d
    end function
%>

<html>
<head>
    <title>Number-it Order View</title>

    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <link href="../includes/style.css" type="text/css" rel="stylesheet">
    <link href="includes/BackOffice.css" type="text/css" rel="stylesheet">
    <!--[if IE]>
    <link href="includes/BackOfficeFixIE.css" type="text/css" rel="stylesheet">
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="includes/flexdropdown.css">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

    <script type="text/javascript" src="includes/flexdropdown.js"></script>

    <script language="JavaScript" src="includes/ni_bo_functions.js"
        type="text/javascript"></script>

    <link href="../Includes/z2t_screen.css" type="text/css" rel="stylesheet" media="print">

    <style>
    input.button {
    background-color: red;
    border-color: #C0C0C0 black black #C0C0C0;
    border-style: solid;
    border-width: 2px;
    color: #FFFFFF;
    display: block;
    font-family: Verdana,Arial,Helvetica,sans-serif;
    font-size: 10px;
    font-weight: bold;
    padding: 1px 2px;
    text-align: center;
    text-decoration: none;
    width: 85px;
}
    input.button:hover {
    background-color: red;
    border-color: black #C0C0C0 #C0C0C0 black;
    color: #C0C0C0;
    font-family: Verdana,Arial,Helvetica,sans-serif;
    font-size: 10px;
    font-weight: bold;
}
    </style>

     


<script language='JavaScript'>

    function clickDetailDelete(odid)
        {
        var URL = 'boOrderDetailDelete.asp' +
            '?ODID=' + odid;
        openPopUp(URL);
        }

    function clickDetailEdit(odid, odType)
        {
        var URL = 'boOrderDetailEdit.asp' +
            '?ODID=' + odid +
            '&odType=' + odType
            <% If Request("mock") Then Response.Write("+ '&mock=true'") %>;
        openPopUp(URL);
        }
		
    function clickStatusChange(OrderID, Status)
        {
        var URL = 'boOrderStatusChange.asp' +
            '?OrderID=' + OrderID +
            '&Status=' + Status;
        openPopUp(URL);
        }

</script>

</head>

<body class="gray">

<table align="center" cellspacing="0" cellpadding="0" class="MainBody">

        <tr>
            <td>
                <div style="width: 500px; float: left;padding: 15px 0 0 0;">
                <img src="images/logo-header.png" alt="Zip2Tax Logo"
                 Title="Zip2Tax, LLC Tax Data Providers">
                </div>
            </td>
            <td align="right">
                <FONT FACE="arial">
                <b>Zip2Tax, LLC</b><br />
                1740H Dell Range Blvd #449<br />
                Cheyenne, WY 82009<br /><br />
                <b><FONT SIZE="4">1-866-492-8494</FONT></b>
                </FONT>
            </td>
        </tr>

        <tr>
            <td>
                <hr style="height:3px;color:black;background-color:black"/>
            </td>
            <td>
                <hr style="height:3px;color:black;background-color:black"/>
            </td>
        </tr>
        
        <tr>
            <td align="center" colspan="2">
                <b><FONT FACE="arial" SIZE="5">Subscription Renewal Invoice</FONT></b>
            </td>
        </tr>
        
  
        <tr>
          <td>

            <table width="100%" border="0" cellspacing="0" cellpadding="2" 
		align="left" BorderColor="White">
	<%
	    SQL="SELECT *, o.Status as OrderStatus " & _
		"FROM ni_Orders o " & _
		"LEFT JOIN ni_Accounts a " & _
		"ON a.[AccountID]=o.[AccountID] " & _
		"WHERE o.[OrderID] = " & Session("OrderID")

	    set RS=server.createObject("ADODB.Recordset")
	    RS.open SQL,objcon,2,3

	    if RS.EOF then
	%>

		<tr>
		  <td colspan="4">
		    <CENTER>No orders on file with those specifications</CENTER>
		  </td>
		</tr>
	
    	<%
	    else
	%>
		
	        
            <tr>
            
                <td Align="Left">
                    <br />
                    <FONT FACE="arial">
				      Account # </a>
                    </FONT>
		        </td>
                <td>
                    <br />
                    <FONT FACE="arial">
				        <%=rs("AccountID")%>  
                    </FONT>
                </td>
            </tr>
		<tr>
		  <td Align="Left" width="20%">
              <FONT FACE="arial">
		        Bill To:
              </FONT>
		  </td>
		  <td>
              <FONT FACE="arial">
		        <%=rs("FirstName")%>&#32;
		        <%=rs("MiddleName")%>&#32;
		        <%=rs("LastName")%>
              </FONT>
		  </td>
		 </tr>

		<tr>
		  <td Align="Right">
		   <!-- Organization:-->
		  </td>
		  <td>
            <FONT FACE="arial">
		        <%=rs("Organization")%>
            </FONT>
		  </td>
		</tr>

		<tr>
		  <td Align="Right">
		   <!-- Address:-->
		  </td>
		  <td>
            <FONT FACE="arial">
		        <%=rs("AddressLine1")%>
            </FONT>
		  </td>
		</tr>

		<tr>
		  <td Align="Right">&nbsp;
		    
		  </td>
		  <td>
              <FONT FACE="arial">
		        <%=rs("AddressLine2")%>
              </FONT>
		  </td>
		</tr>

		<tr>
		  <td Align="Right">&nbsp;
		    
		  </td>
		  <td>
            <FONT FACE="arial">
		        <%=rs("City")%>,
		        <%=rs("State")%>&#32;
		        <%=rs("PostalCode")%>
            </FONT>
		  </td>
		 </tr>

		<tr>
		  <td Align="Right">
		    <!--Country:-->
		  </td>
		  <td>
            <FONT FACE="arial">
		        <%=rs("Country")%>
            </FONT>
		  </td>
		</tr>

	    </table>
	  </td>
	</tr>

    <tr>
        <td>
            <br /><br /><br />
            <hr />
        </td>
        <td>
            <br /><br /><br />
            <hr />
        </td>
    </tr>

		<tr>
		  <td colspan="2">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
				<td Width="25%" class="TopGrayLine">
                    <FONT FACE="arial">
				      Our Order # 
                    </FONT>
				</td>
                <td Width="25%">
                    <FONT FACE="arial">
                        <%=rs("OrderID")%>
                    </FONT>
                </td>
                <td width="25%">
                    <FONT FACE="arial">
                        Phone:
                    </FONT>
                </td>
                    <% SQL = "select * from [ha_prod].[dbo].[ni_Accounts] where AccountID=" & rs("AccountID")
                    set rs1 = objcon.Execute(SQL)
                    %>
                <td Width="25%">
                    <FONT FACE="arial">
                        <%=rs1("WorkPhone")%>
                     </FONT>
                </td>
		      </tr>
              <tr>
		        <td Width="25%" class="TopGrayLine">
                  <FONT FACE="arial">
		            Purchase Order # 
                  </FONT>
		        </td>
                <td Width="25%">
                    <FONT FACE="arial">
                        <%=rs("CustomerPurchaseOrder")%> 
                    </FONT>
                </td>
                <td width="25%">
                    <FONT FACE="arial">
                        Email:
                    </FONT>
                </td>

                    <% SQL = "select * from [ha_prod].[dbo].[ni_Accounts] where AccountID=" & rs("AccountID")
                    set rs1 = objcon.Execute(SQL)
                    %>

                <td width="25%">
                     <FONT FACE="arial">
                        <%=rs1("Email")%>
                     </FONT>
                </td>
		      </tr>
		    </table>
		  </td>
		</tr>			
        	

	<%
	    end if		    
	    rs.close
	    set rs = nothing
	%>
    
    <tr>
        <td>
            <br />
        </td>
        <td>
            <br />
        </td>
    </tr>

	<tr>
	  <td colspan="2">

            <table width="100%" border="1" cellspacing="0" cellpadding="2" 
		align="left" BorderColor="Black">

	        <tr>
		  <th width="8%" Class="sectionSubHead">
            <FONT FACE="arial">
		        Quantity
            </FONT>
		  </th>
		  <th width="50%" Class="sectionSubHead">
            <FONT FACE="arial">
		        Description
            </FONT>
		  </th>
		  <th width="12%" Class="sectionSubHead">
            <FONT FACE="arial">
		        Each
            </FONT>
		  </th>
		  <th width="12%" Class="sectionSubHead">
            <FONT FACE="arial">
		        Price
            </FONT>
		  </th>
		<tr>

	<%
	    'Sale or Debit----------------------------------------------------------
	    SQL="SELECT * " & _
		"FROM ni_OrderDetails " & _
		"WHERE [OrderID] = " & Session("OrderID") & " " &  _
		"AND ([ItemID] < 500 OR ([ItemID] > 799 AND [ItemID] < 900)) " & _
		"AND [DeletedDate] IS NULL " & _
		"ORDER BY [OrderSeq]"

	    set RS=server.createObject("ADODB.Recordset")
	    RS.open SQL,objcon,2,3

	    if RS.EOF then
	%>

		<tr>
		  <td colspan="5">
            <FONT FACE="arial">
		        <CENTER>No details for this order</CENTER>
            </FONT>
		  </td>
		</tr>
	
    	<%
	    else
		do while not rs.eof
		    CurrentODID = "ODID=" & rs("ODID")
		    LineCount = LineCount + 1
		    If LineCount Mod 3 = 0 then
			strColor = "#C8FFC8"
		    Else
			strColor = "#FFFFFF"
		    End If

                    dextra=trim(rs("DescriptionExtra") & "")
	%>
		
		<tr bgcolor=<%=strColor%>>
		  <td Align="Center">
              <FONT FACE="arial">
		        <%q=iif(isnull(rs("Quantity")),0,rs("Quantity"))%>
		        <%qq=iif(q = 0, "",cStr(q))%>
		        <%=qq%>
              </FONT>
		  </td>
		  <td>
            <FONT FACE="arial">
		        <%=setDescription(trim(rs("Description")))%>
            </FONT>
		  </td>
	
		<%
		    'Calculate price
		    e = iif(isnull(rs("PriceEach")),0,rs("PriceEach"))
		    If rs("ItemID") > 399 and rs("ItemID") < 500 then
			cType = 1
			p = e
			e = 0
		    ElseIf rs("ItemID") => 800 then
			cType = 8
			p = e
			e = 0
		    Else
			cType = 1
			p = e * q
		    End If
		    t = t + p		
		%>

		  <td Align="Right">
              <FONT FACE="arial">
		        <%=iif(e = 0,"",FormatCurrency(e,2,-1,0,-1))%>
              </FONT>
		  </td>
		  <td Align="Right">
              <FONT FACE="arial">
		        <%=iif(p = 0,"",FormatCurrency(p,2,-1,0,-1))%>
              </FONT>
		  </td>
		  <!--<td>-->
      

	<%
		'If LineCount<>1 then
	%>
	
		<!-- <FONT FACE="arial">
		    <a href="boOrderView-jo1.asp?oMode=Up&<%=CurrentODID%>">
		      <Font Size="1">Up</Font></a>-->

	<%
		'End If
		rs.movenext
		'If not rs.eof then
	%>

		    <!--<a href="boOrderView-jo1.asp?oMode=Down&<%=CurrentODID%>">
		       <Font Size="1">Dwn</Font></a>
         </FONT>-->
		 <!-- </td>-->
		</tr>

	<%
	    	'End If

                    'Place extra line
                    if dextra > "" then
%>

                <tr>
                  <td>&nbsp;</td>
                  <td style="padding-left: 30px;">
                    <FONT FACE="arial">
                        (<%=dextra%>)
                    </FONT>
                  </td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <!--<td>&nbsp;</td>-->
                </tr>

<%
                    end if
		Loop
	    End If		    
	    rs.close


	    'Sales Tax----------------------------------------------------------
	    SQL="SELECT * " & _
		"FROM ni_OrderDetails " & _
		"WHERE [OrderID] = " & Session("OrderID") & " " &  _
		"AND [ItemID] > 499 AND [ItemID] < 800 " & _
		"AND [DeletedDate] IS NULL " & _
		"ORDER BY [OrderSeq]"

	    set RS=server.createObject("ADODB.Recordset")
	    RS.open SQL,objcon,2,3

	    If Not RS.EOF then
		do while not rs.eof
	%>
		
		<tr>
		  <td colspan="2">&nbsp;
		    
		  </td>
		  <td Class="sectionSubHeadRight">
              <FONT FACE="arial">
		        Subtotal:
              </FONT>
		  </td>
		  <td Class="sectionSubHeadRight" align="right">
            <FONT FACE="arial">
		        <%=FormatCurrency(t,2,-1,0,-1)%>
            </FONT>
		  </td>
		</tr>

		<tr>
		  <td>&nbsp;</td>

		  <td>
            <FONT FACE="arial">
		        <%=setDescription(rs("Description"))%>
            </FONT>
		  </td>

		  <td>&nbsp;</td>

		  <td Align="Right">
            <FONT FACE="arial">
		        <%p = iif(isnull(rs("PriceEach")),0,rs("PriceEach"))%>
		        <%t = t + p%>
		        <%=iif(p = 0,"",FormatCurrency(p,2,-1,0,-1))%>
            </FONT>
		  </td>

		  <!--<td> 
		  </td>-->
		</tr>

	<%
                    rs.movenext
                Loop
	    End If
	    rs.close
	%>

		<tr>
		  <td colspan="2">&nbsp;
		    
		  </td>
		  <td Class="sectionSubHeadRight">
            <FONT FACE="arial">
		        Total:
            </FONT>
		  </td>
		  <td Class="sectionSubHeadRight" align="right">
            <FONT FACE="arial">
		        <%=FormatCurrency(t,2,-1,0,-1)%>
            </FONT>
		  </td>
		</tr>

	<%
	    'Payments----------------------------------------------------------
	    SQL="SELECT * " & _
		"FROM ni_OrderDetails " & _
		"WHERE [OrderID] = " & Session("OrderID") & " " &  _
		"AND [ItemID] > 899 " & _
		"AND [DeletedDate] IS NULL " & _
		"ORDER BY [OrderSeq]"

	    set RS=server.createObject("ADODB.Recordset")
	    RS.open SQL,objcon,2,3

	    if Not RS.EOF then
		LineCount = 0
		do while not rs.eof
		    CurrentODID = "ODID=" & rs("ODID")
		    LineCount = LineCount + 1
	%>
		
		<tr>
		  <td>&nbsp;</td>

		  <td>
            <FONT FACE="arial">
		        <%=setDescription(rs("Description"))%>
            </FONT>
		  </td>
	
		  <td>&nbsp;</td>

		  <td Align="Right">
            <FONT FACE="arial">
		        <%p = iif(isnull(rs("PriceEach")),0,rs("PriceEach"))%>
		        <%=iif(p = 0,"",FormatCurrency(p,2,-1,0,-1))%>
		        <%
                          t = t + p
                          Session("oTotal") = t
                        %>
            </FONT>
		  </td>

		 <!-- <td>
            <FONT FACE="arial">   -->      

	<%
		'If LineCount<>1 then
	%>
			
		    <!--<a href="boOrderView-jo1.asp?oMode=Up&<%=CurrentODID%>">
		      <Font Size="1">Up</Font></a>-->

	<%
		'End If
		rs.movenext
		'If not rs.eof then
	%>

		    <!--<a href="boOrderView-jo1.asp?oMode=Down&<%=CurrentODID%>">
		      <Font Size="1">Dwn</Font></a>
            </FONT>-->
		  <!--</td>-->
		</tr>

	<%
	    	'End If
		Loop
	%>

		<tr>
		  <td colspan="2">&nbsp;
		    
		  </td>
		  <td Class="sectionSubHeadRight">
            <FONT FACE="arial">
		        Balance:
            </FONT>
		  </td>
		  <td Class="sectionSubHeadRight" align="right">
            <FONT FACE="arial">
		        <%=FormatCurrency(t,2,-1,0,-1)%>
            </FONT>
		  </td>
		</tr>

	<%
	    End If		    
	    rs.close
	%>

	    </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>


<%
	    SQL="SELECT *, o.Status as OrderStatus " & _
		"FROM ni_Orders o " & _
		"LEFT JOIN ni_Accounts a " & _
		"ON a.[AccountID]=o.[AccountID] " & _
		"WHERE o.[OrderID] = " & Session("OrderID")

        set rs2 = objcon.Execute(SQL)
		
		SQL = "select * from [ha_prod].[dbo].[ni_Accounts] where AccountID=" & rs2("AccountID")
		set rs3 = objcon.Execute(SQL)
		
		Dim order
		order = Session("OrderID")
		
		Dim stamp
		Dim time
		stamp = Now
		time = FormatDateTime(Now)
		
		Dim php_url
	'CreditCardProcessing is defined in config.asp in order to identify test and production credit card processing
if CreditCardProcessing = "CCProd" then
	php_url =  CyberSourceBasePath & "Website/Includes/OnlineInvoice/CyberSourceProduction.php?amount=" & t & "&ref_num=" & Session("OrderID") & _
		"&fName=" & rs2("FirstName") & "&lName=" & rs2("LastName") & "&addr=" & rs2("AddressLine1")  & "&city=" & rs2("City") & _
		"&zip=" & rs2("PostalCode") & "&email=" & rs3("Email")
 Else
 	php_url =  CyberSourceBasePath & "Website/Includes/OnlineInvoice/CyberSourceTest.php?amount=" & t & "&ref_num=" & Session("OrderID") & _
		"&fName=" & rs2("FirstName") & "&lName=" & rs2("LastName") & "&addr=" & rs2("AddressLine1")  & "&city=" & rs2("City") & _
		"&zip=" & rs2("PostalCode") & "&email=" & rs3("Email")
 End If

	%>
	<br />
<center><input class="button" type="submit" value="Pay Now" onClick="location.href='<%=php_url%>'"></center>
</script>
 
<a href="#" onClick="window.open('https://www.entrust.net/customer/profile.cfm?domain=orderpage.ic3.com','_blank','width=550,height=450')">
<img src="images/entrust.jpg" border="0" alt="SSL, SSL Certificates, Secure Sockets Layer" align="right">
                </a>

<%
Else

response.Write("<br/><br/>There is some problem with the URL.<br/> Please contact our representative for resolution of issue. <br/>Sorry for inconvenience.")

end if 

%>
</body>
</html>
