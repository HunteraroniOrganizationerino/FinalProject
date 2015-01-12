void setup(){
  size(800,800);
}
void draw(){
  background(35,35,35);
  rect(width/2-175, height/2-150, 350,75);// Start game
  rect(width/2-175, height/2, 350,75); // About the coders
  rect(width/2-175, height/2+150, 350,75);// Credits
  noFill();
  stroke(50);
  rect(0,0,width,height);
}
