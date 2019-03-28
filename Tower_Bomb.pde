class TowerAttackTerrtoriumBomb extends Tower  //<>//
{  

  int life;


  int energybuild = 40;
  int energyConsomstion = 9;
  int strongest = 0;    
  int cooldown;

  //boolean conected=false;

  int range = 20;

  void weapon(Enemy[][] enemyArray) {

    cooldown++;
    if (cooldown == 15) {

      if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {
        cooldown = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {   
            enemyArray[int(detection(enemyArray).x+i)+(int)location.x ][int(detection(enemyArray).y+j)+(int)location.y ].strength-=5;
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
    super.attack(enemyArray);
    if (!build()) { 
      return ;
    }
    weapon(enemyArray);
    detection(enemyArray);
  }

  void Build() {   
    fill(15+(20*underCunstructoin), 0, 0);
    super.Build();
  }  
  void Run() {


    Build();
  }
}
