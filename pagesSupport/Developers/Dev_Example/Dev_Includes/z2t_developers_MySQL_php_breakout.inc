&lt;?php<br>

$strServer = "db.Zip2Tax.com";
$strDBUsername = "z2t_link";
$strDBPassword = "H^2p6~r";
$strDatabase = "zip2tax";<br>

//Open the connection
$conn = mysql_connect($strServer, $strDBUsername, $strDBPassword, 0, 65536) 
    or die("Failed to connect to MySQL server on $strServer");<br>

//Open the Database
mysql_select_db($strDatabase, $conn)
    or die("Could not open database $strDatabase");<br>

//Set-up query variables
$strZipCode = "90210";  //sample zip code must be between 90001 and 90999
$strUserName = "sample";
$strUserPassword = "password";<br>

//Execute
$result = mysql_query( "CALL zip2tax.z2t_lookup_extended('" . $strZipCode . "','" . $strUserName . "', '" . $strUserPassword . "')" )
    or die( mysql_error() );<br>

//Read the result
while($row = mysql_fetch_array($result, MYSQL_ASSOC))
    {
    echo "Zip Code: " . $row['Zip_Code'] . "&lt;br&gt;";
    echo "Sales Tax Rate: " . $row['Sales_Tax_Rate'] . "&lt;br&gt;";
    echo "Post Office City: " . $row['Post_Office_City'] . "&lt;br&gt;";
    echo "County: " . $row['County'] . "&lt;br&gt;";
    echo "State: " . $row['State'] . "&lt;br&gt;";
    echo "Shipping Taxable: " . $row['Shipping_Taxable'] . "&lt;br&gt;";
    echo " Sales Tax Rate State: " . $row['Sales_Tax_Rate_State'] . "&lt;br&gt;";
    echo " Sales Tax Rate County: " . $row['Sales_Tax_Rate_County'] . "&lt;br&gt;";
    echo " Sales Tax Rate City: " . $row['Sales_Tax_Rate_City'] . "&lt;br&gt;";
    echo " Sales Tax Rate Special: " . $row['Sales_Tax_Rate_Special'] . "&lt;br&gt;";
    echo " Sales Tax Reporting Code Total: " . $row['Sales_Tax_Reporting_Code_Total'] . "&lt;br&gt;";
    echo " Sales Tax Reporting Code State: " . $row['Sales_Tax_Reporting_Code_State'] . "&lt;br&gt;";
    echo " Sales Tax Reporting Code County: " . $row['Sales_Tax_Reporting_Code_County'] . "&lt;br&gt;";
    echo " Sales Tax Reporting Code City: " . $row['Sales_Tax_Reporting_Code_City'] . "&lt;br&gt;";
    echo " Sales Tax Reporting Code Special: " . $row['Sales_Tax_Reporting_Code_Special'] . "&lt;br&gt;";
    }<br>

mysql_free_result($result);

//Close the Database
mysql_close($conn);<br>

?&gt;
