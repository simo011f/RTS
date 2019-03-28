class TowerAttackTerrtoriumShot extends Tower {  


  int life;


  int energybuild = 40;
  int energyConsomstion = 3;
  int cooldown;

  boolean shoot = false;

  //boolean conected=false;

  int range = 20;



  void weapon(Enemy[][] enemyArray) {
    if (enemyArray[(int)location.x + (int)detection(enemyArray).x][((int)location.y) + (int)detection(enemyArray).y].updateNR==3) {
      shoot=false;
    } else {
      shoot=true;
    } 
    cooldown++;
    println(shoot);
    if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {
      if (cooldown == 5 && shoot) { 
        stroke(255);
        strokeWeight(2);
        line((detection(enemyArray).x + location.x) * scale + 5, (detection(enemyArray).y + location.y) * scale + 5, location.x * scale + 5, location.y * scale + 5);
        noStroke();

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
    if (!build()) { 
      return ;
    }
    weapon(enemyArray);
    detection(enemyArray);
  }
  void Build() {  

    fill(0, 0, 15+(20*underCunstructoin));
    super.Build();
  }
  void Run() {


    Build();
  }
}
