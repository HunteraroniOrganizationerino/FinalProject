PImage magneman;
float x = 0;
float y = 100;
float velx = 0;
float vely = -10;
float up, right, down, left;
boolean touchingGround;
float gravity = .3;
float speed = 3;
int currentFrame;

void setup() {
  size(600, 800);
  magneman = loadImage("magamen.png");
}
void draw() {

  background(255);

  velx += (right - left) * speed; 


  image(magneman, x, y);
}

void keyPressed() {
  if (keyCode == RIGHT) {
    right = 1;
    left = 0;
  }
  if (keyCode == LEFT) {
    right = 0;
    left = 1;
  }
  if (y <= 100) {


    if (keyCode == UP) {
      y+=vely;
      vely+=gravity;
    }
  }
}

