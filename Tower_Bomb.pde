class TowerBomb extends Tower //<>// //<>//
{  
  int strongest = 0;    
  PVector underBombartment;
  boolean shoot = false;
  //boolean conected=false;

  TowerBomb()
  {
    super();
    underCunstruction = 0;
    cunstructionEnergyConsomstion = 50;
    energyConsomstion = 0;
    leifRegen = 1;
    maxLeif = 25;
    cunstructionTime=120;
    finishCooling = 112;
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
    if (shoot && cooldown >= finishCooling*(3/4)) {
      stroke(255, 255, 255, 100);
      strokeWeight(2);
      line((( underBombartment.x + location.x)) * scale + 5, (( underBombartment.y + location.y)) * scale + 5, location.x * scale + 5, location.y * scale + 5);  
      noStroke();
    }

    if (cooldown >= finishCooling && shoot ) { 
      fill(200, 0, 0, 200);
      strokeWeight(2);
      rect((( underBombartment.x + location.x)) * scale-15, (( underBombartment.y + location.y)) * scale-15, 30, 30);
      if ( underBombartment.x >=-20 &&  underBombartment.x <=20 &&  underBombartment.y >=-20 &&  underBombartment.y <=20) {



        energyConsomstion = 45;






        enemyArray[int(underBombartment.x+location.x)][int(underBombartment.y+location.y)].strength-=50;



        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {    

            enemyArray[int(underBombartment.x+location.x)+i][int(underBombartment.y+location.y)+j].strength-=50;
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
