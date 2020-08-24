<?php
	//Bare minimum code to update a Hostname on SuperDDNS
	//Written using the documentation found at: https://www.superddns.net/help/kb2/

	//Config section
	//Enter your information within the quotation marks
	$UserID = ""; //Your UserID
	$HostID = ""; //Your HostID

	$ch = curl_init('https://www.superddns.net/v1/update/'); 
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
	curl_setopt($ch, CURLOPT_POSTFIELDS, '{"HostID":"'.$HostID.'"}');
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('UserID: '.$UserID));
	curl_setopt($ch, CURLOPT_TIMEOUT,10);

	$result = curl_exec($ch); //This command sends the POST request
	$response = json_decode($result, true);

	//Bare minimum status checking
	if ( $response) {
		if ( $response['status'] == "Updated successfully" ) {
			//Put your success code here
			print("Success");
		} else {
			//Put your fail code here
			print("Failed: ".$response['status']);
		}
	} else {
		//failed to get a response from the server.
		print("No response from server.");
	}
	print("\n");
?>
