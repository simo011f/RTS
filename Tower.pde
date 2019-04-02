class Tower {   //<>//
  //når jeg skal finde z(højden) så brug baselevel.currentTerrain

  PVector location;
  PVector newLocation;
  PVector velocity = new PVector();


  int leif = 2;
  int maxLeif = 2;
  int leifRegen = 0;

  //build timer
  int t=-2;
  int underCunstruction;
  int cunstructionEnergyConsomstion;
  int energyConsomstion;

  boolean conected = false;
  boolean isDead = false;
  boolean isMoving = false;

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
        if ((int)location.x + i < 0 || (int)location.x + i >= cols)
        {
          continue;
        }
        if ((int)location.y + j < 0 || (int)location.y + j >= cols)
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
  void terrainHight(PVector[][] terrain) {
    if (sameTerrainHeight(terrain)) {
      if (mouseX/scale < cols||mouseX/scale > 0) {
        return;
      }
      if (mouseY/scale < rows||mouseY/scale > 0) {
        return;
      }
      location.z=terrain[(int)mouseX/scale][(int)mouseY/scale].z;
    }
  }
  boolean sameTerrainHeight(PVector[][] terrain) {
    //måske det der gør at den er bug    restrainMouse();
    for (int i = -1; i <= 1; ++i) {
      for (int j = -1; j <= 1; ++j) {
        //if (terrain[int(location.x)][int(location.y)].z != terrain[int(location.x) + i][int(location.y) + j].z) {
        //  return false;
        //} 
        if (mouseX/scale + i < cols||mouseX/scale + i > 0) {
          continue;
        }
        if (mouseY/scale + j < rows||mouseY/scale + j > 0) {
          continue;
        }
        if (terrain[int(mouseX/scale)][int(mouseY/scale)].z != terrain[int(mouseX/scale) + i][int(mouseY/scale) + j].z) { 
          return false;
        }
      }
    }
    return true;
  }

  void Build() {
    //stroke(0);
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

    if (t<=11&&t>=-1) { 
      t--;
    }

    if (t<=-1) {
      underCunstruction++;
      t=11;
    }

    if (underCunstruction==11) {
      underCunstruction=12;
      t=13;
    }

    if (t==13) { 


      //game.energy.energyUsed = game.energy.energyUsed+energybuild-energyConsomstion; 
      t=14;
    }
  }



  boolean isBuild () { 
    if (t==14) {
      return true;
    } else {
      return false;
    }
  }

  void updateNewLocation(PVector newLoc)
  {
    newLocation = newLoc;
  }

  void move()
  {
    velocity.set(newLocation);
    velocity.sub(location);
    float dist = velocity.mag();
    if (dist < 0.1)
    {
      location = newLocation;
      return;
    }
    if (dist > 3) {
      velocity.setMag(1);
    } else {    
      velocity.setMag(dist/2);
    }
    location.x += velocity.x;
    location.y += velocity.y;
  }

  void Run() {

    if (newLocation != null && location != newLocation && isBuild())
    {
      move();
    }

    Build();
  }
}
