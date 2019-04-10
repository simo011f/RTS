class EnemyGrid implements Visualize { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

  PVector[] directions = new PVector[4];

  boolean spreadNorth = false;
  boolean spreadSouth = false;
  boolean spreadEast = false;
  boolean spreadWest = false;

  Enemy[][] enemys = new Enemy[cols][rows];
  int[][] updated = new int[cols][rows];
  ArrayList<PVector> thisCluster = new ArrayList<PVector>();
  ArrayList<PVector> thisClusterCheking = new ArrayList<PVector>();

  int damping = -1; 



  EnemyGrid()
  {
    directions[0] = new PVector(1, 0);
    directions[1] = new PVector(-1, 0);
    directions[2] = new PVector(0, 1);
    directions[3] = new PVector(0, -1);
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
    directions[0] = new PVector(1, 0);
    directions[1] = new PVector(-1, 0);
    directions[2] = new PVector(0, 1);
    directions[3] = new PVector(0, -1);
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

  void reLoad(EnemyGrid EG)
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

  void updateEnemysStrength(int i, int j)
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

  void spreadBooleans(int i, int j)
  {
    if (i - 1 >= 0)
    {
      spreadWest = true;
      if (i - 1 == 0 && enemys[i][j].strength <= enemys[i - 1][j].strength || enemys[i][j].strength + 10 * enemys[i][j].terrainHeight + damping < enemys[i - 1][j].strength + 10 * enemys[i - 1][j].terrainHeight || enemys[i - 1][j].terrainHeight == -1) {
        spreadWest = false;
      }
      if (updated[i - 1][j] == 2)
      {
        spreadWest = false;
      }
    }

    if (i + 1 < cols) 
    {
      spreadEast = true;
      if (i + 1 == cols - 1 && enemys[i][j].strength <= enemys[i + 1][j].strength || enemys[i][j].strength + 10 * enemys[i][j].terrainHeight + damping < enemys[i + 1][j].strength + 10 * enemys[i + 1][j].terrainHeight || enemys[i + 1][j].terrainHeight == -1) {
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
      if (j - 1 == 0 && enemys[i][j].strength <= enemys[i][j - 1].strength || enemys[i][j].strength + 10 * enemys[i][j].terrainHeight + damping < enemys[i][j - 1].strength + 10 * enemys[i][j - 1].terrainHeight || enemys[i][j - 1].terrainHeight == -1) {
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
      if (j + 1 == rows - 1 && enemys[i][j].strength <= enemys[i][j + 1].strength || enemys[i][j].strength + 10 * enemys[i][j].terrainHeight + damping < enemys[i][j + 1].strength + 10 * enemys[i][j + 1].terrainHeight || enemys[i][j + 1].terrainHeight == -1) {
        spreadSouth = false;
      }
      if (updated[i][j + 1] == 2)
      {
        spreadSouth = false;
      }
    }
  } 

  void findCenter(int i, int j)
  {
    //find centeret i hvert kloster
    int x = i;
    int y = j;
    int checkingX = 0;
    int checkingY = 0;
    thisCluster.clear();
    thisClusterCheking.clear();
    updated[x][y] = 1;
    thisClusterCheking.add(new PVector(x, y));

    while (thisClusterCheking.size() > 0)
    {

      for (PVector direction : directions) 
      {
        checkingX = x + (int)direction.x;
        checkingY = y + (int)direction.y;
        if (checkingX < 0 || checkingX >= cols) {
          continue;
        }
        if (checkingY < 0 || checkingY >= rows) {
          continue;
        }
        if (updated[checkingX][checkingY] == 0) {
          updated[checkingX][checkingY] = 1;
          thisClusterCheking.add(new PVector(checkingX, checkingY));
        }
      }
      thisCluster.add(thisClusterCheking.get(0));
      thisClusterCheking.remove(0);
    }

    if (thisCluster.size() == 0) {
      return;
    }

    while (thisCluster.size() > 0)
    { 
      PVector thisStrongest = strongest(thisCluster);
      x = (int)thisStrongest.x;
      y = (int)thisStrongest.y;
      updateEnemysStrength(x, y);
    }
    //while (strongest(x, y) != null && x != strongest(x, y).x && y != strongest(x, y).y) 
    //{
    //  x = (int)strongest(x, y).x; //<>//
    //  y = (int)strongest(x, y).y;
    //}

    //thisCluster.add(new PVector(x, y));
    //updated[x][y] = 1;

    //while (thisCluster.size() > 0) {
    //  for (int a = -1; a <= -1; a++) {
    //    for (int b = -1; b <= -1; b++) {
    //      checkingX = x + a;
    //      checkingY = y + b;
    //      if (checkingX < 0 || checkingX >= cols) {
    //        continue;
    //      }

    //      if (checkingY < 0 || checkingY >= rows) {
    //        continue;
    //      }

    //      if (updated[checkingX][checkingY] == 0)
    //      {
    //        updated[checkingX][checkingY] = 1;
    //        thisCluster.add(new PVector(checkingX, checkingY));
    //      }
    //    }
    //  }
    //  updateCluster(thisCluster);
    //  x = checkingX;
    //  y = checkingY;
    //}
    //return;
  }

  PVector strongest(ArrayList<PVector> cluster)
  {
    PVector strongest = new PVector();
    int strongestStrength = 0;
    for (PVector clusterPositions : cluster)
    {
      if (updated[(int)clusterPositions.x][(int)clusterPositions.y] == 1) {
        if (enemys[(int)clusterPositions.x][(int)clusterPositions.y].strength > strongestStrength)
        {
          strongestStrength = enemys[(int)clusterPositions.x][(int)clusterPositions.y].strength;
          strongest.set(clusterPositions);
        }
      }
    }
    cluster.remove(strongest);
    return strongest;
  }

  void terrainUpdate(int i, int j, PVector[][] grid)
  {
    enemys[i][j].terrainHeight = (int)grid[i][j].z;
  }

  void terrainUpdate(PVector[][] grid)
  {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        enemys[i][j].terrainHeight = (int)grid[i][j].z;
        if (enemys[i][j].terrainHeight == -1) {
          enemys[i][j].strength = 0;
        }
      }
    }
  }

  void Update()
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


  void visualize()
  {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if (enemys[i][j].strength >= 1)
        {
          noStroke();
          strokeWeight(0.5);
          fill(0, enemys[i][j].strength*2, 255, 100);
          rect(i*10, j*10, 10, 10);
          //for at se styrke går FPS fra ca. 13 til ca. 5
          //fill(0);
          //textAlign(CENTER);  
          //textSize(10);
          //text(enemys[i][j].strength, i*10+5, j*10+10);
        }
      }
    }
  }
}
