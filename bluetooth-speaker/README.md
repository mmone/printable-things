After my 2007 MacBook Pro finally died :-( I decided to recycle some of its parts. The sound quality of its tiny speakers was always quite good, so I made this battery powered bluetooth speaker. It's small enough to easily fit into your laptop bag and runs for many hours of the 1200 mAh battery. The speaker grills are cut from the MacBooks original ones.

Happy making.

##### Versions
- v1.0: Initial post.
- v1.2: Stiffened housing, optimised grill recess.
- v1.3: Optimised lip "seal". Added printable grill.


#Parts List

The additional parts needed can be easily sourced online. Although the bluetooth amp is rated for 5V it runs without a problem of the 3.7V lipo battery.
- 1x set of speakers from MacBook Pro model number  A1226, A1211 or A1260.

- 2x 3W Bluetooth amplifier module TE657
This module is sold under many different names. Compare pictures when in doubt.
[ebay.de](http://www.ebay.de/itm/5V-Micro-USB-2x3W-Bluetooth-Audio-Receiver-Digital-Amplifier-Amp-Board-TE657/391647617482) / [banggood.com](https://www.banggood.com/Mini-Bluetooth-Speaker-Digital-Amplifier-Board-USB-Power-Supply-Bluetooth-Receiver-p-1071305.html?p=2510111470354201504I) / [google](https://www.google.com/search?q=sanwu+3W+bluetooth+amp)

- Lipo charger module TE585 a.k.a TP4056
[ebay.de](http://www.ebay.de/itm/10x-TP4056-mit-Batterie-protection-Micro-USB-LIPO-Akkuladeger%C3%A4t-Modul-TE585/381768251934) / [banggood.com](https://www.banggood.com/10X-TP4056-1A-Lipo-Battery-Charging-Board-Charger-Module-Mini-USB-Interface-p-1053635.html?p=2510111470354201504I) / [gearbest.com](http://www.gearbest.com/other-accessories/pp_248278.html?lkid=11051225) / [google](https://www.google.de/search?q=Lipo+Charger+TE585&oq=Lipo+Charger+TP4056)

- Lipo battery 1200 mAh ca. 53 x 30 x 10 mm
[ebay.de](http://www.ebay.de/itm/2x-4x-800mAh-1200mAh-3-7V-25C-Batterie-w-Ladeger%C3%A4t-f%C3%BCr-Syma-X5HC-X5HW-RC-Drone/391701523741) / [banggood.com (1000mAh)](https://www.banggood.com/Bossy-Syma-X5SW-X5SC-Spare-Part-3_7V-1000Mah-25C-Va32-Upgraded-Lipo-Battery-p-984344.html?p=2510111470354201504I) / [gearbest.com](http://www.gearbest.com/rc-quadcopter-parts/pp_246067.html?lkid=11051219) / [google](https://www.google.de/search?q=syma+lipo+battery)

- Mini sliding switch ca. 19.5 x 5.5 x 5mm	
- Two short M3 screws
- Ideally two terminals from a 2.54mm 90° header
- Micro USB power supply for charging


#Printing

The shell is optimised for printing with a 0.4mm nozzle at 0.2 mm layer height. No support is required even the top part with a maximum overhang of 45° prints fine without support. 

The printable grill is easier to make than you might think. I deactivated retracts and overextruded about 10%. 

# Assembly

##### Prepare the speakers

Remove the mounting tabs and the microphone section from the speakers. In general be careful not to cut into the soundbox of the speaker. Check the last picture that shows the cuts to make.

##### Prepare the grills
The grills can be cut by scoring them with a X-Acto knife and breaking them over a sharp (table) edge. Then use a file to fit them into the recess in the top part of the housing.
Remove the black textile backing from them to significantly improve the sound quality.

##### Electrical connections

We need to make the following connections
- The black wire of the battery to the "Bat -" Terminal of the charger module.
- The red wire of the battery to the "Bat +" Terminal of the charger module.
- The "Bat -" Terminal of the lipo charger module to the GND terminal on the bluetooth module.
- The "Bat +" Terminal of the lipo charger module to one terminal of the sliding switch.
- From the sliding switch to the +5V terminal of the bluetooth module.
- The speakers to the output of the bluetooth module.

##### Additional Tips

You could solder the battery directly to the charger module. A better solution is to use two [90° 2.54mm header](http://www.ebay.de/itm/40-Pin-90-Grad-Header-L-Stiftleisten-2-54mm-Arduino-Raspberry-Steckerleiste-/252796042666?var=&hash=item3adbd17daa:m:m98YV9aAamT0mQSV6EpgWYA) terminals and solder them to the charger. I used the terminals without the plastic part and shorted them a little to maintain a low profile. That way we make sure the module still fits in below the left speaker.
Then you remove the two 2.54mm crimped contacts from battery plug housing and plug them onto the header contacts without soldering. Remove them one by one from the housing making sure to isolate them with heat shrink tube or tape right away. The cables to bluetooth module/switch can be soldered directly to the charging module.

*Whatever solution you use make sure to never short the two battery contacts. In the best case you will damage the battery in the worst you'll create a little fire.*

Same as for the battery the crimped contacts of the speakers can be reused by removing them from the plug housing. The cable for the right speaker needs to be shortened though.

##### Mounting the parts

The charger module and the switch can be either glued or "heat-staked" into the housing.
Speakers  and the battery can be fixed with some double sided tape but that is not strictly necessary.
The grills are glued in. I used hot glue for that.
Finally you can wrap a piece of black tape around the light pipe that leads to the status LED on the bluetooth module, this reduces light bleeding into the surrounding housing.
The housing itself holds together well when the two halves are pushed together just through friction.