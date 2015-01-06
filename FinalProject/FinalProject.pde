float x, y, velocity, accel;
PImage magamen;

void setup() {

  size(displayWidth, displayHeight);
  magamen = loadImage("magamen.png"); 
  x = width/2;
  y = height/2;
  velocity = -8;
  accel=.3;
}

void draw() {
  background(0);
  image(magamen, x, y, 50, 60);
  if (keyPressed == true) { 
    if (key == CODED) {
      if (keyCode == UP) {
        if (y < height/2 +1) {
          y+=velocity;
          velocity+=accel;
        }
      }
      if (y > height/2 + 1) {
        y = height/2;
        velocity = -8;
      }
      if (keyCode == DOWN) {
        y+=10;
      }
      if (keyCode == RIGHT) {
        x+=10;
      }
      if (keyCode == LEFT) {
        x-=10;
      }
    }
  }
}

