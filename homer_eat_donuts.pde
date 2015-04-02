Timer timer;
Donut[] d;
Catcher c;
PImage back_img,back_img2;
int totalDrops = 0;
boolean gameStatus = false;
int dohCount = 0;
int doh_y = 10;
String display_doh = "";
void setup() {
  size(510,765);
  smooth();
  back_img = loadImage("homer_backg.jpg"); 
  back_img2 = loadImage("homer_backg2.jpg"); 
  d = new Donut[1000];
  c = new Catcher();
  timer = new Timer(300);   
  timer.start();                 
}
void draw(){
 // println(gameStatus,dohCount);
  if(gameStatus == true){
    if(dohCount > 10){
      gameStatus = false;
      dohCount = 0;  
    }    
    background(back_img2);
    text(display_doh, 10, 20);
    c.setLocation(mouseX-30, mouseY-30);
    c.display();
    if(timer.isFinished()){
      d[totalDrops] = new Donut();
      totalDrops++;
      if(totalDrops>=d.length){
        totalDrops = 0;
      }
    timer.start();
    }
    for(int i=0; i<totalDrops; i++){
      d[i].move();
      d[i].display();
      if(d[i].reachedBottom() && d[i].wasted == false){
        c.doh = true;
        d[i].wasted = true;
        dohCount++;
        display_doh += "d'oh!!\n";
 
      }
      if(c.intersect(d[i])){
      c.doh = false;
      d[i].caught();
      }
    }
  }
  else{
    background(back_img);
  }
  
}
void mouseClicked(){
  gameStatus = true;
//  println("click!!!!!!",gameStatus);


      display_doh = "";
  totalDrops = 0;
  c.doh = false;

}

