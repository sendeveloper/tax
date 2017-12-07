<div class="well text-center side-menu">
	<img src="/Website/images/my_account.png" alt="My Account" class="centered">
<%
Dim menu: menu = Array( _
Array("Account Information", "/my-account"), _
Array( _
Array("Online Lookup Usage", "/account-usage"), _
Array("Tax Table Downloads", "/account-table-download"), _
Array("Renew Online", "/account-renew"), _
Array("Downloadable Badges", "/badges")))
%>
	<ul>
	<%recurseList "listify", menu%>
	</ul>

<%
Sub listify(string, link)
  Response.Write("<li" & iif(Session("acctPage") = string, " class=""mSelected""", "") & "><a class=""firstword" & """ href=""" & link & """>" & string & "</a></li>")
End Sub


Sub recurseList(fn, list)
  Dim item: For Each item In list
	  Select Case TypeName(item(1))
	  Case "Variant()"
      recurseList fn, item
    Case "String"
	     Dim l
	     Execute(fn & " item(0), item(1)")
    Case Else
      Response.Write("<li><a>&lt;" & TypeName(item) & "&gt;</a></li>")
	  End Select
  Next
End Sub


Function iif(condition, consequent, alternative)
  If condition Then iif = consequent Else iif = alternative
End Function


%>	
</div>