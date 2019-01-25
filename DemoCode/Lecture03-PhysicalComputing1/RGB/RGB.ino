/*
 * This example changes the colors of the RGB LED
 * 
 * By Jon Froehlich for HCID521
 * http://makeabilitylab.io
 * 
 * Adapted from https://learn.adafruit.com/adafruit-arduino-lesson-3-rgb-leds?view=all
 */

// Change this to 0 if you are working with a common cathode RGB LED
// We purchased Common Anode RGB LEDs for class: https://www.adafruit.com/product/159
#define COMMON_ANODE 1 

const int RGB_RED_PIN = 6;
const int RGB_GREEN_PIN  = 5;
const int RGB_BLUE_PIN  = 3;
const int DELAY = 1000; // delay in ms between changing colors

void setup() {
  // Set the RGB pins to output
  pinMode(RGB_RED_PIN, OUTPUT);
  pinMode(RGB_GREEN_PIN, OUTPUT);
  pinMode(RGB_BLUE_PIN, OUTPUT);

  // Turn on Serial so we can verify expected colors via Serial Monitor
  Serial.begin(9600); 
}

void loop() {

  Serial.println("Color=Red");
  setColor(255, 0, 0);  // red
  delay(DELAY);

  Serial.println("Color=Green");
  setColor(0, 255, 0);  // green
  delay(DELAY);

  Serial.println("Color=Blue");
  setColor(0, 0, 255);  // blue
  delay(DELAY);

  Serial.println("Color=Yellow");
  setColor(255, 255, 0);  // yellow
  delay(DELAY);  

  Serial.println("Color=Purple");
  setColor(80, 0, 80);  // purple
  delay(DELAY);

  Serial.println("Color=Aqua");
  setColor(0, 255, 255);  // aqua
  delay(DELAY);

  Serial.println("Color=White");
  setColor(255, 255, 255);  // white
  delay(DELAY);
}

/**
 * setColor takes in values between 0 - 255 for the amount of red, green, and blue, respectively
 * where 255 is the maximum amount of that color and 0 is none of that color. You can illuminate
 * all colors by intermixing different combinations of red, green, and blue
 * 
 * This function is based on https://gist.github.com/jamesotron/766994
 * 
 */
void setColor(int red, int green, int blue)
{
  Serial.print("Setting color to");
  Serial.print(" RED=");
  Serial.print(red);
  Serial.print(" GREEN=");
  Serial.print(green);
  Serial.print(" BLUE=");
  Serial.println(blue);
  
  #ifdef COMMON_ANODE
    red = 255 - red;
    green = 255 - green;
    blue = 255 - blue;
  #endif
  analogWrite(RGB_RED_PIN, red);
  analogWrite(RGB_GREEN_PIN, green);
  analogWrite(RGB_BLUE_PIN, blue);  
}
