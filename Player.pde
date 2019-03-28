class Player  //<>// //<>// //<>// //<>// //<>//
{

  Energy energyNetwork;

  int timer;
  int towernr; 

  //skal kigges på igen
  int eTowerNR;

  int [] towernrremeber = new int[5];

  ArrayList<Tower> tower = new ArrayList<Tower>();


  TowerBase base;
  ArrayList<TowerEnergy> energyTowers = new ArrayList<TowerEnergy>();

  boolean[] towerpickedOnBar = new boolean[5];    
  boolean towerPicked = false; 
  boolean basePicked = false;

  int picked;

  boolean placeble;
  boolean placebleEnergy;
  boolean placebleBase;

  boolean GO = false;

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

      energyTowers.add(new TowerEnergy());
      timer=0; 
      picked=5;
      placebleEnergy=true;
      energyTowers.get(eTowerNR - 1).vis = 0;
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

  void drawHotbar() {
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

      energyTowers.get(eTowerNR-1).location.set(loc);  

      energyTowers.get(eTowerNR-1).vis = 255;

      timer=0;      
      picked = 0;
      placebleEnergy = false;

      energyNetwork.energyPruduktionArera(energyTowers);
    }
  }

  void towerDeteckt(Enemy[][] enemyArray) { 
    for (int i = 0; i < tower.size(); i++) {
      Tower t = tower.get(i);
      t.attack(enemyArray);
    }
  }

  void towerRun() {

    for (int i = 0; i < energyTowers.size(); i++) {
      TowerEnergy e = energyTowers.get(i);
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
