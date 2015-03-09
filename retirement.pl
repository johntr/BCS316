#!/usr/local/bin/perl
use Time::Piece;
use Scalar::Util qw(looks_like_number);;
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
$returnrate = $returnrate/100;
print "Enter amount you wish to reitre with. \$";
cleanInput(chomp($retirethresh = <>),"n");

$years = $retireage - $age;
$t = Time::Piece->new();
$curryear = $t->year;
print "$name\n";
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
  sleep(10);
  print "Sorry, $name!!!!..... YOU WILL BE A POOR OLD PERSON!!!!\n";
}

#function to validate input.
sub cleanInput{
  @info = @_;
  if($info[1] == "s") {
    if(looks_like_number($info[0])) {
      print "Field requires string. Invalid Entry, try again.\n";
      die;
    }
  }
  elsif($info[1] == "n") {
    if(!looks_like_number($info[0])){
      print "Field requires a number. Invalid Entry";
      die;
    }
  }
  #elsif($info[1] == "d") {
  #
  #}
  else {
    print "2nd paramater: Invalid in cleanInput subroutine"
  }
}

