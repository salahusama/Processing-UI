class Grid
{
  float gridHeight;
  float gridWidth;
  
  float cellHeight;
  float cellWidth;
  
  boolean drawn = false;
  
  Grid(float gridHeight, float gridWidth)
  {
    this.gridHeight = gridHeight;
    this.gridWidth = gridWidth;
    
    cellWidth = gridWidth / 20;
    cellHeight = gridHeight / 20;
  }
  
  void display()
  {
    float row = 0;
    float col = 0;
    
    stroke(255, 30);
    
    while (row < gridHeight) {
      line(0, cellHeight * row, gridWidth, cellHeight * row);
      row++;
    }
    while (col < gridWidth) {
      line(cellWidth * col, 0, cellWidth * col, gridHeight);
      col++;
    }
    drawn = true;
  }// end display
}