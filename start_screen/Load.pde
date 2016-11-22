class Loading
{
  float centerX;
  float centerY;
  float radius;
  float theta;
  float speed = 4;
  
  boolean grow = true;
  color sColor = color(0, 255, 255);
  
  PImage earth;
  
  Loading()
  {
    centerX = width / 2;
    centerY = height / 2;
    radius = 0;
    theta = 0;
    
    earth = loadImage("earth.jpg");
  }
  
  void render()
  {
    fill(0);
    stroke(sColor);
    strokeWeight(1);
    
    PShape globe;
    globe = createShape(SPHERE, radius);
    globe.setTexture(earth);
    
    // draw the sphere
    pushMatrix();
    translate(centerX, centerY);
    //rotateX(theta);
    rotateY(theta);
    //rotateZ(theta);
    shape(globe);
    popMatrix();
     
    theta += 0.01;
    
    // increase size till loading is done
    if (radius < height / 2 && grow == true) 
    {
      radius += speed / 2;
    }
    // loading has completed, shrink shpere and position sphere in correct position;
    else if (radius > ball.radius)
    {
      radius -= speed;
      centerY = centerY + inc();

      // so it doesnt grow again
      grow = false;
    }
    else
    {
      // loading animation done
      // make ball continue rotation
      ball.theta = theta;
      // go to main state
      state = 1;
    }
  }
  
  float inc()
  {
    float inc;
    float percent;
    
    percent = speed / (radius - ball.radius);
    inc = percent * (ball.centerY - centerY);
    return inc;
  }
}