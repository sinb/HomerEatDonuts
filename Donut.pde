class Donut{
  PImage Donut_img;
  float x, y, speed;
  boolean wasted;
  Donut(){
    wasted = false;
    x = random(width);
    y = -50;
    speed = random(1, 5);
    Donut_img = loadImage("donut.png");
  }
  void move(){
    y += speed;
  }
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height + 50) { 
      return true;
    } else {
      return false;
    }
  }
  void display() {
  image(Donut_img, x, y);
  }
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = - 1000;
  }
}
