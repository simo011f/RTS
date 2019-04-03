class BaseLevel  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

{


  EnemyGrid enemyArray;
  TerrainEditor terrainEditor = new TerrainEditor();
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

  BaseLevel(PVector[][] grid)
  {
    enemyArray = new EnemyGrid(grid);
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        currentTerrain[i][j]= new PVector(i, j);
      }
    }
  }

  void loadLevel(int newLevel)
  {
    currentTerrain = terrainEditor.loadMap(newLevel);
    enemyArray = enemyPlasmentEditor.loadBasicEnemy(newLevel, currentTerrain);
    enemyArray.reLoad(enemyArray);
    emitters = enemyPlasmentEditor.loadEmitters(newLevel, enemyArray);
    emittersRemaning = emitters.size();
  }



  void fieldDraw(PVector[][] grid) 
  {   
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
    thisMap.fill(120, 58, 8);
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);
    thisMap.rect(x, y, scale, scale);
  }

  void layerOneDraw()
  {
    thisMap.fill(160, 75, 30);
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);
    thisMap.rect(x, y, scale, scale);
  }

  void layerTowDraw()
  {
    thisMap.fill(100);
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);
    thisMap.rect(x, y, scale, scale);
  }

  void layerThreeDraw()
  {
    thisMap.fill(100, 70, 40);
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);
    thisMap.rect(x, y, scale, scale);
  }


  void layerFourDraw()
  {
    thisMap.fill(90, 60, 30);
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);
    thisMap.rect(x, y, scale, scale);
  }


  void layerFiveDraw()
  {
    thisMap.fill(10);
    thisMap.stroke(0);
    thisMap.strokeWeight(0.5);
    thisMap.rect(x, y, scale, scale);
  }


  //denher æder fames
  void Draw()
  {
    image(thisMap, 0, 0);
  }

  void Update()
  {
    //viktury
    if(currentLevel >= 25){println("Game Over");}
    
    if (currentLevel < 25 && emitters.size() == 0 || currentLevel == 0) {
      currentLevel++;
      loadLevel(currentLevel);
      game.player.energyNetwork.updateTerrain(currentTerrain);
      background(255);
      fieldDraw(currentTerrain);
      enemyArray.terrainUpdate(currentTerrain);
      Draw();
      game.player = new Player();
    }
    if (frameCount % 2 == 0) {
      //enemyArray.Update();
      for (int i = emitters.size() - 1; i >= 0; i--) {
        emitters.get(i).Update(enemyArray);
        if (emitters.get(i).isDead) {
          emitters.remove(i);
        }
      }
    }
  }

  void enemyRun()
  {
    enemyArray.Update();

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
