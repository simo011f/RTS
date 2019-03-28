class TowerEnergy 
{
  PVector location=new PVector(-100, -100);
  
  int life;

  int vis;

  PVector range = new PVector();
  boolean conected=false;
  boolean baseConeced;
  boolean coutedOnBase;

<<<<<<< HEAD



  void detection() {
=======
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
>>>>>>> Tower-Energy-to-Tower
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
<<<<<<< HEAD
=======

>>>>>>> Tower-Energy-to-Tower

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

<<<<<<< HEAD
  void areaDraw() {   

    stroke(0);
    if (vis == 255) {
      strokeWeight(1);
=======

  void arearDraw() {   

    stroke(0);
    if (vis == 100) {
      strokeWeight(1.5);
>>>>>>> Tower-Energy-to-Tower
    } else {  
      noStroke();
    }

    fill(0, 155, 0, vis);
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
<<<<<<< HEAD
        if(0==0);
        rect((location.x + i) * scale, (location.y + j) * scale, scale, scale);
      }
    }
  }

  void towerDraw()
  {
=======
        rect(location.x*10+i*10, location.y*10+j*10, 10, 10);
      }
    }
  }
  void towerDraw() {
    noFill(); 
>>>>>>> Tower-Energy-to-Tower
    fill(0, 255, 0);     
    stroke(0);
    strokeWeight(1.5);
    rect(location.x*10, location.y*10, 10, 10);
  }

<<<<<<< HEAD
  void Draw()
  {
    areaDraw();
    noFill();
=======
  void Darw() {
    arearDraw();
>>>>>>> Tower-Energy-to-Tower
    towerDraw();
  }

  void run() { 
<<<<<<< HEAD
    Draw();
    detection();
=======
    Darw();
>>>>>>> Tower-Energy-to-Tower
  }
}
