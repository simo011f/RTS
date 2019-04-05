class TowerAttackTerrtoriumShot extends Tower {  
  int energybuild = 40;

  PVector EXenemyDir;

  int tZ;
  int t=0;
  boolean shoot = false;
  boolean terrainInPath = false;
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

    if (terrainInPath) { 
      shoot=false;
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


  void terrainInWay(PVector[][] terrain, Enemy[][] enemyArray) {  
    //super.terrainInWay(terrain, enemyArray) ;



    if (isBuild ()) {
      //hvis David vil have Expermental verion så sig til
      float chec = 0;
      PVector enemyLocation = PVector.add(detection(enemyArray), location);
      PVector enemyDir = PVector.sub(enemyLocation, location);
      while (chec < enemyDir.mag()  ) {
        float X = location.x + chec*(enemyDir.x/enemyDir.mag()); 
        float Y = location.y + chec*(enemyDir.y/enemyDir.mag()); 
        float Z = location.z;
        //line(terrain[int(X)][int(Y)].x*10+5, terrain[int(X)][int(Y)].y*10+5, location.x*10+5, location.y *10+5);
        if (terrain[int(X)][int(Y)].z>Z) {
          rect(terrain[int(X)][int(Y)].x*10, terrain[int(X)][int(Y)].y*10, scale, scale);      
          terrainInPath=true;
        }
        if (terrain[int(X)][int(Y)].z<=Z) {
          terrainInPath=false;
        }
        chec+=1;
      }
      if (terrainInPath) {  

        fill(255, 0, 0);
        rect(enemyLocation.x * scale + 5, enemyLocation.y* scale + 5, scale, scale);
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
