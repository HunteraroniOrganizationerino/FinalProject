int x1, x2, y1, y2, time;
int velx1, vely1, velx2, vely2;
ArrayList<Particle> rlist = new ArrayList<Particle>();
ArrayList<Particle> glist = new ArrayList<Particle>();

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  stroke(255);
  x1 = 75;
  y1 = 75;
  x2 = width - 75;
  y2 = 75;
  velx1 = velx2 = 2;
  rectMode(CENTER);
}

void draw() {
  background(0);
  for (int i = 0; i < 30; i++) {
    line(0, 25+ 50*i, width, 25+50*i);
    line(25+ 50*i, 0, 25+ 50*i, height);
  }
  if (frameCount % 3 == 0) {
    rlist.add(new Particle(x1, y1, 255, 0, 0));
    glist.add(new Particle(x2, y2, 0, 255, 0));
  }
  x1+=velx1;
  y1+=vely1;
  x2-=velx2;
  y2+=vely2;
  fill(255,0,0);
  rect(x1, y1, 25, 25);
  fill(0,255,0);
  rect(x2, y2, 25, 25);
  if (keyPressed) {
    if (keyCode == UP && vely1 != 2) {
      velx1 = 0;
      vely1 = -2;
    }
    if (keyCode == DOWN && vely1 != -2) {
      velx1 = 0;
      vely1 = 2;
    }
    if (keyCode == RIGHT && velx1 != -2) {
      velx1 = 2;
      vely1 = 0;
    }
    if (keyCode == LEFT && velx1 != 2) {
      velx1 = -2;
      vely1 = 0;
    }
    if (key == 'w' && vely2 != 2) {
      velx2 = 0;
      vely2 = -2;
    }
    if (key == 's' && vely2 != -2) {
      velx2 = 0;
      vely2 = 2;
    }
    if (key == 'a' && velx2 != -2) {
      velx2 = 2;
      vely2 = 0;
    }
    if (key == 'd' && velx2 != 2) {
      velx2 = -2;
      vely2 = 0;
    }
  }

  for (int i = rlist.size () - 1; i >= 0; i--) {
    Particle r = rlist.get(i);
    r.create();
  }
  for (int i = glist.size () - 1; i >= 0; i--) {
    Particle g = glist.get(i);
    g.create();
  }  
}

