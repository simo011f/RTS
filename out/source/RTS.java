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


int scale = 10;
int cols;
int rows;

Game game;

public void setup() {
  //size(1600, 900);

  

  cols = width / scale;
  rows = height / scale - 6;
  game = new Game();

  background(255); 
  frameRate(30);
}

public void draw() { 

  if (game.loc == 3) {
    //thread("enemyUpdate");
  }

  game.run();
  println(frameRate);
}

public void enemyUpdate()
{
  game.baseLevel.enemyArray.Update();
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
 //<>// //<>// //<>// //<>//
class BaseLevel  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

{

  EnemyGrid enemyArray;
  TerrainEditor terrainEditor = new TerrainEditor();
  EnemyPlasmentEditor enemyPlasmentEditor = new EnemyPlasmentEditor();

  int currentLevel = 0;
  int emittersRemaning = 0;

  ArrayList<Emitter> emitters = new ArrayList<Emitter>();

  PVector[][] currentTerrain = new PVector[cols][rows];

  BaseLevel() {
    enemyArray = new EnemyGrid();
    thread("feildDraw");
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        currentTerrain[i][j]= new PVector(i, j);
      }
    }
  }

  BaseLevel(PVector[][] grid)
  {
    enemyArray = new EnemyGrid(grid);
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        currentTerrain[i][j]= new PVector(i, j);
      }
    }
  }

  public void loadLevel(int newLevel)
  {
    currentTerrain = terrainEditor.loadMap(newLevel);
    enemyArray = enemyPlasmentEditor.loadBasicEnemy(newLevel, currentTerrain);
    enemyArray.reLoad(enemyArray);
    emitters = enemyPlasmentEditor.loadEmitters(newLevel, enemyArray);
    emittersRemaning = emitters.size();
  }

  public void fieldDraw(PVector[][] grid) 
  {   
    // Begin loop for cols
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
        layerZeroDraw(i, j);
        voidLayer(i, j, grid);
        stroke(0);
        layerOneDraw(i, j, grid);
        layerTowDraw(i, j, grid);
        layerThreeDraw(i, j, grid);
        layerFourDraw(i, j, grid);
        layerFiveDraw(i, j, grid);
      }
    }
  }

  public void voidLayer(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == -1)
    {
      int x = i*scale;
      int y = j*scale;
      fill(0);
      stroke(255);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerZeroDraw(int i, int j)
  {
    int x = i*scale;
    int y = j*scale;
    fill(120, 58, 8);
    stroke(0);
    strokeWeight(0.5f);
    rect(x, y, scale, scale);
  }

  public void layerOneDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 1)
    {
      int x = i*scale;
      int y = j*scale;
      fill(160, 75, 30);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerTowDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 2)
    {
      int x = i*scale;
      int y = j*scale;
      fill(100);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerThreeDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 3)
    {
      int x = i*scale;
      int y = j*scale;
      fill(100, 70, 40);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerFourDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 4)
    {
      int x = i*scale;
      int y = j*scale;
      fill(90, 60, 30);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerFiveDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 5)
    {
      int x = i*scale;
      int y = j*scale;
      fill(10);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void Draw()
  {
    fieldDraw(currentTerrain);
  }
  public void Update()
  {
    if (emitters.size() == 0 || currentLevel == 0) {
      currentLevel++;
      loadLevel(currentLevel);
      game.player.energyNetwork.updateTerrain(currentTerrain);
    }
    //enemyArray.Update();
    for (int i = 0; i < emitters.size(); ++i) {
      emitters.get(i).Update(enemyArray);
      if (emitters.get(i).isDead) {
        emitters.remove(i);
      }
    }
    enemyArray.Update();
  }

  public void enemyRun()
  {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        enemyArray.Draw(i, j);
      }
    }

    for (int i = 0; i < emitters.size(); ++i) {
      emitters.get(i).Draw();
    }
  }
}
class Emitter //<>//
{
  PVector[][] pGrid;
  PVector location;

  int power;
  int delay;
  int timer = 0;

  boolean isDead = false;

  Emitter()
  {}

  Emitter(PVector spawn, int sDelay, int sPower)
  {
    location = spawn;
    delay = sDelay;
    power = sPower;
  }

  Emitter(PVector spawn, int sDelay, int sPower, EnemyGrid enemys) 
  {
    location = spawn;
    delay = sDelay;
    pGrid = game.squareFeld.grid;
    power = sPower;
    enemys.enemys[(int)spawn.x][(int)spawn.y].strength = 1;
  }



  public void Draw()
  {
    fill(200, 200, 25, 150);
    stroke(200, 100, 0);
    rect(((int)location.x - 1) * 10, ((int)location.y - 1) * 10, 30, 30);
  }

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
class Enemy    //<>//
{
  int strength;
  int terrainHeight;
  int updateNR;

  Enemy() {
    strength = -100;
    updateNR=0;
    terrainHeight= -1;
  }

  Enemy(PVector spawn)
  {
    strength = -100;
    updateNR=0;
    terrainHeight = (int)spawn.z;
  }

  public void addLayer()
  {

    strength++;
  }

  public void addLayer(int addStrength)
  {
    strength += addStrength;
  }
  public void updateNumber(int u) {updateNR=u;
  }
}
class EnemyGrid { //<>// //<>// //<>// //<>// //<>//

  boolean spreadNorth = false;
  boolean spreadSouth = false;
  boolean spreadEast = false;
  boolean spreadWest = false;

  Enemy[][] enemys = new Enemy[cols][rows];
  int[][] updated = new int[cols][rows];
  ArrayList<PVector> thisCluster = new ArrayList<PVector>();


  EnemyGrid()
  {
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

  EnemyGrid(PVector[][] grid) {
    // Begin loop for columns
    for (int i = 0; i < cols; i++)   
    {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) 
      {
        updated[i][j] = 3;
        enemys[i][j] = new Enemy(new PVector(i, j));
        if (enemys[i][j].strength > 0)
        {
          updated[i][j] = 0;
        }
        terrainUpdate(i, j, grid);
      }
    }
  }

  public void reLoad(EnemyGrid EG)
  {
    for (int i = 0; i < cols; i++) 
    {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) 
      {
        updated[i][j] = 3;
        enemys[i][j] = EG.enemys[i][j];
        if (enemys[i][j].strength > 0)
        {
          updated[i][j] = 0;
        }
      }
    }
  }

  public void updateEnemysStrength(int i, int j)
  {
    int strengthChange = 0;
    spreadNorth = false;
    spreadSouth = false;
    spreadEast = false;
    spreadWest = false;

    spreadBooleans(i, j);


    if (!spreadNorth && !spreadSouth && !spreadEast && !spreadWest) {
      return;
    }

    if (enemys[i][j].strength > 401)
    {
      if (spreadEast) {
        enemys[i + 1][j].strength += 50;
        strengthChange += 50;
      }
      if (spreadWest) {
        enemys[i - 1][j].strength += 50;
        strengthChange += 50;
      }
      if (spreadSouth) {
        enemys[i][j + 1].strength += 50;
        strengthChange += 50;
      }
      if (spreadNorth) {
        enemys[i][j - 1].strength += 50;
        strengthChange += 50;
      }
      enemys[i][j].strength -= strengthChange;
      updated[i][j] = 1;
      return;
    }

    if (enemys[i][j].strength > 161)
    {
      if (spreadEast) {
        enemys[i + 1][j].strength += 20;
        strengthChange += 20;
      }
      if (spreadWest) {
        enemys[i - 1][j].strength += 20;
        strengthChange += 20;
      }
      if (spreadSouth) {
        enemys[i][j + 1].strength += 20;
        strengthChange += 20;
      }
      if (spreadNorth) {
        enemys[i][j - 1].strength += 20;
        strengthChange += 20;
      }
      enemys[i][j].strength -= strengthChange;
      updated[i][j] = 1;
      return;
    }

    if (enemys[i][j].strength > 81)
    {
      if (spreadEast) {
        enemys[i + 1][j].strength += 10;
        strengthChange += 10;
      }
      if (spreadWest) {
        enemys[i - 1][j].strength += 10;
        strengthChange += 10;
      }
      if (spreadSouth) {
        enemys[i][j + 1].strength += 10;
        strengthChange += 10;
      }
      if (spreadNorth) {
        enemys[i][j - 1].strength += 10;
        strengthChange += 10;
      }
      enemys[i][j].strength -= strengthChange;
      updated[i][j] = 1;
      return;
    }

    if (enemys[i][j].strength > 41)
    {
      if (spreadEast) {
        enemys[i + 1][j].strength += 5;
        strengthChange += 5;
      }
      if (spreadWest) {
        enemys[i - 1][j].strength += 5;
        strengthChange += 5;
      }
      if (spreadSouth) {
        enemys[i][j + 1].strength += 5;
        strengthChange += 5;
      }
      if (spreadNorth) {
        enemys[i][j - 1].strength += 5;
        strengthChange += 5;
      }
      enemys[i][j].strength -= strengthChange;
      updated[i][j] = 1;
      return;
    }

    if (enemys[i][j].strength > 25)
    {
      if (spreadEast) {
        enemys[i + 1][j].strength += 3;
        strengthChange += 3;
      }
      if (spreadWest) {
        enemys[i - 1][j].strength += 3;
        strengthChange += 3;
      }
      if (spreadSouth) {
        enemys[i][j + 1].strength += 3;
        strengthChange += 3;
      }
      if (spreadNorth) {
        enemys[i][j - 1].strength += 3;
        strengthChange += 3;
      }
      enemys[i][j].strength -= strengthChange;
      updated[i][j] = 1;
      return;
    }

    if (enemys[i][j].strength > 17)
    {
      if (spreadEast) {
        enemys[i + 1][j].strength += 2;
        strengthChange += 2;
      }
      if (spreadWest) {
        enemys[i - 1][j].strength += 2;
        strengthChange += 2;
      }
      if (spreadSouth) {
        enemys[i][j + 1].strength += 2;
        strengthChange += 2;
      }
      if (spreadNorth) {
        enemys[i][j - 1].strength += 2;
        strengthChange += 2;
      }
      enemys[i][j].strength -= strengthChange;
      updated[i][j] = 1;
      return;
    }

    if (enemys[i][j].strength > 5)
    {
      if (spreadEast) {
        enemys[i + 1][j].strength += 1;
        strengthChange += 1;
      }
      if (spreadWest) {
        enemys[i - 1][j].strength += 1;
        strengthChange += 1;
      }
      if (spreadSouth) {
        enemys[i][j + 1].strength += 1;
        strengthChange += 1;
      }
      if (spreadNorth) {
        enemys[i][j - 1].strength += 1;
        strengthChange += 1;
      }
      enemys[i][j].strength -= strengthChange;
      updated[i][j] = 1;
      return;
    }
  }

  public void spreadBooleans(int i, int j)
  {
    if (i - 1 >= 0)
    {
      spreadWest = true;
      if (i - 1 == 0 && enemys[i][j].strength <= enemys[i - 1][j].strength || enemys[i][j].strength + 10 * enemys[i][j].terrainHeight + 10 < enemys[i - 1][j].strength + 10 * enemys[i - 1][j].terrainHeight || enemys[i - 1][j].terrainHeight == -1) {
        spreadWest = false;
      }
      if (updated[i - 1][j] == 2)
      {
        spreadWest = false; //<>//
      }
    }

    if (i + 1 < cols) 
    {
      spreadEast = true;
      if (i + 1 == cols - 1 && enemys[i][j].strength <= enemys[i + 1][j].strength || enemys[i][j].strength + 10 * enemys[i][j].terrainHeight + 10 < enemys[i + 1][j].strength + 10 * enemys[i + 1][j].terrainHeight || enemys[i + 1][j].terrainHeight == -1) {
        spreadEast = false;
      }
      if (updated[i + 1][j] == 2)
      {
        spreadEast = false;
      }
    }

    if (j - 1 >= 0)
    {
      spreadNorth = true;
      if (j - 1 == 0 && enemys[i][j].strength <= enemys[i][j - 1].strength || enemys[i][j].strength + 10 * enemys[i][j].terrainHeight + 10 < enemys[i][j - 1].strength + 10 * enemys[i][j - 1].terrainHeight || enemys[i][j - 1].terrainHeight == -1) {
        spreadNorth = false;
      }
      if (updated[i][j - 1] == 2)
      {
        spreadNorth = false;
      }
    }

    if ( j + 1 < rows) 
    {
      spreadSouth = true;
      if (j + 1 == rows - 1 && enemys[i][j].strength <= enemys[i][j + 1].strength || enemys[i][j].strength + 10 * enemys[i][j].terrainHeight + 10 < enemys[i][j + 1].strength + 10 * enemys[i][j + 1].terrainHeight || enemys[i][j + 1].terrainHeight == -1) {
        spreadSouth = false;
      }
      if (updated[i][j + 1] == 2)
      {
        spreadSouth = false;
      }
    }
  } 

  public void findCenter(int i, int j)
  { //<>//
    //find centeret i hvert kloster //<>//
    int x = i;
    int y = j;
    int checkingX = 0;
    int checkingY = 0;

    thisCluster.clear();

    while (strongest(x, y) != null && x != strongest(x, y).x && y != strongest(x, y).y) 
    {
      x = (int)strongest(x, y).x; //<>// //<>// //<>//
      y = (int)strongest(x, y).y;
      println(x, y);
    }

    thisCluster.add(new PVector(x, y));
    updated[x][y] = 1;

    while (thisCluster.size() > 0) {
      for (int a = -1; a <= -1; a++) {
        for (int b = -1; b <= -1; b++) {
          checkingX = x + a;
          checkingY = y + b;
          if (checkingX < 0 || checkingX >= cols) {
            continue;
          }

          if (checkingY < 0 || checkingY >= rows) {
            continue;
          }

          if (updated[checkingX][checkingY] == 0)
          {
            updated[checkingX][checkingY] = 1;
            thisCluster.add(new PVector(checkingX, checkingY));
          }
        }
      }
      updateCluster(thisCluster);
      x = checkingX;
      y = checkingY;
    }
    return;
  }

  public void updateCluster(ArrayList<PVector> cluster)
  {
    int x = 0;
    int y = 0;
    for (int i = 0; i < cluster.size(); i++) {
      PVector position = cluster.get(i);
      x = (int)position.x;
      y = (int)position.y;
      updateEnemysStrength(x, y);
    }
    cluster.remove(0);
  }

  public PVector strongest(int x, int y)
  {
    if (x - 1 < 0 || x + 1 >= cols) {
      return null;
    }

    if (y - 1 < 0 || y + 1 >= rows) {
      return null;
    }
    int strengthNorth = enemys[x][y - 1].strength;
    int strengthSouth = enemys[x][y + 1].strength;
    int strengthEast = enemys[x + 1][y].strength;
    int strengthWest = enemys[x - 1][y].strength;

    if (strengthNorth > strengthSouth && strengthNorth > strengthEast && strengthNorth > strengthWest)
    {
      return new PVector(x, y - 1);
    }

    if (strengthSouth > strengthNorth && strengthSouth > strengthEast && strengthSouth > strengthWest)
    {
      return new PVector(x, y + 1);
    }

    if (strengthEast > strengthSouth && strengthEast > strengthNorth && strengthEast > strengthWest)
    {
      return new PVector(x + 1, y);
    }

    if (strengthWest > strengthSouth && strengthWest > strengthEast && strengthWest > strengthNorth)
    {
      return new PVector(x - 1, y);
    }

    return new PVector(x, y);
  }

  public void terrainUpdate(int i, int j, PVector[][] grid)
  {
    enemys[i][j].terrainHeight = (int)grid[i][j].z;
  }

  public void Update()
  {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if (enemys[i][j].strength <= 0)
        {
          updated[i][j] = 3;
        } else {
          updated[i][j] = 0; 
          enemys[i][j].updateNumber(0);
        }
      }
    }
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if (enemys[i][j].strength <= 0)
        {
          enemys[i][j].strength = 0;
          updated[i][j] = 3;
          enemys[i][j].updateNumber(3);
          continue;
        }
        if (enemys[i][j].strength >= 5 && updated[i][j] == 0) {	
          findCenter(i, j);
        }
      }
    }
  }


  public void Draw(int i, int j)
  {

    if (enemys[i][j].strength >= 1)
    {
      fill(0, enemys[i][j].strength*5, 255, 100);
      rect(i*10, j*10, 10, 10);
      //for at se styrke går FPS fra ca. 13 til ca. 5
      //fill(0);
      //textAlign(CENTER);  
      //textSize(10);
      //text(enemys[i][j].strength, i*10+5, j*10+10);
    }
  }
}
class EnemyPlasmentEditor {     //<>//
  Table table;
  
  int mapSaveNR = 0;

  boolean isMouseNotPressedSave = true;
  boolean isMouseNotPressedBasicStrength = true;
  boolean isMouseNotPressedUpdateMap = true;
  boolean isMouseNotPressedEmitterStrength = true;
  boolean isMouseNotPressedEmitterDelay = true;


  TerrainEditor terrainEditor = new TerrainEditor();

  PVector[][] newMap = new PVector[cols][rows];

  int[][] newBasicEnemys = new int[cols][rows];
  int newBasicEnemysStrength = 1; 

  ArrayList<Emitter> newLevelEmitters = new ArrayList<Emitter>();
  int newLevelEmitterStrength = 1;
  int newLevelEmitterDelay = 1;



  EnemyPlasmentEditor () 
  {
    thread("hotbar");
    createTabel();
    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++)
      {
        newMap[i][j] = new PVector(i, j, 0);
        newBasicEnemys[i][j] = -100;
      }
    }
  }

  public void createTabel()
  {
    table = new Table();
    table.addColumn("x");
    table.addColumn("y");
    table.addColumn("EmitterDelay");
    table.addColumn("EmitterStrength");
    table.addColumn("BasicEnemyStrength");    
    table.addColumn("EnemyType");
    table.addColumn("LevelNR");
  }

  boolean enemyTypeOne = false;
  boolean enemyTypeTow = false;
  boolean enemyTypeThree = false;

  public void hotbar()
  {
    int x;
    int y;

    fill(150);
    rect(width/2-500, height-60, 1000, 60);

    //Basic enemy seleckt
    x = width / 2 - 350;
    y = height - 30;
    textSize(15);
    fill(0);
    text("Basic enemy", x - 35, y - 15);

    if (mouseX >= x - 10 && mouseX <= x + 20)
    {
      if (mouseY >= height - 40 && mousePressed) {
        enemyTypeOne = true;
        enemyTypeTow = false;
        enemyTypeThree = false;
      }
    }

    fill(0, 5, 255, 100);
    stroke(0);
    strokeWeight(0.5f);
    rect(x, y, scale, scale);
    increaseDecreaseBasicEnemyStrength(x, y);

    //Emitter selekt
    x = width / 2 - 1 * scale - 260;
    y = height - 1 * scale - 30;
    textSize(15);
    fill(0);
    text("Emitter", x-10, y-5);

    if (mouseX >= x && mouseX <= x + 30)
    {
      if (mouseY >= y && mousePressed) {
        enemyTypeOne = false;
        enemyTypeTow = true;
        enemyTypeThree = false;
      }
    }
    increaseDecreaseEmitterStrength(x, y);
    increaseDecreaseEmitterDelay(x, y);

    fill(200, 200, 25, 150);
    stroke(200, 100, 0);
    strokeWeight(0.5f);
    rect(x, y, 3 * scale, 3 * scale);

    //New Enemy type selekt
    x = width / 2 - 1 * scale + 70;
    y = height - 1 * scale - 30;
    textSize(15);
    fill(0);
    text("New Enemy type", x - 15, y - 5);

    if (mouseX >= x && mouseX <= x + 30)
    {
      if (mouseY >= y && mousePressed) {
        enemyTypeOne = false;
        enemyTypeTow = false;
        enemyTypeThree = true;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        fill(160, 75, 30);
        stroke(0);
        strokeWeight(0.5f);
        rect(x + 10 + i*scale, y + 10 + j*scale, scale, scale);
      }
    }

    // Reset level
    x = width / 2 - 1 * scale + 200;
    y = height - 1 * scale - 30;
    textSize(15);
    fill(0);
    text("Reset level", x - 15, y - 5);

    if (mouseX >= x && mouseX <= x + 30)
    {
      if (mouseY >= y && mousePressed) {
        overrideMap(mapSaveNR);
        loadEnemys(mapSaveNR);
      }
    }

    fill(0);
    stroke(0);
    strokeWeight(0.5f);
    rect(x  , y, 3 * scale, 3 * scale);

  }

  public void increaseDecreaseBasicEnemyStrength(int x, int y)
  {
    fill(250);
    stroke(150);
    strokeWeight(0.5f);
    rect(x + scale * 2, y - scale * 5 / 6, scale * 3, scale * 3 / 2);  
    rect(x + scale * 2, y + scale * 2 / 3, scale * 3, scale * 3 / 2);
    fill(0);
    text("+", x + scale * 3, y + scale * 5 / 6 - 4);
    textSize(20);
    text("-", x + 1 + scale * 3, y + scale * 2);
    textSize(15);
    text("Enemy strength: " + newBasicEnemysStrength, x - 140, y + 10);
    if (mouseX >= x + 20 && mouseX <= x + 50 && isMouseNotPressedBasicStrength)  
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed && newBasicEnemysStrength < 100)
        {
          newBasicEnemysStrength++;
        } 
        fill(10, 240, 10);
        rect(x + scale * 2, y - scale * 5 / 6, scale * 3, scale * 3 / 2);  
        fill(0);
        textSize(15);
        text("+", x + scale * 3, y + scale * 5 / 6 - 4);
      }
    }

    if (mouseX >= x + 20 && mouseX <= x + 50 && isMouseNotPressedBasicStrength)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && newBasicEnemysStrength > 0) 
        {
          newBasicEnemysStrength--;
        } 
        fill(240, 10, 10);
        rect(x + scale * 2, y + scale * 2 / 3, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale * 3, y + scale * 2 - 2);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedBasicStrength = false;
    } else
    {
      isMouseNotPressedBasicStrength = true;
    }
  }

  public void increaseDecreaseEmitterStrength(int x, int y)
  {
    x = x + scale * 10;
    fill(250);
    stroke(150);
    strokeWeight(0.5f);
    rect(x, y, scale * 3, scale * 3 / 2);  
    rect(x, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
    fill(0);
    textSize(15);
    text("+", x + scale, y + scale * 3 / 2 - 2);
    textSize(20);
    text("-", x + 1 + scale, y + scale * 3 - 2);
    textSize(15);
    text("Emitter strength: " + newLevelEmitterStrength, x - 50, y - 5);
    if (mouseX >= x && mouseX <= x + 30 && isMouseNotPressedEmitterStrength)  
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed && newLevelEmitterStrength < 100)
        {
          newLevelEmitterStrength++;
        } 
        fill(10, 240, 10);
        rect(x, y, scale * 3, scale * 3 / 2);  
        fill(0);
        textSize(15);
        text("+", x + scale, y + scale * 3 / 2 - 2);
      }
    }

    if (mouseX >= x && mouseX <= x + 30 && isMouseNotPressedEmitterStrength)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && newLevelEmitterStrength > 1) 
        {
          newLevelEmitterStrength--;
        } 
        fill(240, 10, 10);
        rect(x, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale, y + scale * 3 - 2);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedEmitterStrength = false;
    } else
    {
      isMouseNotPressedEmitterStrength = true;
    }
  }

  public void increaseDecreaseEmitterDelay(int x, int y)
  {
    x = x + scale * 24;
    fill(250);
    stroke(150);
    strokeWeight(0.5f);
    rect(x, y, scale * 3, scale * 3 / 2);  
    rect(x, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
    fill(0);
    textSize(15);
    text("+", x + scale, y + scale * 3 / 2 - 2);
    textSize(20);
    text("-", x + 1 + scale, y + scale * 3 - 2);
    textSize(15);
    text("Emitter delay: " + newLevelEmitterDelay, x - 50, y - 5);
    if (mouseX >= x && mouseX <= x + 30 && isMouseNotPressedEmitterDelay)  
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed && newLevelEmitterDelay < 100)
        {
          newLevelEmitterDelay++;
        } 
        fill(10, 240, 10);
        rect(x, y, scale * 3, scale * 3 / 2);  
        fill(0);
        textSize(15);
        text("+", x + scale, y + scale * 3 / 2 - 2);
      }
    }

    if (mouseX >= x&& mouseX <= x + 30 && isMouseNotPressedEmitterDelay)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && newLevelEmitterDelay > 1) 
        {
          newLevelEmitterDelay--;
        } 
        fill(240, 10, 10);
        rect(x, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale, y + scale * 3 - 2);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedEmitterDelay = false;
    } else
    {
      isMouseNotPressedEmitterDelay = true;
    }
  }

  public void saveMap()
  {
    //save map
    textSize(15);
    fill(0);
    text("Save map", width/2+375, height-45);

    if (mouseX >= width / 2 + 380 && mouseX <= width / 2 + 410)
    {
      if (mouseY >= height - 40 && mousePressed) {
        overrideMap(mapSaveNR);
        addMap(mapSaveNR);
        saveTable(table, "EnemyPlasment.csv");
      }
    }

    // Display corrent mapNR
    fill(255);
    stroke(150);  
    strokeWeight(0.5f);
    int x = width / 2 + 380;
    int y = height - 40;
    rect(x, y, scale * 3, scale * 3);
    fill(0);
    text(mapSaveNR, x +scale, y+scale*2); 
    // Display + or - mapNR
    fill(250);
    stroke(150);
    strokeWeight(0.5f);
    rect(x + scale * 3, y, scale * 3, scale * 3 / 2);  
    rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
    fill(0);
    text("+", x + scale * 4, y + scale + 2);
    textSize(20);
    text("-", x + 1 + scale * 4, y + scale * 3);

    if (mouseX >= width / 2 + 410 && mouseX <= width / 2 + 440 && isMouseNotPressedSave) 
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed)
        {
          mapSaveNR++;
        } 
        fill(10, 240, 10);
        rect(x + scale * 3, y, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(15);
        text("+", x + scale * 4, y + scale + 2);
      }
    }
    

    if (mouseX >= width / 2 + 410 && mouseX <= width / 2 + 440 && isMouseNotPressedSave)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && mapSaveNR > 0) 
        {
          mapSaveNR--;
        } 
        fill(240, 10, 10);
        rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale * 4, y + scale * 3);
      }
    }
    if (mousePressed && mouseY >= height - 40 && mouseX > width / 2 + 370)
    { 
      isMouseNotPressedSave = false;
      enemyTypeOne = false;
      enemyTypeTow = false;
      enemyTypeThree = false;
      loadEnemys(mapSaveNR);
    } else
    {
      isMouseNotPressedSave = true;
    }
  }

  public void overrideMap(int mapNR)
  {
    
    int rowMapNr;
    for (int i = table.getRowCount()-1; i >= 0; i--)
    {
      TableRow row = table.getRow(i);
      rowMapNr = row.getInt("LevelNR");
      if (mapNR == rowMapNr)
      {
        table.removeRow(i);
      }
    }
    saveTable(table, "EnemyPlasment.csv");
  }

  public void addMap(int mapNR)
  {
    TableRow newRow;
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        if (newBasicEnemys[i][j] > 0)
        {
          newRow = table.addRow();
          newRow.setInt("x", i);
          newRow.setInt("y", j);
          newRow.setInt("BasicEnemyStrength", newBasicEnemys[i][j]);
          newRow.setInt("EnemyType", 1);
          newRow.setInt("LevelNR", mapNR);
        }
      }
    }
    if (newLevelEmitters.size() > 0)
    {
      for (int i = 0; i < newLevelEmitters.size(); ++i) 
      {
        newRow = table.addRow();
        Emitter emitter = newLevelEmitters.get(i);
        newRow.setInt("x", (int)emitter.location.x);
        newRow.setInt("y", (int)emitter.location.y);
        newRow.setInt("EmitterStrength", emitter.power);
        newRow.setInt("EmitterDelay", emitter.delay);
        newRow.setInt("EnemyType", 2);
        newRow.setInt("LevelNR", mapNR);
      }
    }
  }

  public void updateMap()
  {
    if (mouseY >= height - 60 || mouseY <= 0 || mouseX <= 0 || mouseX >= width)
    {
      return;
    }

    if (enemyTypeOne && mousePressed)
    {
      newBasicEnemys[mouseX/scale][mouseY/scale] = newBasicEnemysStrength;
    }

    if (enemyTypeTow && mousePressed && isMouseNotPressedUpdateMap)
    {
      for (int i = 0; i < newLevelEmitters.size(); ++i) {
        Emitter emitter = newLevelEmitters.get(i);
        if  (emitter.location.x == mouseX / scale && emitter.location.y == mouseY / scale)
        {
          newLevelEmitters.remove(i);
          isMouseNotPressedUpdateMap = false;
          return;
        }
      }
      newLevelEmitters.add(new Emitter(new PVector(mouseX/scale, mouseY/scale), newLevelEmitterDelay, newLevelEmitterStrength));
    }

    if (enemyTypeThree && mousePressed && isMouseNotPressedUpdateMap)
    {
      newMap[mouseX/scale][mouseY/scale].z = 3;
    }

    if (mousePressed && mouseY < height - 40)
    { 
      isMouseNotPressedUpdateMap = false;
    } else
    {
      isMouseNotPressedUpdateMap = true;
    }
  }

  public void drawEnemys()
  {
    drawBasicEnemy();
    drawEmitter();
  }

  public void drawBasicEnemy()
  {
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        if (newBasicEnemys[i][j] > 0) {
          fill(0, 5 * newBasicEnemys[i][j], 255, 100);
          stroke(0);
          strokeWeight(0.5f);
          rect(i*scale, j*scale, scale, scale);
        }
      }
    }
  }

  public void drawEmitter()
  {
    for (int i = 0; i < newLevelEmitters.size(); ++i) {
      newLevelEmitters.get(i).Draw();
    }
  }

  public void loadEnemys(int levelNR)
  {
    int x;
    int y;
    newLevelEmitters.clear();
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        newBasicEnemys[i][j] = 0;
      }
    }

    table = loadTable("EnemyPlasment.csv", "header");

    if (table != null)
    {
      for (TableRow row : table.rows())
      {
        if (row.getInt("LevelNR") == levelNR)
        {
          x = row.getInt("x");
          y = row.getInt("y");
          int enemyType = row.getInt("EnemyType");
          if (enemyType == 1)
          {
            newBasicEnemysStrength = row.getInt("BasicEnemyStrength");
            newBasicEnemys[x][y] = newBasicEnemysStrength;
          }
          if (enemyType == 2)
          {
            x = row.getInt("x");
            y = row.getInt("y");
            newLevelEmitterStrength = row.getInt("EmitterStrength");
            newLevelEmitterDelay = row.getInt("EmitterDelay");
            newLevelEmitters.add(new Emitter(new PVector(x, y), newLevelEmitterDelay, newLevelEmitterStrength));
          }
        }
      }
    }
  }

  public EnemyGrid loadBasicEnemy(int levelNR, PVector[][] levelMap)
  {
    EnemyGrid newLevelEnemyGrid = new EnemyGrid(levelMap);
    table = loadTable("EnemyPlasment.csv", "header");
    if (table != null)
    {
      for (int i = table.getRowCount()-1; i >= 0; i--)
      {
        TableRow row = table.getRow(i);
        if (row.getInt("LevelNR") == levelNR)
        {
          if (row.getInt("EnemyType") == 1) {
            int x = row.getInt("x");
            int y = row.getInt("y");
            newLevelEnemyGrid.enemys[x][y].strength = row.getInt("BasicEnemyStrength");
          }
        }
      }
      return newLevelEnemyGrid;
    }
    return null;
  }  //<>// //<>//
 //<>// //<>//
  public ArrayList<Emitter> loadEmitters(int levelNR, EnemyGrid enemys)
  {
    table = loadTable("EnemyPlasment.csv", "header");
    if (table != null)
    {
      for (int i = table.getRowCount()-1; i >= 0; i--)
      {
        TableRow row = table.getRow(i);
        if (row.getInt("LevelNR") == levelNR)
        {
          if (row.getInt("EnemyType") == 2) {
            int x = row.getInt("x");
            int y = row.getInt("y");
            int emitterDelay = row.getInt("EmitterDelay");
            int emitterStrength = row.getInt("EmitterStrength");
            newLevelEmitters.add(new Emitter(new PVector(x, y), emitterDelay, emitterStrength, enemys));
          }
        }
      }
      return newLevelEmitters;
    }
    return null;
  }

  public void Draw()
  {
    terrainEditor.fieldDraw(terrainEditor.loadMap(mapSaveNR));
  }

  public void Run()
  {
    Draw();
    hotbar();
    drawEnemys();
    saveMap();
    updateMap();
  }
}
//<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
class Energy {

  int totalEnergy;
  int energyUsed;
  int energyGained;
  int maxEnergy;
  int[][] energyArera;
  int[][] terrain;
  boolean transmit = true;



  Energy()
  {
    totalEnergy = 0;
    energyGained = 0;
    energyUsed = 0;
    maxEnergy = 100;
    energyArera = new int[cols][rows];
    terrain = new int[cols][rows];
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        energyArera[i][j] = 0;
      }
    }
  }

  public void updateTerrain(PVector[][] newTerrain)
  {
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        terrain[i][j] = (int)newTerrain[i][j].z;
      }
    }
  }

  public void energyPruduktion(ArrayList<TowerEnergy> energyTowers)
  {
    int x = 0;
    int y = 0;
    for (TowerEnergy energyTower : energyTowers) {
      if (!energyTower.baseConeced)
      {
        continue;
      }
      x = (int)energyTower.location.x;
      y = (int)energyTower.location.y;
      for (int i = -2; i <= 2; ++i) {
        for (int j = -2; j <= 2; ++j) {
          if (x + i < 0 || x + i > cols)
          {
            continue;
          }
          if (y + j < 0 || y + j > cols)
          {
            continue;
          }
          if (terrain[x][y] != terrain[x + i][y + j] || terrain[x + i][y + j] == -1)
          {
            continue;
          }
          energyArera[x + i][y + j] = 1;
        }
      }
    }
    updateEnergyGained();
  }

  public void updateEnergyGained()
  {
    energyGained = 0;
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        if (energyArera[i][j] == 1)
        {
          energyGained++;
        }
      }
    }
  }

  public void useEnergy(ArrayList<Tower> towers)
  {
    if (!transmit)
    {
      return;
    }
    energyUsed = 0;
    for (Tower tower : towers) {
      if (!tower.conected)
      {
        continue;
      }
      if (tower.isBuild())
      {
        energyUsed += tower.energyConsomstion;
      } else 
      {
        energyUsed += tower.cunstructionEnergyConsomstion;
      }
    }
  }

  public void energyUI()
  {
    int x = 100;
    int y = height - 30;
    rectMode(CENTER);
    stroke(0);
    strokeWeight(1.5f);

    fill(0, 255, 0);
    rect(x + 100, y - 15, 50, 15);

    fill(255, 0, 0);
    rect(x + 100, y + 10, 50, 15);

    fill(0, 0, 255);
    rect(width - x - 225, y, 30, 30);


    textAlign(CENTER);
    textSize(17);
    fill(0);
    text("Energy purduktion:", x, y - 10);
    text(energyGained, x + 100, y - 9);

    text("Energy consumption:", x - 10, y + 15);
    text(energyUsed, x + 100, y + 16);

    text("Energy:", width - x - 275, y + 5);
    text(energyGained-energyUsed, width - x - 225, y + 5);

    text("Energy reseve: " + totalEnergy, width - x * 2, y + 5);

    textAlign(CORNER);
    rectMode(CORNER);
  }

  public void Update()
  {
    if (totalEnergy <= 0)
    {
      transmit = false;
      totalEnergy += energyGained;
    } else {
      transmit = true;
      totalEnergy += energyGained - energyUsed;
    }
    if (totalEnergy > maxEnergy)
    {
      totalEnergy = maxEnergy;
    }
  }
}
class EscMenu 
{

  PFont font;
  boolean escPressed;
  boolean[] Opt = new boolean[4];
  int[] chol = new int[4];

  EscMenu() {
    font = createFont("arial", 16, true);
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
      if (mousePressed == true)
      {
        game.loc = 0; //<>// //<>//
      }
      game.menu.timer = 1;
      //this is the main menu option
      chol[2] = 0;
      Opt[2] = true;
      game.menu.screen[0] = false;
      game.menu.screen[1] = false;
      game.menu.screen[2] = false;
      game.menu.screen[3] = false; 
      game.menu.screen[4] = false;
      game.menu.screen[5] = false;
      game.menu.screen[6] = false;
      
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
    background(255);


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
      game.loc = 0;
      escPressed = false;
    }

    if (escPressed) {
      display();  
      choices();
    }
  }
}
class Game {
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

  GameBord gameBord = new GameBord(); 

  BaseLevel baseLevel;
  TerrainEditor terrainEditor = new TerrainEditor();
  EnemyPlasmentEditor enemyPlasmentEditor = new EnemyPlasmentEditor();

  Game() {
    squareFeld = new SquareField();
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
      escMenu.escPressed = false;
      escMenu.Opt[2]=false;
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
    if (mousePressed && menu.screen[5]) { 
      //if tarrain editor is pressed on the start menu
      menu.screen[0]=false;
      loc = 4;
    }

    if (mousePressed && menu.screen[6]) {
      //if enemyplasment is presst on the start menu
      menu.screen[0] = false;
      loc = 6;
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
    background(255);
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

      player.drawHotbar();
      //player stas


      baseLevel.Update();
      baseLevel.Draw();
      baseLevel.enemyRun();

      player.towerDamige(baseLevel.enemyArray.enemys);
      player.towerAttack(baseLevel.enemyArray.enemys);
      player.Run();

      escMenu.run();
      break;

    case 4:
      //this is the level editor

      terrainEditor.Run();

      //testLevel


      //      
      escMenu.run();
      break;

    case 5:
      //this is the end screen
      break;

    case 6:
      enemyPlasmentEditor.Run();
      escMenu.run();
      break;
    }
  }
}
class GameBord 
{

  PFont font;
  boolean GO;

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
  int colorTerrainEditor;
  int colorEnemyPlasmentEditor;

  PVector mouseLocation = new PVector(mouseX, mouseY);

  boolean[] screen = new boolean[7];

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

    //terrain edditor box
    fill(255, colorTerrainEditor * 2, colorTerrainEditor);
    stroke(0);
    strokeWeight(2);
    rect(width*2/3, height*55/72-15, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Terrain editor", width*16/20, height*127/144);
    //terrain editor box

    //enemy plasement edditor box
    fill(colorEnemyPlasmentEditor, colorEnemyPlasmentEditor * 2, 255);
    stroke(0);
    strokeWeight(2);
    rect(width*0/3, height*55/72-15, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Enemy plasement", width*3/20, height*127/144);
    //enemy plasement box

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
      colorLoadGame = 0;
      screen[1] = true;
    } else {
      colorLoadGame = 255;
      screen[1] = false;
    }

    if (mouseX >= width*2/3 && mouseX<=width*3/3 && mouseY>=height*55/72-15 && mouseY<= height*55/72-15+height/4-20 && timer >= 10) {
      colorTerrainEditor = 75;
      screen[5] = true;
    } else {
      colorTerrainEditor = 255;
      screen[5] = false;
    }

    if (mouseX >= width*0/3 && mouseX <= width*1/3 && mouseY>=height*55/72-15 && mouseY<= height*55/72-15+height/4-20 && timer >= 10) {
      colorEnemyPlasmentEditor = 75;
      screen[6] = true;
    } else {
      colorEnemyPlasmentEditor = 255;
      screen[6] = false;
    }
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
//<>// //<>// //<>// //<>//
class Player  
{

  Energy energyNetwork;

  int timer;
  int towernr = 0; 

  //skal kigges på igen
  int eTowerNR;

  int [] towernrremeber = new int[5];

  ArrayList<Tower> towers = new ArrayList<Tower>();


  TowerBase base;
  ArrayList<TowerEnergy> energyTowers = new ArrayList<TowerEnergy>();

  boolean[] towerpickedOnBar = new boolean[5];    
  boolean towerPicked = false; 
  boolean basePicked = false;

  int picked;

  boolean placeble;
  boolean placebleEnergy;
  boolean placebleBase;

  boolean GO = false;

  boolean isMouseNotPressedGat = true;
  boolean isMouseNotPressedPlace = true;
  boolean isMouseNotPressedHotBar = true;


  int chosenTower;
  int rageDisply = 195;

  Player() {
    energyNetwork = new Energy();
  }

  public void PickTowerOnBar() { 
    timer++;

    //blå
    if (mouseX>= width/2-10 && mouseX<=width/2+20 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[0] = true;
    } else {
      towerpickedOnBar[0] = false;
    }
    if (towerpickedOnBar[0] && mousePressed) {   
      towernr += 1;

      towers.add(new TowerAttackTerrtoriumShot());
      timer = 0; 
      picked = 1;
      placeble = true;
      towerpickedOnBar[0] = false; 
      GO = true;
    }


    //rød
    if (mouseX>= width/2+25 && mouseX<=width/2+55 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[1] = true;
    } else {
      towerpickedOnBar[1] = false;
    }
    if (towerpickedOnBar[1] && mousePressed) {   
      towernr += 1;

      towers.add(new TowerAttackTerrtoriumBomb());
      timer = 0; 
      picked = 2;
      placeble = true;
      towerpickedOnBar[1] = false;   
      GO = true;
    }

    //gul
    if (mouseX>= width/2+60 && mouseX<=width/2+90 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[2]=true;
    } else {
      towerpickedOnBar[2]=false;
    }
    if (towerpickedOnBar[2] && mousePressed) {   
      towernr += 1;

      //tower.add(new TowerAttackETowers());
      timer = 0; 
      picked = 3;
      placeble = true;
      towerpickedOnBar[2] = false;   
      GO = true;
    }

    //tukis
    if (mouseX>= width/2+140 && mouseX<=width/2+190 && mouseY>=height-65 && mouseY<=height-15 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[3]=true;
    } else {
      towerpickedOnBar[3]=false;
    }
    if (towerpickedOnBar[3] && mousePressed) {   
      base = new TowerBase();
      timer=0; 
      picked=4;
      placebleBase = true;
      towerpickedOnBar[3]=false; 
      GO = true;
    }

    //grøn
    if (mouseX >= width/2+215 && mouseX<=width/2+225 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[4]=true;
    } else {
      towerpickedOnBar[4]=false;
    }
    if (towerpickedOnBar[4] && mousePressed) {   
      eTowerNR = eTowerNR + 1;

      energyTowers.add(new TowerEnergy());
      timer=0; 
      picked=5;
      placebleEnergy=true;
      energyTowers.get(eTowerNR - 1).vis = 0;
      towerpickedOnBar[4]=false; 
      GO = true;
    }

    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedHotBar = false;
    } else
    {
      isMouseNotPressedHotBar = true;
    }
  }

  public void drawHotbar() {
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
        rect((location.x+i*10)+10*3+5, (location.y+j*10)+10, 10, 10);
      }
    } 

    fill(255, 255, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+10*6+10, (location.y+j*10)+10, 10, 10);
      }
    }

    fill(0, 255, 255);
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        rect((location.x+i*10)+10*6+100, (location.y+j*10)+10, 10, 10);
      }
    }

    fill(0, 255, 0);   
    rect((location.x+10)+10*6+145, (location.y+10), 10, 10);
    energyNetwork.energyUI();
  }

  //nyt navn
  public void gat() {

    if (mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY < height - 60 && isMouseNotPressedGat) {
      towerPicked = false;
    }

    if (towerPicked && mousePressed && isMouseNotPressedGat)
    {
      newPlace(chosenTower);
      towerPicked=false; 
      GO = true;
    }

    if (mouseX >= base.location.x && mouseX <= base.location.x+10 && mouseY >= base.location.y && mouseY <= base.location.y+10) {
      basePicked = true;
      towerPicked = true;
    }

    if (towerPicked && mousePressed && isMouseNotPressedGat)
    {
      if (mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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
        base.location.set(new PVector(mouseX/scale, mouseY/scale));
      }
      towerPicked=false; 
      basePicked = true;
      GO = true;
    }
    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedGat = false;
    } else
    {
      isMouseNotPressedGat = true;
    }
  }

  public void newPlace(int i)
  {
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
    towers.get(i).location.set(game.squareFeld.grid[mouseX/10][mouseY/10]);
  }


  // vise range og energyrange
  // skrives om til at virke med kun en arrayliste
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
      for (int i = -7; i <= 7; i++) {
        for (int j = -7; j <= 7; j++) {
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
      for (int i = -7; i <= 7; i++) {
        for (int j = -7; j <= 7; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      } 
      fill(0, 155, 0);
      stroke(0);
      for (int i = -2; i <= 2; i++) {
        for (int j = -2; j <= 2; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }  

      fill(0, 255, 0);
      rect(location.x, location.y, 10, 10);
    }
  }

  public void place() {     

    if (placeble && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer >= 10) { 
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
      int x = mouseX/10;
      int y = mouseY/10;
      PVector loc = new PVector(x, y);
      towers.get(towernr - 1).location.set(loc);
      picked = 0;
      placeble = false;
      timer = 0;
    }  

    if (placebleBase  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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


      int x = (int)mouseX/scale;
      int y = (int)mouseY/scale;
      PVector loc = new PVector(x, y);

      base.location.set(loc);  



      timer=0;      
      picked = 0;
      placebleBase = false;
    }

    if (placebleEnergy  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      int x = mouseX/10;
      int y = mouseY/10;
      PVector loc = new PVector(x, y);

      energyTowers.get(eTowerNR-1).location.set(loc);  

      energyTowers.get(eTowerNR-1).vis = 100;

      timer=0;      
      picked = 0;
      placebleEnergy = false;
    }
  }

  public void towerDamige(Enemy[][] enemyArray) {

    for (int i = 0; i < energyTowers.size(); i++)
    {
      TowerEnergy energyTower = energyTowers.get(i); 
      energyTower.enemyColition(enemyArray);
      if (energyTower.isDead)
      {
        energyTowers.remove(i);
        energyTower.towersConnected(towers, energyTowers, base);
        for(Tower tower: towers){
        energyTower.energyTowerToTower(tower);
        }
        energyNetwork.energyPruduktion(energyTowers);
        eTowerNR--;
        continue;
      }
    }

    for (int i = 0; i < towers.size(); i++) {
      Tower tower = towers.get(i); 
      tower.enemyColition(enemyArray);
      if (tower.isDead)
      {
        towers.remove(tower);
        towernr--;
        continue;
      }
    }
  }

  public void towerAttack(Enemy[][] enemyArray)
  {
if (energyNetwork.transmit) {
      for (Tower tower : towers) {
        tower.attack(enemyArray);
      }
    }
  }

  public void towerRun() {

    for (TowerEnergy energyTower : energyTowers) {
      energyTower.run(); 
      energyTower.detection(energyTowers);
      energyTower.towersConnected(towers, energyTowers, base);
    }
    energyNetwork.energyPruduktion(energyTowers);

    for (int i = 0; i < towers.size(); i++) {
      Tower tower = towers.get(i);
      tower.Run();
    }    
    energyNetwork.useEnergy(towers);

    if (base != null)
    {
      base.run();
    }
  }

  public void Run() {

    energyNetwork.Update();
    PickTowerOnBar();   
    highLight();   
    if (keys[0]) {
      gat();
    }
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
class TerrainEditor {  //<>//

  Thread thread;
  Table table;

  int mapSaveNR = 0;
  boolean isMouseNotPressedSave = true;
  boolean isMouseNotPressedBrush = true;


  int terrainHeight = 0;
  int brushSize = 1;

  PVector[][] newMap = new PVector[cols][rows];


  TerrainEditor () 
  {
    createTabel();
    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++)
      {
        newMap[i][j] = new PVector(i, j, 0);
      }
    }
  }

  public void createTabel()
  {
    table = new Table();
    table.addColumn("x");
    table.addColumn("y");
    table.addColumn("z");
    table.addColumn("LevelNR");
  }

  public void fieldDraw(PVector[][] grid) 
  {   
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        layerZeroDraw(i, j);
        layerOneDraw(i, j, grid);
        layerTowDraw(i, j, grid);
        layerThreeDraw(i, j, grid);
        layerFourDraw(i, j, grid);
        layerFiveDraw(i, j, grid);
        voidLayer(i, j, grid);
      }
    }
  }

  public void voidLayer(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == -1)
    {
      int x = i*scale;
      int y = j*scale;
      fill(0);
      stroke(255);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerZeroDraw(int i, int j)
  {
    int x = i*scale;
    int y = j*scale;
    fill(120, 58, 8);
    stroke(0);
    strokeWeight(0.5f);
    rect(x, y, scale, scale);
  }

  public void layerOneDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 1)
    {
      int x = i*scale;
      int y = j*scale;
      fill(160, 75, 30);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerTowDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 2)
    {
      int x = i*scale;
      int y = j*scale;
      fill(100);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerThreeDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 3)
    {
      int x = i*scale;
      int y = j*scale;
      fill(100, 70, 40);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerFourDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 4)
    {
      int x = i*scale;
      int y = j*scale;
      fill(90, 60, 30);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public void layerFiveDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 5)
    {
      int x = i*scale;
      int y = j*scale;
      fill(10);
      stroke(0);
      strokeWeight(0.5f);
      rect(x, y, scale, scale);
    }
  }

  public PVector[][] loadMap(int levelNR)
  {
    PVector[][] thisMap = new PVector[cols][rows];
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        thisMap[i][j] = new PVector(i, j);
      }
    }
    table = loadTable("Tarrains.csv", "header");

    if (table != null)
    {
      for (TableRow row : table.rows())
      {
        if (row.getInt("LevelNR") == levelNR)
        {
          int x = row.getInt("x");
          int y = row.getInt("y");
          int z = row.getInt("z");
          thisMap[x][y].z = z;
        }
      }
    }
    return thisMap;
  }

  public void hotbar()
  {
    fill(150);
    rect(width/2-500, height-60, 1000, 60);

    //void layer seleckt
    textSize(15);
    fill(0);
    text("Void layer", width/2-305, height-45);

    if (mouseX >= width / 2 - 290 && mouseX <= width / 2 - 260)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = -1;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale - 280;
        int y = height + j*scale - 30;
        fill(0);
        stroke(255);
        strokeWeight(0.5f);
        rect(x, y, scale, scale);
      }
    }
    stroke(0);

    //layer zero selekt
    textSize(15);
    fill(0);
    text("Layer zero", width/2-215, height-45);

    if (mouseX >= width / 2 - 200 && mouseX <= width / 2 - 170)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 0;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale - 190;
        int y = height + j*scale - 30;
        fill(120, 58, 8);
        stroke(0);
        strokeWeight(0.5f);
        rect(x, y, scale, scale);
      }
    }

    //layer one selekt
    textSize(15);
    fill(0);
    text("Layer One", width/2-125, height-45);

    if (mouseX >= width / 2 - 110 && mouseX <= width / 2 - 80)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 1;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale - 100;
        int y = height + j*scale - 30;
        fill(160, 75, 30);
        stroke(0);
        strokeWeight(0.5f);
        rect(x, y, scale, scale);
      }
    }

    //layer tow selekt
    textSize(15);
    fill(0);
    text("Layer two", width/2 - 35, height-45);

    if (mouseX >= width / 2 - 20 && mouseX <= width / 2 + 10)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 2;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale - 10;
        int y = height + j*scale - 30;
        fill(100);
        stroke(0);
        strokeWeight(0.5f);
        rect(x, y, scale, scale);
      }
    }

    //layer three selekt
    textSize(15);
    fill(0);
    text("Layer three", width/2 + 50, height-45);

    if (mouseX >= width / 2 + 70 && mouseX <= width / 2 + 100)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 3;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale + 80;
        int y = height + j*scale - 30;
        fill(100, 70, 40);
        stroke(0);
        strokeWeight(0.5f);
        rect(x, y, scale, scale);
      }
    }

    //layer four selekt
    textSize(15);
    fill(0);
    text("Layer four", width/2+145, height-45);

    if (mouseX >= width / 2 + 160 && mouseX <= width / 2 + 210)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 4;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale + 170;
        int y = height + j*scale - 30;
        fill(90, 60, 30);
        stroke(0);
        strokeWeight(0.5f);
        rect(x, y, scale, scale);
      }
    }

    //layer five selekt
    textSize(15);
    fill(0);
    text("Layer five", width/2+235, height-45);

    if (mouseX >= width / 2 + 250 && mouseX <= width / 2 + 280)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 5;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale + 260;
        int y = height + j*scale - 30;
        fill(10);
        stroke(0);
        strokeWeight(0.5f);
        rect(x, y, scale, scale);
      }
    }

    //Reset map
    textSize(15);
    fill(0);
    text("Reset map", width/2-415, height-45);
    if (mouseX >= width / 2 - 400 && mouseX <= width / 2 - 370)
    {
      if (mouseY >= height - 40 && mousePressed) {
        overrideMap(mapSaveNR);
        loadMap(mapSaveNR);
      }
    }
    fill(0);
    stroke(0);
    strokeWeight(0.5f);
    rect(width / 2 - 400, height - 40, 3 * scale, 3 * scale);

    choseBrushSize();
  }

  public void choseBrushSize()
  {
    //brush size
    int x = width / 2 + 315;
    int y = height - 40;
    textSize(15);
    fill(0);
    text("Brush size", x - 5, y - 5);

    // Display corrent mapNR
    fill(255);
    stroke(150);
    strokeWeight(0.5f);

    rect(x, y, scale * 3, scale * 3);
    fill(0);
    text(brushSize, x +scale, y+scale*2);

    // Display + or - mapNR
    fill(250);
    stroke(150);
    strokeWeight(0.5f);
    rect(x + scale * 3, y, scale * 3, scale * 3 / 2);
    rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
    fill(0);
    text("+", x + scale * 4, y + scale + 2);
    textSize(20);
    text("-", x + 1 + scale * 4, y + scale * 3);


    if (mouseX >= x + 30 && mouseX <= x + 60 && isMouseNotPressedBrush)  
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {

        if (mousePressed && brushSize < 3)
        {
          brushSize++;
        } 
        fill(10, 240, 10);
        rect(x + scale * 3, y, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(15);
        text("+", x + scale * 4, y + scale + 2);
      }
    }

    if (mouseX >= x + 30 && mouseX <= x + 60 && isMouseNotPressedBrush)  
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {

        if (mousePressed && brushSize > 1) 
        {
          brushSize--;
        } 
        fill(240, 10, 10);
        rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale * 4, y + scale * 3);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    {
      isMouseNotPressedBrush = false;
    } else
    {
      isMouseNotPressedBrush = true;
    }
  }

  public void saveMap()
  {
    //save map
    int x = width / 2 + 400;
    int y = height - 40; 
    textSize(15);
    fill(0);
    text("Save map", x - 5, y - 5);

    if (mouseX >= x && mouseX <= x + 30 && isMouseNotPressedSave)  
    {
      if (mouseY >= height - 40 && mousePressed) {
        overrideMap(mapSaveNR);
        addMap(mapSaveNR);
        saveTable(table, "Tarrains.csv");
      }
    }


    // Display corrent mapNR
    fill(255);
    stroke(150);
    strokeWeight(0.5f);

    rect(x, y, scale * 3, scale * 3);
    fill(0);
    text(mapSaveNR, x +scale, y+scale*2);

    // Display + or - mapNR
    fill(250);
    stroke(150);
    strokeWeight(0.5f);
    rect(x + scale * 3, y, scale * 3, scale * 3 / 2);
    rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
    fill(0);
    text("+", x + scale * 4, y + scale + 2);
    textSize(20);
    text("-", x + 1 + scale * 4, y + scale * 3);

    if (mouseX >= x + 30 && mouseX <= x + 60 && isMouseNotPressedSave) {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed==true)
        {
          mapSaveNR++;
        } 
        fill(10, 240, 10);
        rect(x + scale * 3, y, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(15);
        text("+", x + scale * 4, y + scale + 2);
      }
    }

    if (mouseX >= x + 30 && mouseX <= x + 60 && isMouseNotPressedSave)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && mapSaveNR > 0) 
        {
          mapSaveNR--;
        }  //<>// //<>// //<>// //<>//
        fill(240, 10, 10); //<>// //<>// //<>// //<>//
        rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale * 4, y + scale * 3);
      }
    } //<>// //<>//
    if (mousePressed && mouseY >= height - 40)
    {
      isMouseNotPressedSave = false;
      newMap = loadMap(mapSaveNR);
    } else //<>// //<>// //<>// //<>//
    {
      isMouseNotPressedSave = true;
    }
  }

  public void updateMap()
  {
    if (mouseY >= height - 60 || mouseY <= 0 || mouseX <= 0 || mouseX >= width)
    {
      return; //<>// //<>// //<>//
    }
   
    if (mousePressed && brushSize == 3)
    {
      if (mouseX > width-30) {
        mouseX = width-30;
      } 
      if (mouseX < 20) {
        mouseX = 20;
      } 
      if (mouseY < 20) {
        mouseY = 20;
      } 
      if (mouseY > height-90) {
        mouseY = height-90;
      }

      for (int i = -2; i <= 2; ++i) {
        for (int j = -2; j <= 2; ++j) {
          if (mouseY + j * scale <= height - 60 || mouseY + j *scale >= 0 || mouseX + i * scale >= 0 || mouseX + i * scale <= width)
          {
            newMap[(mouseX / scale) + i][(mouseY / scale) + j].z = terrainHeight;
          }
        }
      }
      return;
    }

    if (mousePressed && brushSize == 2)
    {
      if (mouseX > width-10) {
        mouseX = width-10;
      } 
      if (mouseX < 10) {
        mouseX = 10;
      } 
      if (mouseY < 10) {
        mouseY = 10;
      } 
      if (mouseY > height-80) {
        mouseY = height-80;
      }

      for (int i = -1; i <= 1; ++i) {
        for (int j = -1; j <= 1; ++j) {

          if (mouseY + j * scale <= height - 60 || mouseY + j *scale >= 0 || mouseX + i * scale >= 0 || mouseX + i * scale <= width)
          {
            newMap[(mouseX / scale) + i][(mouseY / scale) + j].z = terrainHeight;
          }
        }
      }
      return;
    }

    if (mousePressed)
    {
      newMap[mouseX/scale][mouseY/scale].z = terrainHeight;
    }
  }

  public void overrideMap(int mapNR)
  {
    int rowMapNr;
    for (int i = table.getRowCount()-1; i >= 0; i--)
    {
      TableRow row = table.getRow(i);
      rowMapNr = row.getInt("LevelNR");
      if (mapNR == rowMapNr)
      {
        table.removeRow(i);
      }
    }
    saveTable(table, "Tarrains.csv");
  }
 
  public void addMap(int mapNR)
  {
    TableRow newRow;
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        if (newMap[i][j].z != 0) {
          newRow = table.addRow();
          newRow.setInt("x", i);
          newRow.setInt("y", j);
          newRow.setInt("z", (int)newMap[i][j].z);
          newRow.setInt("LevelNR", mapNR);
        }
      }
    }
  }

  public void Draw()
  {
    fieldDraw(newMap);
  }
 

  public void Run()
  {
    Draw();
    hotbar();
    saveMap();
    updateMap();
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
class Tower {  

  PVector location;

  int leif = 2;
  int maxLeif = 2;
  int leifRegen = 0;

  //build timer
  int t=-2;
  int underCunstruction;
  int cunstructionEnergyConsomstion;
  int energyConsomstion;

  boolean conected = false;
  boolean isDead = false;

  int range = 20;

  Tower()
  {
    location = new PVector(-10, -10);
  }

  public void weapon(Enemy[][] enemyArray) {
  }

  public PVector detection(Enemy[][] enemyArray) {
    PVector closest = new PVector(-20, -20);
    return closest;
  }

  public void attack(Enemy[][] enemyArray) {
    if (!isBuild()) { 
      return ;
    }
    leif += leifRegen;
    if (leif >= maxLeif)
    {
      leif = maxLeif;
    }
    if (conected) {
      weapon(enemyArray);
      detection(enemyArray);
    }
  }
  
  public void enemyColition (Enemy[][] enemyArray)
  {
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++) {
        if ((int)location.x + i < 0 || (int)location.x + i >= cols)
        {
          continue;
        }
        if ((int)location.y + j < 0 || (int)location.y + j >= cols)
        {
          continue;
        }
        if (enemyArray[(int)location.x + i][(int)location.y + j].updateNR != 3)
        {
          leif--;
        }
      }
    }
    if (leif <= 0)
    {
      isDead = true;
    }
  }

  public void Build() {
    stroke(0);
    strokeWeight(1.5f);
    rect((location.x*10 - 10), (location.y*10 - 10), 30, 30);

    if (conected == false) {
      return;
    }

    if (game.player.energyNetwork.totalEnergy < 0)
    {
      return;
    }

    if (t==-3) {
      //game.energy.energyUsed = game.energy.energyUsed-energybuild;
      t=11;
    }

    if (t<=11&&t>=-1) { 
      t--;
    }

    if (t<=-1) {
      underCunstruction++;
      t=11;
    }

    if (underCunstruction==11) {
      underCunstruction=12;
      t=13;
    }

    if (t==13) { 


      //game.energy.energyUsed = game.energy.energyUsed+energybuild-energyConsomstion; 
      t=14;
    }
  }



  public boolean isBuild () { 
    if (t==14) {
      return true;
    } else {
      return false;
    }
  }


  public void Run() {

    Build();
  }
}
//class TowerAttackETowers  extends Tower
//{
//  PVector location=new PVector(-100, -100);

//  int life;

//  int t=-2;

//  int build;
//  int energybuild = 50;
//  int energyConsomstion = 9;

//  boolean conected=false;

//  void weapon() {
//  }

//  void detection() {
//  }
/*
  void build() {  
    
    fill(15+(20*build), 15+(20*build), 0);
     stroke(0);
     strokeWeight(1.5);
     
     for (int i = -1; i <= 1; i++) {
     for (int j = -1; j <= 1; j++) {
     rect(location.x+i*10, location.y+j*10, 10, 10);
     }
     }
     
     if (!conected && game.energy.energyTotal <= 0) {
     return;
     }
     if (t==-3) {
     game.energy.energyUsed = game.energy.energyUsed-energybuild;
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
     game.energy.energyUsed = game.energy.energyUsed+energybuild-energyConsomstion; 
     
     t=14;
     }
     
  }

  boolean ready() { 
    if (t==14) {
      return true;
    } else {
      return false;
    }
  }

//  void build() {  
    
//    fill(15+(20*build), 15+(20*build), 0);
//    stroke(0);
//    strokeWeight(1.5);

//    for (int i = -1; i <= 1; i++) {
//      for (int j = -1; j <= 1; j++) {
//        rect(location.x+i*10, location.y+j*10, 10, 10);
//      }
//    }

//    if (!conected && game.energy.energyTotal <= 0) {
//      return;
//    }
//    if (t==-3) {
//      game.energy.energyUsed = game.energy.energyUsed-energybuild;
//      t=11;
//    }

//    if (t<=11&&t>=-1) { 
//      t--;
//    }


//    if (t<=-1) {
//      build++;
//      t=11;
//    }
//    if (build==11) {
//      build=12;
//      t=13;
//    }
//    if (t==13) { 
//      game.energy.energyUsed = game.energy.energyUsed+energybuild-energyConsomstion; 

//      t=14;
//    }
//  }
//  boolean ready() { 
//    if (t==14) {
//      return true;
//    } else {
//      return false;
//    }
//  }
>>>>>>> origin/Tower-Energy-to-Tower

//  void run() { 
//    build();
//    if (ready()) {
//      weapon();
//    }
//  }
//}
*/
class TowerAttackTerrtoriumBomb extends Tower  //<>// //<>//
{  
  int energybuild = 40;
  int cooldown;
  int range = 20;
  int strongest = 0;    

  boolean shoot = false;
  //boolean conected=false;

  TowerAttackTerrtoriumBomb()
  {
    super();
    underCunstruction = 0;
    cunstructionEnergyConsomstion = 20;
    energyConsomstion = 25;
    leifRegen = 1;
    maxLeif = 25;
  }


  public void weapon(Enemy[][] enemyArray) {
    if (enemyArray[(int)location.x + (int)detection(enemyArray).x][((int)location.y) + (int)detection(enemyArray).y].updateNR==3) {
      shoot=false;
    } else {
      shoot=true;
    } 
    cooldown++;
    if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {
      if (cooldown >= 5 && shoot) { 
        stroke(255);
        strokeWeight(2);
        line((detection(enemyArray).x + location.x) * scale + 5, (detection(enemyArray).y + location.y) * scale + 5, location.x * scale + 5, location.y * scale + 5);
        strokeWeight(0.5f);
        noStroke();

        cooldown = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {   
            enemyArray[PApplet.parseInt(detection(enemyArray).x+i)+(int)location.x ][PApplet.parseInt(detection(enemyArray).y+j)+(int)location.y ].strength-=5;
          }
        }
      }
    }
  }

  public PVector detection(Enemy[][] enemyArray) {

    PVector inRange = new PVector(-range, -range);
    strongest = 0;


    for (int i = -range; i <= range; i++) {
      for (int j = -range; j <= range; j++) {
        if (((int)location.x) + i >= 0 && ((int)location.y) + j >= 0 && ((int)location.x) + i < cols && ((int)location.y) + j < rows) {
          Enemy enemy = enemyArray[((int)location.x) + i][((int)location.y) + j];
          if (enemy.strength > 0) {
            if (strongest < enemy.strength) {
              strongest = enemy.strength;
              inRange = new PVector(i, j);
            }
          }
        }
      }
    }
    return inRange;
  }

  public void attack(Enemy[][] enemyArray) {
    super.attack(enemyArray);
    if (!isBuild()) { 
      return ;
    }
    weapon(enemyArray);
    detection(enemyArray);
  }

  public void Build() {   
    fill(15+(20*underCunstruction), 0, 0);
    super.Build();
  }  
  public void Run() {


    Build();
  }
}
class TowerEnergy 
{
  PVector location=new PVector(-100, -100);

  int leif = 2;

  int vis;

  PVector range = new PVector();
  boolean conected=false;
  boolean baseConeced;
  boolean coutedOnBase;
  boolean isDead = false;


  public void detection(ArrayList<TowerEnergy> energyTowers) {
    for (TowerEnergy energyTower : energyTowers) {
      if (energyTower == this)
      {
        continue;
      }
      energyTowersConnected(energyTower);
    }
  }

  public boolean inRangeEnergyTower(TowerEnergy energyTower) {  
    range = PVector.sub(energyTower.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  public void energyTowersConnected(TowerEnergy energyTower) { 


    if (inRangeEnergyTower(energyTower)) {       

      conected=true;
      stroke(255);
      strokeWeight(2);
      //line(energyTower.location.x*scale+5, energyTower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
    }
  }


  public boolean inRangeTower(Tower tower) {
    range = PVector.sub(tower.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  public boolean inRangeTower(TowerEnergy energyTower) {
    range = PVector.sub(energyTower.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  public boolean inRangeTower(TowerBase base) {
    if (base == null)
    {
      return false;
    }
    range = PVector.sub(base.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  public void towersConnected(ArrayList<Tower> towers, ArrayList<TowerEnergy> energyTowers, TowerBase base) {

    baseConeced = false;

    connectedToBase(base);

    for (TowerEnergy energyTower : energyTowers)
    {
      energyTowerToEnergyTower(energyTower);
    }

    for (Tower tower : towers) {
      energyTowerToTower(tower);
    }
    strokeWeight(0.5f);
  }

  public void energyTowerToEnergyTower(TowerEnergy energyTower) {
    if (energyTower == this) {
      return;
    }
    if (inRangeTower(energyTower) && energyTower.baseConeced)
    {
      baseConeced = true;
      stroke(255);
      strokeWeight(2);
      line(energyTower.location.x*scale+5, energyTower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
    }
  }

  public void connectedToBase(TowerBase base)
  {
    if (inRangeTower(base))
    {
      baseConeced = true;
      stroke(255);
      strokeWeight(2);
      line(base.location.x*scale+5, base.location.y*scale+5, location.x*scale+5, location.y*scale+5);
    }
  }


  public void energyTowerToTower(Tower tower) { 
    tower.conected = false;
    println(tower.conected, frameCount);
    if (baseConeced && inRangeTower(tower)) {
      tower.conected=true; 
      println(tower.conected,frameCount);
      stroke(255);
      strokeWeight(2);
      line(tower.location.x*scale+5, tower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
      return;
    }
  }

  public void enemyColition (Enemy[][] enemyArray)
  {
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++) {
        if ((int)location.x + i < 0 || (int)location.x + i >= cols)
        {
          continue;
        }
        if ((int)location.y + j < 0 || (int)location.y + j >= cols)
        {
          continue;
        }
        if (enemyArray[(int)location.x + i][(int)location.y + j].updateNR != 3)
        {
          leif--;
        }
      }
    }
    if (leif <= 0)
    {
      isDead = true;
    }
  }


  public void arearDraw() {   

    stroke(0);
    if (vis == 100) {
      strokeWeight(1.5f);
    } else {  
      noStroke();
    }

    fill(0, 155, 0, vis);
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {


        rect((location.x + i) * scale, (location.y + j) * scale, scale, scale);
      }
    }
  }
  public void towerDraw() {
    noFill(); 
    fill(0, 255, 0);     
    stroke(0);
    strokeWeight(1.5f);
    rect(location.x*10, location.y*10, 10, 10);
  }



  public void Darw() {
    arearDraw();

    towerDraw();
  }

  public void run() { 

    Darw();
  }
}
class TowerBase 
{
  PVector location=new PVector(-100, -100);
  
  int life;
  
   boolean conected=false;

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
        rect((location.x+i)*scale, (location.y+j)*scale, 10, 10);
      }
    }
  }
  public void run() { 
    highLight();
    weapon();
    detection();
  }
}
class TowerAttackTerrtoriumShot extends Tower {  
  int energybuild = 40;
  int cooldown;

  boolean shoot = false;

  //boolean conected=false;

  int range = 20;

  TowerAttackTerrtoriumShot()
  {
    super();
    underCunstruction = 0;
    cunstructionEnergyConsomstion = 10;
    energyConsomstion = 10;
    leifRegen = 1;
    maxLeif = 25;
  }


  public void weapon(Enemy[][] enemyArray) {
    if (enemyArray[(int)location.x + (int)detection(enemyArray).x][((int)location.y) + (int)detection(enemyArray).y].updateNR==3) {
      shoot=false;
    } else {
      shoot=true;
    } 
    cooldown++;

    if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {
      if (cooldown >= 5 && shoot) { 
        stroke(255);
        strokeWeight(2);
        line((detection(enemyArray).x + location.x) * scale + 5, (detection(enemyArray).y + location.y) * scale + 5, location.x * scale + 5, location.y * scale + 5);
        noStroke();
        strokeWeight(0.5f);

        cooldown=0;
        enemyArray[PApplet.parseInt(detection(enemyArray).x)+(int)location.x][PApplet.parseInt(detection(enemyArray).y)+(int)location.y].strength-=5;
      }
    }
   
  
  }


  public PVector detection(Enemy[][] enemyArray) {

    PVector inRange = new PVector(-range, -range);
    PVector closest = new PVector(inRange.x, inRange.y);

    for (int i = -range; i <= range; i++) {
      for (int j = -range; j <= range; j++) {

        if (((int)location.x) + i >= 0 && ((int)location.y) + j >= 0 && ((int)location.x) + i < cols && ((int)location.y) + j < rows) {
          Enemy enemy = enemyArray[((int)location.x) + i][((int)location.y) + j];
          if (enemy.strength > 0) {   
            inRange = new PVector(i, j);
            if (inRange.mag() < closest.mag()) {
              closest = inRange;
            }
          }
        }
      }
    }
    return closest;
  }

  public void attack(Enemy[][] enemyArray) {
    super.attack(enemyArray);
    if (!isBuild()) { 
      return ;
    }
    weapon(enemyArray);
    detection(enemyArray);
  }
  public void Build() {  

    fill(0, 0, 15+(20*underCunstruction));
    super.Build();
  }
  public void Run() {


    Build();
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RTS" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
