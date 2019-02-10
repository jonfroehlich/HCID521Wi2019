import processing.serial.*;

// We communicate with the Arduino via the serial port
Serial _serialPort;

final int ARDUINO_SERIAL_PORT_INDEX = 7;

void setup(){
  size(400, 300);
  //fullScreen();
  noStroke();
  colorMode(HSB, 1.0);  
  
  // Open the serial port
  _serialPort = new Serial(this, Serial.list()[ARDUINO_SERIAL_PORT_INDEX], 9600);
}

void draw(){
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      float hue = map(x, 0, width, 0, 1.0);
      float saturation = map(y, 0, height, 0, 1.0);
      stroke(hue, saturation, 1.0);
      point(x, y);
    }
  }
}

void mousePressed() {
  float hue = map(mouseX, 0, width, 0, 1.0);
  float saturation = map(mouseY, 0, height, 0, 1.0);
  String dataToSend = String.format("%.2f\n",hue);
  println(dataToSend); // print to console
  _serialPort.write(dataToSend); // send the data over serial
}

void serialEvent (Serial myPort) {

  try {
    // Grab the data off the serial port. See: 
    // https://processing.org/reference/libraries/serial/index.html
    String inString = trim(_serialPort.readStringUntil('\n'));
    if(inString != null){
      println("Read in: " + inString);
    }
  }
  catch(Exception e) {
    println(e);
  }
}
