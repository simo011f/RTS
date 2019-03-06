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



  boolean thereIs(int i, int j) {
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

  void fieldDraw() {   
    //this draws the stuff
    //Maybe an array of variables would have been better
    layerOneDraw();
  } 
  
  void layerOneDraw()
  {
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {

        int x = i*scale;
        int y = j*scale;
        fill(255, 0);
        stroke(0);
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }
  }


  void Draw()
  {
    background(100);
    fieldDraw();
  }



  void Update()
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

  void enemyRun()
  {
    emitter.Update(enemys);

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        enemys.Run(i, j);
      }
    }
    emitter.Draw();
  }

  void Run()
  {
    Update();
    Draw();
  }
}
