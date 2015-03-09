#!/usr/local/bin/perl
use Time::Piece;
use Scalar::Util qw(looks_like_number);;
#query user for info
print "Welcome to your friendly retirement calculator!\n";
print "Please enter your name";
cleanInput(chomp($name = <>),"s");
print "Please enter your current retirement balance. \$";
cleanInput(chomp($starting = <>),"n");
print "Please enter your age: ";
cleanInput(chomp($age = <>),"n");
print "Please enter the age you wish to retire: ";
cleanInput(chomp($retireage = <>),"n");
print "Please enter dollar amount you will deposit each year. \$";
cleanInput(chomp($yearlycontrib = <>),"n");
print "Please enter the percentage return you expect: ";
cleanInput(chomp($returnrate = <>),"n");
$returnrate = $returnrate/100;      #get percentage ready to calculate
print "Enter amount you wish to reitre with. \$";
cleanInput(chomp($retirethresh = <>),"n");

$years = $retireage - $age;   #get years to retirement based on age
$t = Time::Piece->new();
$curryear = $t->year;         #get current year
#format headers for output.
print "$name\n";
printf("%5s%13s%13s%17s\n", "Year", "Balance(\$)", "Interest(\$)", "New Balance(\$)");
#loop through years and output results.
$i = 0;
while ($age <= $retireage) {
  #if its the last year just print balance
  if($age == $retireage) {
    printf("%5s   %.2f\n", $curryear+$i, $starting);
    last;
  }
  #pre-output calculations
  $interest = $starting * $returnrate;    #get interest for each year
  $yearend = $starting + $interest;       #get year end balance for each year
  printf("%5s   %.2f     %.2f       %.2f\n", $curryear+$i, $starting, $interest,$yearend );
  #post output calculations for next year
  $starting = $yearend + $yearlycontrib;    #get next years starting balance
  $i++;
  $age++;   #increment year counter
}
#report results of calculations
if($retirethresh < $starting){
  print "Congradulations you can retire!!!!\n"
}
elsif($retirethresh > $starting){
  sleep(10);
  print "Sorry, $name!!!!..... YOU WILL BE A POOR OLD PERSON!!!!\n";
}

#function to validate input.
#passes the input and what time it should be. Currently supports string and numbers. TODO validate percent and double
sub cleanInput{
  @info = @_;
  #decide if user entered string
  if($info[1] == "s") {
    if(looks_like_number($info[0])) {
      print "Field requires string. Invalid Entry, try again.\n";
      die;
    }
  }
  #decide if user entered a number
  elsif($info[1] == "n") {
    if(!looks_like_number($info[0])){
      print "Field requires a number. Invalid Entry";
      die;
    }
  }
  #elsif($info[1] == "d") {
  #
  #}
  #decide if function was called correctly.
  else {
    print "2nd paramater: Invalid in cleanInput subroutine"
  }
}

