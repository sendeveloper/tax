


<script type="text/javascript" language="jscript" runat="server" src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/hmac-sha256.js"></script>

 <script type="text/javascript" language="jscript" runat="server" >
function getHash(message)
{

 var hash = CryptoJS.HmacSHA256(message, "8917ea5d53a54a70a0de1143eff5a6ef41b93ad781f54f868fab13d2690e858b42fb7b48353841568b82a53f9550aff3df4eddc97f0440cfbfa6fe6c6109a4e7206b05ca12e04cedb07038611f2acf8994ce2cc7579946d29f247e4b5cecb1be13b65f29affa42d7977c0bb8fe50fa5e0b1f1e76d05542baad1047a4673b7c71");
 var hashInBase64 = CryptoJS.enc.Base64.stringify(hash);
 
 // shaObj = new jsSHA(message);
	
 //var hashInBase64 = shaObj.getHMAC("8917ea5d53a54a70a0de1143eff5a6ef41b93ad781f54f868fab13d2690e858b42fb7b48353841568b82a53f9550aff3df4eddc97f0440cfbfa6fe6c6109a4e7206b05ca12e04cedb07038611f2acf8994ce2cc7579946d29f247e4b5cecb1be13b65f29affa42d7977c0bb8fe50fa5e0b1f1e76d05542baad1047a4673b7c71", "TEXT", "SHA-256", "B64");
 
 return hashInBase64;
}


function getMerchantID() { return "zip2taxsb"; }
function getSharedSecret()  { return "8917ea5d53a54a70a0de1143eff5a6ef41b93ad781f54f868fab13d2690e858b42fb7b48353841568b82a53f9550aff3df4eddc97f0440cfbfa6fe6c6109a4e7206b05ca12e04cedb07038611f2acf8994ce2cc7579946d29f247e4b5cecb1be13b65f29affa42d7977c0bb8fe50fa5e0b1f1e76d05542baad1047a4673b7c71"; }
function getSerialNumber() { return "3422082256790176056180"; }

function InsertMapSignatureVBScript(map)
{
    //map.Item("merchantID") = getMerchantID();
    //map.Item("orderPage_timestamp") = timestamp();
    //map.Item("orderPage_version") = "7";
    //map.Item("orderPage_serialNumber") = getSerialNumber();

    var signedFields = "";
    var valuesToSign = "";
    var key, value;

    keys = (new VBArray(map.Keys())).toArray();

    for (var i in keys) {
        key = keys[i];
        value = map.Item(keys[i]);
        signedFields += key;
        signedFields += ",";
        valuesToSign += key;
        valuesToSign += "=";
        valuesToSign += value;
		if(key != "signed_field_names")
		{
			valuesToSign += ",";
		}
		
        Response.Write('<input type="hidden" name="' + key + '" value="' + value + '">\n');
    }

    if (signedFields.length != 0) {
        signedFields = signedFields.substring(0, signedFields.length - 1);
    }

    var pub = getSharedSecret();
	//var hash = CryptoJS.HmacSHA256(valuesToSign, pub);
 //var hashInBase64 = hash.toString(CryptoJS.enc.Base64);
 
 //var hashInBase64 = CryptoJS.enc.Base64.stringify(hash);
 
    var signedFieldsPublicSignature = getHash(valuesToSign);
    //valuesToSign += "signedFieldsPublicSignature=";
    //valuesToSign += signedFieldsPublicSignature;

	//Response.Write('<input type="text" name="abc" value="' + valuesToSign + '">\n');
    Response.Write('<input type="hidden" name="signature" value="' + signedFieldsPublicSignature + '">\n');
    Response.Write('<input type="hidden" name="signed_field_names" value="' + signedFields + '">\n');
}


</script>

