/*
 * TODO
 *   
 * By Jon Froehlich
 * http://makeabilitylab.io
 * 
 */

const int ANALOG_XCONTROL_PIN = A0;
const int ANALOG_YCONTROL_PIN = A1;
const int DELAY_INTERVAL = 100;

void setup() {

  // Turn on Serial so we can communicate with our processing program
  Serial.begin(9600);   
}

void loop() {

  // read the potentiometers
  int xRawVal = analogRead(ANALOG_XCONTROL_PIN);
  int yRawVal = analogRead(ANALOG_YCONTROL_PIN);

  float xValNormalized = xRawVal / 1023.0;
  float yValNormalized = yRawVal / 1023.0;

  Serial.print(xValNormalized);
  Serial.print(",");
  Serial.println(yValNormalized);
 

  delay(DELAY_INTERVAL);
}
