class Particle{
  int px,py;
  int pr, pg, pb;
 Particle(int x, int y, int r, int g, int b){
  px = x;
  py = y;  
  pr = r;
  pg = g;
  pb = b;
 }  
  
  void create(){
    noStroke();
    fill(pr, pg, pb);
    rect(px, py, 5, 5);
    stroke(255);
  }
 
 }

