#!/usr/local/bin/perl
#By John Redlich   2/26/2015   BCS316  password_ex_15
#set correct password
$pass = "password3";
#setup some varriables to store some info.
@wrongpass;
$failed = 4;
#as long we haven't hit our max tries get some passwords
while($failed >= 0) {
  print "Please enter your password. You have $failed attempts left:\n";
  #Give 2 chances then check if password is too short.
  if ($failed < 3 && $wronglength < 6) {
    print "The password you entered was too short. Passwords are at least 6 characters.\n";
  }
  #get passwords from users
  chomp($passguess = <>);
  #check passwords
  #if we get the right password get into the program
  if ($pass eq $passguess) {
    print "That password is correct. Welcome to the program\n";
    last;
  }
  #if its wrong keep a record
  else {
    #keep a record of wrong guesses
    push(@wrongpass,$passguess);
    #get the length of wrong guesses
    $wronglength = length $passguess;
    #decrement failed tries
    $failed--;
    #if we reach the max number of tries end.
    if($failed < 0) {
      print "\nSorry you have failed too many times.\n";
      print "Your wrong guesses were: \n";
      foreach $p(@wrongpass){
        print $p."\n";
      }
    }
  }
}
