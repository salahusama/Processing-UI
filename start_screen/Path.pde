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
    float nodeY = startY - pHeight +(step / 2);

    for (int i = 0; i < nodeCount; i++)
    {
      nodes.add( new Node(nodeX + random(-pWidth/4, pWidth/4), nodeY, startX, startX + pWidth, 0.6 * step) );
      nodeY += step;
    }
  }

  void render()
  {
    // draw box
    noFill();
    stroke(255);
    rect(startX, startY, pWidth, -pHeight);

    // write text
    fill(255);
    textSize(15);
    textAlign(CENTER, TOP);
    text("Drag nodes to edit path", startX + pWidth / 2, startY + 10);

    // draw nodes
    for (int i = 0; i < nodeCount; i++)
    {
      nodes.get(i).y += 0.05;
      nodes.get(i).draw();
      if (nodes.get(i).y > startY)
      {
        nodes.remove(i);
        nodes.add( new Node(startX + (pWidth / 2) + random(-pWidth/4, pWidth/4), startY - pHeight +(step / 2), startX, startX + pWidth, 0.6 * step) );
      }
      
    }
    // draw lines
    float x1 = nodes.get(nodeCount - 1).x;
    float y1 = nodes.get(nodeCount - 1).y;

    for (int i = nodeCount - 1; i >= 0; i--)
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
    for (Node n : nodes)
    {
      if (mouseX > (n.x - n.big / 2) && mouseX < (n.x + n.big / 2) &&  mouseY > (n.y - n.big / 2) && mouseY < (n.y + n.big / 2))
      {
        n.follow = true;
      }
    }
  }
}