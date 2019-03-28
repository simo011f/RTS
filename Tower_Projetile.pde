class TowerAttackTerrtoriumShot extends Tower {  


  int life;


  int energybuild = 40;
  int energyConsomstion = 3;
  int cooldown;

  //boolean conected=false;

  int range = 20;



  void weapon(Enemy[][] enemyArray) {
    cooldown++;
    if (cooldown == 5) {
      stroke(255);
      strokeWeight(2);
      line((detection(enemyArray).x * 10 + location.x) + 5, (detection(enemyArray).y * 10 + location.y) + 5, location.x + 5, location.y + 5);
      if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {
        cooldown=0;
        enemyArray[int(detection(enemyArray).x)+(int)location.x/10][int(detection(enemyArray).y)+(int)location.y/10].strength-=5;
      }
    }
  }

  PVector detection(Enemy[][] enemyArray) {

    PVector inRange = new PVector(-range, -range);
    PVector closest = new PVector(inRange.x, inRange.y);

    for (int i = -range; i <= range; i++) {
      for (int j = -range; j <= range; j++) {
        if (((int)location.x)/10 + i >= 0 && ((int)location.y)/10 + j >= 0 && ((int)location.x)/10 + i < width/10 && ((int)location.y)/10 + j < (height-60)/10) {
          Enemy enemy = enemyArray[((int)location.x)/10 + i][((int)location.y)/10 + j];

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
    super.attack(enemyArray);
    if (!ready()) { 
      return ;
    }
    weapon(enemyArray);
    detection(enemyArray);
  }
  void Build() {  

    fill(0, 0, 15+(20*build));
    super.Build();
  }
  void Run() {


    Build();
  }
}
