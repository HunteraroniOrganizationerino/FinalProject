int x1, x2, y1, y2, time;
int velx, vely;

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  stroke(255);
  x1 = 75;
  y1 = 75;
  velx = 2;
  rectMode(CENTER);
}

void draw() {
  background(0);
  for (int i = 0; i < 30; i++) {
    line(0, 25+ 50*i, width, 25+50*i);
    line(25+ 50*i, 0, 25+ 50*i, height);
  }
  x1+=velx;
  y1+=vely;
  fill(200);
  rect(x1, y1, 25, 25);
  if (keyPressed) {
    if (keyCode == UP && vely != 2) {
      velx = 0;
      vely = -2;
    }
    if (keyCode == DOWN && vely != -2) {
      velx = 0;
      vely = 2;
    }
    if (keyCode == RIGHT && velx != -2) {
      velx = 2;
      vely = 0;
    }
    if (keyCode == LEFT && velx != 2) {
      velx = -2;
      vely = 0;
    }
  }
}

