/*
 * This example changes the colors of the RGB LED and should be more 
 * straightforward to undertand than BlinkRGB
 * 
 * By Jon Froehlich
 * http://makeabilitylab.io
 * 
 * Adapted from https://learn.adafruit.com/adafruit-arduino-lesson-3-rgb-leds?view=all
 */

const int RGB_RED_PIN = 6;
const int RGB_GREEN_PIN  = 5;
const int RGB_BLUE_PIN  = 3;
const int DELAY = 1000; // delay in ms between changing colors

void setup() {
  // Set the RGB pins to output
  pinMode(RGB_RED_PIN, OUTPUT);
  pinMode(RGB_GREEN_PIN, OUTPUT);
  pinMode(RGB_BLUE_PIN, OUTPUT);
}

void loop() {

  // Because the RGB LED we purchased for the class is a 'common anode'
  // RGB, the way we turn on each light is counter to our intuition
  // We set a pin to 0 to turn on the corresponding LED to its maximum brightness
  // and 255 to turn it off (the opposite of what you might think)

  // Set the RGB LED to red
  analogWrite(RGB_RED_PIN, 0);      // turn on the red LED
  analogWrite(RGB_GREEN_PIN, 255);  // turn off the green LED
  analogWrite(RGB_BLUE_PIN, 255);   // turn off the blue LED
  delay(DELAY);

  // Set the RGB LED to green
  analogWrite(RGB_RED_PIN, 255);    // turn off the red LED
  analogWrite(RGB_GREEN_PIN, 0);    // turn on the green LED
  analogWrite(RGB_BLUE_PIN, 0);     // turn on the blue LED
  delay(DELAY);

  // Set the RGB LED to blue
  analogWrite(RGB_RED_PIN, 255);    // turn off the red LED
  analogWrite(RGB_GREEN_PIN, 255);  // turn off the green LED
  analogWrite(RGB_BLUE_PIN, 0);     // turn on the blue LED
  delay(DELAY);

  // Set the RGB LED to yellow (by turning on green and blue!)
  analogWrite(RGB_RED_PIN, 255);    // turn off the red LED
  analogWrite(RGB_GREEN_PIN, 0);    // turn on the green LED
  analogWrite(RGB_BLUE_PIN, 0);     // turn on the blue LED
  delay(DELAY);

  // Set the RGB LED to purple (by turning on red and blue!)
  analogWrite(RGB_RED_PIN, 0);      // turn on the red LED
  analogWrite(RGB_GREEN_PIN, 255);  // turn off the green LED
  analogWrite(RGB_BLUE_PIN, 0);     // turn on the blue LED
  delay(DELAY);
}
