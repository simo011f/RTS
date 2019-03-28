class TowerEnergy 
{
  PVector location=new PVector(-100, -100);

  int life;

  int vis;

  PVector range = new PVector();
  boolean conected=false;
  boolean baseConeced;
  boolean coutedOnBase;

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

  void towersConnected(ArrayList<Tower> towers) {


    for (Tower tower : towers) {

      energyTowerToTower(tower);
      linkBaseToTower(tower);
    }
  }

  void linkBaseToTower(Tower tower) {
    if (tower.conected && baseConeced) {
    }
  }


  void energyTowerToTower(Tower tower) { 
    if (inRangeTower(tower)) {
      tower.conected=true; 

      stroke(255);
      strokeWeight(2);
      line(tower.location.x*scale+5, tower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
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
        rect(location.x*10+i*10, location.y*10+j*10, 10, 10);
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
