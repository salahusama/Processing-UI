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
    this.c = color(random(255), random(255), random(255));
    
    smallSize = 0.7 * size;
  }
  
  Point(float cx, float cy)
  {
    pos = new PVector(cx, cy);
    size = random(10, 30);
    c = color(50, 255, 150);
    
    smallSize = 0.3 * size;
  }
  
  void draw()
  {
    noFill();
    stroke(c);
    strokeWeight(2);
    ellipse(pos.x, pos.y, size, size);
    
    fill(255, 0, 0);
    noStroke();
    ellipse(pos.x, pos.y, smallSize, smallSize);
  }
}