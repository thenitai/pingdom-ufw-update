# Update your firewall automatically with Pingdom IPs
This is a simple bash script that updates the firewall (ufw) with the list of Pingdom's server ip addresses, automatically.

## Usage
Simply grab the script and put it on your server (I like to use /opt). Don't forget to make the script executable with:

```
chmod +x /opt/pingdom.sh
```

The script accepts the port for the firewall with the "-p (portnumber)" argument, e.g. if you want to open port 25 you would execute the script with:

```
/opt/pingdom.sh -p 25
```

To keep your firwall constantly updated use cron to run the script every 24 hours or so.

```
01 01 * * * /opt/pingdom.sh
```

