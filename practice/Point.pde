class Point
{
  PVector pos;
  float size;
  float smallSize;
  color c;
  
  Point(float cx, float cy, float size, color c)
  {
    pos = new PVector(cx, cy);
    this.size = size;
    this.c = c;
    
    smallSize = 0.3 * size;
  }
  
  Point(float cx, float cy)
  {
    pos = new PVector(cx, cy);
    size = random(10, 30);
    c = color(255, 0, 0);
    
    smallSize = 0.3 * size;
  }
  
  void draw()
  {
    noFill();
    stroke(255);
    ellipse(pos.x, pos.y, size, size);
    
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, smallSize, smallSize);
  }
}