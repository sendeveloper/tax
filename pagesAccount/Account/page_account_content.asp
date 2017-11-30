<%
'
' Page Code
'
    Dim accountInfo
    Dim subscriptions

    Set subscriptions = GetUserSubscriptions(Session("z2t_UserName"))

%>



<div id="content">
  <div class="post">
    <h1 class="title">Account Information</h1>
    <div class="entry">
      
	  <div id="AccountInfoBox" style="height: 200px; width: 500px;">
		<table width="100%" height="100%" align="center" valign="center">
		  <tr>
		    <td>
			  <img src="/Website/Images/AjaxLoading.gif" style="display: block; margin-left: auto; margin-right: auto;">
			</td>
		  </tr>
		</table>
	  </div>
	  
      
      <table width="500" border="0" cellspacing="0" cellpadding="0">
        <col width="50%" /><col width="50%" />
        <tr valign="top">
          <td colspan="2">
              <font color="red"><b>Services:</b></font>
          </td>
        </tr>
          <%
            Dim subscription
            Set subscription = subscriptions.EnumSubscriptions()
            While Not (subscription Is Nothing)

                Response.Write("<tr><td style=""padding-left: 10px;"">Type:&nbsp;" & subscription.SubscriptionName & "</td>")
                Response.Write("<td style=""padding-left: 10px;"">Expiration Date:&nbsp;" & subscription.ExpirationDate & "</td></tr>")

                If (cWebLookup = subscription.SubscriptionType) Or (cPPWebLookup = subscription.SubscriptionType) Then
                    Response.Write("<tr><td style=""padding-left: 30px;"">Add-ons:</td><td>&nbsp;</td></tr>")
                    Dim i
                    For i = 0 To cLookupAddonArraySize
                        If (True = subscription.HasAddon(i)) Then
                            Response.Write("<tr><td style=""padding-left:50px;"">" & subscription.AddonName(i) & "</td>")
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
      </table>
      <p /><p />      
    </div><!-- entry -->
  </div><!-- post -->
</div><!-- content -->
