class Orbit
{
  PVector pos;
  float radius;
  float theta;
  float speed;
  
  color c;
  
  Point p;
  
  Orbit(float cx, float cy, float size, float speed)
  {
    this.radius = size;
    theta = random(0, TWO_PI);
    this.speed = speed;
    
    c = color(random(50), random(255), random(255));
    
    pos = new PVector(cx, cy);
    p = new Point(pos.x, pos.y);
  }
  
  void render()
  {
    // draw orbit
    noFill();
    stroke(c);
    strokeWeight(2);
    ellipse(pos.x, pos. y, radius * 2, radius * 2);
    
    // calculate point coordinates
    p.pos.x = radius * sin(theta);
    p.pos.y = radius * -cos(theta);
    
    p.pos.add(this.pos);
    
    theta += speed;
    
    // draw point
    p.draw();
  }
}