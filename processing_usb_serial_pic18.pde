// Author: Thai Nguyen
// Date: Oct 5, 2024
// Run this on processing then connect the PIC18 via USB
// Baud rate: 38400
// Need to select right port INDEX in Serial.list()[INDEX], in this case is 7,
// check the console log printArray(Serial.list()) to choose the right index


import processing.serial.*;

Serial myPort;  // The serial port
char letter;
String words = "Receiving: ";
String sendWords = "Sending: ";

void setup() {
  size(1000, 800);
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[7], 38400); 
}

void draw() {
  background(0); // Set background to black
  // Draw the letter to the center of the screen
  textSize(14);
  text("3D Scanner R&D", 50, 50);
  text("Current character received: " + letter, 50, 70);
  text("The Char is " + words.length() +  " characters long", 50, 90);
  
  textSize(36);
  // display text in receiving section
  text(words, 50, 120, 400, 400);

  // display text in sending section
  text(sendWords, 450, 120, 400, 400);
  
  // Read each character received from queue inside of myPort until it empty
  while (myPort.available() > 0) {
    // read the first received data in byte format
    int inByte = myPort.read();
    // convert that into character
    letter = char(inByte);
    // concatenate into big words
    words = words + char(inByte);
  }
}

void keyTyped() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    sendWords = sendWords + key;
    // send data to USB port in number format, key will return character, thus int(key) to cast them to integer
    myPort.write(int(key));
  }
}