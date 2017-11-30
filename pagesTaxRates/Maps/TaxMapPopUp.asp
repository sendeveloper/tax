  <!--#include virtual="/Website/Includes/config.asp"-->	

<%
		TaxMapText = "Tax Map For " & Request("city") & ", " & Request("state") & "<br>"
		TaxMapImage = "<img src='" & pathBase & "Website/pagesTaxRates/Maps/images/" & _
			Request("city") & "_" & Request("state") & ".png'>"
%>

<html>
<head><title>Tax Map PopUp</title>

  <!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	



  <script type="text/javascript" language="javascript">

function SetScreen(w, h)
    {
    window.resizeTo(w, h);
    CenterScreen(w, h);
    }

function CenterScreen(w, h)
    {
    var leftprop, topprop;

    var leftvar = (window.screen.availWidth - w) / 2;
    var rightvar = (window.screen.availHeight - h) / 2;

    if(navigator.appName == "Microsoft Internet Explorer")
        {
        leftprop = leftvar;
        topprop = rightvar;
        }
    else
        {
        leftprop = (leftvar - pageXOffset);
        topprop = (rightvar - pageYOffset);
        }

    window.moveTo(leftprop,topprop);
    }

</script>
</head>

<body onLoad="SetScreen(700, 700);" class="popup">

  <table width="100%" border="0" cellspacing="5" cellpadding="5">
    <tr>
      <td align="left" style="color: red;">
		<%=TaxMapText%>
      </td>
	</tr>
	<tr>
      <td align="center">
		<%=TaxMapImage%>
      </td>
    </tr>
  </table>
  
</body>
</html>
