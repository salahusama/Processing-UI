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
    if ( checkKey(' ') )
    {
      for (int i = 0; i < barCount; i++)
      {
        if (data.get(i) < chartHeight)
          data.add(i, 5);
        else
          data.add(i, random(0, 30) * -1);
      }
    }
    
    // randomize data
    else if (frameCount % 5 == 0)
    {
      for (int i = 0; i < barCount; i++) {
        data.set( i, random(0, chartHeight) );
      }
    }
    
    // display barchart
    float barWidth = chartWidth / barCount;
    float barHeight;
    
    noStroke();
    for (int i = 0; i < barCount; i++)
    {
      barHeight = -data.get(i);
      // start y position is the same, increment the x position by barWidth
      float startX = this.startX + (barWidth * i);
      
      if ( data.get(i) > 0.8 * chartHeight ) {
        fill(255, 0, 0);
      }
      else if ( data.get(i) > 0.6 * chartHeight ) {
        fill(255, 255, 0);
      }
      else {
        fill(50, 160, 50);
      }
      rect(startX, startY, barWidth, barHeight);
    }
    
    // draw border
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(startX, startY, chartWidth, -chartHeight);
    
    //
    fill(255);
    textSize(15);
    textAlign(CENTER, BOTTOM);
    text("Press Space for Full Throtle", startX + chartWidth / 2, startY - chartHeight - 10);
  }
}