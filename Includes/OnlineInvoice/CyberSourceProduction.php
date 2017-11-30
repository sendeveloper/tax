<?php include ("security.php") ?>

<form action="https://secureacceptance.cybersource.com/pay" method="post" name="BillingForm"/>
<?php

$php_amt = $_GET['amount'];
$php_ref_num = $_GET['ref_num'];
$php_fName = $_GET['fName'];
$php_lName = $_GET['lName'];
$php_addr = $_GET['addr'];
$php_city = $_GET['city'];
$php_zip = $_GET['zip'];
$php_mail = $_GET['email'];

//echo "First Name : $php_fName", PHP_EOL;
//echo "Last Name : $php_lName";
//echo "\r\n";
//echo "Amount : $php_amt";

$map;
$map['access_key']= "0e678f1e00b1388289fe1d03169184d5";
// Specifying the selected profile
$map['profile_id']= "2014_07";
$map['amount']= $php_amt;
$map['currency']= "usd";
// Specifying the transaction type
$map['transaction_type']= "sale";
// Establishing the timestamp
$map['signed_date_time']= gmdate("Y-m-d\TH:i:s\Z");
// Specifying the merchant reference code
$map['reference_number']= $php_ref_num;
// Passing prepopulated data to the SA endpoint
$map['bill_to_forename']= $php_fName;
$map['bill_to_surname']= $php_lName;
$map['bill_to_address_line1']= $php_addr;
$map['bill_to_address_city']= $php_city;
$map['bill_to_address_postal_code']= $php_zip;
$map['bill_to_email']= $php_mail;
// Passing non-payment data that will be returned in the response
//$map['merchant_defined_data1'] = "My Merchant Defined String";
//$map['merchant_defined_data2'] = "Yes";
// Specifying the locale
$map['locale'] = "en";
// Specifying the unique transaction id
$map['transaction_uuid'] = uniqid(1);
// Specifying the signed and unsigned fields
$map['signed_field_names'] = "access_key,profile_id,amount,currency,transaction_type,reference_number,signed_date_time,locale,transaction_uuid,signed_field_names,unsigned_field_names"; 
 $map['unsigned_field_names'] = "bill_to_forename,bill_to_surname,bill_to_address_line1,bill_to_address_city,bill_to_address_postal_code,bill_to_email";

 foreach($map as $name => $value) {
echo "<input type=\"hidden\" id=\"" . $name . "\" name=\"" . $name . "\" value=\"" . $value . "\"/>\n";
}
// And finally, generating the signature
echo "<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" . sign($map) . "\"/>\n";
?>
<script language="javascript" type="text/javascript">
    document.BillingForm.submit();
 </script>

</form>
