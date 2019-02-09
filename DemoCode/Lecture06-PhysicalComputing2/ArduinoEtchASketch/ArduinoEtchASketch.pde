/*
 * IDEAS:
 *  - have the etch cursor smoke
 *  - show etch cursor
 *  - add in a 'waiting for data'
 *   
 * By Jon Froehlich
 * http://makeabilitylab.io
 * 
 */
import processing.serial.*;
import java.awt.geom.Point2D;

// We communicate with the Arduino via the serial port
Serial _serialPort;

final int ARDUINO__SERIAL_PORT_INDEX = 7;

Point2D.Float _lastPt = null;
Point2D.Float _curPt = null;

void setup() {
  
  size(640, 480);

  // Print all the available serial ports to the console
  printArray(Serial.list());

  // Open the serial port
  _serialPort = new Serial(this, Serial.list()[ARDUINO__SERIAL_PORT_INDEX], 9600);

  // Don't generate a serialEvent() unless you get a newline character:
  _serialPort.bufferUntil('\n');
  
  background(10);
}

void draw() {
  
  if(_curPt != null && _lastPt != null){
    float lastX = map(_lastPt.x, 0, 1, 0, width);
    float lastY = map(_lastPt.y, 0, 1, 0, height); //<>//
    
    float curX = map(_curPt.x, 0, 1, 0, width);
    float curY = map(_curPt.y, 0, 1, 0, height);
    
    stroke(180);
    strokeWeight(4);
    line(lastX, lastY, curX, curY);
  }
}

/**
 *
 *
 */
void serialEvent (Serial myPort) {

  try {
    // Grab the data off the serial port. See: 
    // https://processing.org/reference/libraries/serial/index.html
    String inString = trim(_serialPort.readStringUntil('\n'));
    
    // uncomment this to see what was read in
    // println("Read in: " + inString);

    // Split the comma separated data into individual values
    float [] data = float(split(inString, ','));
    
    if(data.length >= 2){ // we expect at least x,y values from serial
      //&& (_curPt == null || _curPt.x != data[0] || _curPt.y != data[1])
      
      // initialize point objects
      if(_curPt == null){
        _curPt = new Point2D.Float(0,0);
        _lastPt = new Point2D.Float(0,0);
      }
      
      _lastPt.x = _curPt.x;
      _lastPt.y = _curPt.y;
      _curPt.x = data[0];
      _curPt.y = 1 - data[1]; // reverse y direction
      
      println("New data received:");
      println("_lastPt.x=" + _lastPt.x + " _lastPt.y=" + _lastPt.y + " _curPt.x=" + _curPt.x + " _curPt.y=" + _curPt.y);
      //printArray(data);
    }

    // Print out the received data (this is just for debugging, feel free to comment out this line)
    // printArray(data);
  }
  catch(Exception e) {
    println(e);
  }
}
