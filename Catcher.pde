class Catcher {
  PImage homer_eat_img, homer_doh_img;
  float x,y; // location
  boolean doh;
  Catcher() {
    x = 0;
    y = 0;
    homer_eat_img = loadImage("homer_eat.png");
    homer_doh_img = loadImage("homer_doh.png");
    doh = false;
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    if(doh){
      image(homer_doh_img, x, y);
      
    }
    else
      image(homer_eat_img, x, y);
  }
  
  // A function that returns true or false based on
  // if the catcher intersects a raindrop
  boolean intersect(Donut d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y); 
    
    // Compare distance to sum of radii
    if (distance < 20) { 
      return true;
    } else {
      return false;
    }
  }
}
