float cellSize = 10;

float radius = 150;
float theta = 0;
float a = 0;
float r = radius;
float cx, cy;
float g = 0;

void setup()
{
  fullScreen();
  frameRate(60);
  
  background(0);
  noStroke();
}

void draw()
{
  background(0);
  grid();
  shape();
  
  theta += 0.1;
}

void shape()
{
  float scale = 80;
  fill(0, 255, 255);
  
  cx = width / 2 + r * cos(theta);
  cy = height / 2 - r * sin(theta);
  
  ellipse(cx, cy, 50, 50);
  
  theta += 0.1;
  a += 0.005;
  r = radius + scale * sin(a * 10);
  /* 10 is the number of bends
   * 5 is how big the dent is
   */
}