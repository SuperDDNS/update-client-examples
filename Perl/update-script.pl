#!/usr/bin/perl

#Bare minimum code to update a Hostname on SuperDDNS
#Written using the documentation found at: https://www.superddns.net/help/kb2/
use LWP::UserAgent;
my $ua = LWP::UserAgent->new;
my $server_endpoint = "https://www.superddns.net/v1/update/";
my $request = HTTP::Request->new(POST => $server_endpoint);
$request->header('content-type' => 'application/json');

#Config Section
#Enter your information within the quotation marks
$request->header("UserID" => ""); #Your UserID
my $post_data = '{ "HostID" : ""}'; #Your HostID

$request->content($post_data);
my $response = $ua->request($request);
my $status = $response->decoded_content;
#Bare minimum status checking
if ( $status eq "{\"status\":\"Updated successfully\"}" ) {
	#Put your success code here
	print "Successful update: $status\n";
} else {
	#Put your fail code here
	print "An issue occurred: $status\n";
}