<%If Not Session("z2t_loggedin") = "True"  Then%>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> Free Trial
			</h3>
		</div>
		<div class="panel-body text-center">
			 <strong>
				Call today<br>
				for your free trial at <br><br>
				<a class="green-btntrans" href="tel:+18664928494" onclick="ga('send', 'event', 'Phone Leads', 'Mobile Interaction', 'Headerclicked');"
				style="color: #9CE53C;
				border-radius: 25px;
				border: 2px solid #9CE53C;
				padding: 6px 10px;
				width: 200px;
				height: 45px;
				font-size: 23px;
				white-space: nowrap;">
				1-866-492-8494</a>
				
				<!--This section will allow for the online free trial signups to be active again. Jessie Shrauger 8/2/17-->
				<!--Call 1-866-492-8494 today<br>
				for your free trial or <br>
				<a style="cursor:pointer"  id="lookupOpener">sign up</a> risk free!<br>-->
			</strong>			
		</div>
	</div>
<%End If %>