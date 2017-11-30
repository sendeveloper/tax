<?php include ("security.php") ?>
<h3>Sample PHP Receipt Page</h3>
<table border="1">
<tr><td><b>Field Name</b></td><td><b>Field Value</b></td></tr>
<?php
while(list($key, $val) = each($_POST))
{
echo '<tr><td>' . $key . '</td><td>' . $val . "</td></tr>";
}
// Use the sign function in the security file and compare with the
// signature value that is posted in the response.
$input = $_POST["signature"];
echo "input : $input", PHP_EOL;
$sig = sign($_POST);
echo "sign : $sig", PHP_EOL;

if ($sig==$input)
{ //if they match, the data is valid.
 echo '<tr><td>Valid Signature:</td><td>' .'Signatures Match'. '</td></tr>';
}
else
 { //otherwise the data is invalid.
echo '<tr><td>Valid Signature:</td><td>' .'Uh oh! The signatures dont match! Invalid Response'. 
'</td></tr>';
 }
 
 $curl = curl_init('http://dev.zip2tax.com/account/OnlineInvoice/receipt.asp');
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$curl_response = curl_exec($curl);
/*echo $curl_response;*/
curl_close($curl);

?>
</table>