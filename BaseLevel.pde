//<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
class BaseLevel  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

{

  EnemyGrid enemyArray;
  TerrainEditor terrainEditor = new TerrainEditor();
  EnemyPlasmentEditor enemyPlasmentEditor = new EnemyPlasmentEditor();

  int currentLevel = 0;
  int emittersRemaning = 0;

  int x;
  int y;

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
    voidLayer();
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        x = i*scale;
        y = j*scale;


        if (currentTerrain[i][j].z == -1 && frameCount % 2 == 0)
        {
        }
        stroke(0);


        if (grid[i][j].z == 0)
        {

          noStroke();
          fill(255);
          rect(x, y, scale, scale);
          layerZeroDraw();
        }
        if (grid[i][j].z == 1)
        {

          noStroke();
          fill(255);
          rect(x, y, scale, scale);
          layerOneDraw();
        }    
        if (grid[i][j].z == 2)
        {

          noStroke();
          fill(255);
          rect(x, y, scale, scale);
          layerTowDraw();
        }  
        if (grid[i][j].z == 3)
        {

          noStroke();
          fill(255);
          rect(x, y, scale, scale);
          layerThreeDraw();
        }  
        if (grid[i][j].z == 4)
        {

          noStroke();
          fill(255);
          rect(x, y, scale, scale);
          layerFourDraw();
        }        
        if (grid[i][j].z == 5)
        {

          noStroke();
          fill(255);
          rect(x, y, scale, scale);
          layerFiveDraw();
        }
      }
    }
    strokeWeight(0);
  }

  void voidLayer()
  {
    fill(0);
    stroke(0);
    strokeWeight(0.5);
    rect(0, 0, cols * scale, rows * scale);
  }

  void layerZeroDraw()
  {
    fill(120, 58, 8);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, scale, scale);
  }

  void layerOneDraw()
  {
    fill(160, 75, 30);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, scale, scale);
  }

  void layerTowDraw()
  {
    fill(100);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, scale, scale);
  }

  void layerThreeDraw()
  {
    fill(100, 70, 40);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, scale, scale);
  }


  void layerFourDraw()
  {
    fill(90, 60, 30);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, scale, scale);
  }


  void layerFiveDraw()
  {
    fill(10);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, scale, scale);
  }


  //denher æder fames
  void Draw()
  {
    fieldDraw(currentTerrain);
  }

  void Update()
  {
    if (emitters.size() == 0 || currentLevel == 0) {
      currentLevel++;
      loadLevel(currentLevel);
      game.player.energyNetwork.updateTerrain(currentTerrain);
      background(255);
      Draw();
    }
    if (frameCount % 2 == 0) {
      //enemyArray.Update();
      for (int i = emitters.size() - 1; i >= 0; i--) {
        emitters.get(i).Update(enemyArray);
        if (emitters.get(i).isDead) {
          emitters.remove(i);
        }
      }

      enemyArray.Update();
    }
  }

  void enemyRun()
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
