int x1, y1, x2, y2, velx1, vely1, velx2, vely2;
String rdir, gdir; 
boolean game;
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
  game = false;
}

void draw() {
  
  //sets each movement as a string to represent direction
  directionSetup();

  //waits for an enter input to begin the game
  if (keyPressed) {
    if (key == ENTER) {
      game = true;
    }
  }
  if (game) {

    //simple creation of a grid background
    background(0);    
    for (int i = 0; i < 38; i++) {
      line(0, 25+ 50*i, width, 25+50*i);
      line(25+ 50*i, 0, 25+ 50*i, height);
    }

    //adds a red and green particle to each of the array lists
    if (frameCount % 1 == 0) {
      rlist.add(new Particle(x1, y1, 255, 0, 0));
      glist.add(new Particle(x2, y2, 0, 255, 0));
    }

    //changes the location of the players through velocities
    x1+=velx1;
    y1+=vely1;
    x2-=velx2;
    y2+=vely2;

    //creation of the blocks/players
    fill(255, 0, 0);
    rect(x1, y1, 25, 25);
    fill(0, 255, 0);
    rect(x2, y2, 25, 25);

    //movement for both arrow keys and WASD
    //prevents moving in the direction opposite to current movement
    movement();   

    // checks interactions between the red particles and the players
    for (int i = rlist.size () - 1; i >= 0; i--) {     
      Particle r = rlist.get(i);
      if (game) {
        r.create();
      }
      if (r.px < x1 + .999 && r.px > x1 - .999 && r.py > y1 - .999 && r.py < y1 + .999) {
        greenWin();
      }
      if ( r.px < x2 + .999 && r.px > x2 - .999 && r.py > y2 - .999 && r.py < y2 + .999) {
        redWin();
      }
    }

    // checks interactions between the green particles and the players
    for (int i = glist.size () - 1; i >= 0; i--) {      
      Particle g = glist.get(i);
      if (game) {
        g.create();
      }  
      if (g.px < x1 + .999 && g.px > x1 - .999 && g.py > y1 - .999 && g.py < y1 + .999) {
        greenWin();
      }
      if (g.px < x2 + .999 && g.px > x2 - .999 && g.py > y2 - .999 && g.py < y2 + .999) {
        redWin();
      }
    }
  }
}

//sets each movement as a string to represent direction
void directionSetup() {
  if (velx1 > 0) {
    rdir = "right";
  }
  if (velx1 < 0) {
    rdir = "left";
  }
  if (vely1 > 0) {
    rdir = "down";
  }
  if (vely1 < 0) {
    rdir = "up";
  }
  if (velx2 > 0) {
    gdir = "right";
  }
  if (velx2 < 0) {
    gdir = "left";
  }
  if (vely2 > 0) {
    gdir = "down";
  }
  if (vely2 < 0) {
    gdir = "up";
  }
}

//movement for both arrow keys and WASD
//prevents moving in the direction opposite to current movement
void movement() {

  if (keyPressed) {
    if (key == 'w' && rdir != "down") {
      velx1 = 0;
      vely1 = -2;
    }
    if (key == 's' && rdir != "up") {
      velx1 = 0;
      vely1 = 2;
    }
    if (key == 'a' && rdir != "right") {
      velx1 = -2;
      vely1 = 0;
    }
    if (key == 'd' && rdir != "left") {
      velx1 = 2;
      vely1 = 0;
    }      
    if (keyCode == UP && gdir != "down") {
      velx2 = 0;
      vely2 = -2;
    }
    if (keyCode == DOWN && gdir != "up") {
      velx2 = 0;
      vely2 = 2;
    }
    if (keyCode == LEFT && gdir != "left") {
      velx2 = 2;
      vely2 = 0;
    }
    if (keyCode == RIGHT && gdir != "right") {
      velx2 = -2;
      vely2 = 0;
    }
  }
}

//the screen change for a red win
void redWin() {

  background(255);
  fill(255, 0, 0);
  textSize(72);
  text("Red Wins", width/3, height/2);
  game = false;
}


//the screen change for a green win
void greenWin() {

  background(255);
  fill(0, 255, 0);
  textSize(72);
  text("Green Wins", width/3, height/2);
  game = false;
}

