#Bare minimum code to update a Hostname on SuperDDNS
#Written using the documentation found at: https://www.superddns.net/help/kb2/

#Config section
#Enter your information within the quotation marks
$user = "" #Your UserID
$body = @{"HostID" = ""} | ConvertTo-Json #Your HostID
$response = Invoke-RestMethod -Header @{ "UserID" = $user } -body $body -Method POST -Uri https://www.superddns.net/v1/update/ 2>&1 #This  command sends the POST request

#Bare minimum status checking
if ( $response.status -eq "Updated successfully" ) {
	#Put your success code here
	echo "Success: " $response.status
} else {
	#Put your fail code here
	echo "failed: " $response.status
}