<?php


$strServer = "db.Zip2Tax.com";
$strDBUsername = "z2t_link";
$strDBPassword = "H^2p6~r";
$strDatabase = "zip2tax";


//Open the connection
$conn = mysql_connect($strServer, $strDBUsername, $strDBPassword, 0, 65536) 
    or die("Failed to connect to MySQL server on $strServer");


//Open the Database
mysql_select_db($strDatabase, $conn)
    or die("Could not open database $strDatabase");


//Set-up query variables
$strZipCode = "13210";  //sample zip code must be between 90001 and 90999
$strUserName = "pinhead";
$strUserPassword = "pinwheel";


//Execute
$result = mysql_query( "CALL zip2tax.z2t_lookup_multiple('" . $strZipCode . "','" . $strUserName . "', '" . $strUserPassword . "')" )
    or die( mysql_error() );


//Read the result
while($row = mysql_fetch_array($result, MYSQL_ASSOC))
    {
    echo "Zip Code: " . $row['Zip_Code'] . "<br>";
    echo "Sales Tax Rate: " . $row['Sales_Tax_Rate'] . "<br>";
    echo "City: " . $row['City'] . "<br>";
    echo "Post Office City: " . $row['Post_Office_City'] . "<br>";
    echo "County: " . $row['County'] . "<br>";
    echo "State: " . $row['State'] . "<br>";
    echo "Shipping Taxable: " . $row['Shipping_Taxable'] . "<br>";
    echo "<br>";
    }


mysql_free_result($result);

//Close the Database
mysql_close($conn);


?>