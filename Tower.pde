class Tower {           //<>// //<>//
  PVector location;
  PVector newLocation = new PVector();
  PVector velocity = new PVector();
  int life = 2;
  int maxLife = 2;
  int lifeRegen = 0;
  int cooldown;
  int finishCooling;
  //build timer
  int timer=-2;
  int underCunstruction;
  int cunstructionTime;
  int cunstructionEnergyConsomstion;
  int energyConsomstion;
  boolean conected = false;
  boolean isDead = false;
  boolean coliding = false;


  int range = 15;


  Tower()
  {
    location = new PVector(-10, -10);
  }

  void weapon(Enemy[][] enemyArray) {
  }

  PVector detection(Enemy[][] enemyArray) {
    PVector closest = new PVector(-20, -20);
    return closest;
  }

  void attack(Enemy[][] enemyArray) {
    if (!isBuild()) { 
      return ;
    }

    life += lifeRegen;  
    if (life < maxLife) {
      energyConsomstion=5;
    }
    if (life >= maxLife) {
      life = maxLife; 
      underCunstruction=12;
    }  

    if (conected) {
      weapon(enemyArray);
    }
  }

  void enemyColition (Enemy[][] enemyArray)
  {
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++) {
        if ((int)location.x + i < 0 || (int)location.x + i > cols)
        {
          continue;
        }

        if ((int)location.y + j < 0 || (int)location.y + j > cols)
        {
          continue;
        }

        if (enemyArray[(int)location.x + i][(int)location.y + j].updateNR != 3)
        {
          life--;
        }
      }
    }
    if (life <= 0)
    {
      conected = false;
      isDead = true;
    }
  }


  void towerColition(ArrayList<Tower> towers, ArrayList<TowerEnergy> energyTowers, TowerBase base, ArrayList<TowerAttackEmitters> towerAttackETowers)
  {
    for (Tower tower : towers)
    {
      if (tower == this)
      {
        continue;
      }
      for (int i = -7; i <= 7; i++) 
      {
        for (int j = -7; j <= 7; j++) 
        {
          if (newLocation.x + i == tower.location.x && newLocation.y + j == tower.location.y)
          {
            newLocation.set(location);
          }
        }
      }
    } //<>//
  }

  //<>//

  void terrainHight(PVector[][] terrain) {
    if (sameTerrainHeight(terrain)) {
      if (location.x > cols || location.x < 0) {
        return;
      }

      if (location.y > rows || location.y < 0) {
        return;
      }
    }
  }

  void terrainInWay(PVector[][] terrain, Enemy[][] enemyArray) {
  }


  boolean sameTerrainHeight(PVector[][] terrain) { 
    for (int i = -1; i <= 1; ++i) {
      for (int j = -1; j <= 1; ++j) {
        if (location.x + i < cols || location.x + i > 0) {
          continue;
        }
        if (location.y + j < rows || location.y + j > 0) {
          continue;
        }
        if (terrain[(int)location.x][(int)location.y].z != terrain[(int)location.x + i][(int)location.y + j].z) { 

          return false;
        }
      }
    }
    return true;
  }

  void Build() {
    //stroke(0);

    if (conected == false) {
      return;
    }

    if (game.player.energyNetwork.totalEnergy < 0)
    {
      return;
    }

    if (timer==-3) {
      //game.energy.energyUsed = game.energy.energyUsed-energybuild;
      timer=11;
    }

    if (timer<=cunstructionTime&&timer>=0) { 
      timer--;
    }

    if (timer<=0) {
      underCunstruction++;
      timer=cunstructionTime;
    }

    if (underCunstruction==11) {

      timer=cunstructionTime+1;
    }
  }



  boolean isBuild () { 
    if (timer==cunstructionTime+1) {
      return true;
    } else {
      return false;
    }
  }

  void updateNewLocation(PVector newLoc) 
  {
    newLocation.set(newLoc);
  }

  void move()
  {
   
    velocity.set(newLocation);
    velocity.sub(location);
    float dist = velocity.mag();
    if (dist < 0.4)
    {
      location.x = floor(newLocation.x);
      location.y = floor(newLocation.y); 
      location.z = floor(newLocation.z);
      return;
    }
    if (dist > 3) {
      velocity.setMag(1);
    } else {    
      velocity.setMag(dist/2);
    }
    location.x += velocity.x;
    location.y += velocity.y;
    location.z += velocity.z;
  }

  void Draw() {
    strokeWeight(1.5);
    if (coliding)
    {
      stroke(255, 50, 50);
      strokeWeight(2);
    }
    rect((location.x*10 - 10), (location.y*10 - 10), 30, 30);
  }

  void Run() {

    if (newLocation != null && location.x != newLocation.x && location.y != newLocation.y && isBuild())
    {
      move();
    }
    Draw();
    Build();
  }
}
