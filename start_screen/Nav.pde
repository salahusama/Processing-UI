class Nav
{
  float x, y;
  float theta;
  float diameter;
  float speed = 5;
  
  PShape shape;
  
  Nav(float x, float y, float diameter)
  {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    
    theta = 0;
    
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(5);
    
    line(x, y, x, y - diameter/2);
    
    shape.endShape();
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    shape(shape, 0, 0);
    popMatrix();
    
    if (checkKey('a')) {
      theta += -0.1;
    }
    if (checkKey('d')) {
      theta += 0.1;
    }
  }
}