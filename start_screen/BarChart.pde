class BarChart
{
  float startX;
  float startY;
  float chartWidth;
  float chartHeight;
  float barCount;
  float[] data;
  
  BarChart(float startX, float startY, float chartWidth, float chartHeight, float barCount)
  {
    this.startX = startX;
    this.startY = startY;
    this.chartWidth = chartWidth;
    this.chartHeight = chartHeight;
    this.barCount = barCount;
    
    for (int i = 0; i < barCount; i++) {
      // add random values from 0 to maximum
      data[i] = random(0, chartHeight);
    }
  }
  
  void draw()
  {
    // display barchart
    float barWidth = chartWidth / barCount;
  }
}