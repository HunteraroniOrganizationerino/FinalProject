class Particle{
  float px,py;
  float pr, pg, pb;
 Particle(float x, float y, float r, int g, int b){
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

