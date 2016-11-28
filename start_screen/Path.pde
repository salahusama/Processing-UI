class Path
{
  float startX;
  float startY;
  float pWidth;
  float pHeight;
  float step;
  int nodeCount;
  
  ArrayList<Node> nodes;
  
  Path(float startX, float startY, float pWidth, float pHeight, int nodeCount)
  {
    this.startX = startX;
    this.startY = startY;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    this.nodeCount = nodeCount;
    
    step = pHeight / nodeCount;
    
    nodes = new ArrayList<Node>();
    
    initialise();
  }
  
  
  
  void initialise()
  {
    float nodeX = startX + (pWidth / 2);
    float nodeY = startY -(step / 2);
    
    for (int i = 0; i < nodeCount; i++)
    {
      nodes.add( new Node(nodeX + random(-pWidth/4, pWidth/4), nodeY, startX, startX + pWidth, 0.6 * step) );
      nodeY -= step;
    }
  }
  
  void render()
  {
     // draw box
     noFill();
     stroke(255);
     rect(startX, startY, pWidth, -pHeight);
     
     // write text
     // draw text
      fill(255);
      textSize(15);
      textAlign(CENTER, TOP);
      text("Drag nodes to edit path", startX + pWidth / 2, startY + 10);
     
     // draw nodes
     for (Node n: nodes)
     {
       n.draw();
     }
     // draw lines
     float x1 = nodes.get(0).x;
     float y1 = nodes.get(0).y;
     
     for (int i = 1; i < nodeCount; i++)
     {
       float x2 = nodes.get(i).x;
       float y2 = nodes.get(i).y;
       stroke(255);
       line(x1, y1, x2, y2);
       x1 = x2;
       y1 = y2;
     }
  }
  
  void update()
  {
    for (Node n: nodes)
    {
      if (mouseX > (n.x - n.big / 2) && mouseX < (n.x + n.big / 2) &&  mouseY > (n.y - n.big / 2) && mouseY < (n.y + n.big / 2))
      {
        n.follow = true;
      }
    }
  }
}