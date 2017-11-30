<div id="useful-links" class="box">
  <h2 class="title">Usage History</h2>
  <div class="content">
    <ul>
      <%If Session("z2t_loggedin") = "True" Then%>
      <li style="text-align: left;">Lookups for your subscription:</li>
      <%Else %>
      <li style="text-align: left;">Lookups for this IP address:</li>
      <%End If %>
      <li style="text-align: center;">
      <%=Session("z2t_UserLookupsDaily")%>&nbsp;today,&nbsp;<%=Session("z2t_UserLookupsTotal")%>&nbsp;total.
      </li>
    </ul>
  </div>
</div>
