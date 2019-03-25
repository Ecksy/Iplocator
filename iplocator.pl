#!/usr/bin/perl
# Ip Geolocation 
#
# API documentation - http://ip-api.com/docs/
# you can see your external ip using this Bash script :
# read COUNTRY IP <<< $(wget -qO- http://ip-api.com/line/?fields=countryCode,query); echo $IP $COUNTRY
# Now let's start:

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;
  
 
#print color 'bold bright_yellow';
 
print q{
Ip Geolocation Tool  
By: Alexcerus-HR
Modded by: Ecksy

  ----------------------------------------
};
 
#print color 'reset';
@iphost=$ARGV[0] || die "Usage: ./iplocator.pl [host] [ip] [domain] \n       perl iplocator.pl [host] [ip] [domain] \n\nEx:  ./iplocator.pl  www.google.com \n     ./iplocator.pl  216.58.210.206\n \nUsage Limit: The ip-api.com system will automatically ban any IP addresses doing over 150 requests per minute. \n\nIf your IP was banned, visit http://ip-api.com/docs/unban \n\n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip?fields=589823"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "success",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "city": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
print "  [!] IP		:  ", $info->{'query'}, "\n";
print "  [!] Query Status	:  ", $info->{'status'}, "\n";
print "  [!] Error Message	:  ", $info->{'message'}, "\n";
print "  ----------------------------------------\n";
print "  [+] Country/Code	:  ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [+] Region/Code	:  ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [+] City		:  ", $info->{'city'}, "\n";
print "  [+] Zip		:  ", $info->{'zip'}, "\n";
print "  [+] Geo		:  ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [+] Paste to Maps	:  ", $info->{'lat'},  ", ", $info->{'lon'}, "\n";
print "  [+] Timezone		:  ", $info->{'timezone'}, "\n";
print "  [+] ISP		:  ", $info->{'isp'}, "\n";
print "  [+] Organization	:  ", $info->{'org'}, "\n";
print "  [+] AS Number/Name	:  ", $info->{'as'}, "\n";
print "  [+] Reverse DNS	:  ", $info->{'reverse'}, "\n";
print "  [+] District		:  ", $info->{'district'}, "\n";
print "  [+] https://maps.google.com/maps/place/$info->{'lat'}%20$info->{'lon'}", "\n";
print "\n";
# EOF
