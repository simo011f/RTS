class Energy { //<>//
  int totalEnergy;
  int energyUsed;
  int energyGained;
  int maxEnergy;
  int[][] energyArera;
  int[][] terrain;
  boolean transmit = true;

  Energy()
  {
    totalEnergy = 0;
    energyGained = 0;
    energyUsed = 0;
    maxEnergy = 100;
    energyArera = new int[cols][rows];
    terrain = new int[cols][rows];
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        energyArera[i][j] = 0;
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

  void energyPruduktion(ArrayList<TowerEnergy> energyTowers)
  {
    int x = 0;
    int y = 0;
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        energyArera[i][j] = 0;
      }
    }
    for (TowerEnergy energyTower : energyTowers) {

      if (!energyTower.conected)
      {
        continue;
      }
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
          if (terrain[x][y] != terrain[x + i][y + j] || terrain[x + i][y + j] == -1)
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

  void useEnergy(ArrayList<Tower> towers)
  {
    if (!transmit)
    {
      return;
    }
    energyUsed = 0;
    for (Tower tower : towers) {
      if (!tower.conected)
      {
        continue;
      }
      if (tower.isBuild())
      {
        energyUsed += tower.energyConsomstion;
      } else 
      {
        energyUsed += tower.cunstructionEnergyConsomstion;
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

    fill(255, 0, 0);
    rect(x + 100, y + 10, 50, 15);

    fill(0, 0, 255);
    rect(width - x - 225, y, 30, 30);


    textAlign(CENTER);
    textSize(17);
    fill(0);
    text("Energy purduktion:", x, y - 10);
    text(energyGained, x + 100, y - 9);

    text("Energy consumption:", x - 10, y + 15);
    text(energyUsed, x + 100, y + 16);

    text("Energy:", width - x - 275, y + 5);
    text(energyGained-energyUsed, width - x - 225, y + 5);

    text("Energy reseve: " + totalEnergy, width - x * 2, y + 5);

    textAlign(CORNER);
    rectMode(CORNER);
  }

  void Update()
  {
    if (totalEnergy <= 0)
    {
      transmit = false;
      totalEnergy += energyGained + 1;
    } else {
      transmit = true;
      totalEnergy += energyGained - energyUsed;
    }
    if (totalEnergy > maxEnergy)
    {
      totalEnergy = maxEnergy;
    }
  }
}
