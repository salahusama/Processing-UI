class Nav
{
  float cx, cy;
  float theta;
  float diameter;
  float radius1;
  float radius2;
  float gap;
  float speed = 5;
  
  PShape shape;
  
  Nav(float cx, float cy, float diameter)
  {
    this.cx = cx;
    this.cy = cy;
    this.diameter = diameter;
    
    theta = 0;
    
    gap = 0.1 * diameter;
    radius1 = diameter / 2 + gap;
    radius2 = diameter / 2 + 2 * gap;
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
    noFill();
    
    ellipse(0, 0, diameter + gap, diameter + gap);
    
    line(0, -radius1 , 0, -radius2 );
    line(0, radius1, 0, radius2);
    
    line(radius1, 0, radius2, 0);
    line(-radius1, 0, -radius2, 0);
    
    fill(255, 255, 0);
    textSize(textSize);
    
    textAlign(CENTER, BOTTOM);
    text("N", 0, -(radius2 + textSize));
    textAlign(CENTER, TOP);
    text("S", 0, (radius2 + textSize));
    
    textAlign(RIGHT, CENTER);
    text("E", (radius2 + 2 * textSize), 0);
    textAlign(LEFT, CENTER);
    text("W", - (radius2 + 2 * textSize), 0);
    
    popMatrix();
    
    if ( checkKey('d') ) {
      theta += -0.01;
    }
    if ( checkKey('a') ) {
      theta += 0.01;
    }
  }
  
}