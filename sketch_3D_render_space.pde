// Sample list of (x, y, z) coordinates
float[][] points = {
  {50, 50, 50},
  {100, 100, 0},
  {150, 50, -100},
  {200, 150, 50},
  {50, -50, 100},
  {0, 0, 0},
  {-100, -100, -100}
};

void setup() {
  size(600, 600, P3D);  // 3D rendering
  background(255);      // White background
  stroke(0);            // Black stroke for dots and axes
}

void draw() {
  lights();
  background(0);
  translate(width/2, height/2, 0);  // Move origin to center of the window

  // Change height of the camera with mouseY
  camera(mouseX, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  

  // Draw X, Y, Z axes
  drawAxes();

  // Plot each point
  for (int i = 0; i < points.length; i++) {
    float x = points[i][0];
    float y = points[i][1];
    float z = points[i][2];
    
    strokeWeight(8);   // Size of the dot
    point(x, y, z);    // Draw the point at (x, y, z)
  }
}

// Function to draw the X, Y, Z axes
void drawAxes() {
  strokeWeight(2);
  
  // X-axis (red)
  stroke(255, 0, 0);    // Red color for X axis
  line(-300, 0, 0, 300, 0, 0);  // X axis from (-300,0,0) to (300,0,0)
  
  // Y-axis (green)
  stroke(0, 255, 0);    // Green color for Y axis
  line(0, -300, 0, 0, 300, 0);  // Y axis from (0,-300,0) to (0,300,0)
  
  // Z-axis (blue)
  stroke(0, 0, 255);    // Blue color for Z axis
  line(0, 0, -300, 0, 0, 300);  // Z axis from (0,0,-300) to (0,0,300)
}
