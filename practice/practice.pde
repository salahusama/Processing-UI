Struct s;

void setup()
{
  size(500, 500);
  stroke(255);
  
  s = new Struct(width / 2, height / 2, 400);
}

void draw()
{
  background(0);
  
  s.render();
}