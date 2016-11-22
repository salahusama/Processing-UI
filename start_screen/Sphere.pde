class Sphere
{
  float centerX;
  float centerY;
  float radius;
  float arcR;
  float theta;
  
  color sColor = color(0, 255, 255);
  color aColor = color(0, 100, 255);
  
  PImage earth;
  PShape globe;
  
  Sphere(float centerX, float centerY, float radius)
  {
    this.centerX = centerX;
    this.centerY = centerY;
    this.radius = radius;
    
    arcR = (2 * radius) + 40;
    theta = 0;
    
    earth = loadImage("earth.jpg");
    globe = createShape(SPHERE, radius);
    globe.setTexture(earth);
  }
  
  void render()
  {
    fill(0);
    stroke(sColor);
    strokeWeight(1);
    
    // draw the sphere
    pushMatrix();
    translate(centerX, centerY);
    //rotateX(theta);
    rotateY(theta);
    //rotateZ(theta);
    texture(earth);
    shape(globe);
    popMatrix();
    
    //draw the arc
    noFill();
    stroke(aColor);
    strokeWeight(7);
    
    arc(centerX, centerY, arcR, arcR, theta, theta + HALF_PI);
    arc(centerX, centerY, arcR, arcR, theta + HALF_PI + (HALF_PI/4), theta + HALF_PI +  + (3*HALF_PI/4));
    
    arc(centerX, centerY, arcR, arcR, theta + PI, theta + PI + HALF_PI);
    arc(centerX, centerY, arcR, arcR, theta + PI + HALF_PI + (HALF_PI/4), theta + PI + HALF_PI + (3*HALF_PI/4));
    
    theta += 0.01;
  }
}