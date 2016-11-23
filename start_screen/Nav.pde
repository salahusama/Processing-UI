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
    
    line(cx, cy - gap, cx, cy - radius);
    line(cx, cy + gap, cx, cy + radius);
    
    line(cx + gap, cy, cx + radius, cy);
    line(cx - gap, cy, cx - radius, cy);
    
    fill(255, 255, 0);
    textSize(textSize);
    
    textAlign(CENTER, BOTTOM);
    text("N", cx, cy - (radius + textSize));
    textAlign(CENTER, TOP);
    text("S", cx, cy + (radius + textSize));
    
    textAlign(RIGHT, CENTER);
    text("E", cx + (radius + 2*textSize), cy);
    textAlign(LEFT, CENTER);
    text("W", cx - (radius + 2*textSize), cy);
    
    popMatrix();
    
    if ( checkKey('a') ) {
      theta += -0.1;
    }
    if ( checkKey('d') ) {
      theta += 0.1;
    }
  }
  
}