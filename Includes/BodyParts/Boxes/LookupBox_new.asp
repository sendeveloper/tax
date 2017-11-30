<script type="text/javascript">

</script>
<!-- 
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">
			<span class="glyphicon glyphicon-star" aria-hidden="true"></span> Look up the Tax
		</h3>
	</div>
	<div class="panel-body">
		<form class="form-horizontal smallFonts" method="post" action= "/sales-tax-calculator">
		  <fieldset>
			<div class="form-group">
			  <label for="inputZip" class="col-lg-4 control-label">Zip Code</label>
			  <div class="col-lg-8">
				<input type="text" class="form-control" NAME="inputZip" id="inputZip" placeholder="Zip Code" >
			  </div>
			</div>
			<div class="form-group">
				  <div class="col-lg-12 text-right">
<%
If Session("z2t_loggedin") = "True"  Then
	'whereTo="clickLookup()"
  whereTo="<button type=""button"" class=""btn btn-danger"" onclick=""clickLookup();"">Lookup</button>"
	
else
	'whereTo="div_show(1)"
	whereTo="<button type=""button"" class=""btn btn-danger"" id=""lookupOpener"">Lookup</button>"
end if


%>

  <%=whereTo%>
				  </div>
				</div>
		  </fieldset>
		</form>						
	</div>
</div> -->
