class TowerAttackTerrtoriumBomb extends Tower
{  
  PVector location=new PVector(-100, -100);

  int life;

  int t=-2;

  int build;
  int energybuild = 40;
  int energyConsomstion = 9;

  boolean conected=false;

  int range = 20;



  PVector detection(Enemy[][] enemyArray) {
    PVector inRange = new PVector(width, height);
    PVector closest = new PVector(-20, -20);

    for (int i = -range; i <= range; i++) {
      for (int j = -range; j <= range; j++) {
        if (((int)location.x) + i >= 0 && ((int)location.y) + j >= 0 && ((int)location.x) + i < width/10 && ((int)location.y) + j < (height-60)/10) {
          Enemy enemy = enemyArray[((int)location.x) + i][((int)location.y) + j];

          if (enemy.strength > 0) {
            inRange = new PVector(i, j);
            if (inRange.mag() < closest.mag()) {
              closest = inRange;
            }
          }
        }
      }
    }
    println(closest, inRange);
    return closest;
  }

  void attack(Enemy[][] enemyArray) {
    if (!ready()) { 
      return ;
    }
    weapon(enemyArray);
    detection(enemyArray);
  }

  void Build() {   
    fill(15+(20*build), 0, 0);
    super.Build();
  }
}
