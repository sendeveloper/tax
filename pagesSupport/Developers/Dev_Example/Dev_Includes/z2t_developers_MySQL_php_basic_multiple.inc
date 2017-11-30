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
$result = mysql_query( "CALL zip2tax.z2t_lookup_multiple('" . $strZipCode . "','" . $strUserName . "', '" . $strUserPassword . "')" )
    or die( mysql_error() );<br>

//Read the result
while($row = mysql_fetch_array($result, MYSQL_ASSOC))
    {
    echo "Zip Code: " . $row['Zip_Code'] . "&lt;br&gt;";
    echo "Sales Tax Rate: " . $row['Sales_Tax_Rate'] . "&lt;br&gt;";
    echo "City: " . $row['City'] . "&lt;br&gt;";
    echo "Post Office City: " . $row['Post_Office_City'] . "&lt;br&gt;";
    echo "County: " . $row['County'] . "&lt;br&gt;";
    echo "State: " . $row['State'] . "&lt;br&gt;";
    echo "Shipping Taxable: " . $row['Shipping_Taxable'] . "&lt;br&gt;";
    echo "&lt;br&gt;";
    }<br>

mysql_free_result($result);

//Close the Database
mysql_close($conn);<br>

?&gt;
