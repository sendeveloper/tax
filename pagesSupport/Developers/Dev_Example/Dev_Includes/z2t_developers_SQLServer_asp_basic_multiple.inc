&lt;%
strServer = "db.Zip2Tax.com"
strDBUsername = "z2t_link"
strDBPassword = "H^2p6~r"
strDatabase = "zip2tax"


'Open the connection
Set conn=server.CreateObject("ADODB.Connection")
conn.Open "driver=SQL Server;server=" & strServer & ";uid=" & strDBUsername & ";pwd=" & strDBPassword & ";database=" & strDatabase

'Assign values to the input variables
strZipCode = "90210"  :  'sample zip code must be between 90001 and 90999
strUsername = "sample"
strPassword = "password"

'Open the recordset using the stored procedure
Set rs = server.CreateObject("ADODB.Recordset")
rs.open "z2t_lookup_multiple('" & strZipCode & "', '" & strUsername & "', '" & strPassword & "')", conn, 3, 3, 4

'Read the results
Do Until rs.EOF
    Response.write "Zip Code: " & rs("Zip_Code") & "&lt;br /&gt;"
    Response.write "Sales Tax Rate: " & rs("Sales_Tax_Rate") & "&lt;br /&gt;"
    Response.write "City: " & rs("City") & "&lt;br /&gt;"
    Response.write "Post Office City: " & rs("Post_Office_City") & "&lt;br /&gt;"
    Response.write "County: " & rs("County") & "&lt;br /&gt;"
    Response.write "State: " & rs("State") & "&lt;br /&gt;"
    Response.write "Shipping Taxable: " & rs("Shipping_Taxable") & "&lt;br /&gt;"
    Response.write "&lt;br /&gt;"
    
    rs.MoveNext
Loop

'Close the Database
rs.Close
conn.Close

%&gt;

