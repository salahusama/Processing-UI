Grid backGrid;
Atom loadingShape;

void setup()
{
  fullScreen();
  frameRate(60);
  
  background(0);
  noStroke();
  
  backGrid = new Grid(height, width);
  loadingShape = new Atom();
}

void draw()
{
  // draw background grid if it is not drawn
  if (!backGrid.drawn) {
    backGrid.display();
  }
  
  loadingShape.display();
}