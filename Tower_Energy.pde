class TowerEnergy 
{
  int life;

  int vis;
  PVector range = new PVector();
  boolean conected=false;
  boolean baseConeced;
  boolean coutedOnBase;




  void detection() {
  }

  boolean inRange(Tower tower) {
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
    if (conected && inRange(tower)) {
      tower.conected=true;
      line(tower.location.x*10, tower.location.y*10, location.x, location.y);
    }
  }

  void areaDraw() {   

    stroke(0);
    if (vis == 255) {
      strokeWeight(1);
    } else {  
      noStroke();
    }

    fill(0, 155, 0, vis);
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        if()
        rect((location.x + i) * scale, (location.y + j) * scale, scale, scale);
      }
    }
  }

  void towerDraw()
  {
    fill(0, 255, 0);     
    stroke(0);
    strokeWeight(1.5);
    rect(location.x*10, location.y*10, 10, 10);
  }

  void Draw()
  {
    areaDraw();
    noFill();
    towerDraw();
  }

  void run() { 
    Draw();
    detection();
  }
}
