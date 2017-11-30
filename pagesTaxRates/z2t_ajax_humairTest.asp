
<%
'Retrieve z2t API data
Dim ajax: Set ajax = Server.CreateObject("MSXML2.ServerXMLHTTP.6.0")
Dim postData: postData = "username=" & Request("username") & "&password=" & Request("password") & "&AddressLine1=" & Request("addressLine1") & "&AddressLine2=" & Request("addressLine2") & "&City=" & Request("city") & "&State=" & Request("state") & "&Zip=" & Request("zip")
'ajax.open "POST", vURL, false
'ajax.setRequestHeader "Content-type","application/json"
'ajax.setRequestHeader "Accept","application/json"
'pathLookupAPI = "https://casper09-api.zip2tax.com/"
pathLookupAPI= "http://frank078-api.zip2tax.com/"

'response.Write( pathLookupAPI + "TaxRate-USA.web?" + postData)

ajax.open "get", pathLookupAPI + "TaxRate-USA.web?" + postData, False
ajax.send

Dim results
If ajax.status = 200 Then
'results = ajax.responseXML.xml ' ajax.responseText  ajax.responseStream
results = ajax.responseText

Response.ContentType = "application/json; charset=utf-8"
Else
' Handle missing response or other errors here
results = ""
'results = "<?xml version=""1.0"" encoding=""utf-16""?><div class=""z2tLookup""><div class=""errorInfo""><span class=""errorCode"">" & ajax.status & "</span><span class=""errorMessage"">" & ajax.responseText & "</span><ul class=""warnings""><li class=""warning"">Load Error: " & ajax.responseText & "</li></ul></div></div>"
'Response.ContentType = "text/plain"
Response.ContentType = "application/json; charset=utf-8"
End If
response.write(results) %>
