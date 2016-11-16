Grid backGrid;
Loading loadingScreen;
Box menu;
Sphere ball;

int state = 0; // chnages the state of the program from loading, UI, exit, etc

void setup()
{
  fullScreen(P3D);
  frameRate(60);
  
  background(0);
  noStroke();
  
  backGrid = new Grid(height, width);
  loadingScreen = new Loading();
  menu = new Box(backGrid.cellWidth, backGrid.cellHeight, width - (2*backGrid.cellWidth), height - (6*backGrid.cellHeight));
  ball = new Sphere(width / 2, height - 50, 80);
}

void draw()
{
  background(0);
  switch (state)
  {
    case 0: // Loading Screen
      loadingScreen.render();
      break;
      
    case 1: // UI
      ball.render();
      menu.render();
      break;
  }
  backGrid.display();
}