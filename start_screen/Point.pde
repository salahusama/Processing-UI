class Point
{
  PVector pos;
  float size;
  float smallSize;
  color c;
  float status;
  
  boolean showBox = false;
  
  Point(float cx, float cy, float size, color c)
  {
    pos = new PVector(cx, cy);
    this.size = size;
    this.c = color(random(255), random(255), random(255));
    
    smallSize = 0.7 * size;
    
    status = random(0, 100);
  }
  
  Point(float cx, float cy)
  {
    pos = new PVector(cx, cy);
    size = random(10, 30);
    c = color(50, 255, 150);
    
    smallSize = 0.3 * size;
    status = random(0, 100);
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
  
  void textBox()
  {
    float x = pos.x + size;
    float y = pos.y + size;
    float boxWidth = 50;
    float boxHeight = 20;
    stroke(255, 50);
    noFill();
    rect(x, y, boxWidth, boxHeight);
    
    fill(255, 100);
    textAlign(CENTER, CENTER);
    if (status > 50) {
      text("Enemy", x + boxWidth/2, y + boxHeight/2);
    }
    else {
      text("Ally", x + boxWidth/2, y + boxHeight/2);
    }
  }
}