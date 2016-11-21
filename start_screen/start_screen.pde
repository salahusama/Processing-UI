Grid backGrid;
Loading loadingScreen;
Box menu;
Sphere ball;
BarChart chart1;

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
      // draw content after box is drawn
      if (menu.drawn == true)
      {
        chart1.display();
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