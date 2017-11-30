 <?php

define ('HMAC_SHA256', 'sha256');
define ('SECRET_KEY', '10fc6edb5bd34712bd1d7555edbae4374b2e0ff8be0349bea5a252215bab0c05395f534ef9094fe2bba1f2b01ddfc0f88282ee779fa045fc8f3effedb9eec81929c4936600fe427f804685acd7b09d617b7ecef9ca5c449b83275e88f2ccd40e4df1fe3855b84e92b7308b0f044046c557c767bc5d0e4cdaa2204b634f832fc2');


//define ('SECRET_KEY', '8917ea5d53a54a70a0de1143eff5a6ef41b93ad781f54f868fab13d2690e858b42fb7b48353841568b82a53f9550aff3df4eddc97f0440cfbfa6fe6c6109a4e7206b05ca12e04cedb07038611f2acf8994ce2cc7579946d29f247e4b5cecb1be13b65f29affa42d7977c0bb8fe50fa5e0b1f1e76d05542baad1047a4673b7c71');

function sign ($params) {
  return signData(buildDataToSign($params), SECRET_KEY);
}

function signData($data, $secretKey) {
    return base64_encode(hash_hmac('sha256', $data, $secretKey, true));
}

function buildDataToSign($params) {
        $signedFieldNames = explode(",",$params["signed_field_names"]);
        foreach ($signedFieldNames as &$field) {
           $dataToSign[] = $field . "=" . $params[$field];
        }
        return commaSeparate($dataToSign);
}

function commaSeparate ($dataToSign) {
    return implode(",",$dataToSign);
}

?>
