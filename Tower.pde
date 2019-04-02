class Tower {  
  //når jeg skal finde z(højden) så brug baselevel.currentTerrain

  PVector location;

  int leif = 2;
  int maxLeif = 2;
  int leifRegen = 0;

  //build timer
  int t=-2;
  int underCunstruction;
  int cunstructionTime;
  int cunstructionEnergyConsomstion;
  int energyConsomstion;

  boolean conected = false;
  boolean isDead = false;

  int range = 20;

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
    leif += leifRegen;
    if (leif >= maxLeif) {
      leif = maxLeif; 
      underCunstruction=12;
    }  

    if (conected) {

      weapon(enemyArray);
      detection(enemyArray);
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
          leif--;
        }
      }
    }
    if (leif <= 0)
    {
      conected = false;
      isDead = true;
    }
  }

  boolean terrainColision(PVector[][] terrain)
  {
    int x = (int)location.x;
    int y = (int)location.y;

    for (int i = -1; i <= 1; ++i) {
      for (int j = -1; j <= 1; ++j) {
        if (terrain[x][y].z != terrain[x + i][y + j].z)
        {
          return false;
        }
      }
    }
    return true;
  }

  void Build() {
    stroke(0);
    strokeWeight(1.5);
    rect((location.x*10 - 10), (location.y*10 - 10), 30, 30);

    if (conected == false) {
      return;
    }

    if (game.player.energyNetwork.totalEnergy < 0)
    {
      return;
    }

    if (t==-3) {
      //game.energy.energyUsed = game.energy.energyUsed-energybuild;
      t=11;
    }

    if (t<=cunstructionTime&&t>=0) { 
      t--;
    }

    if (t<=0) {
      underCunstruction++;
      t=cunstructionTime;
    }

    if (underCunstruction==11) {
      underCunstruction=12;
      t=13;
    }
  }



  boolean isBuild () { 
    if (t==13) {
      return true;
    } else {
      return false;
    }
  }

  void move(PVector newLoc)
  {
    PVector newLocation = newLoc;


    location = newLocation;
  }


  void Run() {

    Build();
  }
}
