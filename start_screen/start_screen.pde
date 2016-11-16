Grid backGrid;
Load loadingShape;
Box menu;

int state = 0; // chnages the state of the program from loading, UI, exit, etc

void setup()
{
  fullScreen();
  frameRate(60);
  
  background(0);
  noStroke();
  
  backGrid = new Grid(height, width);
  loadingShape = new Load();
  menu = new Box(50, 50, 200, 100);
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
      menu.render();
      break;
  }
  backGrid.display();
}