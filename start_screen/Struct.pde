class Struct
{
  ArrayList<Orbit> orbits;
  Orbit main;
  
  float cx;
  float cy;
  float size;
  float rings;
  float diff;
  
  Struct(float cx, float cy, float size)
  {
    this.cx = cx;
    this.cy = cy;
    this.size = size;
    this.rings = 3;
    diff = 30;
    
    orbits = new ArrayList<Orbit>();
    
    for (int i = 0; i < rings; i++)
    {
      float radius = size/2 - (i * diff);
      orbits.add( new Orbit(cx, cy, radius, random(-0.03, 0.03)) );
    }
    
    // make the central orbit
    central();
  }
  
  void central()
  {
    float radius = size / 3 - (rings * diff);
    float x = cx + radius;
    float y = cy;
    main = new Orbit(x, y, radius, 0.01);
  }
  
  void render()
  {
    // draw central
    main.render();
    
    for (Orbit o: orbits)
    {
      // draw other orbits
      o.render();
      
      // connect points from other orbits to point on main orbit
      stroke(255, 255, 0);
      strokeWeight(1);
      line(o.p.pos.x, o.p.pos.y, main.p.pos.x, main.p.pos.y);
    }
    
    
  }
}