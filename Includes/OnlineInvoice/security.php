 <?php

define ('HMAC_SHA256', 'sha256');
define ('SECRET_KEY','31444f744ceb4b018d52850fbb665321ad7329c7819a49d2949ee8a7f80992ddcc5331f670fa482ca295c93145e1e4ceb236ca51866441e8a318ad256b00b6c260adfc2068824e5a98b74e5c0eb48051dc8c287ed10444788b333fa84a12da3fcb25c2b1dca040a68c891cc5d0556e455713ff75246749ef94d45344e5b42159');

//define ('SECRET_KEY', '8e707551ad234caebab5f74ec4323372c6de4e8728a444fcbd8bb68f0c9980461eed83bc932d48bb82488c9d00a45e753c1aeabafa6f456ab943821d3a7d8b3d5757a17e8aa94d7e823aa58341413844fb222a3306714adb8e70e9dfee2d091ab78b8510f00a4a9eaf7eff74c38e6c5d1ddc9808f1954962afa9571e29b9c8f7');

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
