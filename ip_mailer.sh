#!/bin/bash
# /etc/init.d/ip_mailer.sh

### BEGIN INIT INFO
# Provides:          ip_mailer.sh
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Simple script to start a program at boot
# Description:       A simple script to email you your IP address.
### END INIT INFO

# Script to send IP when connected
# Gautham Ponnu

function ping_check
	{
		ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo 1 || echo 0
	}

# Main Starts
while true; do
		if ping_check "1"; then
			ifconfig | mailx -s "Hello from your Raspberry Pi" EDITTHIS@gmail.com
			break
		else
			sleep 20
		fi
	done
exit 0
