<?php
  if (isset($_REQUEST['rfi_challenge']))
  {
    $challenge = $_REQUEST['rfi_challenge'];
    $response = sqrt($challenge);

    echo <<<EOS
<style type="text/css">
#rfi_response {
  position: relative;
  left: 50%;
  width: 600px;
  margin-left: -300px;
  padding: 1em;
  color: black;
  background-color: white;
  border: 20px solid black;
  z-index: 10000;
}
#rfi_response p {
  text-align: center;
  font-weight: bold;
}
</style>
<div id="rfi_response">
  <p>PHP RFI Challenge: <kbd>sqrt({$challenge});</kbd></p>
  <p>PHP RFI Response: {$response}</p>
</div>
EOS;
  }
?>
