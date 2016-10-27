void grid()
{
  float lineY = 0;
  float lineX = 0;
  
  while (lineY <= height)
  {
    hLine(lineY);
    lineY += cellSize;
  }
  while (lineX <= width)
  {
    vLine(lineX);
    lineX += cellSize;
  }
}

void hLine(float y)
{
  strokeWeight(1);
  stroke(150, 100);
  
  float x1 = width / 2;
  float x2 = width / 2;
  
  while (x1 >= 0 && x2 <= width)
  {
    point(x1, y);
    x1--;
    
    point(x2, y);
    x2++;
  }
}

void vLine(float x)
{
strokeWeight(1);
stroke(150, 100);

float y1 = height / 2;
float y2 = height / 2;

while (y1 >= 0 && y2 <= height)
{
  point(x, y1);
  y1--;
  
  point(x, y2);
  y2++;
  }
}