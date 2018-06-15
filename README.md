Welcome to the Iplocator README file!

ip locator: is a simple tool coded in perl to help you identify a site or ip geographical location 
Provides country, region, city, latitude, longitude, ZIP code, time zone, ISP, domain name, IDD country code, area code, ip-api.com's IP address lookup database without invading the Internet user's privacy. 

Usage: ./iplocator.pl [host] [ip] [domain]
       perl iplocator.pl [host] [ip] [domain]
       
  Ex:  ./iplocator.pl  www.google.com    
       ./iplocator.pl  216.58.210.206
       
 Usage Limit: The ip-api.com system will automatically ban any IP addresses doing over 150 requests per minute.
 
 If your IP was banned, visit http://ip-api.com/docs/unban
