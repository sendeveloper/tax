<%
Dim accountInfo
Dim subscriptions
Set subscriptions = GetUserSubscriptions(Session("z2t_UserName"))
%>
<script type="text/javascript">
$(function(){
$.get( "/Website/pagesAccount/Account/z2t_Account_Basic_Info_read.asp", { HarvestID: "<%=Session("ha_AccountID")%>", Now: escape(Date()) } )
	.done(function( data ) {
		$("#AccountInfoBox").empty().append(data);
	});
});
</script>
<div class="col-lg-6 col-md-9 content">
	<h2>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Account Information
	</h2>
	
	<div id="AccountInfoBox">
	<table align="center" valign="center">
	  <tr>
		<td>
		  <img src="/Website/Images/AjaxLoading.gif" style="display: block; margin-left: auto; margin-right: auto;">
		</td>
	  </tr>
	</table>
	</div>

	<table class="table table-bordered table-hover">
	<thead>
		<tr><th colspan="2">Services</th></tr>
	</thead>
	<tbody>
	<%
	Dim subscription
	Set subscription = subscriptions.EnumSubscriptions()
	While Not (subscription Is Nothing)

		Response.Write("<tr><td><strong>Type:&nbsp;" & subscription.SubscriptionName & "</strong></td>")
		Response.Write("<td>Expiration Date:&nbsp;" & subscription.ExpirationDate & "</td></tr>")

		If (cWebLookup = subscription.SubscriptionType) Or (cPPWebLookup = subscription.SubscriptionType) Then
			Response.Write("<tr><td colspan=""2"">Add-ons:</td></tr>")
			Dim i
			For i = 0 To cLookupAddonArraySize
				If (True = subscription.HasAddon(i)) Then
					Response.Write("<tr><td>" & subscription.AddonName(i) & "</td>")
					Response.Write("<td>&nbsp;</td></tr>")
				End If
			Next
		End If

		Set subscription = subscriptions.EnumSubscriptions()
	Wend

	Set accountInfo = Nothing
	Set subscriptions = Nothing
	Set subscription = Nothing
	%>	
	</tbody>
	</table>
</div>