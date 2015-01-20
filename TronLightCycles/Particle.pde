class Particle{
  float px,py;
  float pr, pg, pb, psz;
 Particle(float x, float y, float r, int g, int b, int sz){
  px = x;
  py = y;  
  pr = r;
  pg = g;
  pb = b;
  psz = sz;
 }  
  
  void create(){
    noStroke();
    fill(pr, pg, pb);
    rect(px, py, psz, psz);
    stroke(255);
  }
 
 }

