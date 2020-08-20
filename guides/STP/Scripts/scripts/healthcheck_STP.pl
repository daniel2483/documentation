#!/usr/bin/perl -w
#-----------------------------------------------------#
#    Ericsson script for healthcheck in STP           #
#       Created by: Daniel Rodriguez Sanchez          # 
#       Assisted by: Francisco Zumbado                #
#       Creation date: 14-12-2011                     #
#       Last update:   01-02-2012                     #
#-----------------------------------------------------# 

use Net::Telnet;
use MIME::Lite;
use Net::SMTP;

my $terminal="";
my $password="";
my $fecha=`date +%d%m%y%H`;
chomp($fecha);
$password="eric55on"."\$"."\$";

print "\nInicio ".`date`;
print "Equipo: STP";
$logfile ="/home/ericsson/logs/maintanance/input/STP_$fecha._input_HC.log";
$file_name="/home/ericsson/logs/maintanance/output/STP_$fecha._output_HC.log";
$access='eric55on$$';
print "\nCreating Telnet";
        $telnet = new Net::Telnet ( Timeout=>10,input_log=>$file_name,  output_log=>$logfile,Errmode=>'return');
        $telnet->open("10.196.27.34");
print "\nAccessing Telnet";
        $telnet->waitfor('/> $/i');
        $telnet->print("17");
print "\nAccessing Terminal 17";
        $telnet->waitfor(String     => " Connection established as terminal 17./n");
        $telnet->print("login:uid=ericsson");
print "\nLogin as Ericsson";
        $telnet->waitfor(String     => "Enter Password :");
        $telnet->print("$access");
print "\nPassword Entered";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rept-stat-trbl");
print "\nTrouble checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rept-stat-alm");
print "\nAlarms checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rept-stat-db");
print "\nDatabase checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rept-stat-rtd");
print "\nErrors, RX and TX checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rept-stat-assoc");
print "\nAssociations checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rept-stat-card");
print "\nCards checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rept-stat-dstn");
print "\nDestinations checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rept-stat-iptps");
print "\nTPS checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rtrv-ip-rte");
print "\nRouting Table checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("Rtrv-tbl-capacity");
print "\nCapacity in tables checked";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->print("logout");
print "\nLogout from Ericsson user";
        $telnet->waitfor(String     => "Command Executed/n");
        $telnet->close("10.196.27.34");
print"\nFinalizo ".`date`."\n";
