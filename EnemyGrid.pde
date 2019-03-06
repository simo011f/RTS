class EnemyGrid { //<>//

  int scale = 10;  

  int cols = width/scale;
  int rows = height/scale;

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

  void addToAjesent(int i, int j)
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

  void spawnAjesent(int i, int j)
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

  void Run(int i, int j)
  {

    if (enemys[i][j].strength >= 1)
    {
      fill(0, 0, 255);
      rect(i*10, j*10, 10, 10);
      fill(0);
      textAlign(CENTER);  
      textSize(10);
      text(enemys[i][j].strength, i*10+5, j*10+10);
    }
  }
}
