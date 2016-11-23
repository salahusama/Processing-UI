class Ship
{
  float x, y;
  float theta;
  float size;
  float radius;
  float speed = 5;
  
  PShape shape;
  Nav nav;
  
  Ship(float x, float y, float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    radius = size / 2;
    theta = 0;
    
    nav = new Nav(x, y, size);
    
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(5);
    
    shape.vertex(-radius, radius);
    shape.vertex(0, - radius);
    shape.vertex(radius, radius);
    shape.vertex(0, 0);
    
    shape.endShape(CLOSE);
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    shape(shape, 0, 0);
    popMatrix();
    
    nav.display();
    
    if (checkKey('a')) {
      theta += -0.1;
    }
    if (checkKey('d')) {
      theta += 0.1;
    }
  }
}