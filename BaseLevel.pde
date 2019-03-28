 //<>// //<>// //<>//
class BaseLevel  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

{

  EnemyGrid enemyArray;
  TerrainEditor terrainEditor = new TerrainEditor();
  EnemyPlasmentEditor enemyPlasmentEditor = new EnemyPlasmentEditor();

  int scale = 10;  
  int cols = width / scale;
  int rows = (height / scale) - 6;
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

  void voidLayer(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == -1)
    {
      int x = i*scale;
      int y = j*scale;
      fill(0);
      stroke(255);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerZeroDraw(int i, int j)
  {
    int x = i*scale;
    int y = j*scale;
    fill(120, 58, 8);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, scale, scale);
  }

  void layerOneDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 1)
    {
      int x = i*scale;
      int y = j*scale;
      fill(160, 75, 30);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerTowDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 2)
    {
      int x = i*scale;
      int y = j*scale;
      fill(100);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerThreeDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 3)
    {
      int x = i*scale;
      int y = j*scale;
      fill(100, 70, 40);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerFourDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 4)
    {
      int x = i*scale;
      int y = j*scale;
      fill(90, 60, 30);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerFiveDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 5)
    {
      int x = i*scale;
      int y = j*scale;
      fill(10);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void Draw()
  {
    fieldDraw(currentTerrain);
  }
  void Update()
  {
    if (emitters.size() == 0 || currentLevel == 0) {
      currentLevel++;
      loadLevel(currentLevel);
    }
    //enemyArray.Update();
    for (int i = 0; i < emitters.size(); ++i) {
      emitters.get(i).Update(enemyArray);
      if (emitters.get(i).isDead) {
        emitters.remove(i);
      }
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
