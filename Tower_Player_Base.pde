class TowerBase 
{
  PVector location=new PVector(-100, -100);
  int leif = 2;
  int maxLeif = 2;
  int leifRegen = 0;
  boolean isDead = false;
  ArrayList<PVector> energyTowersConectedIndex = new ArrayList<PVector>();

  TowerBase() {
    leif = 50;
    maxLeif = 250;
    leifRegen = 5;
  }

  void regen() { 
    leif += leifRegen;
    if (leif >= maxLeif) {
      leif = maxLeif;
    }
  }

  void energyTowersConected(ArrayList<TowerEnergy> energyTowers)
  {
    energyTowersConectedIndex.clear();
    for (int i = energyTowers.size() - 1; i >= 0; i--)
    {
      TowerEnergy energyTower = energyTowers.get(i);
      energyTowers.get(i).anchoredToBase = 4;
      PVector range = PVector.sub(energyTower.location, location);
      if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
        energyTowers.get(i).conected = true;
        energyTowersConectedIndex.add(new PVector(i, 0));
      }
    }

    while (energyTowersConectedIndex.size() > 0)
    {   

      for (int i = energyTowersConectedIndex.size() - 1; i >= 0; i--)

      {
        int j = (int)energyTowersConectedIndex.get(i).x;
        TowerEnergy thisEnergyTower = energyTowers.get(j); 

        for (int k = energyTowers.size() - 1; k >= 0; k--)
        {
          TowerEnergy energyTower = energyTowers.get(k);
          if (thisEnergyTower.location == energyTower.location || energyTower.conected) {
            continue;
          }
          energyTowers.get(k).anchoredToBase = 4;
          PVector range = PVector.sub(energyTower.location, thisEnergyTower.location);
          if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
            energyTowersConectedIndex.add(new PVector(k, 0));
            energyTowers.get(k).anchoredToBase = 12;
            energyTowers.get(k).conected = true;
          }
        }
      }
      energyTowersConectedIndex.remove(0);
    }
  }

  void contactWithEnemy (Enemy[][] enemyArray)
  {
    for (int i = -2; i <= 2; i++)
    {
      for (int j = -2; j <= 2; j++) {
        if ((int)location.x + i < 0 || (int)location.x + i > cols)
        {
          continue;
        }
        if ((int)location.y + j < 0 || (int)location.y + j > cols)
        {
          continue;
        }
        if (enemyArray[(int)location.x + i][(int)location.y + j].updateNR != 3)
        {
          leif--;
        }
      }
    }
    if (leif <= 0)
    {
      isDead = true;
    }
  }

  void Draw() {   
    noFill();
    noStroke();
    image(baseImg,(location.x-2) * scale,(location.y-2) * scale);
  }
  
  void run() { 
    regen();
    Draw();
  }
}
