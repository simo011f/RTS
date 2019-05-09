class BaseLevel implements Visualize //<>//
{

  EnemyGrid enemyArray;
  EnemyPlasmentEditor enemyPlasmentEditor = new EnemyPlasmentEditor();

  int currentLevel = 0;
  int emittersRemaning = 0;

  int x;
  int y;

  PGraphics thisMap;  

  ArrayList<Emitter> emitters = new ArrayList<Emitter>();

  PVector[][] currentTerrain = new PVector[cols][rows];

  BaseLevel() {
    thisMap = createGraphics(width, height);
    enemyArray = new EnemyGrid();
    thread("feildDraw");
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        currentTerrain[i][j]= new PVector(i, j);
      }
    }
  }

  PVector[][] loadMap(int levelNR)
  {
    PVector[][] thisMap = new PVector[cols][rows];
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        thisMap[i][j] = new PVector(i, j, -1);
      }
    }
    Table table = loadTable("Tarrains.csv", "header");

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

  void loadLevel(int newLevel)
  {
    currentTerrain = loadMap(newLevel);  

    enemyArray = enemyPlasmentEditor.loadBasicEnemy(newLevel, currentTerrain);
    enemyArray.reLoad(enemyArray);
    emitters = enemyPlasmentEditor.loadEmitters(newLevel, enemyArray);  
    game.player.levelTerrain=currentTerrain;
    emittersRemaning = emitters.size();
  }


  void fieldDraw(PVector[][] grid) 
  {   
    background(255);
    thisMap.beginDraw();
    voidLayer();
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        x = i*scale;
        y = j*scale;

        thisMap.stroke(0);


        if (grid[i][j].z == 0)
        {

          thisMap.noStroke();
          thisMap.fill(255);
          thisMap.rect(x, y, scale, scale);
          layerZeroDraw();
        }
        if (grid[i][j].z == 1)
        {

          thisMap.noStroke();
          thisMap.fill(255);
          thisMap.rect(x, y, scale, scale);
          layerOneDraw();
        }    
        if (grid[i][j].z == 2)
        {

          thisMap.noStroke();
          thisMap.fill(255);
          thisMap.rect(x, y, scale, scale);
          layerTowDraw();
        }  
        if (grid[i][j].z == 3)
        {

          thisMap.noStroke();
          thisMap.fill(255);
          thisMap.rect(x, y, scale, scale);
          layerThreeDraw();
        }  
        if (grid[i][j].z == 4)
        {

          thisMap.noStroke();
          thisMap.fill(255);
          thisMap.rect(x, y, scale, scale);
          layerFourDraw();
        }        
        if (grid[i][j].z == 5)
        {

          thisMap.noStroke();
          thisMap.fill(255);
          thisMap.rect(x, y, scale, scale);
          layerFiveDraw();
        }
      }
    }
    strokeWeight(0);
    thisMap.endDraw();
  }

  void voidLayer()
  {
    thisMap.fill(0);
    thisMap.stroke(0);
    thisMap.image(voidImg, 0, 0);
  }

  void layerZeroDraw()
  {
    thisMap.noFill();
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);  
    thisMap.image(layerZeroImg, x, y);
    thisMap.rect(x, y, scale, scale);
  }

  void layerOneDraw()
  {
    thisMap.noFill();
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);  
    thisMap.image(layerOneImg, x, y);
    thisMap.rect(x, y, scale, scale);
  }

  void layerTowDraw()
  {
    thisMap.noFill();
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);  
    thisMap.image(layerTowImg, x, y);
    thisMap.rect(x, y, scale, scale);
  }

  void layerThreeDraw()
  {
    thisMap.noFill();
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);  
    thisMap.image(layerThreeImg, x, y);
    thisMap.rect(x, y, scale, scale);
  }


  void layerFourDraw()
  {
    thisMap.noFill();
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);  
    thisMap.image(layerFureImg, x, y);
    thisMap.rect(x, y, scale, scale);
  }


  void layerFiveDraw()
  {
    thisMap.noFill();
    thisMap.stroke(0);
    thisMap.strokeWeight(0.75);  
    thisMap.image(layerFiveImg, x, y);
    thisMap.rect(x, y, scale, scale);
  }


  //denher æder fames
  void visualize()
  {
    image(thisMap, 0, 0);
  }

  void reloadLevel()
  {
    visualizer.remove(enemyArray);
    loadLevel(currentLevel);
    game.player.energyNetwork.updateTerrain(currentTerrain);
    background(255);
    fieldDraw(currentTerrain);
    enemyArray.terrainUpdate(currentTerrain);
    visualizer.add(enemyArray);
    visualize();
    game.player = new Player();
  }

  void Update()
  {

    if (frameCount % 2 == 0) {
      //enemyArray.Update();
      for (int i = emitters.size() - 1; i >= 0; i--) {
        emitters.get(i).Update(enemyArray);
        if (emitters.get(i).isDead) {
          visualizer.remove(emitters.get(i));
          emitters.remove(i);
        }
      }
    }
  }

  void enemyRun()
  {
    enemyArray.Update();
  }
}
