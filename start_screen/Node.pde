class Node
{
  // x and y are relative to the path
  float x;
  float y;
  float small;
  float big;
  boolean follow;
  float limit1;
  float limit2;
  color cColor = color(255);
  
  Node(float x, float y, float limit1, float limit2, float big)
  {
    this.x = x;
    this.y = y;
    this.big = big;
    this.limit1 = limit1;
    this.limit2 = limit2;
    
    small = big / 3;
    follow = false;
  }
  
  void draw()
  {
    check();
    
    // draw big circle
    noFill();
    if (follow == true) {
      stroke(cColor);
    }
    if (follow == true) {
      stroke(0, 255, 0);
    }
    else {
      stroke(255);
    }
    ellipse(x, y, big, big);
    
    // draw small circle
    fill(0, 255, 0);
    noStroke();
    ellipse(x, y, small, small);
  }
  
  void check()
  {
    if (follow == true)
    {
      x = mouseX;
      if (x < limit1)
      {
        x = limit1 + big;
      }
      if (x > limit2)
      {
        x = limit2 - big;
      }
    }
  }
}