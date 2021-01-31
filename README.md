# Stay Distant. Stay Connected

This is a generative art that informs the relationship between people in the covid pandemic situation. The project is set up in a Raspberry Pi with a monitor and a LED module. The Processing script for the visual art and the Python script to control the LEDs can be found in this Git Repo. 

The link to a video demo: https://youtu.be/EPbmIt9Rpxk

# To reproduce the project

Make sure your Raspberry Pi is connected to a monitor and a LED module.

Clone this repo into your Raspberry Pi and run the following to start the Processing script.

```
/usr/local/bin/processing-java --sketch=/home/path_to_the_repo/stayConnected --run
```

Then, run led.py to start the LEDs, which will need root permission so make sure you run it with sudo.
```
sudo python3 /home/path_to_the_repo/led.py
```

To run the project on boot, add the above lines to "~/.config/lxsession/LXDE-pi/autostart" or "/etc/xdg/lxsession/LXDE-pi/autostart"
