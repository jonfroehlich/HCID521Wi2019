/* 
 * This example parses a single floating point value off of serial [0,1] and plots it to the screen
 * Unlike ArduinoGraph, the graph scrolls automatically
 *
 * By Jon Froehlich
 * http://makeabilitylab.io
 * 
 * This example is based on:
 *  - https://www.arduino.cc/en/Tutorial/Graph
 *  - https://itp.nyu.edu/physcomp/labs/labs-serial-communication/serial-output-from-an-arduino/
 */

import processing.serial.*;

// The serial port is necessary to read data in from the Arduino
// Think of this Processing program just like Arduino's Serial Monitor and Serial Plotter tools
Serial _serialPort;

final int ARDUINO_SERIAL_PORT_INDEX = 7; // our serial port index

int [] _circularBuffer; 
int _curWriteIndex = 0;
int _curReadIndex = 0;

void setup() {
  size(200, 400);

  // Open the serial port
  _serialPort = new Serial(this, Serial.list()[ARDUINO_SERIAL_PORT_INDEX], 9600);

  // Don't generate a serialEvent() unless you get a newline character:
  _serialPort.bufferUntil('\n');
  
  _circularBuffer = new int[width];
  
  // set initial background to black
  background(0);
}

void draw() {
  background(0);
  int xPos = 0;
  
  //print("Graphing " + ((width - _curReadIndex) + (_curWriteIndex)) + " values:");
  
  //println(_curReadIndex + "-" + (width - 1) + " and " + "0-" + (_curWriteIndex));
  
  //TODO I think there is a wraparound bug (might be losing one value, need to double check)
  for (int i = _curReadIndex; i < width; i++){
    // draw the line
    int yVal = _circularBuffer[i];
    drawValue(xPos, yVal);
    xPos++;
  }
  
  for(int i = 0; i < _curWriteIndex; i++){
    int yVal = _circularBuffer[i];
    drawValue(xPos, yVal);
    xPos++;
  }
  
  //println(xPos);
}

void drawValue(int xPos, int yVal){
  int redColor = (int)map(yVal, 0, height, 0, 255);
  stroke(redColor, 34, 255); //set the color
  line(xPos, height, xPos, height - yVal);
}

void serialEvent (Serial myPort) {
  try {
    // Grab the data off the serial port. See: 
    // https://processing.org/reference/libraries/serial/index.html
    String inString = trim(_serialPort.readStringUntil('\n'));
    
    if(inString != null){
      float curArduinoVal = float(inString);
      
      // Convert the arduino val [0,1] to a y-position value
      int curYVal = (int)map(curArduinoVal, 0, 1, 0, height);
      
      _circularBuffer[_curWriteIndex++] = curYVal;
      
      if(_curWriteIndex >= _circularBuffer.length){
        _curWriteIndex = 0;
        _curReadIndex = 1;
      }else if(_curReadIndex > 0){
        _curReadIndex++;
        
        //if(_curReadIndex >= _circularBuffer.length){
        //  _curReadIndex = 0;
        //}
      }
      
      //println("WI=" + _curWriteIndex + " RI=" + _curReadIndex);
      //println("Read in: " + inString + " Converted val: " + curArduinoVal + "(" + (int)(curArduinoVal * 1023) + ")");
    }
  }
  catch(Exception e) {
    println(e);
  }
}
