#!/usr/bin/perl
use Win32::TieRegistry (Delimiter => '\\');
$site = $ARGV[1];	#set arg for site to var
#if our command switch is u for update and we are givin a site
if($ARGV[0] =~ /u/g && $site) {
	#check if the site had a www
	if ($site =~ /^[w]{3}/) {
		#set the start page key to site and add http://
		$key = $Registry->{'HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main'};
		$key->{'\Start Page'} = "http://" .$site;
		print "Site changed to $site";
	}
	else {
		print "Vaid website must start with www.";
	}
}
#if the user want to show the current home page.
elsif($ARGV[0] =~ /r/) {
	$key = $Registry->{'HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main'};
	$keyval = $key->{'\Start Page'};
	print "You home page is $keyval.\n";
}
#A little help text
elsif($ARGV[0] eq 'help') {
	print "\nScript to update your Internet Explorer Home Page.\n\n-u\t\tTo update your home page\n-r\t\tUsed to read your current home page.";
	print "\n\nEx: homepagechange -u www.google.com \nUsed to change your home page to www.google.com\n";
}
#if no args or wrong args are passed give a little help recomendation.  
else {
	print "Program requires arguments. Use help for more info.";
}
