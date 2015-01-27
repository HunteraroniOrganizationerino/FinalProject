//the red block is x1 and y1, the green block is x2 and y2
//currentFrame is used as a counter for the invincibility
int x1, y1, x2, y2, velx1, vely1, velx2, vely2, currentFrame;

//powerup initial position
float px, py;

//variable for reset item position
float rx, ry;

//rdir and gdir are meant to help with movement
//rInvince and gInvince indicate invincibility
String rdir, gdir, rInvince, gInvince;

//whether the game is active, whether the title screen is active
boolean game, title; 

//rlist and glist are the particle trails
//power up and reset item are the invincibility and reset item blocks respectively
ArrayList<Particle> rlist = new ArrayList<Particle>();
ArrayList<Particle> glist = new ArrayList<Particle>();
ArrayList<Particle> powerup = new ArrayList<Particle>();
ArrayList<Particle> resetitem = new ArrayList<Particle>();
PImage TScreen;


void setup() {
  size(displayWidth, displayHeight);
  background(0);
  stroke(255);
  x1 = 75;
  y1 = 75;
  x2 = width - 75;
  y2 = 75;
  px = width/2;
  py = 3*height/4;
  TScreen = loadImage("TitleScreen.png");
  velx1 = 2;
  velx2 = -2;
  rectMode(CENTER);
  game = false;
  title = true;
  rInvince = gInvince = "false";
  textAlign(CENTER, CENTER);
}

void draw() {

  //sets each movement as a string to represent direction
  directionSetup();

  //creates the title screen only at the beginning of the game
  if (title) {
    image(TScreen, 0, 0, width, height);
  }

  //waits for an enter input to begin the game, also ends the title screen, and resets the game every time
  if (keyPressed) {
    if (key == ENTER) {
      game = true;
      title = false;
      for (int i = rlist.size () - 1; i >= 0; i--) {
        rlist.remove(i);
        glist.remove(i);
      }
      for (int i = powerup.size () - 1; i >= 0; i--) {
        powerup.remove(i);
      }
      for (int i = resetitem.size () - 1; i >= 0; i--) {
        resetitem.remove(i);
      }
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
      rlist.add(new Particle(x1, y1, 255, 0, 0, 5));
      glist.add(new Particle(x2, y2, 0, 255, 0, 5));
    }
  
    //adds a reset item every 10 seconds  
    if (frameCount % 600 == 0) {
      resetitem.add(new Particle(random(200, width-200), random(200, height-200), 255, 0, 255, 20));
    }


    //adds a powerup
    for (int i = 0; i < 1; i++) {
      powerup.add(new Particle(px, py, 0, 100, 255, 20));
    }

    //changes the location of the players through velocities
    x1+=velx1;
    y1+=vely1;
    x2+=velx2;
    y2+=vely2;

    //indicates invincibility with a blue border
    if (rInvince == "true") {
      fill(0, 100, 255);
      rect(x1, y1, 30, 30);
    }
    if (gInvince == "true") {
      fill(0, 100, 255);
      rect(x2, y2, 30, 30);
    }

    //creation of the blocks/players
    fill(255, 0, 0);
    rect(x1, y1, 25, 25);
    fill(0, 255, 0);
    rect(x2, y2, 25, 25);

    //movement for both arrow keys and WASD
    //prevents moving in the direction opposite to current movement
    movement();   

    //checks if either player gets the invincibility power up, also sets them to invincible, and resets power up
    for (int i = powerup.size () - 1; i >= 0; i--) {
      Particle p = powerup.get(i);
      if (p.px < x1 + 9.999 && p.px > x1 - 9.999 && p.py > y1 - 9.999 && p.py < y1 + 9.999) {
        rInvince = "true";
        frameCount = currentFrame;
        powerup.remove(i);
        px = random(200, width - 200);
        py = random(200, height - 200);
      } 
      if (p.px < x2 + 9.999 && p.px > x2 - 9.999 && p.py > y2 - 9.999 && p.py < y2 + 9.999) {
        gInvince = "true";
        frameCount = currentFrame;
        powerup.remove(i);
        px = random(200, width - 200);
        py = random(200, height - 200);
      }
    }

    //limits the invincibility to three seconds
    if (rInvince == "true" && frameCount - currentFrame > 180) {
      rInvince = "false";
    }
    if (gInvince == "true" && frameCount - currentFrame > 180) {
      gInvince = "false";
    }

    //checks if a reset item is used
    for (int i = resetitem.size () - 1; i >= 0; i--) {
      Particle r = resetitem.get(i);
      if (r.px < x1 + 9.999 && r.px > x1 - 9.999 && r.py > y1 - 9.999 && r.py < y1 + 9.999 || r.px < x2 + 9.999 && r.px > x2 - 9.999 && r.py > y2 - 9.999 && r.py < y2 + 9.999) {
        resetitem.remove(i);
        for (int j = rlist.size () - 1; j >= 0; j--) {
          rlist.remove(j);
          glist.remove(j);
        }
      }
    }
    
    //draw a powerup particle
    for (int i = powerup.size () - 1; i >= 0; i--) {
      Particle p = powerup.get(i);
      p.create();
    } 
    
    //draws all reset items
    for (int i = resetitem.size () - 1; i >= 0; i--) {
      Particle r = resetitem.get(i);
      r.create();
    } 

    // checks interactions between the red particles and the players
    for (int i = rlist.size () - 1; i >= 0; i--) {     
      Particle r = rlist.get(i);
      if (game) {
        r.create();
      }
      if (r.px < x1 + .999 && r.px > x1 - .999 && r.py > y1 - .999 && r.py < y1 + .999 && rInvince == "false") {
        rlist.remove(i);
        glist.remove(i);
        game = false;
        if (!game) {
          greenWin();
        }
      }
      if ( r.px < x2 + .999 && r.px > x2 - .999 && r.py > y2 - .999 && r.py < y2 + .999 && gInvince == "false") {
        rlist.remove(i);
        glist.remove(i);
        game = false;
        if (!game) {
          redWin();
        }
      }
    }

    // checks interactions between the green particles and the players
    for (int i = glist.size () - 1; i >= 0; i--) {      
      Particle g = glist.get(i);
      if (game) {
        g.create();
      }  
      if (g.px < x1 + .999 && g.px > x1 - .999 && g.py > y1 - .999 && g.py < y1 + .999 && rInvince == "false") {
        rlist.remove(i);
        glist.remove(i); 
        game = false;
        if (!game) {
          greenWin();
        }
      }
      if (g.px < x2 + .999 && g.px > x2 - .999 && g.py > y2 - .999 && g.py < y2 + .999 && gInvince == "false") {
        rlist.remove(i);
        glist.remove(i); 
        game = false;
        if (!game) {
          redWin();
        }
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

//movement for both arrow keys and WASD (and wasd for CAPS LOCK issues)
//prevents moving in the direction opposite to current movement
void movement() {

  if (keyPressed) {
    if ((key == 'w' || key == 'W') && rdir != "down") {
      velx1 = 0;
      vely1 = -2;
    }
    if ((key == 's' || key == 'S') && rdir != "up") {
      velx1 = 0;
      vely1 = 2;
    }
    if ((key == 'a' || key == 'A') && rdir != "right") {
      velx1 = -2;
      vely1 = 0;
    }
    if ((key == 'd' || key == 'D') && rdir != "left") {
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
    if (keyCode == LEFT && gdir != "right") {
      velx2 = -2;
      vely2 = 0;
    }
    if (keyCode == RIGHT && gdir != "left") {
      velx2 = 2;
      vely2 = 0;
    }
  }
}

//the screen change for a red win
void redWin() {

  background(255);
  fill(255, 0, 0);
  textSize(72);
  text("Red Wins", width/2, height/2);
  text("Press ENTER to play again", width/2, 3*height/4);
  x1 = 75;
  y1 = 75;
  x2 = width - 75;
  y2 = 75;
  px = width/2;
  py = 3*height/4;
  velx1 = 2;
  velx2 = -2;
  vely1 = vely2 = 0;
  rInvince = gInvince = "false";
}


//the screen change for a green win
void greenWin() {

  background(255);
  fill(0, 255, 0);
  textSize(72);
  text("Green Wins", width/2, height/2);
  text("Press ENTER to play again", width/2, 3*height/4);
  x1 = 75;
  y1 = 75;
  x2 = width - 75;
  y2 = 75;
  px = width/2;
  py = 3*height/4;
  velx1 = 2;
  velx2 = -2;
  vely1 = vely2 = 0;
  rInvince = gInvince = "false";
}

