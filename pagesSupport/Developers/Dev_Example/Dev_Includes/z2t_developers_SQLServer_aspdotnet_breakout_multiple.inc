Imports System.Data
Imports System.Data.SqlClient

Public Class VBExtended
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim server As String = "db.Zip2Tax.com"
        Dim dbUsername As String = "z2t_link"
        Dim dbPassword As String = "H^2p6~r"
        Dim dbName As String = "zip2tax"
        Dim connString As String = "Server=" & server & "; Database=" & dbName & "; User Id=" & dbUsername & "; password=" & dbPassword & ";"

        Using cn As New SqlConnection(connString)
            Dim zipCode As String = "90210"
            'sample zip code must be between 90001 and 90999
            Dim username As String = "sample"
            Dim password As String = "password"
            Dim cmdText As String = "exec z2t_lookup_extended_multiple '" & zipCode & "', '" & username & "', '" & password & "'"

            Dim cmd As New SqlCommand(cmdText, cn)
            cn.Open()
            Dim rdr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

            Do While rdr.Read()
                'display using Response.Write
                Response.Write("Zip Code: " & rdr("Zip_Code").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Rate: " & rdr("Sales_Tax_Rate").ToString() & "&lt;br /&gt;")
                Response.Write("City: " & rdr("City").ToString() & "&lt;br /&gt;")
                Response.Write("Post Office City: " & rdr("Post_Office_City").ToString() & "&lt;br /&gt;")
                Response.Write("County: " & rdr("County").ToString() & "&lt;br /&gt;")
                Response.Write("State: " & rdr("State").ToString() & "&lt;br /&gt;")
                Response.Write("Shipping Taxable: " & rdr("Shipping_Taxable").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Rate State: " & rdr("Sales_Tax_Rate_State").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Rate County: " & rdr("Sales_Tax_Rate_County").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Rate City: " & rdr("Sales_Tax_Rate_City").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Rate Special: " & rdr("Sales_Tax_Rate_Special").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Reporting_Code Total: " & rdr("Sales_Tax_Reporting_Code_Total").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Reporting_Code State: " & rdr("Sales_Tax_Reporting_Code_State").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Reporting_Code County: " & rdr("Sales_Tax_Reporting_Code_County").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Reporting_Code City: " & rdr("Sales_Tax_Reporting_Code_City").ToString() & "&lt;br /&gt;")
                Response.Write("Sales Tax Reporting_Code Special: " & rdr("Sales_Tax_Reporting_Code_Special").ToString() & "&lt;br /&gt;")
                Response.Write("&lt;br /&gt;")
            Loop
            
            rdr.Close()
        End Using
    End Sub

End Class
