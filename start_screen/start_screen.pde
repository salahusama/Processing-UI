Grid backGrid;
Load loadingShape;

int state = 0; // chnages the state of the program from loading, UI, exit, etc

void setup()
{
  fullScreen();
  frameRate(60);
  
  background(0);
  noStroke();
  
  backGrid = new Grid(height, width);
  loadingShape = new Load();
}

void draw()
{
  background(0);
  switch (state)
  {
    case 0: // Loading Screen
      loadingShape.display();
      break;
      
    case 1: // UI
      fill(0, 255, 255);
      text("User Interface :)", 50, 50);
      break;
  }
  println(loadingShape.cSize);
  backGrid.display();
}