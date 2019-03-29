class TowerEnergy 
{
  PVector location=new PVector(-100, -100);

  int leif = 2;

  int vis;

  PVector range = new PVector();
  boolean conected=false;
  boolean baseConeced;
  boolean coutedOnBase;
  boolean isDead = false;


  void detection(ArrayList<TowerEnergy> energyTowers) {
    for (TowerEnergy energyTower : energyTowers) {
      if (energyTower == this)
      {
        continue;
      }
      energyTowersConnected(energyTower);
    }
  }

  boolean inRangeEnergyTower(TowerEnergy energyTower) {  
    range = PVector.sub(energyTower.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  void energyTowersConnected(TowerEnergy energyTower) { 


    if (inRangeEnergyTower(energyTower)) {       

      conected=true;
      stroke(255);
      strokeWeight(2);
      //line(energyTower.location.x*scale+5, energyTower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
    }
  }


  boolean inRangeTower(Tower tower) {
    range = PVector.sub(tower.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  boolean inRangeTower(TowerEnergy energyTower) {
    range = PVector.sub(energyTower.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  boolean inRangeTower(TowerBase base) {
    if (base == null)
    {
      return false;
    }
    range = PVector.sub(base.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  void towersConnected(ArrayList<Tower> towers, ArrayList<TowerEnergy> energyTowers, TowerBase base) {

    baseConeced = false;

    connectedToBase(base);

    for (TowerEnergy energyTower : energyTowers)
    {
      energyTowerToEnergyTower(energyTower);
    }

    for (Tower tower : towers) {
      energyTowerToTower(tower);
    }
    strokeWeight(0.5);
  }

  void energyTowerToEnergyTower(TowerEnergy energyTower) {
    if (energyTower == this) {
      return;
    }
    if (inRangeTower(energyTower) && energyTower.baseConeced)
    {
      baseConeced = true;
      stroke(255);
      strokeWeight(2);
      line(energyTower.location.x*scale+5, energyTower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
    }
  }

  void connectedToBase(TowerBase base)
  {
    if (inRangeTower(base))
    {
      baseConeced = true;
      stroke(255);
      strokeWeight(2);
      line(base.location.x*scale+5, base.location.y*scale+5, location.x*scale+5, location.y*scale+5);
    }
  }


  void energyTowerToTower(Tower tower) { 
    tower.conected = false;
    println(tower.conected, frameCount);
    if (baseConeced && inRangeTower(tower)) {
      tower.conected=true; 
      println(tower.conected,frameCount);
      stroke(255);
      strokeWeight(2);
      line(tower.location.x*scale+5, tower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
      return;
    }
  }

  void enemyColition (Enemy[][] enemyArray)
  {
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++) {
        if ((int)location.x + i < 0 || (int)location.x + i >= cols)
        {
          continue;
        }
        if ((int)location.y + j < 0 || (int)location.y + j >= cols)
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


  void arearDraw() {   

    stroke(0);
    if (vis == 100) {
      strokeWeight(1.5);
    } else {  
      noStroke();
    }

    fill(0, 155, 0, vis);
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {


        rect((location.x + i) * scale, (location.y + j) * scale, scale, scale);
      }
    }
  }
  void towerDraw() {
    noFill(); 
    fill(0, 255, 0);     
    stroke(0);
    strokeWeight(1.5);
    rect(location.x*10, location.y*10, 10, 10);
  }



  void Darw() {
    arearDraw();

    towerDraw();
  }

  void run() { 

    Darw();
  }
}
