class TowerAttackTerrtoriumBomb 
{  
  PVector location=new PVector(-100, -100);

  int life;

  int t=-2;

  int build;
  int energybuild = 40;
  int energyConsomstion = 9;

  boolean conected=false;

  int range = 20;

  void weapon(Enemy[][] enemyArray) {
    println(detection(enemyArray));
    if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          enemyArray[int(detection(enemyArray).x+i)+(int)location.x][int(detection(enemyArray).y+j)+(int)location.y].strength-=5;
        }
      }
    }
  }

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

  void build() {   

    if (!conected && game.energy.energyTotal <= 0) {
      return;
    }
    if (t==-3) {
      game.energy.energyUsed = game.energy.energyUsed-energybuild;
      t=11;
    }

    if (t<=11&&t>=-1) { 
      t--;
    }


    if (t<=-1) {
      build++;
      t=11;
    }
    if (build==11) {
      build=12;
      t=13;
    }
    if (t==13) { 
      game.energy.energyUsed = game.energy.energyUsed+energybuild-energyConsomstion; 

      t=14;
    }

    fill(15+(20*build), 0, 0);
    stroke(0);
    strokeWeight(1.5);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x*10+i*10, location.y*10+j*10, 10, 10);
      }
    }
  }
  boolean ready() { 
    if (t==14) {
      return true;
    } else {
      return false;
    }
  }

  void run() { 
    build();
  }
}
