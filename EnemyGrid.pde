class EnemyGrid  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
{

  int scale = 10;  

  int cols = width / scale;
  int rows = (height / scale) - 6;

  boolean isNorth = false;
  boolean isSouth = false;
  boolean isEast = false;
  boolean isWest = false;

  Enemy[][] enemyArray = new Enemy[cols][rows];

  EnemyGrid()
  {
    // Begin loop for columns
    for (int i = 0; i < cols; i++) 
    {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) 
      {
        enemyArray[i][j] = new Enemy(new PVector(i, j));
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
        enemyArray[i][j] = new Enemy(new PVector(i, j));
        terrainUpdate(i, j, grid);
      }
    }
  }

  int addToNorth(int i, int j)
  {
    if (j - 1 >= 0 && enemyArray[i][j - 1].strength >= 1 && enemyArray[i][j - 1].strength + 80 < enemyArray[i][j].strength)
    {
      enemyArray[i][j - 1].addLayer(50);
      return 50;
    }
    if (j - 1 >= 0 && enemyArray[i][j - 1].strength >= 1 && enemyArray[i][j - 1].strength + 40 < enemyArray[i][j].strength)
    {
      enemyArray[i][j - 1].addLayer(10);
      return 10;
    }
    if (j - 1 >= 0 && enemyArray[i][j - 1].strength >= 1 && enemyArray[i][j - 1].strength + 20 < enemyArray[i][j].strength)
    {
      enemyArray[i][j - 1].addLayer(5);
      return 5;
    }
    if (j - 1 >= 0 && enemyArray[i][j - 1].strength >= 1 && enemyArray[i][j - 1].strength + 1 < enemyArray[i][j].strength)
    {
      enemyArray[i][j - 1].addLayer();
      return 1;
    }
    return 0;
  }

  int addToSouth(int i, int j)
  {
    if (j + 1 < rows  && enemyArray[i][j + 1].strength >= 1 && enemyArray[i][j + 1].strength + 80 < enemyArray[i][j].strength)
    {
      enemyArray[i][j + 1].addLayer(50);
      return 50;
    }
    if (j + 1 < rows  && enemyArray[i][j + 1].strength >= 1 && enemyArray[i][j + 1].strength + 40 < enemyArray[i][j].strength)
    {
      enemyArray[i][j + 1].addLayer(10);
      return 10;
    }
    if (j + 1 < rows  && enemyArray[i][j + 1].strength >= 1 && enemyArray[i][j + 1].strength + 20 < enemyArray[i][j].strength)
    {
      enemyArray[i][j + 1].addLayer(5);
      return 5;
    }
    if (j + 1 < rows  && enemyArray[i][j + 1].strength >= 1 && enemyArray[i][j + 1].strength + 1 < enemyArray[i][j].strength)
    {
      enemyArray[i][j + 1].addLayer();
      return 1;
    }
    return 0;
  }

  int addToEast(int i, int j)
  {
    if (i - 1 >= 0 && enemyArray[i - 1][j].strength >= 1 && enemyArray[i - 1][j].strength + 80 < enemyArray[i][j].strength)
    {
      enemyArray[i - 1][j].addLayer(50);
      return 50;
    }
    if (i - 1 >= 0 && enemyArray[i - 1][j].strength >= 1 && enemyArray[i - 1][j].strength + 40 < enemyArray[i][j].strength)
    {
      enemyArray[i - 1][j].addLayer(10);
      return 10;
    }
    if (i - 1 >= 0 && enemyArray[i - 1][j].strength >= 1 && enemyArray[i - 1][j].strength + 20 < enemyArray[i][j].strength)
    {
      enemyArray[i - 1][j].addLayer(5);
      return 5;
    }
    if (i - 1 >= 0 && enemyArray[i - 1][j].strength >= 1 && enemyArray[i - 1][j].strength + 1 < enemyArray[i][j].strength)
    {
      enemyArray[i - 1][j].addLayer();
      return 1;
    }
    return 0;
  }

  int addToWest(int i, int j)
  {
    if (i + 1 < cols && enemyArray[i + 1][j].strength >= 1 && enemyArray[i + 1][j].strength + 80 < enemyArray[i][j].strength)
    {
      enemyArray[i + 1][j].addLayer(50);
      return 50;
    }
    if (i + 1 < cols && enemyArray[i + 1][j].strength >= 1 && enemyArray[i + 1][j].strength + 40 < enemyArray[i][j].strength)
    {
      enemyArray[i + 1][j].addLayer(10);
      return 10;
    }
    if (i + 1 < cols && enemyArray[i + 1][j].strength >= 1 && enemyArray[i + 1][j].strength + 20 < enemyArray[i][j].strength)
    {
      enemyArray[i + 1][j].addLayer(5);
      return 5;
    }
    if (i + 1 < cols && enemyArray[i + 1][j].strength >= 1 && enemyArray[i + 1][j].strength + 1 < enemyArray[i][j].strength)
    {
      enemyArray[i + 1][j].addLayer();
      return 1;
    }
    return 0;
  }

  void addToAjesent(int i, int j)
  {
    int strengthAdded = 0;
    strengthAdded += addToAjesentSame(i, j);
    strengthAdded += addToAjesentDiffrent(i, j);
    enemyArray[i][j].strength -= strengthAdded;
  }

  int addToAjesentSame(int i, int j)
  {
    int strengthAdded = 0;
    if (i - 1 >= 0 && enemyArray[i][j].terrainHeight >= enemyArray[i - 1][j].terrainHeight && enemyArray[i - 1][j].strength != -100)
    {
      strengthAdded += addToEast(i, j);
    }
    if (j + 1 < rows && enemyArray[i][j].terrainHeight >= enemyArray[i][j + 1].terrainHeight && enemyArray[i][j + 1].strength != -100) 
    {    
      strengthAdded += addToSouth(i, j);
    }
    if (j - 1 >= 0 && enemyArray[i][j].terrainHeight >= enemyArray[i][j - 1].terrainHeight && enemyArray[i][j - 1].strength != -100) 
    {   
      strengthAdded += addToNorth(i, j);
    }
    if (i + 1 < cols && enemyArray[i][j].terrainHeight >= enemyArray[i + 1][j].terrainHeight && enemyArray[i + 1][j].strength != -100) 
    {
      strengthAdded += addToWest(i, j);
    }
    return strengthAdded;
  }

  int addToAjesentDiffrent(int i, int j)
  {
    int strengthAdded = 0;
    if (i - 1 >= 0 && -enemyArray[i][j].terrainHeight + enemyArray[i - 1][j].terrainHeight > 0 && enemyArray[i][j].strength >= (10*(-enemyArray[i][j].terrainHeight + enemyArray[i - 1][j].terrainHeight))) 
    {
      strengthAdded += addToEast(i, j);
    }
    if (j + 1 < rows && -enemyArray[i][j].terrainHeight + enemyArray[i][j + 1].terrainHeight > 0&& enemyArray[i][j].strength >= (10*(-enemyArray[i][j].terrainHeight + enemyArray[i][j + 1].terrainHeight))) 
    {
      strengthAdded += addToSouth(i, j);
    }
    if (j - 1 >= 0 && -enemyArray[i][j].terrainHeight + enemyArray[i][j - 1].terrainHeight > 0 && enemyArray[i][j].strength >= (10*(-enemyArray[i][j].terrainHeight + enemyArray[i][j - 1].terrainHeight))) 
    {
      strengthAdded += addToNorth(i, j);
    }
    if (i + 1 < cols && -enemyArray[i][j].terrainHeight + enemyArray[i + 1][j].terrainHeight > 0&& enemyArray[i][j].strength >= (10*(-enemyArray[i][j].terrainHeight + enemyArray[i + 1][j].terrainHeight))) 
    {
      strengthAdded += addToWest(i, j);
    }
    return strengthAdded;
  }

  void spawnAjesent(int i, int j)
  {
    int strengthAdded = 0;

    //lower heigth
    if (i - 1 >= 0 && enemyArray[i - 1][j].terrainHeight != -1 && enemyArray[i][j].terrainHeight >= enemyArray[i - 1][j].terrainHeight && enemyArray[i - 1][j].strength == -100)
    {
      strengthAdded += spawnEast(i, j);
    }
    if (j + 1 < rows && enemyArray[i][j + 1].terrainHeight != -1 &&  enemyArray[i][j].terrainHeight >= enemyArray[i][j + 1].terrainHeight && enemyArray[i][j + 1].strength == -100) 
    {
      strengthAdded += spawnSouth(i, j);
    }
    if (j - 1 >= 0 && enemyArray[i][j - 1].terrainHeight != -1 &&  enemyArray[i][j].terrainHeight >= enemyArray[i][j - 1].terrainHeight && enemyArray[i][j - 1].strength == -100) 
    {
      strengthAdded += spawnNorth(i, j);
    }
    if (i + 1 < cols && enemyArray[i + 1][j].terrainHeight != -1 &&  enemyArray[i][j].terrainHeight >= enemyArray[i + 1][j].terrainHeight && enemyArray[i + 1][j].strength == -100) 
    {
      strengthAdded += spawnWest(i, j);
    }

    //diffrent height
    if (i - 1 >= 0 && -enemyArray[i][j].terrainHeight + enemyArray[i - 1][j].terrainHeight >= 0 && enemyArray[i][j].strength >= (10*(-enemyArray[i][j].terrainHeight + enemyArray[i - 1][j].terrainHeight))) 
    {
      strengthAdded += spawnEast(i, j);
    }
    if (j + 1 < rows && -enemyArray[i][j].terrainHeight + enemyArray[i][j + 1].terrainHeight >= 0 && enemyArray[i][j].strength >= (10*(-enemyArray[i][j].terrainHeight + enemyArray[i][j + 1].terrainHeight))) 
    {
      strengthAdded += spawnSouth(i, j);
    }
    if (j - 1 >= 0 && -enemyArray[i][j].terrainHeight + enemyArray[i][j - 1].terrainHeight >= 0 && enemyArray[i][j].strength >= (10*(-enemyArray[i][j].terrainHeight + enemyArray[i][j - 1].terrainHeight))) 
    {
      strengthAdded += spawnNorth(i, j);
    }
    if (i + 1 < cols && -enemyArray[i][j].terrainHeight + enemyArray[i + 1][j].terrainHeight >= 0 && enemyArray[i][j].strength >= (10*(-enemyArray[i][j].terrainHeight + enemyArray[i + 1][j].terrainHeight))) 
    {
      strengthAdded += spawnWest(i, j);
    }
    enemyArray[i][j].strength -= strengthAdded;
  }

  int spawnNorth(int i, int j)
  {
    if (j - 1 >= 0 && enemyArray[i][j - 1].strength == -100)
    {
      enemyArray[i][j - 1].strength = 1;
      return 1;
    }
    return 0;
  }

  int spawnSouth(int i, int j)
  {
    if (j + 1 < rows && enemyArray[i][j + 1].strength == -100)
    {
      enemyArray[i][j + 1].strength = 1;
      return 1;
    }
    return 0;
  }

  int spawnEast(int i, int j)
  {
    if (i - 1 >= 0 && enemyArray[i - 1][j].strength == -100)
    {
      enemyArray[i - 1][j].strength = 1;
      return 1;
    }
    return 0;
  }

  int spawnWest(int i, int j)
  {
    if (i + 1 < cols && enemyArray[i + 1][j].strength == -100)
    {
      enemyArray[i + 1][j].strength = 1;
      return 1;
    }
    return 0;
  }

  void terrainUpdate(int i, int j, PVector[][] grid)
  {
    enemyArray[i][j].terrainHeight = (int)grid[i][j].z;
  }

  boolean thereIs(int i, int j) {
    if (j - 1 >= 0) {
      if (enemyArray[i][j - 1].terrainHeight == -1 || (enemyArray[i][j].terrainHeight < enemyArray[i][j - 1].terrainHeight &&  enemyArray[i][j].strength < 10 * enemyArray[i][j - 1].terrainHeight) || enemyArray[i][j - 1].strength >= 1) {
        isNorth = true;
      }
    } else if (j - 1 < 0)
    {
      isNorth = true;
    }
    if (j + 1 < rows) {
      if (enemyArray[i][j + 1].terrainHeight == -1 || (enemyArray[i][j].terrainHeight < enemyArray[i][j + 1].terrainHeight &&  enemyArray[i][j].strength < 10 * enemyArray[i][j + 1].terrainHeight) || enemyArray[i][j + 1].strength >= 1) {
        isSouth = true;
      }
    } else if (j + 1 >= rows)
    {
      isSouth = true;
    }
    if (i + 1 < cols) {
      if (enemyArray[i + 1][j].terrainHeight == -1 || (enemyArray[i][j].terrainHeight < enemyArray[i + 1][j].terrainHeight &&  enemyArray[i][j].strength < 10 * enemyArray[i + 1][j].terrainHeight) || enemyArray[i + 1][j].strength >= 1) {
        isEast = true;
      }
    } else if (i + 1 >= cols)
    {
      isEast = true;
    }
    if (i - 1 >= 0) {
      if (enemyArray[i - 1][j].terrainHeight == -1 || (enemyArray[i][j].terrainHeight < enemyArray[i - 1][j].terrainHeight &&  enemyArray[i][j].strength < 10 * enemyArray[i - 1][j].terrainHeight) || enemyArray[i - 1][j].strength >= 1) {
        isWest = true;
      }
    } else if (i - 1 < 0)
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

  void Update()
  {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if (enemyArray[i][j].strength <= 0)
        {
          enemyArray[i][j].strength = -100;
        }
        if (enemyArray[i][j].strength >= 5) {	
          isNorth = false;
          isSouth = false;
          isEast = false;
          isWest = false;
          if (thereIs(i, j)) {
            addToAjesent(i, j);
          } else {
            spawnAjesent(i, j);
          }
        }
      }
    }
  }

  void Draw(int i, int j)
  {

    if (enemyArray[i][j].strength >= 1)
    {
      fill(0, enemyArray[i][j].strength*5, 255, 100);
      rect(i*10, j*10, 10, 10);


      //for at se styrke går FPS fra ca. 13 til ca. 5
      //fill(0);
      //textAlign(CENTER);  
      //textSize(10);
      //text(enemys[i][j].strength, i*10+5, j*10+10);
    }
  }
}
