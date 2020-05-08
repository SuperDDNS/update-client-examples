#!/bin/sh

#Bare minimum code to update a Hostname on SuperDDNS
#Written using the documentation found at: https://www.superddns.net/help/kb2/

#Config section
#Enter your information within the quotation marks
USERID="" #Your UserID
HOSTID="" #Your HostID
COMMAND=`curl -s -X POST -H "UserID: $USERID"  -d "{\"HostID\":\"$HOSTID\"}" https://www.superddns.net/v1/update/` #This  command sends the POST request

#Bare minimum status checking
if	[ "$COMMAND" = "{\"status\":\"Updated successfully\"}" ]; then
	#Put your success code here
	echo "Successful update"
else
	#Put your fail code here
  	echo "Most likely an issue occurred"
  	echo $COMMAND #displays the command output
fi