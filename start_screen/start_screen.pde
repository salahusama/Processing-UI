/*
 * Salaheldin Akl
 * D15124122
 * 
 * Completed on 19 Nov @ 1:10pm
 * 
 */

Grid grid;
Loading loadingScreen;
Box menu;
TBox mini1;
TBox mini2;
Sphere ball;
BarChart chart1;
Ship ship;
Path path;
Struct awesome;

int state = 1; // changes the state of the program from loading, UI, exit, etc

void setup()
{
  fullScreen(P3D);
  frameRate(60);
  
  background(0);
  noStroke();
  
  grid = new Grid(height, width);
  loadingScreen = new Loading();
  menu = new Box(grid.cellWidth, grid.cellHeight, width - (2*grid.cellWidth), height - (6*grid.cellHeight));
  ball = new Sphere(width / 2, height - 50, 80);
  chart1 = new BarChart(menu.startX + 14 * grid.cellWidth, menu.startY + 13 * grid.cellHeight, 200, 100, 10);
  mini1 = new TBox(grid.cellWidth * 2, grid.cellHeight * 16, grid.cellWidth * 6, grid.cellHeight * 3);
  mini2 = new TBox(grid.cellWidth * 12, mini1.startY, mini1.bWidth, mini1.bHeight);
  
  float shipX = menu.startX + menu.bWidth / 2;
  float shipY = menu.startY + menu.bHeight / 2;
  float shipSize = 0.4 * menu.bHeight;
  ship = new Ship(shipX, shipY, shipSize);
  
  float pathX = menu.startX + grid.cellWidth;
  float pathY = menu.startY + menu.bHeight - 1 * grid.cellHeight;
  float pathW = 4 * grid.cellWidth;
  float pathH = 5 * grid.cellHeight;
  path = new Path(pathX, pathY, pathW, pathH, 10);
  
  float structX = menu.startX + 15 * grid.cellWidth;
  float structY = menu.startY +  4 * grid.cellHeight;
  float structS = 4 * grid.cellWidth;
  awesome = new Struct(structX, structY, structS);
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
        chart1.display();
        path.render();
        awesome.render();
        
        mini1.render();
        if (mini1.drawn == true)
        {
          mini1.write("Hello Captain!", color(0, 255, 255));
        }
        
        mini2.render();
        if (mini2.drawn == true)
        {
          if ( checkKey(' ') ) {
            mini2.write("THAT'S TOO FAST!!", color(255, 0, 0));
          }
          else {
            mini2.write("All is Good", color(0, 255, 255));
          }
        }
      }
      break;
  }
  grid.display();
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

void mousePressed()
{
  path.update();
}

void mouseReleased()
{
  for (Node n : path.nodes)
  {
    n.follow = false;
  }
}