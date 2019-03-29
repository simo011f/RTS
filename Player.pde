//<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
class Player  
{

  Energy energyNetwork;

  int timer;
  int towernr = 0; 

  //skal kigges på igen
  int eTowerNR;

  int [] towernrremeber = new int[5];

  ArrayList<Tower> towers = new ArrayList<Tower>();
  ArrayList<TowerAttackETowers> towerAttackETowers = new ArrayList<TowerAttackETowers>();


  TowerBase base;
  ArrayList<TowerEnergy> energyTowers = new ArrayList<TowerEnergy>();

  boolean[] towerpickedOnBar = new boolean[5];    
  boolean towerPicked = false; 
  boolean basePicked = false;

  int picked;

  boolean placeble;
  boolean placebleEnergy;
  boolean placebleBase;
  boolean placebleETowers;


  boolean isMouseNotPressedGat = true;
  boolean isMouseNotPressedPlace = true;
  boolean isMouseNotPressedHotBar = true;


  int chosenTower;
  int rageDisply = 195;

  Player() {
    energyNetwork = new Energy();
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
      towerpickedOnBar[1] = false;
    }

    //gul
    if (mouseX>= width/2+60 && mouseX<=width/2+90 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[2]=true;
    } else {
      towerpickedOnBar[2]=false;
    }
    if (towerpickedOnBar[2] && mousePressed) {   

      towerAttackETowers.add(new TowerAttackETowers());
      timer = 0; 
      picked = 3;
      placeble = true;
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
      energyTowers.get(eTowerNR - 1).vis = 0;
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

  //nyt navn
  void gat() {

    if (mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY < height - 60 && isMouseNotPressedGat) {
      towerPicked = false;
    }

    if (towerPicked && mousePressed && isMouseNotPressedGat)
    {
      newPlace(chosenTower);
      towerPicked=false;
    }

    if (mouseX >= base.location.x && mouseX <= base.location.x+10 && mouseY >= base.location.y && mouseY <= base.location.y+10) {
      basePicked = true;
      towerPicked = true;
    }

    if (towerPicked && mousePressed && isMouseNotPressedGat)
    {
      if (mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

        if (mouseX>width-20) {
          mouseX = width-20;
        } 
        if (mouseX<10) {
          mouseX = 10;
        } 
        if (mouseY<10) {
          mouseY = 10;
        } 
        if (mouseY>height-80) {
          mouseY = height-80;
        }
        base.location.set(new PVector(mouseX/scale, mouseY/scale));
      }
      towerPicked=false; 
      basePicked = true;
    }
    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedGat = false;
    } else
    {
      isMouseNotPressedGat = true;
    }
  }

  void newPlace(int i)
  {
    if (mouseX>width-20) {
      mouseX = width-20;
    } 
    if (mouseX<10) {
      mouseX = 10;
    } 
    if (mouseY<10) {
      mouseY = 10;
    } 
    if (mouseY>height-80) {
      mouseY = height-80;
    } 
    towers.get(i).location.set(game.squareFeld.grid[mouseX/10][mouseY/10]);
  }


  // vise range og energyrange
  // skrives om til at virke med kun en arrayliste
  void highLight() { 

    PVector location;
    strokeWeight(0.5);
    location = new PVector(mouseX / scale, mouseY / scale);

    if (picked==1) {
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }

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
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }

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
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }

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
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }

      stroke(rageDisply, rageDisply, 0);
      fill(rageDisply, rageDisply, 0, 100);
      rect((location.x - 7) * scale, (location.y - 7) * scale, 15 * scale, 15 * scale);    

      fill(0, 255, 255);
      rect((location.x - 2) * scale, (location.y - 2) * scale, 5 * scale, 5 * scale);
    }    

    if (picked==5) {
      if (mouseX>width-40) {
        mouseX = width-40;
      } 
      if (mouseX<30) {
        mouseX = 30;
      } 
      if (mouseY<30) {
        mouseY = 30;
      } 
      if (mouseY>height-100) {
        mouseY = height-100;
      }

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

    if (placeble && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer >= 10) { 
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }
      int x = mouseX/10;
      int y = mouseY/10;
      PVector loc = new PVector(x, y);
      towers.get(towers.size() - 1).location.set(loc);
      picked = 0;
      placeble = false;
      timer = 0;
    }  

    if (placebleETowers && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer >= 10) { 
      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }
      int x = mouseX/10;
      int y = mouseY/10;
      PVector loc = new PVector(x, y);
      towerAttackETowers.get(towerAttackETowers.size() - 1).location.set(loc); //<>//
      picked = 0;
      placebleETowers = false;
      timer = 0;
    } 

    if (placebleBase  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-20) {
        mouseX = width-20;
      } 
      if (mouseX<10) {
        mouseX = 10;
      } 
      if (mouseY<10) {
        mouseY = 10;
      } 
      if (mouseY>height-80) {
        mouseY = height-80;
      }


      int x = (int)mouseX/scale;
      int y = (int)mouseY/scale;
      PVector loc = new PVector(x, y);

      base.location.set(loc);  



      timer=0;      
      picked = 0;
      placebleBase = false;
    }

    if (placebleEnergy  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

      if (mouseX>width-40) {
        mouseX = width-40;
      } 
      if (mouseX<30) {
        mouseX = 30;
      } 
      if (mouseY<30) {
        mouseY = 30;
      } 
      if (mouseY>height-100) {
        mouseY = height-100;
      }

      int x = mouseX/10;
      int y = mouseY/10;
      PVector loc = new PVector(x, y);

      energyTowers.get(eTowerNR-1).location.set(loc);  

      energyTowers.get(eTowerNR-1).vis = 100;

      timer=0;      
      picked = 0;
      placebleEnergy = false;
    }
  }

  void towerDead(Enemy[][] enemyArray) {
    for (int i = 0; i < energyTowers.size(); i++) {
      TowerEnergy energyTower = energyTowers.get(i); 
      energyTower.enemyColition(enemyArray);
      if (energyTower.isDead) { 
        energyTowers.get(i).ancetToBase=4;
        energyTowers.get(i).conected=false;
        energyTowers.get(i).baseConeced=false;
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
  }

  //kan ikke overskue at gøre feridg
  void towerTerrain(PVector[][]terrain)
  {
    for (Tower tower : towers) {
      tower.terrainColision(terrain);
    }
  }

  void towerAttack(Enemy[][] enemyArray, ArrayList<Emitter> emitters)
  {
    if (energyNetwork.transmit) {
      for (Tower tower : towers) {
        tower.attack(enemyArray);
      }
      for (TowerAttackETowers towerAttackETower : towerAttackETowers)
      {
        towerAttackETower.attack(emitters);
      }
    }
  }

  void towerRun() {
    //tower attack enemy tower skal dræbe emitter

    for (TowerEnergy energyTower : energyTowers) {
      energyTower.run(); 

      energyTower.towersConnected(towers, energyTowers, base);
    }
    energyNetwork.energyPruduktion(energyTowers);

    for (int i = 0; i < towers.size(); i++) {
      Tower tower = towers.get(i);
      tower.Run();
    }    

    //gider ikke at tegne dem
    for (int i = 0; i < towerAttackETowers.size(); i++)
    {
      TowerAttackETowers tAttackETower = towerAttackETowers.get(i);
      tAttackETower.Build();
      println(tAttackETower.location);
    }

    energyNetwork.useEnergy(towers);

    if (base != null)
    {
      base.run();
    }
  }

  void Run() {

    energyNetwork.Update();
    PickTowerOnBar();   
    highLight();   
    if (keys[0]) {
      gat();
    }
    place();  
    towerRun();

    //println(shotTower.size(), towernr[0], placeble[1], towerpickedOnBar[1], picked, width/2+215, mouseX);
    if (timer >= 20) {
      timer = 20;
    }
  }
}
