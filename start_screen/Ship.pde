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
    
    // distance between center of ship and furthest corner of  ship is the radius of nav
    float len = dist(0, 0, -size, size);
    nav = new Nav(x, y, len);
    
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
    rotate(theta);
    shape(shape, 0, 0);
    popMatrix();
    
    nav.display();
    
    if ( checkKey('a') ) {
      theta += -0.005;
    }
    if ( checkKey('d') ) {
      theta += 0.005;
    }
  }
}