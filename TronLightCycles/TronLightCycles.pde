int x1, y1, x2, y2, velx1, vely1, velx2, vely2;
boolean game;
ArrayList<Particle> rlist = new ArrayList<Particle>();
ArrayList<Particle> glist = new ArrayList<Particle>();

void setup() {
  //boolean if mouse pressed in box {draw loop} 
  size(displayWidth, displayHeight);
  background(0);
  stroke(255);
  x1 = 75;
  y1 = 75;
  x2 = width - 75;
  y2 = 75;
  velx1 = velx2 = 2;
  rectMode(CENTER);
  game = false;
}

void draw() {
  if(keyPressed){
   if(key == ENTER){
   game = true;
   } 
  }
  if(game) {
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
    if (key == 'w' && vely1 != 2) {
      velx1 = 0;
      vely1 = -2;
    }
    if (key == 's' && vely1 != -2) {
      velx1 = 0;
      vely1 = 2;
    }
    if (key == 'd' && velx1 != -2) {
      velx1 = 2;
      vely1 = 0;
    }
    if (key == 'a' && velx1 != 2) {
      velx1 = -2;
      vely1 = 0;
    }
    if (keyCode == UP && vely2 != 2) {
      velx2 = 0;
      vely2 = -2;
    }
    if (keyCode == DOWN && vely2 != -2) {
      velx2 = 0;
      vely2 = 2;
    }
    if (keyCode == LEFT && velx2 != -2) {
      velx2 = 2;
      vely2 = 0;
    }
    if (keyCode == RIGHT && velx2 != 2) {
      velx2 = -2;
      vely2 = 0;
    }
  }

  for (int i = rlist.size () - 1; i >= 0; i--) {
    Particle r = rlist.get(i);
    r.create();
    if(r.px == x1 && r.py == y1 || r.px == x2 && r.py == y2){
      game = false;
  }
  }
  for (int i = glist.size () - 1; i >= 0; i--) {
    Particle g = glist.get(i);
    g.create();  
    if(g.px == x1 && g.py == y1 || g.px == x2 && g.py == y2){
      game = false;
  }
  }
  }  
}

