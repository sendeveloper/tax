<%
Function HeadingH1(text)
	
	HeadingH1 = "<h1>" & vbCrLf & _
		"        <span class='glyphicon glyphicon-star redFont' aria-hidden='true'></span>" & vbCrLf & _
		"        " & text & vbCrLf & _
		"    </h1>"

End Function		
		
Function HeadingH2(text)

	HeadingH2 = "<h2 style='font-size: 160%;'>" & vbCrLf & _
		"        <span class='glyphicon glyphicon-star redFont' aria-hidden='true'></span>" & vbCrLf & _
		"        " & text & vbCrLf & _
		"    </h2>"
End Function

Function MapCode(pr_abr, pr_name)
	MapCode = "<span id='img-small' class='imgRight' style='text-align: center; cursor: pointer; display: block;'>" & vbCrLf & _
		"    <a id='single_1' href='Website/pagesCountries/Includes/Maps/Canada/" & pr_abr & ".png' title='[Alberta sales tax rates for each jurisdiction]'>" & vbCrLf & _
		"        <img src='Website/pagesCountries/Includes/Maps/Canada/" & pr_abr & ".png' alt='[" & pr_name & "Alberta tax rates for each jurisdiction]' style='width: 150px;'>" & vbCrLf & _
		"        <br/>" & vbCrLf & _
		"        <img src='Website/pagesCountries/Includes/images/click_for_larger.png' style='width: 95px !important;' /></a>" & vbCrLf & _
		"    <br>" & vbCrLf & _
	  	"</span>"
End Function
%>   	
	