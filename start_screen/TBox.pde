class TBox extends Box
{
  float centerX;
  float centerY;
  
  TBox(float startX, float startY, float bWidth, float bHeight)
  {
    super(startX, startY, bWidth, bHeight);
    
    centerX = startX + bWidth / 2;
    centerY = startY + bHeight / 2;
  }
  
  void write(String text, color c)
  {
    fill(c);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(text, centerX, centerY);
  }
}