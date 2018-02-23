#!/usr/bin/perl
# vignac 
# by: navi87

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;
  
 
print color 'bold blue';
 
print q{
                      :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!
               ~?WuxiW*`   `"#$$$$8!!!!??!!!
             :X- M$$$$       `"T#$T~!8$WUXU~
            :%`  ~#$$$m:        ~!~ ?$$$$$$
          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~


------------------------------------
};
 
print color 'reset';
@iphost=$ARGV[0] || die "Usage : perl vignac.pl [ip] [domain] \n\nEx: perl vignac.pl  www.yahoo.com \n    perl vignac.pl  212.82.162.33\n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host unreachable!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip");
    my $json = $GET->content();
 
 
my $info = decode_json($json);

 
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  [*] ORG: ", $info->{'as'}, "\n";
print "  [*] ISP: ", $info->{'isp'}, "\n";
print "  [*] Country: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [*] City: ", $info->{'city'}, "\n";
print "  [*] Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [*] Geo: ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [*] Time: ", "timezone: " , $info->{'timezone'}," \n";
print "  [*] Country code: ", $info->{'countryCode'}, "\n"; 
print "  [*] Status: ", $info->{'status'}, "\n"; 
print "\n";
