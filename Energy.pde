//<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
class Energy {

  int totalEnergy;
  int energyUsed;
  int energyGained;
  int[][] energyArera;
  int[][] terrain;



  Energy()
  {
    totalEnergy = 0;
    energyGained = 0;
    energyUsed = 0;
    energyArera = new int[cols][rows];
    terrain = new int[cols][rows];
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        energyArera[i][j] = 0;
      }
    }
  }

  void energyPruduktionArera(ArrayList<TowerEnergy> energyTowers)
  {
    int x = 0;
    int y = 0;
    for (TowerEnergy energyTower : energyTowers) {
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
          if(terrain[x][y] != terrain[x + i][y + j])
          {
            continue;
          }
          energyArera[x + i][y + j] = 1;
        }
      }
    }
    updateEnergyGained();
  }

  void updateEnergyGained()
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

  void updateTerrain(PVector[][] newTerrain)
  {
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        terrain[i][j] = (int)newTerrain[i][j].z;
      }
    }
  }

  void energyUI()
  {
    int x = 100;
    int y = height - 30;
    rectMode(CENTER);
    stroke(0);
    strokeWeight(1.5);


    fill(0, 255, 0);



    rect(x + 100, y - 15, 50, 15);

    textAlign(CENTER);
    textSize(17);
    fill(0);
    text("Energy purduktion:", x, y - 10);
    text(energyGained, x + 100, y - 9);

    textAlign(CORNER);
    rectMode(CORNER);
  }

  void energyPruduktion()
  {
    //enegytowers connetcet to base & them selvs
  }
}
