#!/usr/bin/perl -w

my $size;

@stp_check=`(sleep 5;echo "17";sleep 5;echo ">login:uid=ericsson";sleep 5;echo 'futb0l$$')| telnet 10.196.27.34`; #>> /home/home/ericsson/logs/telnet_connection.log


$size=@stp_check;

foreach(@stp_check){
        print $_;
                }

