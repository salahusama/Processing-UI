class Atom
{
  float size;
  float radius;
  float theta;
  float angle;
  float r;
  float cx, cy;
  
  float cSize;
  float scale = 20;
  
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
      ellipse(width / 2, height / 2, cSize, cSize);
      cSize += map(1, 0, 180, 0, 76);
      theta += 0.1;
      
      cx = width / 2 + r * cos(theta);
      cy = height / 2 - r * sin(theta);
      
      ellipse(cx, cy, size, size);
      
      theta += 0.1;
      angle += 0.1;
      r = radius + scale * sin(angle * 5);
    }
    else {
      ellipse(width / 2, height / 2, cSize, cSize);
      cSize = lerp(cSize, width * 2, 0.1);
    }
  }
}