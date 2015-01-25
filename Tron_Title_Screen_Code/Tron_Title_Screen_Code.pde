PImage TScreen;

void setup() {
  size(displayWidth,displayHeight);
  TScreen=loadImage("TitleScreen.png");
}

void draw() {
  image(TScreen,0,0,displayWidth,displayHeight);
}
