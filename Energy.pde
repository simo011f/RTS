//<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
class Energy {

  int totalEnergy;
  int energyUsed;
  int energyGained;
  int scale = 10;
  int cols = width / scale;
  int rows = (height / scale) - 6;
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
      x = (int)energyTower.location.x;
      y = (int)energyTower.location.y;
    }
  }

  void energyPruduktion()
  {
    //enegytowers connetcet to base & them selvs
  }
}
