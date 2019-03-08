class BaseLevel  //<>// //<>// //<>// //<>//
{

  EnemyGrid enemys;


  int scale = 10;  
  int cols = width / scale;
  int rows = (height / scale) - 6;

  BaseLevel() {
  }

  BaseLevel(PVector[][] grid)
  {
    enemys = new EnemyGrid(grid);
  }

  void fieldDraw(PVector[][] grid) {   
    // Begin loop for cols
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
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
      fill(50);
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
      fill(50);
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

  void Draw(PVector[][] grid)
  {
    fieldDraw(grid);
  }

  void Update()
  {
    enemys.Update();
  }

  void enemyRun()
  {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        enemys.Draw(i, j);
      }
    }
  }
}

class TestLevel extends BaseLevel
{

  TestLevel() {
  }

  TestLevel(PVector[][] grid)
  {
    super(grid);
    enemys.enemys[cols/2][rows/2].strength = 100000;
  }
}
