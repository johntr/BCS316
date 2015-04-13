#!/usr/local/bin/perl
#List of our spelled out letters
@numbers = ("Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine");
#go until the user says END
while($usernum ne "END"){
  print "Please enter a number from (0-9): Type END to quit\n";
  chomp($usernum = <>);
#find our letter then print out word.
  if($usernum =~ /^[0-9]$/){
    print "$numbers[$usernum]\n";
  }
  #Error checking hell
  #check if decimal
   elsif ($usernum =~ /[0-9]+\.[0-9]+/) {
    print "Decimals are just the worst. I am not spelling them.\n";
  }
  #check if greater than 9
   elsif ($usernum > 9) {
    print "Too big to fail... errr spell.\n";
  }
  #check if special char
  elsif ($usernum =~ /[^\.]\W/) {
    print "That isn't even a letter. I can only do digits.. c'mon man.\n"
  }
  #If user ends print this out.
  elsif ($usernum =~ /END/) {
    print "Thanks for using me!\n";
    last; #besure we are ending the program after displaying this text.
  }
  #if negative number
  elsif ($usernum < 0) {
    print "Lets keep it positive... numbers.\n";
  }
  #if not a number
  elsif ($usernum =~ /\D/) {
    print "That is not a number... that is a letter...what are you trying to pull here?\n";
  }
  #check if user didn't enter anything.
  elsif ($usernum == ""){
    print "You didn't enter anything.. what is up with that?!\n";
  }
}
