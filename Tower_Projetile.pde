class TowerAttackTerrtoriumShot extends Tower {  
  int energybuild = 40;

  boolean shoot = false;

  //boolean conected=false;

  TowerAttackTerrtoriumShot()
  {
    super();
    underCunstruction = 0;
    cunstructionEnergyConsomstion = 10;
    energyConsomstion = 10;
    leifRegen = 1;
    maxLeif = 25;
    cunstructionTime=11;
  }


  void weapon(Enemy[][] enemyArray) {
    if (enemyArray[(int)location.x + (int)detection(enemyArray).x][((int)location.y) + (int)detection(enemyArray).y].updateNR==3) {
      shoot=false;
    } else {
      shoot=true;
    } 
    cooldown++;

    if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {
      if (cooldown >= 5 && shoot) { 
        stroke(255);
        strokeWeight(2);
        line((detection(enemyArray).x + location.x) * scale + 5, (detection(enemyArray).y + location.y) * scale + 5, location.x * scale + 5, location.y * scale + 5);
        noStroke();
        strokeWeight(0.5);

        cooldown=0;
        enemyArray[int(detection(enemyArray).x)+(int)location.x][int(detection(enemyArray).y)+(int)location.y].strength-=5;
      }
    }
  }


  PVector detection(Enemy[][] enemyArray) {

    PVector inRange = new PVector(-range, -range);
    PVector closest = new PVector(inRange.x, inRange.y);

    for (int i = -range; i <= range; i++) {
      for (int j = -range; j <= range; j++) {

        if (((int)location.x) + i >= 0 && ((int)location.y) + j >= 0 && ((int)location.x) + i < cols && ((int)location.y) + j < rows) {
          Enemy enemy = enemyArray[((int)location.x) + i][((int)location.y) + j];
          if (enemy.terrainHeight > location.z) {
            continue;
          }
          if (enemy.strength > 0) {   
            inRange = new PVector(i, j);
            if (inRange.mag() < closest.mag()) {
              closest = inRange;
            }
          }
        }
      }
    }
    return closest;
  }

  void attack(Enemy[][] enemyArray) {
    if (conected) {
      super.attack(enemyArray);
      if (!isBuild()) { 
        return ;
      }
      weapon(enemyArray);
      detection(enemyArray);
    }
  }
  void Build() {  
    Draw();
    super.Build();
  }
  void Draw()
  {
    fill(0, 0, 15+(20*underCunstruction));    
    super.Draw();
  }
}
