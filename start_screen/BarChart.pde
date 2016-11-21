class BarChart
{
  float startX;
  float startY;
  float chartWidth;
  float chartHeight;
  int barCount;
  
  FloatList data = new FloatList();
  
  BarChart(float startX, float startY, float chartWidth, float chartHeight, int barCount)
  {
    this.startX = startX;
    this.startY = startY;
    this.chartWidth = chartWidth;
    this.chartHeight = chartHeight;
    this.barCount = barCount;
    
    for (int i = 0; i < barCount; i++) {
      // add random values from 0 to maximum
      data.append( random(0, chartHeight) );
    }
  }
  
  void display()
  {
    // randomize data
    if (frameCount % 4 == 0)
    {
      for (int i = 0; i < barCount; i++) {
        data.set( i, random(0, chartHeight) );
      }
    }
    
    // display barchart
    float barWidth = chartWidth / barCount;
    float barHeight;
    
    for (int i = 0; i < barCount; i++)
    {
      barHeight = -data.get(i);
      // start y position is the same, increment the x position by barWidth
      float startX = this.startX + (barWidth * i);
      fill(50, 160, 50);
      stroke(255);
      strokeWeight(1);
      rect(startX, startY, barWidth, barHeight);
    }
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(startX, startY, chartWidth, -chartHeight);
  }
}