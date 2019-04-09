class TowerAttackTerrtoriumBomb extends Tower  //<>// //<>// //<>//
{  
  int energybuild = 40;
  int cooldown;
  int range = 20;
  int strongest = 0;    

  boolean shoot = false;
  //boolean conected=false;

  TowerAttackTerrtoriumBomb()
  {
    super();
    underCunstruction = 0;
    cunstructionEnergyConsomstion = 50;
    energyConsomstion = 0;
    leifRegen = 1;
    maxLeif = 25;
    cunstructionTime=120;
    finishCooling = 90;
  }


  void weapon(Enemy[][] enemyArray) {
    energyConsomstion = 0;
    if (enemyArray[(int)location.x + (int)detection(enemyArray).x][((int)location.y) + (int)detection(enemyArray).y].updateNR==3) {
      shoot=false;
    } else {
      shoot=true;
    } 
    if (game.menu.overRide) {
      finishCooling=1;
    }

    if (cooldown >= finishCooling && shoot) {
      if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {


        cooldown = 0;
        energyConsomstion = 45;
        stroke(255);
        strokeWeight(2);
        line(((detection(enemyArray).x + location.x)) * scale + 5, ((detection(enemyArray).y + location.y)) * scale + 5, location.x * scale + 5, location.y * scale + 5);
        strokeWeight(0.5);

        noStroke();
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {   
            enemyArray[int(detection(enemyArray).x+(int)location.x )+i][int(detection(enemyArray).y+(int)location.y)+j ].strength-=20;
          }
        }
      }
    }
  }

  PVector detection(Enemy[][] enemyArray) {

    PVector inRange = new PVector(-range, -range);
    strongest = 0;


    for (int i = -range; i <= range; i++) {
      for (int j = -range; j <= range; j++) {
        if (((int)location.x) + i >= 0 && ((int)location.y) + j >= 0 && ((int)location.x) + i < cols && ((int)location.y) + j < rows) {
          Enemy enemy = enemyArray[((int)location.x) + i][((int)location.y) + j];
          if (enemy.strength > 0) {
            if (strongest < enemy.strength) {
              strongest = enemy.strength;
              inRange = new PVector(i, j);
            }
          }
        }
      }
    }
    return inRange;
  }

  void attack(Enemy[][] enemyArray) {    
    println(isBuild (), underCunstruction);
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
    fill(15+(20*underCunstruction), 0, 0);
    super.Draw();
  }
}
