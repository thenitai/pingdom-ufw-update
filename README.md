# Update your firewall automatically with Pingdom IPs
This is a simple bash script that updates the firewall (ufw) with the list of Pingdom's server ip addresses, automatically.

## Usage
Simply grab the script and put it on your server (I like to use /opt). Give the script executable permission and run it.

For a constantly updated firewall you can use cron to run the script every 24 hours or so.

```
01 01 * * * /opt/pingdom.sh
```
