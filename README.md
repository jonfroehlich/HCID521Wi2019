# HCID521Wi2019
The github repo for HCID521 - Prototyping Studio Winter 2019

## Digital Output Examples
[Blink.ino](https://github.com/jonfroehlich/HCID521Wi2019/blob/master/DemoCode/Lecture03-PhysicalComputing1/Blink/Blink.ino)<br/>
Turns on and off Pin 3 once a second

[BlinkWithSerialPrint](https://github.com/jonfroehlich/HCID521Wi2019/blob/master/DemoCode/Lecture03-PhysicalComputing1/BlinkWithSerialPrint/BlinkWithSerialPrint.ino)<br/>
Turns on and off Pin 3 and shows how to use Serial.print to print values to the Serial Monitor

[Blink2.ino](https://github.com/jonfroehlich/HCID521Wi2019/blob/master/DemoCode/Lecture03-PhysicalComputing1/Blink2/Blink2.ino)<br/>
Demonstrates two configurations of activating LEDs. One where the LED   anode (long leg) is pointed towards an output pin (in this case, Pin 3). In this configuration, driving Pin 3 HIGH will turn on the LED. And the second where the LED anode is connected to 5V and the cathode is connected towards Pin 4. In this configuration, driving Pin 4 HIGH will turn off the LED. See lecture slides for details.

## Analog Output Examples
[BlinkRGB.ino](https://github.com/jonfroehlich/HCID521Wi2019/blob/master/DemoCode/Lecture03-PhysicalComputing1/BlinkRGB/BlinkRGB.ino)<br/>
Flashes (blinks) through a series of colors using the RGB LED

[BlinkRGBSimple.ino](https://github.com/jonfroehlich/HCID521Wi2019/blob/master/DemoCode/Lecture03-PhysicalComputing1/BlinkRGBSimple/BlinkRGBSimple.ino)<br/>
Flashes (blinks) through a series of colors using the RGB LED. Should be more straightforward to understand than BlinkRGB.ino

[BlinkRGBBrightness.ino](https://github.com/jonfroehlich/HCID521Wi2019/blob/master/DemoCode/Lecture03-PhysicalComputing1/BlinkRGBBrightness/BlinkRGBBrightness.ino)<br/>
Flashes (blinks) through a series of colors using the RGB LED. The brightness of the RGB LED is set by `_curBrightness`, which ranges from [0, 100] where 100 is brightest and 0 is off.`

