#!/usr/local/bin/perl
use Time::Piece;
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
$years = $retireage - $age;
$t = Time::Piece->new();
$curryear = $t->year;
printf("%5s%10s%10s%15s\n", "Year", "Balance", "Interest", "New Balance");
$i = 0;
while ($age <= $retireage) {
  $interest = $starting*$returnrate;
  $yearend = $starting+$interest;
  printf("%5s%10s%10s%15s\n", $curryear+$i, $starting, $interest,$yearend );
  $i++;
  $age++;
}
