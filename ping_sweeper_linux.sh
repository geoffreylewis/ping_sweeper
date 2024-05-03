#!/bin/bash

# If you forget to put in the first 3 octets of the IP address, the script will remind you of the missing syntax.
if [$1 == ""]
then
    echo "You forgot an IP address!  Make sure to not forget the first 3 octets."
    echo "The syntax should be: \"./ping_sweeper_linux.sh 192.168.4\" or something to that effect."

# Ping every possible IP in the last octet at the same time.
else
    for ip in `seq 1 254`;
    do 
        ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
    done

fi