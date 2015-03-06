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
$returnrate = $returnrate/100;
print "Enter amount you wish to reitre with. \$";
chomp ($retirethresh = <>);
$years = $retireage - $age;
$t = Time::Piece->new();
$curryear = $t->year;
printf("%5s%13s%13s%17s\n", "Year", "Balance(\$)", "Interest(\$)", "New Balance(\$)");
$i = 0;
while ($age <= $retireage) {
  if($age == $retireage) {
    printf("%5s   %.2f\n", $curryear+$i, $starting);
    last;
  }
  $interest = $starting * $returnrate;
  $yearend = $starting + $interest;
  printf("%5s   %.2f     %.2f       %.2f\n", $curryear+$i, $starting, $interest,$yearend );
  $starting = $yearend + $yearlycontrib;
  $i++;
  $age++;
}

if($retirethresh < $starting){
  print "Congradulations you can retire!!!!\n"
}
elsif($retirethresh > $starting){
  $num = 10;
  while($num--){
    sleep(1);
  }
  print "Boom!!!!..... YOU WILL BE A POOR OLD PERSON!!!!\n";

}

