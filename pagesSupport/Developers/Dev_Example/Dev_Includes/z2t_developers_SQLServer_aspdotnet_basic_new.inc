
Imports System
Imports System.IO
Imports System.Net
Imports System.Text
Imports System.Xml


Partial Class VBBasic
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strZip As String = "90210"
        'sample zip code must be between 90001 and 90999
        Dim strUser As String = "sample"
        Dim strPassword As String = "password"
        Dim url As String
        url = "https://api.zip2tax.com/TaxRate-USA.xml?username="&amp;strUser&"&amp;password="&amp;strPassword&"&amp;zip="&amp;strZip

        Dim request As HttpWebRequest
        Dim http_response As HttpWebResponse = Nothing
   
        'Create the web request  
        request = DirectCast(WebRequest.Create(url), HttpWebRequest)

        ' Get response  
        http_response = DirectCast(request.GetResponse(), HttpWebResponse)

        ' Get the response stream into a reader  
        Dim reader As StreamReader = New StreamReader(http_response.GetResponseStream(), Encoding.UTF8)

        Dim str As String = reader.ReadLine()

        Dim doc As XDocument = XDocument.Parse(str)
        Dim generalElement As XElement = doc.Element("z2tLookup").Element("errorInfo")

        Dim errorInfo As String = generalElement.Element("errorMessage").Value

        If errorInfo = "Success" Then

            Dim generalInnerElement As XElement =
                    doc.Element("z2tLookup").Element("addressInfo").Element("addresses").Element("address")

            Dim generalInnerTaxElement As XElement =
                generalInnerElement.Element("salesTax").Element("rateInfo")

            Dim generalInnerNotesElement As XElement =
                    generalInnerElement.Element("notes")

            Dim childElement As XElement
            Dim shipping As Integer = 0

            For Each childElement In generalInnerNotesElement.Descendants("noteDetail").Elements("note")

                If childElement.Value.ToString().Equals("Shipping charges are not taxable") Then

                    shipping = 1
                End If
            Next

            Response.Write("Zip Code: " + generalInnerElement.Element("zipCode").Value + "<br >")
            Response.Write("Sales Tax Rate: " + generalInnerTaxElement.Element("taxRate").Value + "<br >")
            Response.Write("Post Office City: " + generalInnerElement.Element("place").Value + "<br >")
            Response.Write("County: " + generalInnerElement.Element("county").Value + "<br >")
            Response.Write("State: " + generalInnerElement.Element("state").Value + "<br >")
            Response.Write("Shipping Taxable: " + shipping.ToString() + "<br >")

        End If

    End Sub

End Class
