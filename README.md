RPi-IP-mailer is a shell script to send your IP address to an email account from your Raspberry Pi. It offers easy workflow when you're working with the Raspberry Pi in a headless configuration ( i.e. Just WiFi-Dongle without keyboard, mouse or monitor)

Install Dependencies
---
The following are dependencies.

	$ sudo apt-get update
	$ sudo apt-get install mailutils
	$ sudo apt-get install sendmail

Check whether the command works
---

Run this command

	$ ifconfig | mailx -s "Hello from your Raspberry Pi" yourmail@gmail.com

Replace yourmail@gmail.com with your email address. You should now recieve a mail.

Download 
---

Easiest way would be
	
	$ curl --remote-name https://raw.githubusercontent.com/gapo/RPi-IP-mailer/master/ip_mailer.sh
	$ sudo mv ip_mailer.sh /etc/init.d/.
	$ sudo chmod 755 /etc/init.d/ip_mailer.sh

Adding to the Pi
---

NOTE: There is another way to add it by calling the script from /etc/rc.local. Both work.

Register script to be run at startup:

    $ sudo update-rc.d ip_mailer.sh defaults 19

ENABLING AUTO-LOGIN (FOR HEADLESS OPERATION)
---

> This method works in headless configuration, only if you enable autologin.

Edit the inittab file:

	sudo nano /etc/inittab

Scroll down to:

	1:2345:respawn:/sbin/getty 115200 tty1

and change to

	#1:2345:respawn:/sbin/getty 115200 tty1

Under that line add:

	1:2345:respawn:/bin/login -f pi tty1 </dev/tty1 >/dev/tty1 2>&1

Save and exit.

Removal
---

If you ever want to remove the script from start-up, run the following command:

	$ sudo update-rc.d -f ip_mailer.sh remove 
	
To Do
---

- Figure way out to ensure it runs without login. (Is this even possible)
- Sort the dependencies. Do we really need this many.
