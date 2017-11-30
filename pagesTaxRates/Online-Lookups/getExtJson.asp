<%
Function getExternalJSON (pagina)
	set GData = server.Createobject("Microsoft.XMLHTTP.1.0")
	GData.Open "GET",pagina,false
	on error resume next
	GData.setOption SXH_OPTION_URL_CODEPAGE,"1252"
	GData.send 
	dtemp=replace(GData.responseText, vblf,"")
	dtemp=GData.responseText
	getExternalJSON=  dtemp
end function
strPage=request("strpage")
username=request("username")
password=request("password")
AddressLine1=request("AddressLine1")
AddressLine2=request("AddressLine2")
City=request("City")
strState=request("strState")
Zip=request("Zip")
theURL=strpage&"?username=" & username & "&password=" & password & "&AddressLine1=" & AddressLine1 &"&AddressLine2=" & AddressLine2 &"&City=" & City &"&State=" & strState &"&Zip=" & Zip
%>
<%=getExternalJSON(theURL)%>