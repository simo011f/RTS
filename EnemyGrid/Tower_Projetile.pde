<<<<<<< HEAD
class TowerAttackTerrtoriumShot extends Tower {  
=======
class TowerAttackTerrtoriumShot {  
  PVector location=new PVector(-100, -100);
>>>>>>> parent of 33733a5... david har gjordt at player er blver mindre og tower har en over klasse


  int life;


  int energybuild = 40;
  int energyConsomstion = 3;


  //boolean conected=false;

  int range = 20;

  void weapon(Enemy[][] enemyArray) {


    if (detection(enemyArray).x >=-20 && detection(enemyArray).x <=20 && detection(enemyArray).y >=-20 && detection(enemyArray).y <=20) {

      enemyArray[int(detection(enemyArray).x)+(int)location.x/10][int(detection(enemyArray).y)+(int)location.y/10].strength-=5;
      println(enemyArray[int(detection(enemyArray).x)+(int)location.x/10][int(detection(enemyArray).y)+(int)location.y/10].strength+"hej", detection(enemyArray));
    }
  }

  PVector detection(Enemy[][] enemyArray) {

    PVector inRange = new PVector(width, height);
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
        //println(closest, inRange);
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
<<<<<<< HEAD
  void Build() {  
=======

  void build() { 
>>>>>>> parent of 33733a5... david har gjordt at player er blver mindre og tower har en over klasse

    fill(0, 0, 15+(20*build));
    stroke(0);
    strokeWeight(1.5);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x*10+i*10, location.y*10+j*10, 10, 10);
      }
    }

    if (conected == false) {
      return;
    }
    if (game.energy.energyTotal < 0)
    {
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
  void Run() {


    Build();
  }
}
