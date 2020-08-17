import json
import requests

#Bare minimum code to update a Hostname on SuperDDNS
#Written using the documentation found at: https://www.superddns.net/help/kb2/
#Works on Python 2 and 3

#Config section
#Enter your information within the quotation marks
UserIDHeader = {"UserID": ""} # Your UserID
body = {"HostID": ""} #Your HostID
successString={'status': 'Updated successfully'}

response = requests.post("https://www.superddns.net/v1/update/", data=json.dumps(body), headers=UserIDHeader)  #This command sends the POST request

#Bare minimum status checking
if response.json() == successString:
    #Put your success code here
    print("Success")

else:
    #Put your fail code here
    print("Failed")

print(response.json())