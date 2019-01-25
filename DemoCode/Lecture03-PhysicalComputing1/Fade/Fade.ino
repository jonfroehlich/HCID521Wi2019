/*
 * This example shows how to fade an LED on pin 3 using the analogWrite() function 
 * 
 * The analogWrite() function uses PWM, so if you want to change the pin you're
 * using, be sure to use another PWM capable pin. On the Arduino Uno, the PWM pins
 * are identified with a "~" sign, like ~3, ~5, ~6, ~9, ~10 and ~11. 
 * 
 * By Jon Froehlich for HCID521
 * http://makeabilitylab.io
 * Adapted from http://www.arduino.cc/en/Tutorial/Fade
 */

const int LED_OUTPUT_PIN = 3;

int _fadeAmount = 5;      // the amount to fade the LED by on each step
int _curBrightness = 0;   // how bright the LED is
int _minBrightness = 0;   // the min allowable analogWrite value is 0. Must be less than _maxBrightness
int _maxBrightness = 128; // the max allowable analogWrite value is 255. Must be greater than _minBrightness

void setup() {
  pinMode(LED_OUTPUT_PIN, OUTPUT);
}

void loop() {
  
  // set the brightness of pin D0:
  analogWrite(LED_OUTPUT_PIN, _curBrightness);

  // change the brightness for next time through the loop:
  _curBrightness = _curBrightness + _fadeAmount;

  // reverse the direction of the fading at the ends of the fade:
  if (_curBrightness <= _minBrightness || _curBrightness >= _maxBrightness) {
    _fadeAmount = -_fadeAmount; // reverses fade direction
  }
  
  // wait for 30 milliseconds to see the dimming effect
  delay(30);
}

/*
 * While correct, the following code is an inferior implementation of the fade program, 
 * which is why it's commented out. I included it for educational purposes.
 * 
 * Can you think of why?
 * 
 * Answer: generally, we want to keep the loop() function as fast as possible
 * as it will increase the perceived responsiveness of our program. While
 * it doesn't matter in this case--because this code is so simple--generally,
 * your Arduino code will be performing read operations (e.g., digitalRead, digitalWrite). 
 * If you're stuck in these long 'for loops' with lots of delays, you are going to
 * negatively impact your sampling rate of your read calls. 
 */
//void loop(){
//  for(int i = 0; i <= _maxBrightness; i += _fadeAmount){
//    analogWrite(LED_OUTPUT_PIN, i);
//    delay(30);
//  }
//
//  for(int i = _maxBrightness; i >= 0; i -= _fadeAmount){
//    analogWrite(LED_OUTPUT_PIN, i);
//    delay(30);
//  }
//}
