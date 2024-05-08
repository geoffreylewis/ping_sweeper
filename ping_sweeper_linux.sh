#!/bin/bash

################
# Ping Sweeper #
################

# Note: You can run this with syntax "./ping_sweeper_linux.sh <the first 3 octets of the IP address range>".

# Additional Note: It would be best to redirect the output of this script to a file.
# An example would be "./ping_sweeper_linux.sh 192.168.4.33 > ping_results.txt"; that kind of thing.
# Displaying the output on Terminal sometimes looks...messy. 

# If you forget to put in the first 3 octets of the IP address, the script will remind you of the missing syntax.
if [$1 == ""]
then
    echo "You forgot an IP address!  Make sure to not forget the first 3 octets."
    echo "The syntax should be: \"./ping_sweeper_linux.sh 192.168.4\" or something to that effect."

# Ping every possible IP in the last octet at the same time.
else
    # Starting Banner
    echo "================="
	echo "Starting sweep..."
	echo "================="
    echo ""

    # Pinging every IP, looking for responses, and displaying those.
    for ip in `seq 1 254`;
    do 
        ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
    done
fi