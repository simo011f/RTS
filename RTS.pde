
int scale = 10;
int cols;
int rows;

PImage voidImg;
PImage emitterImg;
PImage baseImg;
PImage bombTowerImg;

Game game;



void setup() {
  //size(1600, 900);
  fullScreen();
  spriteLoad();

  cols = width / scale;
  rows = height / scale - 6;
  game = new Game();

  background(255); 
  frameRate(45);
}

void draw() { 

  if (game.loc == 3) {
    thread("enemyUpdate");
  }

  game.run();
  //println(frameRate);
}

void enemyUpdate()
{
  if (frameCount % 2 == 0) {
    game.baseLevel.enemyArray.Update();
  }
}

void spriteLoad()
{
  voidImg = loadImage("voidImg.png");
  emitterImg = loadImage("EmitterSprite.png");
  baseImg = loadImage("BaseSprite.png");
  bombTowerImg = loadImage("BombTower.png");
}

void mouseClicked()
{
  game.player.towerMove();
}

boolean[] keys = new boolean[11];
//this boolean handles all the key inputs.

void keyPressed() {
  switch (key) {
  case ' ':
    keys[0] = true;
    break;
  case 'a':
    keys[1] = true;
    break;
  case 's':
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
    game.timer.St = 0;
    break;
  case 'a':
    keys[1] = false;
    game.timer.Bt1=0;
    break;
  case 's':
    keys[2] = false;
    game.timer.Bt1=0;
    break;
  case 'd':
    keys[3] = false;
    game.timer.Bt1=0;
    break;
  case 'w':
    keys[4] = false;
    game.timer.Bt1=0;
    break;
  }
  switch (keyCode) {
  case RIGHT:
    keys[5] = false;
    game.timer.Bt2=0;
    break;
  case LEFT:
    keys[6] = false;
    game.timer.Bt2=0;
    break;
  case DOWN:
    keys[7] = false;
    game.timer.Bt2=0;
    break;
  case UP:
    keys[8] = false;
    game.timer.Bt2=0;
    break;
  case ESC:
    keys[9] = false;
    key = 0;
    game.timer.es = 0;
    break;
  case ENTER:
    keys[10] = true;
    break;
  }
}
