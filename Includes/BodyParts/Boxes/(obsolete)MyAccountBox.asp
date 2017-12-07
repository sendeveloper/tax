<!-- START MY ACCOUNT BOX -->
<div class="side-menu">
  <div class="centering alt-title"><img src="/Website/images/my_account.png" alt="My Account"></div>
  
<%
  Dim menu: menu = Array( _
	  Array("Account Information", "/Website/pagesAccount/z2t_account.asp"), _
	  Array( _
	    Array("Online Lookup Usage", "/Website/pagesAccount/z2t_account_LookupUsage.asp"), _
        Array("Tax Table Downloads", "/Website/pagesAccount/z2t_account_TableDownloads.asp"), _
     Array("Renew Online", "/Website/pagesAccount/z2t_account_RenewalInvoice.asp"), _
     Array("Downloadable Badges", "/Website/pagesAccount/z2t_badges.asp")))
      
      


	  'Array("Renew my subscription", ""), _
	  'Array("Change password", ""), _
	  'Array("Settings", "")

%>

<ul>
<%
  recurseList "listify", menu
%>
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

</div><!-- side-menu -->
<!-- END MY ACCOUNT BOX -->