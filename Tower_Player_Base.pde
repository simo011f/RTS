class TowerBase 
{
  PVector location=new PVector(-100, -100);

  int life;

  boolean conected=false;

  ArrayList<PVector> energyTowersConectedIndex = new ArrayList<PVector>();

  void weapon() {
  }

  void detection() {
  }

  void energyTowersConected(ArrayList<TowerEnergy> energyTowers)
  {

    for (int i = energyTowers.size() - 1; i >= 0; i--)
    {
      TowerEnergy energyTower = energyTowers.get(i);
      energyTowers.get(i).anchoredToBase = 4;
      PVector range = PVector.sub(energyTower.location, location);
      if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
        energyTowersConectedIndex.add(new PVector(i, 0));
      }
    }
    while (energyTowersConectedIndex.size() > 0)
    {
      for (int i = energyTowersConectedIndex.size() - 1; i >= 0; i--)
      {
        int j = (int)energyTowersConectedIndex.get(i).x;
        TowerEnergy thisEnergyTower = energyTowers.get(j); 

        for (int k = energyTowers.size() - 1; i >= 0; i--)
        {
          TowerEnergy energyTower = energyTowers.get(i);
          energyTowers.get(k).anchoredToBase = 4;
          if (thisEnergyTower == energyTower) {
            continue;
          }
          PVector range = PVector.sub(energyTower.location, thisEnergyTower.location);
          if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
            energyTowersConectedIndex.add(new PVector(i, 0));
            energyTowers.get(k).anchoredToBase = 12;
          }
        }
      }
      energyTowersConectedIndex.remove(0);
    }
  }

  void highLight() {   

    fill(0, 255, 255);
    stroke(0);
    strokeWeight(1.5);

    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        rect((location.x+i)*scale, (location.y+j)*scale, 10, 10);
      }
    }
  }
  void run() { 
    highLight();
    weapon();
    detection();
  }
}
