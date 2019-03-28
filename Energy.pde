//<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
class Energy {

  int totalEnergy;
  int energyUsed;
  int energyGained;
  int[][] energyArera;



  Energy()
  {
    totalEnergy = 0;
    energyGained = 0;
    energyUsed = 0;
    energyArera = new int[cols][rows];
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
      x = (int)energyTower.location.x / scale;
      y = (int)energyTower.location.y / scale;
      for (int i = -5; i <= 5; ++i) {
        for (int j = -5; j <= 5; ++j) {
          if(x + i < 0 || x + i > cols)
          {
            continue;
          }
          if(y + j < 0 || y + j > cols)
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

  void energyUI()
  {
    int x = 100;
    int y = height - 30;
    rectMode(CENTER);
    stroke(0);
    strokeWeight(1.5);


    fill(0, 255, 0);



    rect(x + 126, y - 15, 50, 15);

    textMode(CENTER);
    textSize(17);
    fill(0);
    text("Energy purduktion:", x - 50, y - 10);
    text(energyGained, x + 122, y - 9);

    textMode(CORNER);
    rectMode(CORNER);
  }

  void energyPruduktion()
  {
    //enegytowers connetcet to base & them selvs
  }
}
