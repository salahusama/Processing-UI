class Nav
{
  float cx, cy;
  float theta;
  float diameter;
  float radius;
  float gap;
  float speed = 5;
  
  PShape shape;
  
  Nav(float x, float y, float diameter)
  {
    this.cx = x;
    this.cy = y;
    this.diameter = diameter;
    
    radius = diameter / 2;
    theta = 0;
    gap = 0.2 * radius;
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(5);
    
    line(cx, cy - gap, cx, cy - radius);
    line(cx, cy + gap, cx, cy + radius);
    
    line(cx + gap, cy, cx + radius, cy);
    line(cx - gap, cy, cx - radius, cy);
    
    shape.endShape();
  }
  
  void display()
  {
    pushMatrix();
    translate(cx, cy);
    rotate(theta);
    shape(shape, 0, 0);
    popMatrix();
    
    if ( checkKey('a') ) {
      theta += -0.1;
    }
    if ( checkKey('d') ) {
      theta += 0.1;
    }
  }
}