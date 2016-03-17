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

Basic rundown:

    Create a file for your startup script and write your script in the file:

    $ sudo nano /etc/init.d/ip_mailer.sh

    Save and exit.

    Make the script executable:

    $ sudo chmod 755 /etc/init.d/ip_mailer.sh

    Register script to be run at startup:

    $ sudo update-rc.d ip_mailer.sh defaults

Removal
---

If you ever want to remove the script from start-up, run the following command:

	$ sudo update-rc.d -f ip_mailer.sh remove 
	
To Do
---

- Figure way out to ensure it runs without login. (Is this even possible)
- Sort the dependencies. Do we really need this many.
