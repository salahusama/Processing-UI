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
    shape.vertex(-radius / 2, -radius / 2);
    shape.vertex(0, - radius);
    shape.vertex(radius / 2, -radius / 2);
    shape.vertex(radius, radius);
    shape.vertex(radius/3, radius/2);
    shape.vertex(-radius/3, radius/2);
    
    shape.endShape(CLOSE);
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    shape(shape, 0, 0);
    
    if ( checkKey(' ') ) {
      boost();
    }
    popMatrix();
    
    nav.display();
    
    if ( checkKey('a') ) {
      theta += -0.005;
    }
    if ( checkKey('d') ) {
      theta += 0.005;
    }
  }
  
  float clearY = size;
  float clearX1;
  float clearX2;
  float clearAlpha = 255;
    
  void boost()
  {
    float lineY = radius / 2 + 10;
    float x1 = -20;
    float x2 = 20;
    float alpha = 150;
    
    while ( lineY < (2 * size / 3) )
    {
      stroke(60, 175, 60, alpha);
      line(x1, lineY, x2, lineY);
      
      lineY += 5;
      x1 -= 2;
      x2 += 2;
      alpha -= 10;
    }
    
    if ( clearY < (2 * size / 3) )
    {
      // clearer line
      stroke(0, 255, 0, clearAlpha);
      strokeWeight(2);
      line(clearX1, clearY, clearX2, clearY);
      
      clearY += 2.5;
      clearX1 -= 1f;
      clearX2 += 1f;
      clearAlpha -= 10;
    }
    else 
    {
      clearY = radius / 2 + 10;
      clearX1 = -20;
      clearX2 = 20;
      clearAlpha = 255;
    }
    
  }
}