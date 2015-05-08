#!/usr/bin/perl
use Win32::TieRegistry (Delimiter => '\\');
$site = $ARGV[1];

if($ARGV[0] =~ /u/g && $site) {
	if ($site =~ /^[w]{3}/) {
		$key = $Registry->{'HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main'};
		$key->{'\Start Page'} = "http://" .$site;
		print "Site changed to $site";
	}
	else {
		print "Vaid website must start with www.";
	}
}
elsif($ARGV[0] =~ /r/) {
	$key = $Registry->{'HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main'};
	$keyval = $key->{'\Start Page'};
	print "You home page is $keyval.\n";
}
elsif($ARGV[0] eq 'help') {
	print "\nScript to update your Internet Explorer Home Page.\n\n-u\t\tTo update your home page\n-r\t\tUsed to read your current home page.";
	print "\n\nEx: homepagechange -u www.google.com \nUsed to change your home page to www.google.com\n";
}
else {
	print "Program requires arguments. Use help for more info.";
}
