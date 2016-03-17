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

Replace yourmail@gmail.com with your email address.

Adding to the Pi
---

NOTE: There is another way to add it by calling the script from /etc/rc.local. Both work.

Basic rundown:

Create a file for your startup script and write your script in the file:

    $ sudo nano /etc/init.d/ip_mailer.sh

Save and exit.
Make the script executable:

    $ sudo chmod 755 /etc/init.d/ip_mailer.sh

Register script to be run at startup:

    $ sudo update-rc.d ip_mailer.sh defaults

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
