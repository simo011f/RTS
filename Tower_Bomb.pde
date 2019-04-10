class TowerAttackTerrtoriumBomb extends Tower  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
{  
  int energybuild = 40;
  int cooldown;
  int range = 20;
  int strongest = 0;    
  PVector underBombartment;
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
    cunstructionTime=0;
    finishCooling = 60;
    underBombartment=new PVector(-range, -range);
  }


  void weapon(Enemy[][] enemyArray) {   

    if (cooldown==0) {
      underBombartment=detection(enemyArray);
    }

    cooldown++;  


    energyConsomstion = 0;
    if (enemyArray[(int)location.x + (int) detection(enemyArray).x][((int)location.y) + (int) detection(enemyArray).y].updateNR==3) {
      shoot=false;
    } else {
      shoot=true;
    } 
    if (game.menu.overRide) {
      finishCooling=1;
    }

    //println( enemyArray[int(underBombartment.x+location.x)][int(underBombartment.y+location.y)].strength);

    if (cooldown >= finishCooling && shoot ) {
      if ( underBombartment.x >=-20 &&  underBombartment.x <=20 &&  underBombartment.y >=-20 &&  underBombartment.y <=20) {



        energyConsomstion = 45;
        stroke(255);
        strokeWeight(2);
        line((( underBombartment.x + location.x)) * scale + 5, (( underBombartment.y + location.y)) * scale + 5, location.x * scale + 5, location.y * scale + 5);
        strokeWeight(0.5);




        enemyArray[int(underBombartment.x+location.x)][int(underBombartment.y+location.y)].strength-=20;


        noStroke();
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {    
     
            enemyArray[int(underBombartment.x+location.x)+i][int(underBombartment.y+location.y)+j].strength-=20;
          }
        }  

        cooldown = 0;
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

    if (conected) {
      super.attack(enemyArray);
      if (!isBuild()) { 
        return ;
      }
      weapon(enemyArray);
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
