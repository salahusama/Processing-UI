float cellHeight;
float cellWidth;

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
  
  cellHeight = height / 20;
  cellWidth = width / 20;
}

float s = 0;

void draw()
{
  //background(0);
  grid();
  
  if (theta < 76) {
    ellipse(width / 2, height / 2, s, s);
    shape();
    println(s);
    
    s += map(1, 0, 180, 0, 76);
    theta += 0.1;
  }
  else {
    ellipse(width / 2, height / 2, s, s);
    s = lerp(s, width * 2, 0.1);
  }
  
}

void shape()
{
  float scale = 20;
  fill(0, 255, 255);
  
  cx = width / 2 + r * cos(theta);
  cy = height / 2 - r * sin(theta);
  
  ellipse(cx, cy, 5, 5);
  
  theta += 0.1;
  a += 0.1;
  r = radius + scale * sin(a * 5);
  /* 10 is the number of bends
   * 5 is how big the dent is
   */
}