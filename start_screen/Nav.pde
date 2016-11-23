class Nav
{
  float cx, cy;
  float theta;
  float diameter;
  float radius;
  float gap;
  float speed = 5;
  
  PShape shape;
  
  Nav(float cx, float cy, float diameter)
  {
    this.cx = cx;
    this.cy = cy;
    this.diameter = diameter;
    
    radius = diameter / 2;
    theta = 0;
    gap = 0.2 * radius;
  }
  
  void display()
  {
    float textSize = 20;
    
    pushMatrix();
    translate(cx, cy);
    rotate(theta);
    
    // create shape
    //
    stroke(255);
    strokeWeight(5);
    
    line(0, 0 - gap, 0, - radius);
    line(0, 0 + gap, 0, radius);
    
    line(gap, 0, radius, 0);
    line(- gap, 0, - radius, 0);
    
    fill(255, 255, 0);
    textSize(textSize);
    
    textAlign(CENTER, BOTTOM);
    text("N", 0, - (radius + textSize));
    textAlign(CENTER, TOP);
    text("S", 0, (radius + textSize));
    
    textAlign(RIGHT, CENTER);
    text("E", (radius + 2 * textSize), 0);
    textAlign(LEFT, CENTER);
    text("W", - (radius + 2 * textSize), 0);
    
    popMatrix();
    
    if ( checkKey('d') ) {
      theta += -0.1;
    }
    if ( checkKey('a') ) {
      theta += 0.1;
    }
  }
  
}