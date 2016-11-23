Grid backGrid;
Loading loadingScreen;
Box menu;
Box mini1;
Box mini2;
Sphere ball;
BarChart chart1;
Ship ship;
Nav nav;

int state = 1; // chnages the state of the program from loading, UI, exit, etc

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
  chart1 = new BarChart(menu.startX + 14 * backGrid.cellWidth, menu.startY + 13 * backGrid.cellHeight, 200, 100, 10);
  mini1 = new Box(backGrid.cellWidth * 2, backGrid.cellHeight * 16, backGrid.cellWidth * 6, backGrid.cellHeight * 3);
  mini2 = new Box(backGrid.cellWidth * 12, mini1.startY, mini1.bWidth, mini1.bHeight);
  
  float shipX = menu.startX + menu.bWidth / 2;
  float shipY = menu.startY + menu.bHeight / 2;
  float shipSize = 0.5 * menu.bHeight;
  ship = new Ship(shipX, shipY, shipSize);
  
  nav = new Nav(width / 2, height / 2, ship.size);
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
      
      // draw content after box is fully drawn
      if (menu.drawn == true)
      {
        ship.display();
        nav.display();
        chart1.display();
        mini1.render();
        mini2.render();
      }
      break;
  }
  backGrid.display();
}


// key recognition
//
boolean[] keys = new boolean[1000];

void keyPressed()
{ 
 keys[keyCode] = true;
}

void keyReleased()
{
 keys[keyCode] = false; 
}

boolean checkKey(int k)
{
 if (keys.length >= k) 
 {
   return keys[k] || keys[Character.toUpperCase(k)];  
 }
 return false;
}