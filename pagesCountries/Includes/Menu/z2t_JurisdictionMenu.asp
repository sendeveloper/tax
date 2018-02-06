<%
	MenuOrder = UCase(Session("MenuOrder"))
	
	'Parse MenuOrder
	Dim m(10)
	If MenuOrder = "" Then
		mNum = 1
		m(mNum) = "USA"
	Else
		Do
			p=instr(MenuOrder,"|")
			If p > 0 Then
				mNum = mNum + 1
				m(mNum) = Left(MenuOrder,p-1)
				MenuOrder = Mid(MenuOrder,p+1)
			Else
				If MenuOrder <> "" Then
					mNum = mNum + 1
					m(mNum) = MenuOrder
				End If
				Exit Do
			End If
		Loop
	End If
	
%>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> Sales Tax Information
			</h3>
		</div>

<%		
	For i = 1 to mNum
		Select Case m(i)
		Case "CANADA"
%>

		<div class="panel-body Jurisdictions">
			<span class="ToolTip" style="font-weight: bold;">
				<a class="ToolTip" style="color: black; padding-left: 0px;" href="/canada-sales-tax">Canada
					<span class="ToolTipBox">
						Click for Canada<br>Sales and Use Tax Information
					</span></a>
			</span><br>
			
			<div class="divLeft">
				<a class="ToolTip" href="/alberta-sales-tax">Alberta
					<span class="ToolTipBox">
						Click for the Province of Alberta<br>Sales and Use Tax Information
					</span></a><br>
			</div>
			
			<div class="divLeft">
				<a class="ToolTip" href="/british-columbia-sales-tax">British Columbia
					<span class="ToolTipBox">
						Click for the Province of British Columbia<br>Sales and Use Tax Information
					</span></a><br>
			</div>

			<div class="divLeft">
				<a class="ToolTip" href="/new-brunswick-sales-tax">New Brunswick
					<span class="ToolTipBox">
						Click for the Province of New Brunswick<br>Sales and Use Tax Information
					</span></a><br>
			</div>

			<div class="divLeft">
				<a class="ToolTip" href="/newfoundland-labrador-sales-tax">Newfoundland
					<span class="ToolTipBox">
						Click for the Province of Newfoundland Labrador<br>Sales and Use Tax Information
					</span></a><br>
			</div>

			<div class="divLeft">
				<a class="ToolTip" href="/ontario-sales-tax">Ontario
					<span class="ToolTipBox">
						Click for the Province of Ontario<br>Sales and Use Tax Information
					</span></a><br>
			</div>

		</div>
		
<%
		Case "USA"
%>
		
		<div class="panel-body Jurisdictions">
			<span class="ToolTip" style="font-weight: bold;">
				<a class="ToolTip" style="color: black; padding-left: 0px;" href="/sales-tax-by-state">United States
					<span class="ToolTipBox">
						Click for United States<br>Sales and Use Tax Information
					</span></a>
			</span><br>
			
			<div class="divLeft">
				<a class="ToolTip" href="/AL/Alabama-sales-tax">Alabama
					<span class="ToolTipBox">
						Click for State of Alabama<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/AK/Alaska-sales-tax">Alaska
					<span class="ToolTipBox">
						Click for State of Alaska<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/AZ/Arizona-sales-tax">Arizona
					<span class="ToolTipBox">
						Click for State of Arizona<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/AR/Arkansas-sales-tax">Arkansas
					<span class="ToolTipBox">
						Click for State of Arkansas<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/CA/California-sales-tax">California
					<span class="ToolTipBox">
						Click for State of California<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/CO/Colorado-sales-tax">Colorado
					<span class="ToolTipBox">
						Click for State of Colorado<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/CT/Connecticut-sales-tax">Connecticut
					<span class="ToolTipBox">
						Click for State of Connecticut<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/DE/Delaware-sales-tax">Delaware
					<span class="ToolTipBox">
						Click for State of Delaware<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/DC/District-of-Columbia-sales-tax">District of Columbia
					<span class="ToolTipBox">
						Click for District of Columbia<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/FL/Florida-sales-tax">Florida
					<span class="ToolTipBox">
						Click for State of Florida<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/GA/Georgia-sales-tax">Georgia
					<span class="ToolTipBox">
						Click for State of Georgia<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/HI/Hawaii-sales-tax">Hawaii
					<span class="ToolTipBox">
						Click for State of Hawaii<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ID/Idaho-sales-tax">Idaho
					<span class="ToolTipBox">
						Click for State of Idaho<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/IL/Illinois-sales-tax">Illinois
					<span class="ToolTipBox">
						Click for State of Illinois<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/IN/Indiana-sales-tax">Indiana
					<span class="ToolTipBox">
						Click for State of Indiana<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/IA/Iowa-sales-tax">Iowa
					<span class="ToolTipBox">
						Click for State of Iowa<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/KS/Kansas-sales-tax">Kansas
					<span class="ToolTipBox">
						Click for State of Kansas<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/KY/Kentucky-sales-tax">Kentucky
					<span class="ToolTipBox">
						Click for State of Kentucky<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/LA/Louisiana-sales-tax">Louisiana
					<span class="ToolTipBox">
						Click for State of Louisiana<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ME/Maine-sales-tax">Maine
					<span class="ToolTipBox">
						Click for State of Maine<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/MD/Maryland-sales-tax">Maryland
					<span class="ToolTipBox">
						Click for State of Maryland<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/MA/Massachusetts-sales-tax">Massachusetts
					<span class="ToolTipBox">
						Click for State of Massachusetts<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/MI/Michigan-sales-tax">Michigan
					<span class="ToolTipBox">
						Click for State of Michigan<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/MN/Minnesota-sales-tax">Minnesota
					<span class="ToolTipBox">
						Click for State of Minnesota<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/MS/Mississippi-sales-tax">Mississippi
					<span class="ToolTipBox">
						Click for State of Mississippi<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/MO/Missouri-sales-tax">Missouri
					<span class="ToolTipBox">
						Click for State of Missouri<br>Sales and Use Tax Information
					</span></a><br>
			</div>
			
			<div class="divRight">
				<a class="ToolTip" href="/MT/Montana-sales-tax">Montana
					<span class="ToolTipBox">
						Click for State of Montana<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/NE/Nebraska-sales-tax">Nebraska
					<span class="ToolTipBox">
						Click for State of Nebraska<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/NV/Nevada-sales-tax">Nevada
					<span class="ToolTipBox">
						Click for State of Nevada<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/NH/New-Hampshire-sales-tax">New Hampshire
					<span class="ToolTipBox">
						Click for State of New Hampshire<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/NJ/New-Jersey-sales-tax">New Jersey
					<span class="ToolTipBox">
						Click for State of New Jersey<br>Sales and Use Tax Information
					</span></a><br>
				
				<a class="ToolTip" href="/NM/New-Mexico-sales-tax">New Mexico
					<span class="ToolTipBox">
						Click for State of New Mexico<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/NY/New-York-sales-tax">New York
					<span class="ToolTipBox">
						Click for State of New York<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/NC/North-Carolina-sales-tax">North Carolina
					<span class="ToolTipBox">
						Click for State of North Carolina<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/ND/North-Dakota-sales-tax">North Dakota
					<span class="ToolTipBox">
						Click for State of North Dakota<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/OH/Ohio-sales-tax">Ohio
					<span class="ToolTipBox">
						Click for State of Ohio<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/OK/Oklahoma-sales-tax">Oklahoma
					<span class="ToolTipBox">
						Click for State of Oklahoma<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/OR/Oregon-sales-tax">Oregon
					<span class="ToolTipBox">
						Click for State of Oregon<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/PA/Pennsylvania-sales-tax">Pennsylvania
					<span class="ToolTipBox">
						Click for State of Pennsylvania<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/RI/Rhode-Island-sales-tax">Rhode Island
					<span class="ToolTipBox">
						Click for State of Rhode Island<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/SC/South-Carolina-sales-tax">South Carolina
					<span class="ToolTipBox">
						Click for State of South Carolina<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/SD/South-Dakota-sales-tax">South Dakota
					<span class="ToolTipBox">
						Click for State of South Dakota<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/TN/Tennessee-sales-tax">Tennessee
					<span class="ToolTipBox">
						Click for State of Tennessee<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/TX/Texas-sales-tax">Texas
					<span class="ToolTipBox">
						Click for State of Texas<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/UT/Utah-sales-tax">Utah
					<span class="ToolTipBox">
						Click for State of Utah<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/VT/Vermont-sales-tax">Vermont
					<span class="ToolTipBox">
						Click for State of Vermont<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/VA/Virginia-sales-tax">Virginia
					<span class="ToolTipBox">
						Click for State of Virginia<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/WA/Washington-sales-tax">Washington
					<span class="ToolTipBox">
						Click for State of Washington<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/WV/West-Virginia-sales-tax">West Virginia
					<span class="ToolTipBox">
						Click for State of West Virginia<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/WI/Wisconsin-sales-tax">Wisconsin
					<span class="ToolTipBox">
						Click for State of Wisconsin<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/WY/Wyoming-sales-tax">Wyoming
					<span class="ToolTipBox">
						Click for State of Wyoming<br>Sales and Use Tax Information
					</span></a><br>
			</div>
		</div>
		
<%
		End Select
	Next
%>

	</div>
