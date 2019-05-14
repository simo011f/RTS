class TowerEnergy   //<>//
{
  PVector location=new PVector(-100, -100);
  PVector naborsLocation = new PVector();
  int life = 2;
  int anchoredToBase;
  int vis;
  PVector range = new PVector();
  boolean conected;
  boolean isDead = false;

  TowerEnergy() {
    conected=false;
    anchoredToBase = 4;
  }

  boolean inRangeEnergyTower(TowerEnergy energyTower) {  
    if (naborsLocation.mag()<location.mag()) { 
      naborsLocation.set(energyTower.location);
    } else { 
      naborsLocation.set(location);
    }

    if (naborsLocation.mag()>energyTower.location.mag()) {
      naborsLocation.set(location);
    }
    range = PVector.sub(energyTower.location, location);

    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }



  boolean inRangeTower(Tower tower) {  
    range = PVector.sub(tower.location, naborsLocation);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  boolean inRangeAETower(TowerAttackEmitters attackEmitterTower) {  
    range = PVector.sub(attackEmitterTower.location, naborsLocation);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  boolean inRangeBase(TowerBase base) { 
    if (base == null) {
      return false;
    } 
    range = PVector.sub(base.location, location);
    if (range.x <= 7 && range.x >= -7 && range.y <= 7 && range.y >= -7) {
      return true;
    } else {
      return false;
    }
  }

  void towersConnected(ArrayList<Tower> towers, ArrayList<TowerEnergy> energyTowers, TowerBase base, ArrayList<TowerAttackEmitters> towerAttackETowers) {
    connectedToBase(base);
    for (TowerEnergy energyTower : energyTowers) { 
      energyTowersConnected(energyTower);
    }
    for (TowerAttackEmitters attackEmitterTower : towerAttackETowers) { 
      AttackEmitterConnected(attackEmitterTower);
    }
    for (Tower tower : towers) { 
      if (tower.conected)
      {
        continue;
      }
      energyTowerToTower(tower);
    }
    strokeWeight(0.5);
  }

  void connectedToBase(TowerBase base) {
    if (inRangeBase(base)) {
      stroke(255);
      strokeWeight(2);
      line(base.location.x*scale+5, base.location.y*scale+5, location.x*scale+5, location.y*scale+5);
    }
  }

  void AttackEmitterConnected(TowerAttackEmitters attackEmitterTower) { 
    attackEmitterTower.conected = false;
    if (conected && inRangeAETower(attackEmitterTower)) {
      attackEmitterTower.conected=true; 
      stroke(255);
      strokeWeight(2);
      line(attackEmitterTower.location.x*scale+5, attackEmitterTower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
      return;
    }
  }

  void energyTowersConnected(TowerEnergy energyTower) {    
    if (inRangeEnergyTower(energyTower)) { 
      if (energyTower.conected) 
      {
        stroke(255);
        strokeWeight(2);
        line(energyTower.location.x*scale+5, energyTower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
        conected = true;
      }
    }   

    if (inRangeEnergyTower(energyTower)&&!conected) {
      stroke(15+(20*anchoredToBase));
      strokeWeight(2);
      line(energyTower.location.x*scale+5, energyTower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
    }
  }

  void energyTowerToTower(Tower tower) { 
    tower.conected = false;
    if (inRangeTower(tower)) {
      stroke(15+(20*anchoredToBase));
      strokeWeight(2);
      line(tower.location.x*scale+5, tower.location.y*scale+5, location.x*scale+5, location.y*scale+5);
      if (conected) {  
        tower.conected=true;
      }
      return;
    }
  }

  void enemyColition (Enemy[][] enemyArray) {
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if ((int)location.x + i < 0 || (int)location.x + i >= cols) {
          continue;
        }
        if ((int)location.y + j < 0 || (int)location.y + j >= cols) {
          continue;
        }
        if (enemyArray[(int)location.x + i][(int)location.y + j].updateNR != 3) {
          life--;
        }
      }
    }
    if (life <= 0) {
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
