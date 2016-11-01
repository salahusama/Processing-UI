class Atom
{
  float size;
  float radius;
  float theta;
  float angle;
  float r;
  float cx, cy;
  
  Atom()
  {
    radius = 150;
    theta = 0;
    size = 5;
    r = radius;
  }
  
  void display()
  {
    fill(0, 255, 255);
    
    if (theta < 76) {
    ellipse(width / 2, height / 2, s, s);
    s += map(1, 0, 180, 0, 76);
    theta += 0.1;
    
    cx = width / 2 + r * cos(theta);
    cy = height / 2 - r * sin(theta);
    
    float scale = 20;
    
    ellipse(cx, cy, size, size);
    
    theta += 0.1;
    angle += 0.1;
    r = radius + scale * sin(angle * 5);
    /* 10 is the number of bends
     * 5 is how big the dent is
     */
    }
    else {
      ellipse(width / 2, height / 2, s, s);
      s = lerp(s, width * 2, 0.1);
    }
  }
}