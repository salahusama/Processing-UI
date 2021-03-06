class Box
{
  float startX;
  float startY;
  
  float bWidth;
  float bHeight;
  float tempWidth;
  float tempHeight;
  float speed = 10;
  float gap;
  color bColor = color(0, 255, 255);
  boolean drawn = false;
  
  PShape box;
  
  Box(float startX, float startY, float bWidth, float bHeight)
  {
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.startX = startX;
    this.startY = startY;
    
    // set gap to 5%
    gap = map(5, 0, 100, 0, bWidth);
    tempWidth = gap;
    tempHeight = gap;
  }
  
  void create(float tWidth, float tHeight)
  {
    box = createShape();
    box.beginShape();
    box.stroke(bColor);
    box.fill(255, 20);
    box.strokeWeight(3);
    
    box.vertex(0, 0);
    box.vertex(tWidth - gap, 0);
    box.vertex(tWidth, gap);
    box.vertex(tWidth, tHeight);
    box.vertex(gap, tHeight);
    box.vertex(0, tHeight - gap);
    
    box.endShape(CLOSE);
  }
  
  void render()
  {
    // create the box each time with a larger size
    create(tempWidth, tempHeight);
    shape(box, startX, startY);
    noStroke();
    fill(bColor);
    ellipse(startX, startY, 6, 6);
    ellipse(startX + tempWidth, startY + tempHeight, 6, 6);
    
    if (tempWidth < bWidth) {
      tempWidth = tempWidth + speed;
    }
    if (tempHeight < bHeight) {
      tempHeight = tempHeight + map(speed, 0, bWidth, 0, bHeight);
    }
    if (tempWidth >= bWidth && tempHeight >= bHeight) {
      drawn = true;
    }
  }
  
}