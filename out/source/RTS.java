import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class RTS extends PApplet {

Game game;



public void setup() {
  

  //fullScreen();
game= new Game(1);
  game = new Game();
  //frameRate(2);
}

public void draw() {

  background(255);
  game.run(); 
  println(frameRate);
  //println(mouseX, mouseY);
  println(frameRate);
}

boolean[] keys = new boolean[11];
//this boolean handles all the key inputs.

public void keyPressed() {
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

public void keyReleased() {
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
class BaseLevel  //<>//
{

  EnemyGrid enemys;

  Emitter emitter;

  int scale = 10;  

  int cols = width / scale;
  int rows = (height / scale) - 6;

  boolean isNorth = false;
  boolean isSouth = false;
  boolean isEast = false;
  boolean isWest = false;

  BaseLevel()
  {

    enemys = new EnemyGrid();
    emitter = new Emitter(new PVector(cols/2, rows/2), 1);


    //for (int i = 0; i < cols; i++) {
    //  for (int j = 0; j < rows; j++) { 
    //    enemys.enemys[i][j].strength = 10;
    //  }
    //}

    enemys.enemys[cols/2][rows/2].strength = 10000;
    //enemys.enemys[cols-1][rows-1].strength = 10000;
    //enemys.enemys[cols-1][0].strength = 10000;
    //enemys.enemys[0][rows-1].strength = 10000;
    //enemys.enemys[0][0].strength = 10000;
  }



  public boolean thereIs(int i, int j) {
    if (j - 1 > 0) {
      if (enemys.enemys[i][j - 1].strength >= 1) {
        isNorth = true;
      }
    } else if (j - 1 <= 0)
    {
      isNorth = true;
    }
    if (j + 1 < rows) {
      if ( enemys.enemys[i][j + 1].strength >= 1) {
        isSouth = true;
      }
    } else if (j + 1 >= rows)
    {
      isSouth = true;
    }
    if (i + 1 < cols) {
      if (enemys.enemys[i + 1][j].strength >= 1) {
        isEast = true;
      }
    } else if (i + 1 >= cols)
    {
      isEast = true;
    }
    if (i - 1 > 0) {
      if (enemys.enemys[i - 1][j].strength >= 1) {
        isWest = true;
      }
    } else if (i - 1 <= 0)
    {
      isWest = true;
    }

    if (isNorth && isSouth && isEast && isWest)
    {
      return true;
    } else {
      return false;
    }
  }

  public void fieldDraw() {   
    //this draws the stuff
    //Maybe an array of variables would have been better
    layerOneDraw();
  } 
  
  public void layerOneDraw()
  {
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {

        int x = i*scale;
        int y = j*scale;
        fill(255, 0);
        stroke(0);
        strokeWeight(0.5f);
        rect(x, y, scale, scale);
      }
    }
  }


  public void Draw()
  {
    background(100);
    fieldDraw();
  }



  public void Update()
  {
    int hej = 0;

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if (enemys.enemys[i][j].strength >= 5) {	
          isNorth = false;
          isSouth = false;
          isEast = false;
          isWest = false;
          if (thereIs(i, j)) {
            enemys.addToAjesent(i, j);
            hej += enemys.enemys[i][j].strength;
          } else {
            enemys.spawnAjesent(i, j);
          }
        }
      }
    }
    println(hej);
  }

  public void enemyRun()
  {
    emitter.Update(enemys);

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        enemys.Run(i, j);
      }
    }
    emitter.Draw();
  }

  public void Run()
  {
    Update();
    Draw();
  }
}
class Emitter  //<>//
{
  PVector[][] pGrid;
  PVector location;

  int power;
  int delay;
  int timer = 0;

  boolean isDead = false;

  Emitter(PVector spawn, int sDelay) 
  {
    location = spawn;
    delay = sDelay;
    pGrid = game.squareFeld.grid;
    power = 1;
  }



  public void Draw()
  {
    fill(0, 255, 0, 100);
    //for (int i = 0; i <= 2; i++)
    //{
    //  for (int j = 0; j <= 2; i++)
    //  {

        rect((int)location.x*10, (int)location.y*10, 10, 10);
      }
  //  }
  //}

  public void Update(EnemyGrid enemys) 
  {

    if (delay > timer)
    {
      timer++;
    }
    if (delay <= timer) {
      enemys.enemys[(int)location.x][(int)location.y].addLayer(power);
      timer = 0;
    }
  }

  public void Run() 
  {
    Draw();
  }
}
class Enemy   //<>//
{
  int strength;

  Enemy() {
    strength = -1;
  }

  Enemy(PVector spawn)
  {
    game.squareFeld.ocupied[(int)spawn.x][(int)spawn.y] = 1;

    strength = -1;
  }

  public void addLayer()
  {
    strength++;
  }
    public void addLayer(int addStrength)
  {
    strength += addStrength;
  }
}
class EnemyGrid 
{

  int scale = 10;  

  int cols = width / scale;
  int rows = (height / scale) - 6;

  Enemy[][] enemys = new Enemy[cols][rows];

  EnemyGrid() {
    // Begin loop for columns
    for (int i = 0; i < cols; i++) 
    {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) 
      {
        enemys[i][j] = new Enemy(new PVector(i, j));
      }
    }
  }

  public void addToAjesent(int i, int j)
  {
    int strengthAdded = 0;
    if (j - 1 >= 0 && enemys[i][j - 1].strength >= 1 && enemys[i][j - 1].strength <= enemys[i][j].strength)
    {
      strengthAdded++;
      enemys[i][j - 1].addLayer();
    }
    if (j + 1 < rows  && enemys[i][j + 1].strength >= 1 && enemys[i][j + 1].strength <= enemys[i][j].strength)
    {
      strengthAdded++;
      enemys[i][j + 1].addLayer();
    }
    if (i - 1 >= 0 && enemys[i - 1][j].strength >= 1 && enemys[i - 1][j].strength <= enemys[i][j].strength)
    {
      strengthAdded++;
      enemys[i - 1][j].addLayer();
    }
    if (i + 1 < cols && enemys[i + 1][j].strength >= 1 && enemys[i + 1][j].strength <= enemys[i][j].strength)
    {
      strengthAdded++;
      enemys[i + 1][j].addLayer();
    }
    enemys[i][j].strength -= strengthAdded;
  }

  public void spawnAjesent(int i, int j)
  {
    int strengthAdded = 0;
    if (j - 1 >= 0 && enemys[i][j - 1].strength == -1)
    {
      strengthAdded++;
      enemys[i][j - 1].strength = 1;
    }
    if (j + 1 < rows && enemys[i][j + 1].strength == -1)
    {
      strengthAdded++;
      enemys[i][j + 1].strength = 1;
    }
    if (i - 1 >= 0 && enemys[i - 1][j].strength == -1)
    {
      strengthAdded++;
      enemys[i - 1][j].strength = 1;
    }
    if (i + 1 < cols && enemys[i + 1][j].strength == -1)
    {
      strengthAdded++;
      enemys[i + 1][j].strength = 1;
    }
    enemys[i][j].strength -= strengthAdded;
  }

  public void Run(int i, int j)
  {

    if (enemys[i][j].strength >= 1)
    {
      fill(0, 0, 255, 100);
      rect(i*10, j*10, 10, 10);
      fill(0);
      textAlign(CENTER);  
      textSize(10);
      text(enemys[i][j].strength, i*10+5, j*10+10);
    }
  }
}
class Energy 
{

  PVector energy = new PVector(0, 0);

  public void energyLogic() {
    if (game.player.GO) {
      energy.x = game.player.energyTower.size()*49;


      energy.z = energy.x + energy.y;
      
    }
  }


  public void energyGrid() {  

    for (int i = 0; i < game.player.energyTower.size(); i++) {
      for (int j = 1; j < game.player.energyTower.size(); j++) {
        if ((game.player.energyTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.energyTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.energyTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.energyTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          //int playerGetTowerLocationX(int i) ... int playerGetTowerLocationy(int i) 
          line (game.player.energyTower.get(i).location.x+5, game.player.energyTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.shotTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.shotTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.shotTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.shotTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.shotTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.shotTower.get(i).location.x+5, game.player.shotTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.bombTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.bombTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.bombTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.bombTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.bombTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.bombTower.get(i).location.x+5, game.player.bombTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.enemyAttackTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.enemyAttackTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 && (game.player.enemyAttackTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.enemyAttackTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 && (game.player.enemyAttackTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.enemyAttackTower.get(i).location.x+5, game.player.enemyAttackTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.base.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.shotTower.size(); j++) {
        if ((game.player.base.get(i).location.x+5)-(game.player.shotTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.shotTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.shotTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.shotTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.shotTower.get(j).location.x+5, game.player.shotTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.bombTower.size(); j++) {
        if ((game.player.base.get(i).location.x+5)-(game.player.bombTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.bombTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.bombTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.bombTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.bombTower.get(j).location.x+5, game.player.bombTower.get(j).location.y+5);
        }
      }
    }
  }

  public void run() {
    energyLogic();
    energyGrid();
    println(energy);
  }
}
class EscMenu 
{

  PFont font;
  boolean escPressed;
  boolean[] Opt = new boolean[4];
  int[] chol = new int[4];

  EscMenu() {
  }

  public void choices() {  

    if (mouseX >= width*3/8 && mouseX <= width*5/8 && mouseY >= 0 && mouseY <= height*1/4) {
      //this is the continue button.
      chol[0] = 0;
      Opt[0] = true;
    } else {
      chol[0] = 255;
      Opt[0] = false;
    }

    if (mouseX >= width*3/8 && mouseX <= width*5/8 && mouseY >= height*1/4 && mouseY <= height*2/4) {
      //this is the restart button
      chol[1] = 0;
      Opt[1] = true;
    } else {
      chol[1] = 255;
      Opt[1] = false;
    }
    if (mouseX >= width*3/8 && mouseX <= width*5/8 && mouseY >= height*2/4 && mouseY <= height*3/4) { 
      game.menu.timer=1;
      //this is the main menu option
      chol[2] = 0;
      Opt[2] = true;

      game.menu.screen[0]=false;
      game.menu.screen[1]=false;
      game.menu.screen[2]=false;
      game.menu.screen[3]=false; 
      game.menu.screen[4]=false;

      game.loadGame.levelNR[1]=false; 
      game.loadGame.levelNR[0]=false; 
      game.loadGame.levelNR[2]=false; 
      game.loadGame.levelNR[3]=false; 
      game.loadGame.levelNR[4]=false; 
      game.loadGame.levelNR[5]=false; 
      game.loadGame.levelNR[6]=false; 
      game.loadGame.levelNR[7]=false; 
      game.loadGame.levelNR[8]=false; 
      game.loadGame.levelNR[9]=false; 
      game.loadGame.levelNR[10]=false; 
      game.loadGame.levelNR[11]=false;
    } else {
      chol[2] = 255;
      Opt[2] = false;
    }
    if (mouseX >= width*3/8 && mouseX <= width*5/8 && mouseY >= height*3/4 && mouseY <= height) {
      //this is the exit button
      chol[3] = 0;
      Opt[3] = true;
    } else {
      chol[3] = 255;
      Opt[3] = false;
    }
  }

  public void display() {
    font = createFont("arial", 16, true);

    fill(255, 255, 0);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, 0, width*2/8, height);

    //continue button
    fill(255, 255, chol[0]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, 0, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(font, 46);
    text("Continue", width*4/8, height*1/7);
    //continue button

    //restart button
    fill(255, 255, chol[1]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*1/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(font, 46);
    text("Restart", width*4/8, height*7/18);
    //restart button

    //Main menu button
    fill(255, 255, chol[2]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*2/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(font, 46);
    text("Main Menu", width*4/8, height*12/19);
    //Main menu button

    //Close Game button
    fill(255, 255, chol[3]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*3/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(font, 46);
    text("Close Game", width*4/8, height*8/9);
    //Close Game button

    textAlign(LEFT);
  }

  public void run() {
    if (mousePressed && Opt[1]) {

      //game.player.energyTower.clear();
      //game.player.shotTower.clear();
      //game.player.bombTower.clear();
      //game.player.enemyAttackTower.clear();
      //game.player.base.clear();
      //for (int i = 0; i <= 4; i++) {
      //  game.player.towernr[i]=1;
      //}
      escPressed = false;
    }

    //Hvis ESC bliver trykket åbner det menuen og lukker den efter om menuen er åben eller ej
    if (keys[9] && game.timer.es==0) {
      game.timer.es=1;
      escPressed = !escPressed;
      Opt[0] = false;
      Opt[1] = false;
      Opt[2] = false;
      Opt[3] = false;
    } 
    //hvis continue bliver valgt
    if (mousePressed && Opt[0]) {
      escPressed = false;
    }
    //hvis menu bliver valgt
    if (mousePressed && Opt[2]) {
      escPressed = false;
    }

    if (escPressed) {
      display();  
      choices();
    }
  }
}
class Game 
{

  int gameContinue = 0;
  boolean win = false;
  int nr = 0;
  int loc = 0;  
  int lvlcode = 0;

  //these are all the classes: 

  SquareField squareFeld = new SquareField();
  Timer timer = new Timer();
  Menu menu = new Menu();
  LoadGame loadGame =  new LoadGame();
  KeyMenu keyMenu = new KeyMenu();


  EscMenu escMenu = new EscMenu();
  Player player = new Player();
  Energy energy = new Energy();

  GameBord gameBord; 
  BaseLevel baseLevel;

  Game(int i)
  {
    if (i == 1)
    {
      squareFeld = new SquareField();
    }
  }

  Game() {
    gameBord = new GameBord(); 
    baseLevel = new BaseLevel();
  }

  public void changeState() {

    if (mousePressed && keyMenu.leave) { 
      //if the exit button is pressed in the keys menu
      loc = 0;
    }
    if (mousePressed && loadGame.leave) { 
      //if the exit button is pressed in the load game menu
      loc = 0;
    }
    if (mousePressed && escMenu.Opt[2]) { 
      //if the main menu button is pressed in the ESC menu.
      loc = 0;
    }

    if (mousePressed && menu.screen[1]) {  

      //load game is pressed
      loc = 1;
    }



    if (mousePressed && menu.screen[2]) {   


      //if new game is pressed on the start menu
      nr = 0;
      loc = 1;
    }

    if (mousePressed && menu.screen[3]) {
      //if keys are pressed on the start menu
      keyMenu.t = 0;
      loc = 2;
    }
    if (mousePressed && menu.screen[0]) { 
      //if continue is pressed on the start menu
      menu.screen[0]=false;
      loc = 3;
      lvlcode=gameContinue;
    }

    if (mousePressed && loadGame.levelNR[0]) { 
      loc = 3;
      lvlcode=0;
    }
    if (mousePressed && loadGame.levelNR[1]) { 
      loc = 3;
      lvlcode=1;
    }
    if (mousePressed && loadGame.levelNR[2]) { 
      loc = 3;
      lvlcode=2;
    }
    if (mousePressed && loadGame.levelNR[3]) { 
      loc = 3;
      lvlcode=3;
    }
    if (mousePressed && loadGame.levelNR[4]) { 
      loc = 3;
      lvlcode=4;
    }
    if (mousePressed && loadGame.levelNR[5]) { 
      loc = 3;
      lvlcode=5;
    }
    if (mousePressed && loadGame.levelNR[6]) { 
      loc = 3;
      lvlcode=6;
    }
    if (mousePressed && loadGame.levelNR[7]) { 
      loc = 3;
      lvlcode=7;
    }
    if (mousePressed && loadGame.levelNR[8]) { 
      loc = 3;
      lvlcode=8;
    }
    if (mousePressed && loadGame.levelNR[9]) { 
      loc = 3;
      lvlcode=9;
    }
    if (mousePressed && loadGame.levelNR[10]) { 
      loc = 3;
      lvlcode=10;
    }
    if (mousePressed && loadGame.levelNR[11]) { 
      loc = 3;
      lvlcode=11;
    }
    if (mousePressed && menu.screen[4]) { 
      //exits the game if the exit button is pressed in the start menu
      loc = -1;
    }  
    if (mousePressed && escMenu.Opt[3]) {
      //exits the game if the exit button is chosen in the ESC menu
      loc = -1;
    }
    //this is a function that changes the data that is used for the level essentialy changes the level.
  }

  public void run() {



    changeState();
    switch (loc) {

    case -1: 
      //exits the game
      exit();
      break;

    case 0:
      //this is the menu
      menu.run();
      break;

    case 1:
      //this is the load game menu
      loadGame.run(); 
      escMenu.run();
      break;

    case 2:
      //this is the key menu
      keyMenu.run(); 
      escMenu.run();
      break;


    case 3: 

      //this is the main game
      timer.run();



      //gameBoard.run();
      baseLevel.Run();
      gameBord.hotbar();
      //player stas
      player.Run();
      energy.run();
      baseLevel.enemyRun();
      escMenu.run();

      break;

    case 5:
      //this is the end screen
      break;
    }
  }
}
class GameBord 
{

  PFont font;
  boolean GO;
  int scale = 10;  

  int cols = width/scale;
  int rows = height/scale-6;

  GameBord()
  {

  }

  public void hotbar() {
    PVector location=new PVector(width/2, height-45);

    fill(150);
    stroke(0);
    strokeWeight(1.5f);
    rect(width/2-500, height-60, 1000, 60);
    fill(0, 0, 255);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10+10, 10, 10);
      }
    }  

    fill(255, 0, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+scale*3+5, (location.y+j*10)+10, 10, 10);
      }
    } 

    fill(255, 255, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+scale*6+10, (location.y+j*10)+10, 10, 10);
      }
    }

    fill(0, 255, 255);
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        rect((location.x+i*10)+scale*6+100, (location.y+j*10)+10, 10, 10);
      }
    }

    fill(0, 255, 0);   
    rect((location.x+10)+scale*6+145, (location.y+10), 10, 10);
  }


  public void time() {
    //this function displays the time in the upper right corner of the game board.

    font = createFont("arial", 16, true);
    fill(150, 155, 155);
    stroke(0);
    strokeWeight(2);
    rect(width-40, 0, 40, 40);
    fill(222, 0, 222);
    textAlign(CENTER);
    textFont(font, 16);

    text("t", width-20, 20);
    noFill();
    textAlign(LEFT);
  }
}
class KeyMenu 
{

  boolean leave;
  int leaveColor;
  int t;
  PFont f;

  KeyMenu() {
    f = createFont("arial", 16, true);
  }
  public void tekst() { 
    textAlign(CENTER);
    fill(0);
    textFont(f, 35);
    text("← A", 115, 170);  
    text("D →", 245, 170); 

    text("W ↑", 445, 185);  
    text("S ↓", 445, 305); 

    text("Space"+"\n"+"Accept", 700, 125);  
    text("Esc"+"\n"+"Mini Menu", 700, 300);

    if (t >= 41 && t <= 49) { 
      textAlign(CENTER);
      fill(155);
      textFont(f, 35);
      text("← A", 115, 170); 
      text("S ↓", 445, 305);
    }
    if (t >= 86 && t <= 94) { 
      textAlign(CENTER);
      fill(155);
      textFont(f, 35);
      text("D →", 245, 170);
      text("W ↑", 445, 185);
    }   
    if (t >= 131 && t <= 139) { 
      textAlign(CENTER);
      fill(155);
      textFont(f, 35);
      text("D →", 245, 170);
      text("W ↑", 445, 185);
    }
    if (t >= 176 && t <= 180) { 
      textAlign(CENTER);
      fill(155);
      textFont(f, 35);
      text("← A", 115, 170);
      text("S ↓", 445, 305);
    }



    textAlign(LEFT);
  }

  public void display() {


    t++;



    fill(0, 150, 0);
    stroke(0);
    strokeWeight(2);
    rect(25, height*2/4, height*1/4, width*1/8);     
    rect(width*1/4+25, height*2/4, height*1/4, width*1/8); 
    fill(150);
    stroke(0);
    strokeWeight(2);
    rect(width*1/8+25, height*2/4, height*1/4, width*1/8);

    fill(0, 150, 0);
    stroke(0);
    strokeWeight(2);
    rect(width*5/8, height/4-25, height*1/4, width*1/8);
    rect(width*5/8, height*3/4-25, height*1/4, width*1/8);
    fill(150);
    stroke(0);
    strokeWeight(2);
    rect(width*5/8, height*2/4-25, height*1/4, width*1/8);
  }

  public void highligt() {
    //the animation of how to change spots
    if (t<=45) { 
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*1/8+25, height*2/4, height*1/4, width*1/8);
      rect(width*5/8, height*2/4-25, height*1/4, width*1/8);
    }
    if (t >= 45 && t <= 90) { 

      fill(0, 200, 0);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(25, height*2/4, height*1/4, width*1/8);
      rect(width*5/8, height*3/4-25, height*1/4, width*1/8);
    }
    if (t>=90 && t<135) { 
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*1/8+25, height*2/4, height*1/4, width*1/8);
      rect(width*5/8, height*2/4-25, height*1/4, width*1/8);
    }
    if (t >= 135 && t <= 180) { 

      fill(0, 200, 0);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*1/4+25, height*2/4, height*1/4, width*1/8);  
      rect(width*5/8, height/4-25, height*1/4, width*1/8);
    } 

    if (t>=180) {
      t=0;
    }
  }

  public void leave() {
    fill(255, leaveColor, 255);
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 80, 80);
    fill(0);
    textFont(f, 20);
    textAlign(CENTER);
    text("Back", 40, 45);


    if (mouseX>=0 && mouseX<=80 && mouseY>=0 && mouseY<=80 ) {
      game.menu.timer=0;
      leaveColor = 0;
      game.menu.screen[3]=false;
      leave = true;
    } else {
      leaveColor = 255;
      leave = false;
    }
    textAlign(LEFT);
  }

  public void run() {
    tekst();

    display();
    highligt(); 
    leave();
  }
}
class LoadGame {
  PFont f; 
  boolean[] levelNR = new boolean[13];
  int[] levelColors = new int[13];
  int levelCode;
  int colorLeave;
  boolean leave;
  int timer;

  LoadGame() { 
    f = createFont("arial", 16, true);
  }

  public void levelBord() {

    //this draws all the necessary numbers at the right locations

    fill(0, 0, 0); 
    textFont(f, 26);
    textAlign(CENTER);
    text("Load Game", width*4/8, 40);
    textAlign(LEFT);


    fill(levelColors[0], 255, levelColors[0]);
    stroke(0);
    strokeWeight(2);
    rect(width*1/8, 50, 150, height*1/4); 
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL1", width*1/8+75, 110);
    textAlign(LEFT);



    fill(levelColors[1], 255, levelColors[1] );
    if (game.nr <= 1) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*2/8+50, 50, 150, height*1/4);     
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL2", width*2/8+125, 110);
    textAlign(LEFT);


    fill(levelColors[2], 255, levelColors[2] );
    if (game.nr <= 2) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*3/8+100, 50, 150, height*1/4);  
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL3", width*3/8+175, 110);
    textAlign(LEFT);


    fill(levelColors[3], 255, levelColors[3] );
    if (game.nr <= 3) {
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*4/8+150, 50, 150, height*1/4);
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL4", width*4/8+225, 110);
    textAlign(LEFT);

    fill(levelColors[4], 255, levelColors[4] );
    if (game.nr <= 4) {
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*1/8, 150, 150, height*1/4); 
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL5", width*1/8+75, 210);    
    textAlign(LEFT);


    fill(levelColors[5], 255, levelColors[5] );
    if (game.nr <= 5) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*2/8+50, 150, 150, height*1/4);     
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL6", width*2/8+125, 210);
    textAlign(LEFT);

    fill(levelColors[6], 255, levelColors[6] );
    if (game.nr <= 6) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*3/8+100, 150, 150, height*1/4);      
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL7", width*3/8+175, 210);
    textAlign(LEFT); 

    fill(levelColors[7], 255, levelColors[7] );
    if (game.nr <= 7) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*4/8+150, 150, 150, height*1/4); 
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL8", width*4/8+225, 210);
    textAlign(LEFT);

    fill(levelColors[8], 255, levelColors[8] );
    if (game.nr <= 8) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*1/8, 250, 150, height*1/4);     
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL9", width*1/8+75, 310);    
    textAlign(LEFT);


    fill(levelColors[9], 255, levelColors[9]);
    if (game.nr <= 9) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*2/8+50, 250, 150, height*1/4);     
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL10", width*2/8+125, 310);
    textAlign(LEFT);

    fill(levelColors[10], 255, levelColors[10] );
    if (game.nr <= 10) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*3/8+100, 250, 150, height*1/4);  
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL11", width*3/8+175, 310);
    textAlign(LEFT); 

    fill(levelColors[11], 255, levelColors[11] );
    if (game.nr <= 11) {  
      fill(0);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*4/8+150, 250, 150, height*1/4);
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL12", width*4/8+225, 310);
    textAlign(LEFT);
  }


  public void levelBordLogic() {    
    if (timer<30) {
      timer++;
    }
    //You can chose the level that you want to play.

    if (mouseX >= width*2/16 && mouseX <= width*5/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
      levelColors[0] = 0;
      levelNR[0] = true;
    } else {
      levelColors[0] = 255;
      levelNR[0] = false;
    }
    if (game.nr >= 1) { 
      if (mouseX >= width*5/16 && mouseX <= width*8/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
        levelColors[1] = 0;
        levelNR[1] = true;
      } else {
        levelColors[1] = 255;
        levelNR[1] = false;
      }
    } 
    if (game.nr >= 2) { 
      if (mouseX >= width*8/16 && mouseX <= width*11/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
        levelColors[2] = 0;
        levelNR[2] = true;
      } else {
        levelColors[2] = 255;
        levelNR[2] = false;
      }
    } 
    if (game.nr >= 3) { 
      if (mouseX >= width*11/16 && mouseX <= width*14/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
        levelColors[3] = 0;
        levelNR[3] = true;
      } else {
        levelColors[3] = 255;
        levelNR[3] = false;
      }
    }     
    if (game.nr >= 4) { 
      if (mouseX >= width*2/16 && mouseX <= width*5/16 && mouseY >= height*3/8 && mouseY <= height*5/8) {
        levelColors[4] = 0;
        levelNR[4] = true;
      } else {
        levelColors[4] = 255;
        levelNR[4] = false;
      }
    }
    if (game.nr >= 5) { 
      if (mouseX >= width*5/16 && mouseX <= width*8/16 && mouseY >= height*3/8 && mouseY <= height*5/8) {
        levelColors[5] = 0;
        levelNR[5] = true;
      } else {
        levelColors[5] = 255;
        levelNR[5] = false;
      }
    } 
    if (game.nr >= 6) { 
      if (mouseX >= width*8/16 && mouseX <= width*11/16 && mouseY >= height*3/8 && mouseY <= height*5/8) {
        levelColors[6] = 0;
        levelNR[6] = true;
      } else {
        levelColors[6] = 255;
        levelNR[6] = false;
      }
    }  
    if (game.nr >= 7) { 
      if (mouseX >= width*11/16 && mouseX <= width*14/16 && mouseY >=height*3/8 && mouseY <= height*5/8) {
        levelColors[7] = 0;
        levelNR[7] = true;
      } else {
        levelColors[7] = 255;
        levelNR[7] = false;
      }
    }     
    if (game.nr >= 8) { 
      if (mouseX >= width*2/16 && mouseX <= width*5/16 && mouseY >= height*5/8 && mouseY <= height*7/8) {
        levelColors[8] = 0;
        levelNR[8] = true;
      } else {
        levelColors[8] = 255;
        levelNR[8] = false;
      }
    }
    if (game.nr >= 9) { 
      if (mouseX >= width*5/16 && mouseX <= width*8/16 && mouseY >= height*5/8 && mouseY <= height*7/8) {
        levelColors[9] = 0;
        levelNR[9] = true;
      } else {
        levelColors[9] = 255;
        levelNR[9] = false;
      }
    }  
    if (game.nr >= 10) { 
      if (mouseX >= width*8/16 && mouseX <= width*11/16 && mouseY >= height*5/8 && mouseY <= height*7/8) {
        levelColors[10] = 0;
        levelNR[10] = true;
      } else {
        levelColors[10] = 255;
        levelNR[10] = false;
      }
    }  
    if (game.nr >= 11) { 
      if (mouseX >= width*11/16 && mouseX <= width*14/16 && mouseY >= height*5/8 && mouseY <= height*7/8 && timer >= 30) {
        levelColors[11] = 0;
        levelNR[11] = true;
      } else {
        levelColors[11] = 255;
        levelNR[11] = false;
      }
    }
  }


  public void leave() {
    fill(255, colorLeave, 255);
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 80, 80);
    fill(0);
    textFont(f, 20);
    textAlign(CENTER);
    text("Back", 40, 45); 


    if (mouseX>=0 && mouseX<=80 && mouseY>=0 && mouseY<=80 ) {



      game.menu.timer = 0;
      colorLeave = 0;
      game.menu.screen[2]=false;
      game.menu.screen[1]=false;

      colorLeave = 0;
      game.menu.screen[2]=false;
      game.menu.screen[1]=false;


      leave = true;
    } else {
      colorLeave = 255;
      leave = false;
    }  
    textAlign(LEFT);
  }

  public void run() { 

    leave();
    levelBord();
    levelBordLogic();
  }
}
class Menu 
{
  Game game;

  PFont font;

  int timer;
  int colorContinue;
  int colorNewGame;
  int colorLoadGame;
  int colorKeyMenu;
  int colorEscMenu;

  PVector mouseLocation = new PVector(mouseX, mouseY);

  boolean[] screen = new boolean[6];

  Menu() {
    font = createFont("areal", 16, true);
  }    

  public void lvlChoiceBox() {
    //continue box
    fill(colorContinue, colorContinue, 255);
    stroke(0);
    strokeWeight(2);
    rect(width*1/3, 20, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Continue", width*1/2, height*11/72);
    //continue box

    //new game box
    fill(colorNewGame, 255, colorNewGame);
    stroke(0);
    strokeWeight(2);
    rect(width*1/3, height*7/18-10, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("New Game", width*1/2, height*1/2);
    //new game box 

    //load game box
    fill(255, colorLoadGame, colorLoadGame);
    stroke(0);
    strokeWeight(2);
    rect(width*1/3, height*55/72-15, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Load Game", width*1/2, height*127/144);
    //load game box

    textAlign(LEFT);
  }
  public void lvlChoiceLogic() {

    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=20 && mouseY<=height/4 && timer >= 10) {
      //continue box
      colorContinue = 0;
      screen[0] = true;
    } else {
      colorContinue = 255;
      screen[0] = false;
    }
    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=height*3/8 && mouseY<=height*3/8+height/4-20 && timer >= 10) {
      //new game box
      colorNewGame = 0;
      screen[2] = true;
    } else {
      colorNewGame = 255;
      screen[2] = false;
    }
    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=height*55/72-15 && mouseY<= height*55/72-15+height/4-20 && timer >= 10) {
      //load game box
      //G.Lg.t=0;



      colorLoadGame = 0;

      screen[1] = true;
    } else {
      colorLoadGame = 255;
      screen[1] = false;
    }
    //if (mouseX>=0 && mouseX<=80 && mouseY>=390 && mouseY<=height && t >= 10) {
    //  G.nr=12;
    //}
  }

  public void keymenu() {
    timer++;
    //this is the part that handles if the player selects the key menu option.
    fill(colorKeyMenu, 255, 255);
    stroke(0);
    strokeWeight(2);
    rect(width-80, 0, 80, 80);
    fill(0);
    textFont(font, 20);
    textAlign(CENTER);
    text("Keys", width-40, 45);

    if (mouseX>=width-80 && mouseX<=width && mouseY>=0 && mouseY<=80 && timer >= 10) {
      colorKeyMenu = 0;
      screen[3] = true;
    } else {
      colorKeyMenu = 255;
      screen[3] = false;
    }
    textAlign(LEFT);
  }

  public void terminate() {
    fill(255, colorEscMenu, 255);
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 80, 80);
    fill(0);
    textFont(font, 20);
    textAlign(CENTER);
    text("Exit", 40, 45);

    if (mouseX>=0 && mouseX<=80 && mouseY>=0 && mouseY<=80 && timer >= 10) {

      colorEscMenu = 0;
      screen[4] = true;
    } else { 
      colorEscMenu = 255;
      screen[4] = false;
    } 
    textAlign(LEFT);
  }

  public void run() {
    if (timer >= 10) {
      timer = 10;
    }
    terminate();
    keymenu();
    lvlChoiceBox();
    lvlChoiceLogic();
  }
}
class Player  //<>//
{

  int timer;
  int [] towernr = new int[5]; 
  int [] towernrremeber = new int[5];
  ArrayList<TowerAttackTerrtoriumShot> shotTower = new ArrayList<TowerAttackTerrtoriumShot>();
  ArrayList<TowerAttackTerrtoriumBomb> bombTower = new ArrayList<TowerAttackTerrtoriumBomb>();
  ArrayList<TowerAttackETowers> enemyAttackTower = new ArrayList<TowerAttackETowers>(); 
  ArrayList<TowerBase> base = new ArrayList<TowerBase>();
  ArrayList<TowerEnergy> energyTower = new ArrayList<TowerEnergy>();
  boolean[] towerpickedOnBar = new boolean[5];    
  boolean[] towerpicked = new boolean[5]; 
  int picked;
  boolean[] placeble = new boolean[5];
  boolean[] placeble2 = new boolean[5];

  boolean GO = false;
  int [] nr = new int[5];
  int rageDisply = 195;

  Player() {
  }

  public void tower() {
  }

  public void PickTowerOnBar() { 
    timer++;

    //blå
    if (mouseX>= width/2-10 && mouseX<=width/2+20 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[0]=true;
    } else {
      towerpickedOnBar[0]=false;
    }
    if (towerpickedOnBar[0] && mousePressed) {   
      towernr[0]=towernr[0]+1;

      shotTower.add(new TowerAttackTerrtoriumShot());
      timer=0; 
      picked=1;
      placeble[0]=true;
      towerpickedOnBar[0]=false; 
      GO = true;
    }


    //rød
    if (mouseX>= width/2+25 && mouseX<=width/2+55 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[1]=true;
    } else {
      towerpickedOnBar[1]=false;
    }
    if (towerpickedOnBar[1] && mousePressed) {   
      towernr[1]=towernr[1]+1;

      bombTower.add(new TowerAttackTerrtoriumBomb());
      timer=0; 
      picked=2;
      placeble[1]=true;
      towerpickedOnBar[1]=false;   
      GO = true;
    }

    //gul
    if (mouseX>= width/2+60 && mouseX<=width/2+90 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[2]=true;
    } else {
      towerpickedOnBar[2]=false;
    }
    if (towerpickedOnBar[2] && mousePressed) {   
      towernr[2]=towernr[2]+1;

      enemyAttackTower.add(new TowerAttackETowers());
      timer=0; 
      picked=3;
      placeble[2]=true;
      towerpickedOnBar[2]=false;   

      GO = true;
    }

    //tukis
    if (mouseX>= width/2+140 && mouseX<=width/2+190 && mouseY>=height-65 && mouseY<=height-15 && timer>=10) { 
      towerpickedOnBar[3]=true;
    } else {
      towerpickedOnBar[3]=false;
    }
    if (towerpickedOnBar[3] && mousePressed) {   
      towernr[3]=towernr[3]+1;

      base.add(new TowerBase());
      timer=0; 
      picked=4;
      placeble[3]=true;
      towerpickedOnBar[3]=false; 
      GO = true;
    }

    //grøn
    if (mouseX >= width/2+215 && mouseX<=width/2+225 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[4]=true;
    } else {
      towerpickedOnBar[4]=false;
    }
    if (towerpickedOnBar[4] && mousePressed) {   
      towernr[4]=towernr[4]+1;

      energyTower.add(new TowerEnergy());
      timer=0; 
      picked=5;
      placeble[4]=true;
      energyTower.get(towernr[4]-1).vis = 0;
      towerpickedOnBar[4]=false; 
      GO = true;
    }
  }

  public void gat() {

    if (mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) {
      towerpicked[0]=false; 
      towerpicked[1]=false; 
      towerpicked[2]=false;  
      towerpicked[3]=false; 
      towerpicked[4]=false;
    }

    for (int i = 0; i < shotTower.size(); i++) {
      if (shotTower.get(i).t==13 && mouseX >= shotTower.get(i).location.x && mouseX <= shotTower.get(i).location.x+10 && mouseY >= shotTower.get(i).location.y && mouseY <= shotTower.get(i).location.y+10) {
        nr[0]=i;
        towerpicked[0]=true;
      }
    }
    for (int i = 0; i <  bombTower.size(); i++) {
      if (bombTower.get(i).t==13 && mouseX >=  bombTower.get(i).location.x && mouseX <=  bombTower.get(i).location.x+10 && mouseY >=  bombTower.get(i).location.y && mouseY <=  bombTower.get(i).location.y+10) {
        nr[1]=i;
        towerpicked[1]=true;
      }
    }
    for (int i = 0; i < enemyAttackTower.size(); i++) {
      if (enemyAttackTower.get(i).t==13 && mouseX >= enemyAttackTower.get(i).location.x && mouseX <= enemyAttackTower.get(i).location.x+10 && mouseY >= enemyAttackTower.get(i).location.y && mouseY <= enemyAttackTower.get(i).location.y+10) {
        nr[2]=i;
        towerpicked[2]=true;
      }
    }
    for (int i = 0; i < base.size(); i++) {
      if (mouseX >= base.get(i).location.x && mouseX <= base.get(i).location.x+10 && mouseY >= base.get(i).location.y && mouseY <= base.get(i).location.y+10) {
        nr[3]=i;
        towerpicked[3]=true;
      }
    }
    for (int i = 0; i < energyTower.size(); i++) {
      if (mouseX >= energyTower.get(i).location.x && mouseX <= energyTower.get(i).location.x+10 && mouseY >= energyTower.get(i).location.y && mouseY <= energyTower.get(i).location.y+10) {
        nr[4]=i;
        towerpicked[4]=true;
      }
    }


    if (towerpicked[0] && mousePressed && timer>=10) {

      placeble2[0]=true; 
      timer=0;
      picked=1; 
      towerpicked[0]=false; 
      GO = true;
    }
    if (towerpicked[1] && mousePressed && timer>=10) {

      placeble2[1]=true; 
      timer=0;
      picked=2; 
      towerpicked[1]=false; 
      GO = true;
    }
    if (towerpicked[2] && mousePressed && timer>=10) {

      placeble2[2]=true; 
      timer=0;
      picked=3; 
      towerpicked[2]=false; 
      GO = true;
    }
    if (towerpicked[3] && mousePressed && timer>=10) {

      placeble2[3]=true; 
      timer=0;
      picked=4; 
      towerpicked[3]=false; 
      GO = true;
    }

    if (towerpicked[4] && mousePressed && timer>=10) {

      placeble2[4]=true; 
      timer=0;

      towerpicked[4]=false;
    }
    if (placeble2[0]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }

      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      shotTower.get(nr[0]).location.set(loc);  
      shotTower.get(nr[0]).t=-3;
      shotTower.get(nr[0]).build=0;
      timer=0;      
      picked = 0;
      placeble2[0] = false;
    }  
    if (placeble2[1]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }

      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      bombTower.get(nr[1]).location.set(loc);  
      bombTower.get(nr[1]).t=-3;
      bombTower.get(nr[1]).build=0;

      timer=0;      
      picked = 0;
      placeble2[1] = false;
    }  
    if (placeble2[2]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }


      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      enemyAttackTower.get(nr[2]).location.set(loc);  
      enemyAttackTower.get(nr[2]).t=-3;
      enemyAttackTower.get(nr[2]).build=0;

      timer=0;      
      picked = 0;
      placeble2[2] = false;
    }

    if (placeble2[3]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }


      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      base.get(nr[3]).location.set(loc);  


      timer=0;      
      picked = 0;
      placeble2[3] = false;
    }

    if (placeble2[4]  && keys[3] && timer>=10) {
      energyTower.remove(nr[4]);
      towernr[4]=towernr[4]-1;
      timer=0;      
      picked = 0;
      placeble2[4] = false;
    }  
    //if (placeble2[3]  && keys[3] && timer>=10) {
    //  energyTower.remove(nr[3]);
    //  towernr[3]=towernr[3]-1;
    //  timer=0;      
    //  picked = 0;
    //  placeble2[3] = false;
    //}
    //if (placeble2[2]  && keys[3] && timer>=10) {
    //  energyTower.remove(nr[2]);
    //  towernr[2]=towernr[2]-1;
    //  timer=0;      
    //  picked = 0;
    //  placeble2[2] = false;
    //}
    //if (placeble2[1]  && keys[3] && timer>=10) {
    //  energyTower.remove(nr[1]);
    //  towernr[1]=towernr[1]-1;
    //  timer=0;      
    //  picked = 0;
    //  placeble2[1] = false;
    //}
    //if (placeble2[0]  && keys[3] && timer>=10) {
    //  energyTower.remove(nr[0]);
    //  towernr[0]=towernr[0]-1;
    //  timer=0;      
    //  picked = 0;
    //  placeble2[0] = false;
    //}
    if (mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) {
      placeble2[4] = false; 
      timer=0;
    }
  }



  public void highLight() { 

    PVector location;

    if (picked==1) {
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);

      stroke(rageDisply, 0, 0);
      noFill();
      for (int i = -20; i <= 20; i++) {
        for (int j = -20; j <= 20; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }   
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      } 
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1.5f);

      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
    } 
    if (picked==2) {
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);

      stroke(rageDisply, 0, 0);
      noFill();
      for (int i = -20; i <= 20; i++) {
        for (int j = -20; j <= 20; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }       
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      } 
      fill(255, 0, 0);
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
    } 
    if (picked==3) {
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);

      stroke(rageDisply, 0, 0);
      noFill();
      for (int i = -20; i <= 20; i++) {
        for (int j = -20; j <= 20; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }       
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }  
      fill(255, 255, 0);
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
    }
    if (picked==4) {
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }    
      fill(0, 255, 255);
      for (int i = -2; i <= 2; i++) {
        for (int j = -2; j <= 2; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
    }    
    if (picked==5) {
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
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      } 
      fill(0, 155, 0);
      stroke(0);
      for (int i = -3; i <= 3; i++) {
        for (int j = -3; j <= 3; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }  

      fill(0, 255, 0);
      rect(location.x, location.y, 10, 10);
    }
  }

  public void place() {     

    if (placeble[0]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }


      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      shotTower.get(towernr[0]-1).location.set(loc);  
      shotTower.get(towernr[0]-1).t=-3;

      timer=0;      
      picked = 0;
      placeble[0] = false;
    }  
    if (placeble[1]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }


      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      bombTower.get(towernr[1]-1).location.set(loc);  
      bombTower.get(towernr[1]-1).t=-3;

      timer=0;      
      picked = 0;
      placeble[1] = false;
    }  
    if (placeble[2]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }


      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      enemyAttackTower.get(towernr[2]-1).location.set(loc);  
      enemyAttackTower.get(towernr[2]-1).t=-3 ;

      timer=0;      
      picked = 0;
      placeble[2] = false;
    }

    if (placeble[3]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }


      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      base.get(towernr[3]-1).location.set(loc);  


      timer=0;      
      picked = 0;
      placeble[3] = false;
    }
    if (placeble[4]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      int x = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = PApplet.parseInt(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      energyTower.get(towernr[4]-1).location.set(loc);  

      energyTower.get(towernr[4]-1).vis = 255;

      timer=0;      
      picked = 0;
      placeble[4] = false;
    }
  }

  public void towerRun()
  {
    if (keys[0]) {
      gat();
    }
    for (int i = 0; i < energyTower.size(); i++) {
      TowerEnergy e = energyTower.get(i);
      e.run();
    }
    for (int i = 0; i < shotTower.size(); i++) {
      TowerAttackTerrtoriumShot s = shotTower.get(i);
      s.run();
    }    

    for (int i = 0; i < bombTower.size(); i++) {
      TowerAttackTerrtoriumBomb b = bombTower.get(i);
      b.run();
    }  

    for (int i = 0; i < enemyAttackTower.size(); i++) {
      TowerAttackETowers e = enemyAttackTower.get(i);
      e.run();
    }

    for (int i = 0; i < base.size(); i++) {
      TowerBase  b = base.get(i);
      b.run();
    }
  }


  public void Run() {

    PickTowerOnBar();   
    highLight();   

    place();  
    towerRun();

    //println(shotTower.size(), towernr[0], placeble[1], towerpickedOnBar[1], picked, width/2+215, mouseX);

    if (timer >= 20) {
      timer = 20;
    }
  }
}
class Square
{
  PVector loc;

  int gridSquareSize = 10;

  Square() {
  } 

  public void display() {
    fill(0, 0, 255);
    stroke(0);
    strokeWeight(1.5f);
    rect(loc.x, loc.y, gridSquareSize, gridSquareSize);
  }

  public void run() {
    display();
  }
}

class SquareField {  
  ArrayList<Square> parts = new ArrayList<Square>();

  PVector squareNR  = new PVector(0, 0);
  int hej=0; 
  int t;
  int scale = 10;  
  int gridSquares = 0;
  int c; 

  int cols = width / scale;
  int rows = (height / scale) - 6;

  int[][] ocupied = new int[cols][rows];
  PVector[][] grid = new PVector[cols][rows];

  SquareField() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {  
        grid[i][j] = new PVector(i*scale, j*scale);
        ocupied[i][j] = 0;
      }
    }
  }

  public void addParikle() {
  }

  public void run() {     
  }
}
class Timer 
{
  //this is to stop things from happening when they should not be happening.
  int Bt1 = 0 ;
  int Bt2 = 0;
  int St = 0;
  int es = 0;
  int mr = 0;
  int t;
  int endTimer;


  Timer() {
  }



  public void run() {
  }
}
class TowerAttackETowers 
{
  PVector location=new PVector(-100, -100);


  int t=-2;

  int build;
  int energybuild = 50;
  int energyConsomstion = 9;

  public void weapon() {
  }

  public void detection() {
  }

  public void build() {   

    if (t==-3) {
      game.energy.energy.y = game.energy.energy.y-energybuild;
      t=11;
    }

    if (t<=11&&t>=-1) { 
      t--;
    }


    if (t<=-1) {
      build++;
      t=11;
    }
    if (build==11) {
      build=12;
      t=13;
    }
    if (t==13) { 
      game.energy.energy.y = game.energy.energy.y+energybuild-energyConsomstion; 

      t=14;
    }

    fill(15+(20*build), 15+(20*build), 0);
    stroke(0);
    strokeWeight(1.5f);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  public void run() { 

    build();

    if (t==14) { 
      weapon();
      detection();
    }
  }
}
class TowerAttackTerrtoriumBomb 
{  
  PVector location=new PVector(-100, -100);

  int t=-1;

  int build;
  int energybuild = 40;
  int energyConsomstion = 9;

  public void weapon() {
  }

  public void detection() {
  }

  public void build() {   

    if (t==-3) {
      game.energy.energy.y = game.energy.energy.y-energybuild;
      t=11;
    }

    if (t<=11&&t>=-1) { 
      t--;
    }


    if (t<=-1) {
      build++;
      t=11;
    }
    if (build==11) {
      build=12;
      t=13;
    }
    if (t==13) { 
      game.energy.energy.y = game.energy.energy.y+energybuild-energyConsomstion; 

      t=14;
    }

    fill(15+(20*build), 0, 0);
    stroke(0);
    strokeWeight(1.5f);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  public void run() { 

    build();

    if (t==14) { 
      weapon();
      detection();
    }
  }
}
class TowerEnergy 
{
  PVector location=new PVector(-100, -100);

  int vis;

  public void weapon() {
  }

  public void detection() {
  }

  public void highLight() {   


    stroke(0);
    if (vis == 255) {
      strokeWeight(1.5f);
    } else {  
      noStroke();
    }


    fill(0, 155, 0, vis);
    for (int i = -3; i <= 3; i++) {
      for (int j = -3; j <= 3; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }

    fill(0, 255, 0);     
    stroke(0);
    strokeWeight(1.5f);
    rect(location.x, location.y, 10, 10);
  }
  public void run() { 
    highLight();
    weapon();
    detection();
  }
}
class TowerBase 
{
  PVector location=new PVector(-100, -100);

  public void weapon() {
  }

  public void detection() {
  }

  public void highLight() {   

    fill(0, 255, 255);
    stroke(0);
    strokeWeight(1.5f);

    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  public void run() { 
    highLight();
    weapon();
    detection();
  }
}
class TowerAttackTerrtoriumShot {  
  PVector location=new PVector(-100, -100);

  int t=-2;

  int build;
  int energybuild = 40;
  int energyConsomstion = 3;

  public void weapon() {
  }

  public void detection() {
  }

  public void build() {   

    if (t==-3) {
      game.energy.energy.y = game.energy.energy.y-energybuild;
      t=11;
    }

    if (t<=11&&t>=-1) { 
      t--;
    }


    if (t<=-1) {
      build++;
      t=11;
    }
    if (build==11) {
      build=12;
      t=13;
    }
    if (t==13) { 
      game.energy.energy.y = game.energy.energy.y+energybuild-energyConsomstion; 

      t=14;
    }

    fill(0, 0, 15+(20*build));
    stroke(0);
    strokeWeight(1.5f);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  public void run() { 

    build();

    if (t==14) { 
      weapon();
      detection();
    }
  }
}
  public void settings() {  size(1600, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RTS" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
