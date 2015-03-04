#!/usr/local/bin/perl
print "Welcome to your friendly retirement calculator!\n";
print "Please enter your current retirement balance. \$";
chomp($starting = <>);
print "Please enter your age: ";
chomp($age = <>);
print "Please enter the age you wish to retire: ";
chomp($retireage = <>);
print "Please enter dollar amount you will deposit each year. \$";
chomp($yearlycontrib = <>);
print "Please enter the percentage return you expect: ";
chomp($returnrate = <>);
print "Enter amount you wish to reitre with. \$";
chomp ($retirethresh = <>);
