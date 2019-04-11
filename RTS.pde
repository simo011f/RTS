int scale = 10;
int cols;
int rows;

PImage voidImg;
PImage layerZeroImg;
PImage layerOneImg;
PImage layerTowImg;
PImage layerThreeImg;
PImage layerFureImg;
PImage layerFiveImg;
PImage emitterImg;
PImage baseImg;
PImage bombTowerImg;
PImage shotTowerImg;
PImage emitterAttackerTowerImg;
ArrayList<Visualize> visualizer;

Game game;

//conding cahllenge doppelt pendul baggurnd / terrain ved hjelp canvis

void setup() {
  //size(1600, 900);
  fullScreen();
  spriteLoad();

  cols = width / scale;
  rows = height / scale - 6;
  game = new Game();

  visualizer = new ArrayList<Visualize>();

  background(255); 
  frameRate(45);
}

void draw() { 
  if (frameCount == 1)
  {
    game.addToVisualizer();
  }
  if (game.loc == 3) {
    thread("enemyUpdate");
  }
  for (int i = 0; i < visualizer.size(); i++) {
    visualizer.get(i).visualize();
  }
  game.run();

  println(frameRate);
}

void enemyUpdate()
{
  if (!game.pause) {
    game.baseLevel.enemyRun();
  }
}

void spriteLoad()
{
  voidImg = loadImage("voidImg.png");
  layerZeroImg = loadImage("LayerZero.png");
  layerOneImg = loadImage("LayerOne.png");
  layerTowImg = loadImage("LayerTow.png");
  layerThreeImg = loadImage("LayerThree.png");
  layerFureImg = loadImage("LayerFure.png");
  layerFiveImg = loadImage("LayerFive.png");
  emitterImg = loadImage("EmitterSprite.png");
  baseImg = loadImage("BaseSprite.png");
  bombTowerImg = loadImage("BombTower.png");
  shotTowerImg = loadImage("ShotTower.png");
  emitterAttackerTowerImg = loadImage("EmitterAttacker.png");
}

void mouseClicked()
{
  if (game.loc == 3) {
    game.player.isMouseNotPressedHotBar = false;
    game.player.towerMove();
  }
  if (game.win && game.baseLevel.currentLevel >= 12) {
    game.loc = 0;
  }
}

boolean[] keys = new boolean[11];
//this boolean handles all the key inputs.

void keyPressed() {
  switch (key) {
  case ' ':
    keys[0] = true;
    break;
  case 'x':
    keys[1] = true;
    break;
  case 'r':
    keys[2] = true;
    break;
  case 'd':
    keys[3] = true;
    break;
  case 'w':
    keys[4] = true;
    break;
  }

  switch (keyCode) {
  case RIGHT:
    keys[5] = true;
    break;
  case LEFT:
    keys[6] = true;
    break;
  case DOWN:
    keys[7] = true;
    break;
  case UP:
    keys[8] = true;
    break;
  case ESC:
    keys[9] = true;
    key = 0;
    break;
  case ENTER:
    keys[10] = true;
    break;
  }
}

void keyReleased() {
  switch (key) {
  case ' ':
    keys[0] = false;
    break;
  case 'a':
    keys[1] = false;
    break;
  case 's':
    keys[2] = false;
    break;
  case 'd':
    keys[3] = false;
    break;
  case 'w':
    keys[4] = false;
    break;
  }
  switch (keyCode) {
  case RIGHT:
    keys[5] = false;
    break;
  case LEFT:
    keys[6] = false;
    break;
  case DOWN:
    keys[7] = false;
    break;
  case UP:
    keys[8] = false;
    break;
  case ESC:
    keys[9] = false;
    key = 0;
    break;
  case ENTER:
    keys[10] = true;
    break;
  }
}
void restrainMouse()
{
  if (mouseX>width-40) {
    mouseX = width-40;
  } 
  if (mouseX<30) {
    mouseX = 30;
  } 
  if (mouseY<30) {
    mouseY = 30;
  } 
  if (mouseY>height-100) {
    mouseY = height-100;
  }
}

interface Visualize
{
  void visualize();
}
