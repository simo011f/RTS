class Player //<>//
{ //<>//
  Energy energyNetwork;
  int timer;
  int towerNR = 0; 

  //skal kigges på igen
  int eTowerNR;
  int NRInHand = -1;
  PVector[][] levelTerrain;
  TowerBase base;
  ArrayList<Tower> towers = new ArrayList<Tower>();
  ArrayList<TowerAttackEmitters> towersAttackEmitters = new ArrayList<TowerAttackEmitters>();
  ArrayList<TowerEnergy> energyTowers = new ArrayList<TowerEnergy>();

  boolean[] towerPickedOnBar = new boolean[5];    
  boolean towerInHand = false;
  int picked;
  boolean placeble;
  boolean placebleEnergy;
  boolean placebleBase;
  boolean placebleETowers;

  boolean isMouseNotPressedPlace = true;
  boolean isMouseNotPressedHotBar = true;

  int rageDisply = 195;

  Player() {
    energyNetwork = new Energy();
    levelTerrain = new PVector[cols][rows];
  }


  void pickTowerOnBar() {
    timer++;

    //blå
    if (mouseX>= width/2-(6*10) && mouseX<=width/2-(3*10) && mouseY>=height-60 && mouseY<=height && isMouseNotPressedHotBar) { 
      towerPickedOnBar[0] = true;
    } else {
      towerPickedOnBar[0] = false;
    }
    if (towerPickedOnBar[0] && mousePressed) {   
      towerNR += 1;

      towers.add(new TowerShot());
      timer = 0; 
      picked = 1;
      placeble = true;
      towerInHand = false;
      towerPickedOnBar[0] = false;
    }

    //rød
    if (mouseX>= width/2 && mouseX<=width/2+30 && mouseY>=height-60 && mouseY<=height && isMouseNotPressedHotBar) { 
      towerPickedOnBar[1] = true;
    } else {
      towerPickedOnBar[1] = false;
    }
    if (towerPickedOnBar[1] && mousePressed) {   
      towerNR += 1;

      towers.add(new TowerBomb());
      timer = 0; 
      picked = 2;
      placeble = true;
      towerInHand = false;
      towerPickedOnBar[1] = false;
    }

    //gul
    if (mouseX>= width/2+60 && mouseX<=width/2+90 && mouseY>=height-60 && mouseY<=height && isMouseNotPressedHotBar) { 
      towerPickedOnBar[2]=true;
    } else {
      towerPickedOnBar[2]=false;
    }
    if (towerPickedOnBar[2] && mousePressed) {   

      towersAttackEmitters.add(new TowerAttackEmitters());
      timer = 0; 
      picked = 3;
      placebleETowers = true;
      towerInHand = false;
      towerPickedOnBar[2] = false;
    }

    //tukis
    if (mouseX>= width/2+120 && mouseX<=width/2+170 && mouseY>=height-60 && mouseY<=height && isMouseNotPressedHotBar) { 
      towerPickedOnBar[3]=true;
    } else {
      towerPickedOnBar[3]=false;
    }
    if (towerPickedOnBar[3] && mousePressed) {   
      if (base != null)
      {
        return;
      }
      base = new TowerBase();
      timer=0; 
      picked=4;
      placebleBase = true;
      towerInHand = false;
      towerPickedOnBar[3]=false;
    }

    //grøn
    if (mouseX >= width/2+10*20 && mouseX<=width/2+10*25 && mouseY>=height-60 && mouseY<=height && isMouseNotPressedHotBar) { 
      towerPickedOnBar[4]=true;
    } else {
      towerPickedOnBar[4]=false;
    }
    if (towerPickedOnBar[4] && mousePressed) {   
      eTowerNR = eTowerNR + 1;

      energyTowers.add(new TowerEnergy());
      timer=0; 
      picked=5;
      placebleEnergy=true;
      towerInHand = false;
      energyTowers.get(energyTowers.size() - 1).vis = 0;
      towerPickedOnBar[4]=false;
    }

    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedHotBar = false;
    } else
    {
      isMouseNotPressedHotBar = true;
    }
  }

  void drawHotbar(Enemy[][] enemyArray) {

    noStroke();
    fill(255);
    rect(0, height-60, width, height);

    PVector location=new PVector(width/2, height-45);

    fill(150);
    stroke(0);
    strokeWeight(1.5);
    rect(width/2-500, height-60, 1000, 60);

    fill(0, 0, 255);
    rect(location.x-6*10, location.y-1*10+10, 30, 30);

    fill(255, 0, 0);
    rect(location.x, (location.y-1*10)+10, 30, 30);

    fill(255, 255, 0);
    rect(location.x+6*10, (location.y-1*10)+10, 30, 30);

    fill(0, 255, 255);
    rect(location.x+10*12, location.y-10, 50, 50);

    fill(0, 155, 0);   
    rect(location.x+10*20, (location.y-10), 50, 50);

    fill(0, 255, 0);   
    rect(location.x+10*22, (location.y+10), 10, 10);

    energyNetwork.energyUI();

    if (mouseY/scale > rows - 1) {
      return;
    }
    textAlign(CENTER);
    fill(0);
    textSize(17);
    text("Terrain height:", location.x - 250, location.y + 10);
    text("Enemy strength:", location.x - 259, location.y + 30);
    text((int)levelTerrain[(int)mouseX/scale][(int)mouseY/scale].z, location.x - 185, location.y + 10);
    text(enemyArray[(int)mouseX/scale][(int)mouseY/scale].strength, location.x - 185, location.y + 30);
    textAlign(CORNER);
  }




  // vise range og energyrange
  // skrives om hvor der er underfunktioner
  void highLight() { 

    PVector location;
    strokeWeight(0.5);
    location = new PVector(mouseX / scale, mouseY / scale);

    if (picked==1) {
      restrainMouse();
      stroke(rageDisply, 0, 0);
      fill(rageDisply, 0, 0, 100);
      rect((location.x - 15) * scale, (location.y - 15) * scale, 31 * scale, 31 * scale);
      stroke(rageDisply, rageDisply, 0);
      fill(rageDisply, rageDisply, 0, 100);
      rect((location.x - 7) * scale, (location.y - 7) * scale, 15 * scale, 15 * scale);
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1.5);
      if (towerColitionPlase(towers, energyTowers, base, towersAttackEmitters, mouseX/scale, mouseY/scale)) {
        stroke(255, 100, 100);
      } 
      rect((location.x - 1) * scale, (location.y - 1) * scale, 3 * scale, 3 * scale);
    } 

    if (picked==2) {
      restrainMouse();
      stroke(rageDisply, 0, 0);
      fill(rageDisply, 0, 0, 100);
      rect((location.x - 15) * scale, (location.y - 15) * scale, 31 * scale, 31 * scale);
      stroke(rageDisply, rageDisply, 0);
      fill(rageDisply, rageDisply, 0, 100);
      rect((location.x - 7) * scale, (location.y - 7) * scale, 15 * scale, 15 * scale);
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(1.5);
      if (towerColitionPlase(towers, energyTowers, base, towersAttackEmitters, mouseX/scale, mouseY/scale)) {
        stroke(255, 100, 100);
      } 
      rect((location.x - 1) * scale, (location.y - 1) * scale, 3 * scale, 3 * scale);
    } 

    //TowerAttackEnemyTower
    if (picked==3) {
      restrainMouse();
      stroke(rageDisply, 0, 0);
      fill(rageDisply, 0, 0, 100);
      rect((location.x - 10) * scale, (location.y - 10) * scale, 21 * scale, 21 * scale);
      stroke(rageDisply, rageDisply, 0);
      fill(rageDisply, rageDisply, 0, 100);
      rect((location.x - 7) * scale, (location.y - 7) * scale, 15 * scale, 15 * scale); 
      fill(255, 255, 0);
      stroke(0);
      strokeWeight(1.5);
      rect((location.x - 1) * scale, (location.y - 1) * scale, 3 * scale, 3 * scale);
    }

    if (picked==4) {
      restrainMouse();
      stroke(rageDisply, rageDisply, 0);
      fill(rageDisply, rageDisply, 0, 100);
      rect((location.x - 7) * scale, (location.y - 7) * scale, 15 * scale, 15 * scale);    
      fill(0, 255, 255);  
      if (towerColitionPlase(towers, energyTowers, base, towersAttackEmitters, mouseX/scale, mouseY/scale)) {
        strokeWeight(3);
        stroke(255, 100, 100);
      } 

      rect((location.x - 2) * scale, (location.y - 2) * scale, 5 * scale, 5 * scale); 
      strokeWeight(1.5);
    }    

    if (picked==5) {
      restrainMouse();
      stroke(rageDisply, rageDisply, 0);
      fill(rageDisply, rageDisply, 0, 100);
      rect((location.x - 7) * scale, (location.y - 7) * scale, 15 * scale, 15 * scale); 
      fill(0, 155, 0);
      stroke(0);
      rect((location.x - 2) * scale, (location.y - 2) * scale, 5 * scale, 5 * scale);    
      fill(0, 255, 0);
      rect(location.x * scale, location.y * scale, scale, scale);
    }
  }


  void place() {

    if (towerInHand) {
      return;
    }

    if (placeble && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer >= 10) {
      if (towerColitionPlase(towers, energyTowers, base, towersAttackEmitters, mouseX/scale, mouseY/scale)) {
        return;
      }
      restrainMouse();
      int x = mouseX/10;
      int y = mouseY/10;
      int z = int(levelTerrain[x][y].z);
      PVector loc = new PVector(x, y, z);
      towers.get(towers.size()-1).location.set(loc);
      towers.get(towers.size()-1).newLocation.set(loc);
      picked = 0;
      towerInHand = false;
      placeble = false;
      timer = 0;
    }  

    if (placebleETowers && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer >= 10) { 
      restrainMouse();
      int x = mouseX/10;
      int y = mouseY/10;
      PVector loc = new PVector(x, y);
      towersAttackEmitters.get(towersAttackEmitters.size() - 1).location.set(loc);
      picked = 0;
      towerInHand = false;
      placebleETowers = false;
      timer = 0;
    } 

    if (placebleBase  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 
      if (towerColitionPlase(towers, energyTowers, base, towersAttackEmitters, mouseX/scale, mouseY/scale)) {
        return;
      }
      restrainMouse();
      int x = (int)mouseX/scale;
      int y = (int)mouseY/scale;
      PVector loc = new PVector(x, y);
      base.location.set(loc);
      timer=0;      
      picked = 0;
      towerInHand = false;
      placebleBase = false;
    }

    if (placebleEnergy  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 
      if (towerColitionPlase(towers, energyTowers, base, towersAttackEmitters, mouseX/scale, mouseY/scale)) {
        return;
      }
      restrainMouse();
      int x = mouseX/10;
      int y = mouseY/10;
      PVector loc = new PVector(x, y);
      energyTowers.get(energyTowers.size()-1).location.set(loc);
      energyTowers.get(energyTowers.size()-1).vis = 100;
      timer=0;      
      picked = 0;
      towerInHand = false;
      placebleEnergy = false;
    }
  }

  boolean towerColitionPlase(ArrayList<Tower> towers, ArrayList<TowerEnergy> energyTowers, TowerBase base, ArrayList<TowerAttackEmitters> towerAttackETowers, int x, int y)
  {

    for (int i = -1; i <= 1; ++i) {
      for (int j = -1; j <= 1; ++j) {  


        if (levelTerrain[int(mouseX/scale)][int(mouseY/scale)].z != levelTerrain[int(mouseX/scale) + i][int(mouseY/scale)+ j].z ||levelTerrain[int(mouseX/scale)][int(mouseY/scale)].z==-1) {  
          return true;
        }
      }
    } 

    for (Tower tower : towers)
    {
      if (tower.location.x == -10) {
        continue;
      }
      if (x - 2 <= tower.location.x && x + 2 >= tower.location.x && y - 2 <= tower.location.y && y + 2 >= tower.location.y) 
      {        
        return true;
      }
    }
    for (TowerAttackEmitters tower : towerAttackETowers)
    {
      for (int i = -2; i <= 2; i++) 
      {
        for (int j = -2; j <= 2; j++) 
        {
          if (x + i == tower.location.x && y + j == tower.location.y) 
          {
            return true;
          }
        }
      }
    }
    for (TowerEnergy energyTower : energyTowers)
    {
      for (int i = -1; i <= 1; i++) 
      {
        for (int j = -1; j <= 1; j++) 
        {
          if (x + i == energyTower.location.x && y + j == energyTower.location.y) 
          {
            return true;
          }
        }
      }
    } 
    if (placebleBase || placebleEnergy) {
      for (int i = -2; i <= 2; i++) {
        for (int j = -2; j <= 2; j++) { 
          if (levelTerrain[int(mouseX/scale)][int(mouseY/scale)].z != levelTerrain[int(mouseX/scale) + i][int(mouseY/scale)+ j].z) {  
            return true;
          }
        }
      }
    }
    if (base == null) {
      return false;
    }
    for (int i = -3; i <= 3; i++) 
    {
      for (int j = -3; j <= 3; j++) 
      { 

        if (x + i == base.location.x && y + j == base.location.y) 
        {
          return true;
        }
      }
    }
    return false;
  }

  void towerDead(Enemy[][] enemyArray) {
    for (int i = 0; i < energyTowers.size(); i++) {
      TowerEnergy energyTower = energyTowers.get(i); 
      energyTower.enemyColition(enemyArray);
      if (energyTower.isDead) { 
        energyTowers.get(i).anchoredToBase=4;
        energyTowers.get(i).conected=false;
        energyTowers.remove(i);
        for (Tower tower : towers) {
          tower.conected=false;
        }

        energyNetwork.energyPruduktion(energyTowers);
        eTowerNR--;
        continue;
      }
    }

    for (int i = 0; i < towers.size(); i++) {
      Tower tower = towers.get(i); 
      tower.enemyColition(enemyArray);
      if (tower.isDead) {
        towers.remove(tower);
        towerNR--;
        continue;
      }
    }
    for (int i = 0; i < towersAttackEmitters.size(); i++) {
      TowerAttackEmitters tower = towersAttackEmitters.get(i); 
      tower.enemyColition(enemyArray);
      if (tower.isDead) {
        if (i == NRInHand)
        {
          NRInHand = -1;
          towerInHand = false;
        }
        towersAttackEmitters.remove(tower);
        continue;
      }
    }
    if (base != null)
    {
      base.contactWithEnemy(enemyArray);
    }
  }

  void towerAttack(Enemy[][] enemyArray, ArrayList<Emitter> emitters)
  {
    if (energyNetwork.transmit) {
      for (Tower tower : towers) {  
        tower.terrainInWay(levelTerrain, enemyArray); 

        tower.attack(enemyArray);
      }
      for (TowerAttackEmitters towerAttackETower : towersAttackEmitters)
      {
        towerAttackETower.attack(emitters);
      }
    }
  }


  void towerMove()
  {
    if (mouseY > rows * scale || placeble || towers.size() == 0)
    {
      return;
    }
    int x = mouseX/10;
    int y = mouseY/10;
    int z = int(levelTerrain[x][y].z);
    PVector newLocation = new PVector(x, y, z);

    for (int i = 0; i < towers.size(); i++)
    {
      Tower tower = towers.get(i);
      if (mouseOverTower(tower.location, newLocation) && !towerInHand && tower.isBuild() && !placeble) {
        NRInHand = i;
        newLocation = null;
        towerInHand = true;
        placeble = false;
        return;
      }
    }

    if (towerInHand && NRInHand >= 0 && !placeble) {
      towers.get(NRInHand).updateNewLocation(newLocation);
      NRInHand = -1;
      newLocation = null;
      towerInHand = false;
      placeble = false;
    }
    NRInHand = -1;
    towerInHand = false;
    placeble = false;
  }


  boolean mouseOverTower(PVector towerLocatino, PVector mouseLocaton)
  {
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if ((int)towerLocatino.x + i == (int)mouseLocaton.x && (int)towerLocatino.y + j == (int)mouseLocaton.y) {
          return true;
        }
      }
    }
    return false;
  }

  void towerRun() {
    //tower attack enemy tower skal dræbe emitter
    for (Tower tower : towers)
    {
      tower.conected = false;
    }

    for (TowerEnergy energyTower : energyTowers) {
      energyTower.conected = false;
      energyTower.arearDraw();
    }

    if (base != null)
    {
      base.energyTowersConected(energyTowers);
      base.run();
    }

    for (TowerEnergy energyTower : energyTowers) {
      energyTower.towerDraw(); 
      energyTower.towersConnected(towers, energyTowers, base, towersAttackEmitters);
    }

    energyNetwork.energyPruduktion(energyTowers);
    for (int i = 0; i < towers.size(); i++) {
      Tower tower = towers.get(i);
      stroke(0);
      if (i == NRInHand) {
        stroke(255);
      }
      //if () {
      //  stroke(200, 10, 10);
      //}
      tower.Run();
    }    
    stroke(0);
    //gider ikke at tegne dem
    for (int i = 0; i < towersAttackEmitters.size(); i++)
    {
      TowerAttackEmitters towerAttackEmitters = towersAttackEmitters.get(i);
      towerAttackEmitters.Run();
    }
    energyNetwork.useEnergy(towers);
  }

  void terrain(PVector[][] currentTarine) {
    for (TowerEnergy energyTower : energyTowers) {
    }
    for (Tower tower : towers) {  

      tower.terrainHight(currentTarine);
    }
  }

  //runs when the game is paused
  void towerPause()
  {
    destroyTower();
    for (Tower tower : towers)
    {
      tower.conected = false;
    }

    for (TowerEnergy energyTower : energyTowers) {
      energyTower.conected = false;
      energyTower.arearDraw();
    }

    if (base != null) {
      base.energyTowersConected(energyTowers);
      base.run();
    }

    for (TowerEnergy energyTower : energyTowers) {
      energyTower.towerDraw(); 
      energyTower.towersConnected(towers, energyTowers, base, towersAttackEmitters);
    }
    stroke(0);

    for (Tower tower : towers) {
      tower.Draw();
    }
    stroke(0);
    for (TowerAttackEmitters towerAttackEmitters : towersAttackEmitters)
    {
      towerAttackEmitters.Run();
    }
    energyNetwork.useEnergy(towers);
  }

  void destroyTower()
  {
    PVector mouseLocation = new PVector(mouseX/scale, mouseY/scale);
    if (!keys[1])
    {
      return;
    }
    if (towers.size() > 0) {
      for (Tower tower : towers) {
        if (mouseOverTower(tower.location, mouseLocation)) {
          towers.remove(tower);
          keys[1] = false;
          return;
        }
      }
    }

    if (towersAttackEmitters.size() > 0) {
      for (TowerAttackEmitters towerAttackEmitters : towersAttackEmitters)
      {
        if (mouseOverTower(towerAttackEmitters.location, mouseLocation)) {
          towersAttackEmitters.remove(towerAttackEmitters);
          keys[1] = false;
          return;
        }
      }
    }

    if (energyTowers.size() > 0) {
      for (TowerEnergy energyTower : energyTowers) {
        if (mouseOverTower(energyTower.location, mouseLocation)) {
          energyTowers.remove(energyTower);
          keys[1] = false;
          return;
        }
      }
    }

    if (base != null && mouseOverTower(base.location, mouseLocation))
    {
      base = null;
      keys[1] = false;
      return;
    }
    keys[1] = false;
  }

  void Run() {
    destroyTower();
    energyNetwork.Update();
    pickTowerOnBar();   
    highLight();   
    if (keys[0]) {
    }
    place();  
    towerRun();
    //towerMove();
    if (timer >= 20) {
      timer = 20;
    }
  }
}
