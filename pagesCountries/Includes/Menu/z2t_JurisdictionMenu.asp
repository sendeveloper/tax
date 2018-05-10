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
			<h2 class="panel-title">
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> Sales Tax Information
			</h2>
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
				<a class="ToolTip" href="/british-columbia-sales-tax">British Columbia
					<span class="ToolTipBox">
						Click for the Province of British Columbia<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/manitoba-sales-tax">Manitoba
					<span class="ToolTipBox">
						Click for the Province of Manitoba<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/new-brunswick-sales-tax">New Brunswick
					<span class="ToolTipBox">
						Click for the Province of New Brunswick<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/newfoundland-labrador-sales-tax">Newfoundland
					<span class="ToolTipBox">
						Click for the Province of Newfoundland Labrador<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/northwest-territories-sales-tax">Northwest
					<span class="ToolTipBox">
						Click for the Province of Northwest Territories<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/nova-scotia-sales-tax">Nova Scotia
					<span class="ToolTipBox">
						Click for the Province of Nova Scotia<br>Sales and Use Tax Information
					</span></a><br>
			</div>

			<div class="divRight">
				<a class="ToolTip" href="/nunavut-sales-tax">Nunavut
					<span class="ToolTipBox">
						Click for the Province of Nunavut<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/ontario-sales-tax">Ontario
					<span class="ToolTipBox">
						Click for the Province of Ontario<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/prince-edward-island-sales-tax">Prince Edward
					<span class="ToolTipBox">
						Click for the Province of Prince Edward Island<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/quebec-sales-tax">Quebec
					<span class="ToolTipBox">
						Click for the Province of Quebec<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/saskatchewan-sales-tax">Saskatchewan
					<span class="ToolTipBox">
						Click for the Province of Saskatchewan<br>Sales and Use Tax Information
					</span></a><br>
				<a class="ToolTip" href="/yukon-sales-tax">Yukon
					<span class="ToolTipBox">
						Click for the Province of Yukon<br>Sales and Use Tax Information
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
				<a class="ToolTip" href="/al/alabama-sales-tax">Alabama
					<span class="ToolTipBox">
						Click for State of Alabama<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/ak/alaska-sales-tax">Alaska
					<span class="ToolTipBox">
						Click for State of Alaska<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/az/arizona-sales-tax">Arizona
					<span class="ToolTipBox">
						Click for State of Arizona<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ar/arkansas-sales-tax">Arkansas
					<span class="ToolTipBox">
						Click for State of Arkansas<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ca/california-sales-tax">California
					<span class="ToolTipBox">
						Click for State of California<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/co/colorado-sales-tax">Colorado
					<span class="ToolTipBox">
						Click for State of Colorado<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ct/connecticut-sales-tax">Connecticut
					<span class="ToolTipBox">
						Click for State of Connecticut<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/de/delaware-sales-tax">Delaware
					<span class="ToolTipBox">
						Click for State of Delaware<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/dc/district-of-columbia-sales-tax">District of Columbia
					<span class="ToolTipBox">
						Click for District of Columbia<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/fl/florida-sales-tax">Florida
					<span class="ToolTipBox">
						Click for State of Florida<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ga/georgia-sales-tax">Georgia
					<span class="ToolTipBox">
						Click for State of Georgia<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/hi/hawaii-sales-tax">Hawaii
					<span class="ToolTipBox">
						Click for State of Hawaii<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/id/idaho-sales-tax">Idaho
					<span class="ToolTipBox">
						Click for State of Idaho<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/il/illinois-sales-tax">Illinois
					<span class="ToolTipBox">
						Click for State of Illinois<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/in/indiana-sales-tax">Indiana
					<span class="ToolTipBox">
						Click for State of Indiana<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ia/iowa-sales-tax">Iowa
					<span class="ToolTipBox">
						Click for State of Iowa<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ks/kansas-sales-tax">Kansas
					<span class="ToolTipBox">
						Click for State of Kansas<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ky/kentucky-sales-tax">Kentucky
					<span class="ToolTipBox">
						Click for State of Kentucky<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/la/louisiana-sales-tax">Louisiana
					<span class="ToolTipBox">
						Click for State of Louisiana<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/me/maine-sales-tax">Maine
					<span class="ToolTipBox">
						Click for State of Maine<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/md/maryland-sales-tax">Maryland
					<span class="ToolTipBox">
						Click for State of Maryland<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/ma/massachusetts-sales-tax">Massachusetts
					<span class="ToolTipBox">
						Click for State of Massachusetts<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/mi/michigan-sales-tax">Michigan
					<span class="ToolTipBox">
						Click for State of Michigan<br>Sales and Use Tax Information
					</span></a><br>

				<a class="ToolTip" href="/mn/minnesota-sales-tax">Minnesota
					<span class="ToolTipBox">
						Click for State of Minnesota<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/ms/mississippi-sales-tax">Mississippi
					<span class="ToolTipBox">
						Click for State of Mississippi<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/mo/missouri-sales-tax">Missouri
					<span class="ToolTipBox">
						Click for State of Missouri<br>Sales and Use Tax Information
					</span></a><br>
			</div>
			
			<div class="divRight">
				<a class="ToolTip" href="/mt/montana-sales-tax">Montana
					<span class="ToolTipBox">
						Click for State of Montana<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/ne/nebraska-sales-tax">Nebraska
					<span class="ToolTipBox">
						Click for State of Nebraska<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/nv/nevada-sales-tax">Nevada
					<span class="ToolTipBox">
						Click for State of Nevada<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/nh/new-hampshire-sales-tax">New Hampshire
					<span class="ToolTipBox">
						Click for State of New Hampshire<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/nj/new-jersey-sales-tax">New Jersey
					<span class="ToolTipBox">
						Click for State of New Jersey<br>Sales and Use Tax Information
					</span></a><br>
				
				<a class="ToolTip" href="/nm/new-mexico-sales-tax">New Mexico
					<span class="ToolTipBox">
						Click for State of New Mexico<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/ny/new-york-sales-tax">New York
					<span class="ToolTipBox">
						Click for State of New York<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/nc/north-carolina-sales-tax">North Carolina
					<span class="ToolTipBox">
						Click for State of North Carolina<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/nd/north-dakota-sales-tax">North Dakota
					<span class="ToolTipBox">
						Click for State of North Dakota<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/oh/ohio-sales-tax">Ohio
					<span class="ToolTipBox">
						Click for State of Ohio<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/ok/oklahoma-sales-tax">Oklahoma
					<span class="ToolTipBox">
						Click for State of Oklahoma<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/or/oregon-sales-tax">Oregon
					<span class="ToolTipBox">
						Click for State of Oregon<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/pa/pennsylvania-sales-tax">Pennsylvania
					<span class="ToolTipBox">
						Click for State of Pennsylvania<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/ri/rhode-island-sales-tax">Rhode Island
					<span class="ToolTipBox">
						Click for State of Rhode Island<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/sc/south-carolina-sales-tax">South Carolina
					<span class="ToolTipBox">
						Click for State of South Carolina<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/sd/south-dakota-sales-tax">South Dakota
					<span class="ToolTipBox">
						Click for State of South Dakota<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/tn/tennessee-sales-tax">Tennessee
					<span class="ToolTipBox">
						Click for State of Tennessee<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/tx/texas-sales-tax">Texas
					<span class="ToolTipBox">
						Click for State of Texas<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/ut/utah-sales-tax">Utah
					<span class="ToolTipBox">
						Click for State of Utah<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/vt/vermont-sales-tax">Vermont
					<span class="ToolTipBox">
						Click for State of Vermont<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/va/virginia-sales-tax">Virginia
					<span class="ToolTipBox">
						Click for State of Virginia<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/wa/washington-sales-tax">Washington
					<span class="ToolTipBox">
						Click for State of Washington<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/wv/west-virginia-sales-tax">West Virginia
					<span class="ToolTipBox">
						Click for State of West Virginia<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/wi/wisconsin-sales-tax">Wisconsin
					<span class="ToolTipBox">
						Click for State of Wisconsin<br>Sales and Use Tax Information
					</span></a><br>
					
				<a class="ToolTip" href="/wy/wyoming-sales-tax">Wyoming
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
