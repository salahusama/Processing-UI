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
  
  PShape box;
  
  Box(float startX, float startY, float bWidth, float bHeight)
  {
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.startX = startX;
    this.startY = startY;
    
    // set gap to 10%
    gap = map(10, 0, 100, 0, bWidth);
    tempWidth = gap;
    tempHeight = gap;
  }
  
  void create(float tWidth, float tHeight)
  {
    box = createShape();
    box.beginShape();
    box.stroke(bColor);
    box.noFill();
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
  }
  
}