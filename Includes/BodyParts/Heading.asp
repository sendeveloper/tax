<%
Function DisplayCompanyName()

    Dim loginBox_haAccountInfo

    DisplayCompanyName = "nbsp;"
    
	If Session("z2t_DisplayName") > "" Then
		DisplayCompanyName = Session("z2t_DisplayName")
	Else
		If Session("ha_AccountID") <> 0 Then
			Set loginBox_haAccountInfo = GetHAAccountInfo(Session("ha_AccountID"))
			DisplayCompanyName = loginBox_haAccountInfo.Organization
		End If
	End If
		
End Function
%>
<!-- Start of Heading -->
    <div class="container-fluid">
	<div class="row" id="topArea">
		<div style="width: 100%;" class="topAreaBack">
			<div class="container">
				<div class="col-lg-2 col-md-2 hidden-sm hidden-xs chatDiv">
					<div class="topChatImg" style="margin-top: 20px;">
					<!--#include virtual="/Website/Includes/BodyParts/LiveChat.inc"-->
					</div>
<%
  If Session("z2t_loggedin") = "True" Then
%>
					<div class="hidden-sm userNameDiv" style="float: left; margin-left: 5px;    margin-top: 30px;font-size: 16px;">
						<label style="padding-top: 7px; color: #FFF">Welcome<br/><% Response.Write DisplayCompanyName() %></label>
					</div>
<%
end if
%>
				</div>
				<div class="col-lg-7 col-md-7 col-sm-9 scrollHide text-center">
					<div class="topLogo" style="margin-top:20px; margin-bottom: 40px;"><a href="/"><img src="/website/images/logo_header.png" alt="Zip2Tax.com" class="image-responsive"></a></div>
				</div>
				<div class="col-sm-6 hidden-xs text-center scrollShow" style="display: none;">
					<div class="topLogo" style="margin-top:10px; margin-bottom: 10px;">
						<a href="/"><img src="/website/images/logo_small.png" alt="Zip2Tax.com" class="image-responsive"></a></div>
				</div>
				<div class="col-lg-3 col-md-3 fontWhite18Bold hidden-sm hidden-xs scrollHide">
					<p style="margin: 0 0 10px;">	</p>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;Sales & Use Tax Rates<br>
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;for State, County, City<br>
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;and Special Districts
					</div>
					<p style="margin: 0 0 10px;"> </p>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 fontWhite18Bold phoneDiv" style="display: none;">
					<p style="margin: 0 0 10px;"> </p>
					<div style="border-radius: 25px;
								border: 2px solid #9CE53C;
								padding: 6px 10px;
								width: 200px;
								height: 45px;
								font-size: 17pt;
								margin: auto;">
						<a href="tel:+18664928494" onclick="ga('send', 'event', 'Phone Leads', 'Mobile Interaction', 'Headerclicked');"
							style="color: #98e428;">1-866-492-8494</a>
					</div>
					<p style="margin: 0 0 10px;"> </p>
				</div>
			</div>
		</div>
	</div>
<!-- End of Heading -->	
