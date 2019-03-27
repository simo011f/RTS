class Player  //<>// //<>// //<>//
{

  int timer;
  int towernr; 

  //skal kigges på igen
  int eTowerNR;

  int [] towernrremeber = new int[5];

  ArrayList<Tower> tower = new ArrayList<Tower>();

  ArrayList<TowerAttackTerrtoriumShot> shotTower = new ArrayList<TowerAttackTerrtoriumShot>();
  ArrayList<TowerAttackTerrtoriumBomb> bombTower = new ArrayList<TowerAttackTerrtoriumBomb>();
  ArrayList<TowerAttackETowers> enemyAttackTower = new ArrayList<TowerAttackETowers>(); 
  TowerBase base;
  ArrayList<TowerEnergy> energyTower = new ArrayList<TowerEnergy>();

  boolean[] towerpickedOnBar = new boolean[5];    
  boolean towerPicked = false; 
  boolean basePicked = false;

  int picked;

  boolean placeble;
  boolean placebleEnergy;
  boolean placebleBase;

  boolean[] placeble2 = new boolean[5];

  boolean GO = false;

  boolean isMouseNotPressedGat = true;
  boolean isMouseNotPressedPlace = true;
  boolean isMouseNotPressedHotBar = true;


  int chosenTower;
  int rageDisply = 195;

  Player() {
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
      towernr = towernr + 1;

      tower.add(new TowerAttackTerrtoriumShot());
      timer = 0; 
      picked = 1;
      placeble = true;
      towerpickedOnBar[0] = false; 
      GO = true;
    }


    //rød
    if (mouseX>= width/2+25 && mouseX<=width/2+55 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[1] = true;
    } else {
      towerpickedOnBar[1] = false;
    }
    if (towerpickedOnBar[1] && mousePressed) {   
      towernr = towernr + 1;

      tower.add(new TowerAttackTerrtoriumBomb());
      timer = 0; 
      picked = 2;
      placeble = true;
      towerpickedOnBar[1] = false;   
      GO = true;
    }

    //gul
    if (mouseX>= width/2+60 && mouseX<=width/2+90 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[2]=true;
    } else {
      towerpickedOnBar[2]=false;
    }
    if (towerpickedOnBar[2] && mousePressed) {   
      towernr = towernr + 1;

      tower.add(new TowerAttackETowers());
      timer = 0; 
      picked = 3;
      placeble = true;
      towerpickedOnBar[2] = false;   
      GO = true;
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
      GO = true;
    }

    //grøn
    if (mouseX >= width/2+215 && mouseX<=width/2+225 && mouseY>=height-55 && mouseY<=height-25 && isMouseNotPressedHotBar) { 
      towerpickedOnBar[4]=true;
    } else {
      towerpickedOnBar[4]=false;
    }
    if (towerpickedOnBar[4] && mousePressed) {   
      eTowerNR = eTowerNR + 1;

      energyTower.add(new TowerEnergy());
      timer=0; 
      picked=5;
      placebleEnergy=true;
      energyTower.get(eTowerNR - 1).vis = 0;
      towerpickedOnBar[4]=false; 
      GO = true;
    }

    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedHotBar = false;
    } else
    {
      isMouseNotPressedHotBar = true;
    }
  }

  //nyt navn
  void gat() {

    if (mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY < height - 60 && isMouseNotPressedGat) {
      towerPicked = false;
    }

<<<<<<< HEAD
    for (int i = 0; i < shotTower.size(); i++) {
      if (/*kan omskrives til en boolean funktion*/shotTower.get(i).t==13 && mouseX >= shotTower.get(i).location.x && mouseX <= shotTower.get(i).location.x+10 && mouseY >= shotTower.get(i).location.y && mouseY <= shotTower.get(i).location.y+10) {
        nr[0]=i;
        towerpicked[0]=true;
      }
    }
    for (int i = 0; i <  bombTower.size(); i++) {
      if (bombTower.get(i).t==13 && mouseX >=  bombTower.get(i).location.x && mouseX <=  bombTower.get(i).location.x+10 && mouseY >=  bombTower.get(i).location.y && mouseY <=  bombTower.get(i).location.y+10) {
        nr[1]=i;
        towerpicked[1]=true;
      }
    }
    for (int i = 0; i < enemyAttackTower.size(); i++) {
      if (enemyAttackTower.get(i).t==13 && mouseX >= enemyAttackTower.get(i).location.x && mouseX <= enemyAttackTower.get(i).location.x+10 && mouseY >= enemyAttackTower.get(i).location.y && mouseY <= enemyAttackTower.get(i).location.y+10) {
        nr[2]=i;
        towerpicked[2]=true;
      }
    }
    for (int i = 0; i < base.size(); i++) {
      if (mouseX >= base.get(i).location.x && mouseX <= base.get(i).location.x+10 && mouseY >= base.get(i).location.y && mouseY <= base.get(i).location.y+10) {
        nr[3]=i;
        towerpicked[3]=true;
      }
    }
    for (int i = 0; i < energyTower.size(); i++) {
      if (mouseX >= energyTower.get(i).location.x && mouseX <= energyTower.get(i).location.x+10 && mouseY >= energyTower.get(i).location.y && mouseY <= energyTower.get(i).location.y+10) {
        nr[4]=i;
        towerpicked[4]=true;
=======
    for (int i = 0; i < tower.size(); i++) {
      if (tower.get(i).t == 14 && mouseX >= tower.get(i).location.x && mouseX <= tower.get(i).location.x+10 && mouseY >= tower.get(i).location.y && mouseY <= tower.get(i).location.y+10) {
        chosenTower = i;
        towerPicked = true;
>>>>>>> Player-og-enemy-enteration
      }
    }

    if (towerPicked && mousePressed && isMouseNotPressedGat)
    {
      newPlace(chosenTower);
      towerPicked=false; 
      GO = true;
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
        base.location.set(game.squareFeld.grid[mouseX/10][mouseY/10]);
      }
      towerPicked=false; 
      basePicked = true;
      GO = true;
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
    tower.get(i).location.set(game.squareFeld.grid[mouseX/10][mouseY/10]);
  }


  // vise range og energyrange
  // skrives om til at virke med kun en arrayliste
  void highLight() { 

    PVector location;

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
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);

      stroke(rageDisply, 0, 0);
      noFill();
      for (int i = -20; i <= 20; i++) {
        for (int j = -20; j <= 20; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }   
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      } 
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1.5);

      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
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
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);

      stroke(rageDisply, 0, 0);
      noFill();
      for (int i = -20; i <= 20; i++) {
        for (int j = -20; j <= 20; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }       
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      } 
      fill(255, 0, 0);
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
    } 
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
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);

      stroke(rageDisply, 0, 0);
      noFill();
      for (int i = -20; i <= 20; i++) {
        for (int j = -20; j <= 20; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }       
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }  
      fill(255, 255, 0);
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
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
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }    
      fill(0, 255, 255);
      for (int i = -2; i <= 2; i++) {
        for (int j = -2; j <= 2; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
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
      location = new PVector(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x, game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      stroke(rageDisply, rageDisply, 0);
      noFill();
      for (int i = -14; i <= 14; i++) {
        for (int j = -14; j <= 14; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      } 
      fill(0, 155, 0);
      stroke(0);
      for (int i = -3; i <= 3; i++) {
        for (int j = -3; j <= 3; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }  

      fill(0, 255, 0);
      rect(location.x, location.y, 10, 10);
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
      int x = int(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = int(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);
      tower.get(towernr - 1).location.set(loc);
      picked = 0;
      placeble = false;
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


      int x = int(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = int(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
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

      int x = int(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].x);
      int y = int(game.squareFeld.grid[(mouseX/10)][(mouseY/10)].y);
      PVector loc = new PVector(x, y);

      energyTower.get(eTowerNR-1).location.set(loc);  

      energyTower.get(eTowerNR-1).vis = 255;

      timer=0;      
      picked = 0;
      placebleEnergy = false;
    }
  }

  void towerDeteckt(Enemy[][] enemyArray) { 
    for (int i = 0; i < shotTower.size(); i++) {
      TowerAttackTerrtoriumShot s = shotTower.get(i);
      s.attack(enemyArray);
    }

    for (int i = 0; i < bombTower.size(); i++) {
      TowerAttackTerrtoriumBomb b = bombTower.get(i);
      b.attack(enemyArray);
    }
  }

  void towerRun() {




    for (int i = 0; i < energyTower.size(); i++) {
      TowerEnergy e = energyTower.get(i);
      e.run();
    }

     

    for (int i = 0; i < enemyAttackTower.size(); i++) {
      TowerAttackETowers e = enemyAttackTower.get(i);
      e.run();
    }
    for (int i = 0; i < tower.size(); i++) {
      Tower t = tower.get(i);
      t.Run();
    }    

    if (base != null)
    {
      base.run();
    }
  }

  void Run() {

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
