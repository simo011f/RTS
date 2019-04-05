class Player   //<>// //<>// //<>//
{

  Energy energyNetwork;

  int timer;
  int towernr = 0; 

  //skal kigges på igen
  int eTowerNR;
  int NRInHand = -1;

  int [] towernrremeber = new int[5];
  PVector[][] levelTerrain;



  TowerBase base;
  ArrayList<Tower> towers = new ArrayList<Tower>();
  ArrayList<TowerAttackEmitters> towersAttackEmitters = new ArrayList<TowerAttackEmitters>();
  ArrayList<TowerEnergy> energyTowers = new ArrayList<TowerEnergy>();

  boolean[] towerpickedOnBar = new boolean[5];    
  boolean towerPicked = false; 
  boolean basePicked = false;
  boolean towerInHand = false;

  int picked;

  boolean placeble;
  boolean placebleEnergy;
  boolean placebleBase;
  boolean placebleETowers;

  boolean isMouseNotPressedPlace = true;
  boolean isMouseNotPressedHotBar = true;


  int chosenTower;
  int rageDisply = 195;

  Player() {
    energyNetwork = new Energy();
    levelTerrain = new PVector[cols][rows];
  }


  void PickTowerOnBar() {
    timer++;

    //blå
    if (mouseX>= width/2-10 && mouseX<=width/2+20 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[0] = true;
    } else {
      towerpickedOnBar[0] = false;
    }
    if (towerpickedOnBar[0] && mousePressed) {   
      towernr += 1;

      towers.add(new TowerAttackTerrtoriumShot());
      timer = 0; 
      picked = 1;
      placeble = true;
      towerInHand = true;
      towerpickedOnBar[0] = false;
    }


    //rød
    if (mouseX>= width/2+25 && mouseX<=width/2+55 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[1] = true;
    } else {
      towerpickedOnBar[1] = false;
    }
    if (towerpickedOnBar[1] && mousePressed) {   
      towernr += 1;

      towers.add(new TowerAttackTerrtoriumBomb());
      timer = 0; 
      picked = 2;
      placeble = true;
      towerInHand = true;
      towerpickedOnBar[1] = false;
    }

    //gul
    if (mouseX>= width/2+60 && mouseX<=width/2+90 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[2]=true;
    } else {
      towerpickedOnBar[2]=false;
    }
    if (towerpickedOnBar[2] && mousePressed) {   

      towersAttackEmitters.add(new TowerAttackEmitters());
      timer = 0; 
      picked = 3;
      placebleETowers = true;
      towerInHand = true;
      towerpickedOnBar[2] = false;
    }

    //tukis
    if (mouseX>= width/2+140 && mouseX<=width/2+190 && mouseY>=height-65 && mouseY<=height-15 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[3]=true;
    } else {
      towerpickedOnBar[3]=false;
    }
    if (towerpickedOnBar[3] && mousePressed) {   
      base = new TowerBase();
      timer=0; 
      picked=4;
      placebleBase = true;
      towerInHand = true;
      towerpickedOnBar[3]=false;
    }

    //grøn
    if (mouseX >= width/2+215 && mouseX<=width/2+225 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[4]=true;
    } else {
      towerpickedOnBar[4]=false;
    }
    if (towerpickedOnBar[4] && mousePressed) {   
      eTowerNR = eTowerNR + 1;

      energyTowers.add(new TowerEnergy());
      timer=0; 
      picked=5;
      placebleEnergy=true;
      towerInHand = true;
      energyTowers.get(energyTowers.size() - 1).vis = 0;
      towerpickedOnBar[4]=false;
    }

    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedHotBar = false;
    } else
    {
      isMouseNotPressedHotBar = true;
    }
  }

  void drawHotbar() {

    noStroke();
    fill(255);
    rect(0, height-60, width, height);

    PVector location=new PVector(width/2, height-45);

    fill(150);
    stroke(0);
    strokeWeight(1.5);
    rect(width/2-500, height-60, 1000, 60);
    fill(0, 0, 255);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10+10, 10, 10);
      }
    }  

    fill(255, 0, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+10*3+5, (location.y+j*10)+10, 10, 10);
      }
    } 

    fill(255, 255, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+10*6+10, (location.y+j*10)+10, 10, 10);
      }
    }

    fill(0, 255, 255);
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        rect((location.x+i*10)+10*6+100, (location.y+j*10)+10, 10, 10);
      }
    }

    fill(0, 255, 0);   
    rect((location.x+10)+10*6+145, (location.y+10), 10, 10);
    energyNetwork.energyUI();
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
      rect((location.x - 20) * scale, (location.y - 20) * scale, 41 * scale, 41 * scale);
      stroke(rageDisply, rageDisply, 0);
      fill(rageDisply, rageDisply, 0, 100);
      rect((location.x - 7) * scale, (location.y - 7) * scale, 15 * scale, 15 * scale);
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1.5);
      rect((location.x - 1) * scale, (location.y - 1) * scale, 3 * scale, 3 * scale);
    } 

    if (picked==2) {
      restrainMouse();
      stroke(rageDisply, 0, 0);
      fill(rageDisply, 0, 0, 100);
      rect((location.x - 20) * scale, (location.y - 20) * scale, 41 * scale, 41 * scale);
      stroke(rageDisply, rageDisply, 0);
      fill(rageDisply, rageDisply, 0, 100);
      rect((location.x - 7) * scale, (location.y - 7) * scale, 15 * scale, 15 * scale);
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(1.5);
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
      rect((location.x - 2) * scale, (location.y - 2) * scale, 5 * scale, 5 * scale);
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




    if (towers.size() < 0) {
      placeble=false;
    }

    if (towers.size() > 0) {
      towers.get(towers.size()-1).towerColitionPlase(towers, energyTowers, base, towersAttackEmitters);
    }
    if (mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61) {
      if (placeble && levelTerrain[int(mouseX/scale)][int(mouseY/scale)].z==-1) {

        placeble=false;
      }
      //println(levelTerrain[int(mouseX/scale)][int(mouseY/scale)].z);
      if (towers.size()>0&&placebleEnergy==false&&placebleBase==false && placebleETowers==false && levelTerrain[int(mouseX/scale)][int(mouseY/scale)].z>-1) { 

        placeble=true;
      }
    }
    if (placeble && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer >= 10) {
      if (towers.get(towers.size()-1).coliding) {
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
        towernr--;
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
  }



  void updateTerain()
  {
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


  // hej 
  void towerMove()
  {
    if (mouseY > rows * scale)
    {
      return;
    }
    PVector newLocation = new PVector(mouseX/scale, mouseY/scale);

    for (int i = 0; i < towers.size(); i++)
    {
      Tower tower = towers.get(i);
      if (mouseOverTower(tower.location, newLocation) && !towerInHand && tower.isBuild()) {
        NRInHand = i;
        towerInHand = true;
        return;
      }
    }

    if (towerInHand && NRInHand >= 0) {

      towers.get(NRInHand).updateNewLocation(newLocation);
      NRInHand = -1;
      towerInHand = false;
      return;
    }
    NRInHand = -1;
    towerInHand = false;
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
    PickTowerOnBar();   
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
