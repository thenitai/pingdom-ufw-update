#!/bin/bash

# Grab the port from arguments
while getopts p: name
do
	case $name in
		p)port=$OPTARG;;
		*)echo 'Looks like you gave me an invalid argument.';;
	esac
done

# If port is not defined
if [ -z "$port" ]; 
	then 
		echo 'You forgot to define the port with -p (portnumber)';
		exit;
fi

# Grab the pingdom feed
/usr/bin/wget https://www.pingdom.com/rss/probe_servers.xml -O /root/probe_servers.xml -o /dev/null
/bin/cat /root/probe_servers.xml | grep IP | sed -e 's/.*IP: //g' | sed -e 's/; Host.*//g' | grep -v IP > /root/pingdom_ips

# Remove existing file
if [ -f /root/pingdom_rules.sh ]
	then
		/bin/rm /root/pingdom_rules.sh
fi

# Loop over IPs
for ip in `cat /root/pingdom_ips`
	do
		/bin/echo "ufw allow from $ip to any port $port" >> /root/pingdom_rules.sh
done

# Make file executable
chmod +x /root/pingdom_rules.sh

# Now that we have all rules in the file, simply execute and add the rules
sh /root/pingdom_rules.sh

