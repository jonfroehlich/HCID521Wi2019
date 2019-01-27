/*
 * Turns on and off pin 3 once a second and writes to the serial port
 * 
 * By Jon Froehlich
 * http://makeabilitylab.io
 * 
 * Adapted from the official Arduino Blink example:
 *   File -> Examples -> 01. Basics -> Blink
 */

const int LED_OUTPUT_PIN = 3;

// The setup function runs once when you press reset or power the board
void setup() {
  // Because pins 0 - 13 can either be input or output, we must specify
  // how we're using the pin by using pinMode. In this case, we want to
  // control an LED, so set the pin to OUTPUT
  pinMode(LED_OUTPUT_PIN, OUTPUT);

  Serial.begin(9600); // Turn on the serial port, which is necessary for Serial.print
}

// The loop function runs over and over again forever
void loop() {
  int ledVal = HIGH;
  digitalWrite(LED_OUTPUT_PIN, ledVal);   // turn the LED on (HIGH is the voltage level)
  Serial.println(ledVal);
  delay(500);                             // wait 500ms
  ledVal = LOW;
  digitalWrite(LED_OUTPUT_PIN, ledVal);   // turn the LED off by making the voltage LOW
  Serial.println(ledVal);
  delay(500);                            // wait 500ms
}
