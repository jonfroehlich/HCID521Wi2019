# HCID521Wi2019
The github repo for HCID521 - Prototyping Studio Winter 2019

## Digital Output Examples
[Blink.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/Blink/Blink.ino)<br/>
Turns on and off Pin 3 once a second

[BlinkWithSerialPrint.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/BlinkWithSerialPrint/BlinkWithSerialPrint.ino)<br/>
Turns on and off Pin 3 and shows how to use Serial.print to print values to the Serial Monitor

[Blink2.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/Blink2/Blink2.ino)<br/>
Demonstrates two configurations of activating LEDs. One where the LED   anode (long leg) is pointed towards an output pin (in this case, Pin 3). In this configuration, driving Pin 3 HIGH will turn on the LED. And the second where the LED anode is connected to 5V and the cathode is connected towards Pin 4. In this configuration, driving Pin 4 HIGH will turn off the LED. See lecture slides for details.

## Analog Output Examples
## Using an LED
[FadeOneDirection.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/FadeOneDirection/FadeOneDirection.ino)<br/>This example shows how to fade an LED on Pin 3 using the `analogWrite()` function. The fade goes in one direction (from off to a fade on) and then repeats (off to fade on)

[Fade.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/Fade/Fade.ino)<br/>
This example shows how to fade an LED on Pin 3 using the `analogWrite()` function. The fade goes both directions (fades on and then fades off)

### Using the RGB LED
[BlinkRGB.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/BlinkRGB/BlinkRGB.ino)<br/>
Flashes (blinks) through a series of colors using the RGB LED. For a simpler version of this code, see BlinkRGBSimple.ino.

[BlinkRGBSimple.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/BlinkRGBSimple/BlinkRGBSimple.ino)<br/>
Flashes (blinks) through a series of colors using the RGB LED. Should be more straightforward to understand than BlinkRGB.ino

[BlinkRGBBrightness.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/BlinkRGBBrightness/BlinkRGBBrightness.ino)<br/>
Flashes (blinks) through a series of colors using the RGB LED. The brightness of the RGB LED is set by `_curBrightness`, which ranges from [0, 100] where 100 is brightest and 0 is off.

[FadeRGB.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/DemoCode/Lecture03-PhysicalComputing1/FadeRGB)<br/>
Fades through all of the colors of the RGB LED.

[FadeHSL.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/DemoCode/Lecture03-PhysicalComputing1/FadeHSL)<br/>
Fades through all of the colors of the RGB LED using the HSL color space.

## Analog Input Examples

### Using a Trim Potentiometer
The trim potentiometers you have in your kits have 0 - 10K ohms of resistance ([see the Adafruit website](https://www.adafruit.com/product/356?gclid=Cj0KCQiA1sriBRD-ARIsABYdwwGDMgwBoyz1exlAjqUqEU3sLbYekY7SDkNCvGySmwVg8JoNQq4CXrUaAiTbEALw_wcB))

[TrimpotLED.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/TrimpotLED/TrimpotLED.ino)<br/>
This example reads in a potentiometer value (from A0) and sets the brightness of an LED (hooked up to Pin 3).

[TrimpotRGBBrightness.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/TrimpotRGBBrightness/TrimpotRGBBrightness.ino)<br/>
This example reads in a potentiometer value (from A0) and sets the brightness of an RGB LED. For a simpler though less responsive version of this program, see TrimpotRGBBrightnessSimple.

[TrimpotRGBBrightnessSimple.ino](https://github.com/jonfroehlich/HCID521Wi2019/tree/master/Arduino/TrimpotRGBBrightnessSimple/TrimpotRGBBrightnessSimple.ino)<br/>
This example reads in a potentiometer value (from A0) and sets the brightness of an RGB LED. While more straightforward than TrimpotRGBBrightness, it uses delay() function calls which makes the prototype seem less responsive to changes in the potentiometer.
