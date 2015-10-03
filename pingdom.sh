#!/bin/bash

# Grab the pingdom feed
/usr/bin/wget https://www.pingdom.com/rss/probe_servers.xml -O /root/probe_servers.xml -o /dev/null
/bin/cat /root/probe_servers.xml | grep IP | sed -e 's/.*IP: //g' | sed -e 's/; Host.*//g' | grep -v IP > /root/pingdom_ips
# Remove existing file
/bin/rm /root/pingdom_rules.sh
# Loop over IPs
for ip in `cat /root/pingdom_ips`
	do
		/bin/echo "ufw allow from $ip to any port 27017" >> /root/pingdom_rules.sh
done
# Make file executable
chmod +x /root/pingdom_rules.sh
# Now that we have all rules in the file, simply execute and add the rules
sh /root/pingdom_rules.sh

