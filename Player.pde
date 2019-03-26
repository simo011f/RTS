class Player  //<>//
{

  int timer;
  int [] towernr = new int[5]; 
  int [] towernrremeber = new int[5];
  ArrayList<TowerAttackTerrtoriumShot> shotTower = new ArrayList<TowerAttackTerrtoriumShot>();
  ArrayList<TowerAttackTerrtoriumBomb> bombTower = new ArrayList<TowerAttackTerrtoriumBomb>();
  ArrayList<TowerAttackETowers> enemyAttackTower = new ArrayList<TowerAttackETowers>(); 
  ArrayList<TowerBase> base = new ArrayList<TowerBase>();
  ArrayList<TowerEnergy> energyTower = new ArrayList<TowerEnergy>();
  boolean[] towerpickedOnBar = new boolean[5];    
  boolean[] towerpicked = new boolean[5]; 
  int picked;
  boolean[] placeble = new boolean[5];
  boolean[] placeble2 = new boolean[5];

  boolean GO = false;
  int [] nr = new int[5];
  int rageDisply = 195;

  Player() {
  }

  void tower() {
  }

  void PickTowerOnBar() { 
    timer++;

    //blå
    if (mouseX>= width/2-10 && mouseX<=width/2+20 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[0]=true;
    } else {
      towerpickedOnBar[0]=false;
    }
    if (towerpickedOnBar[0] && mousePressed) {   
      towernr[0]=towernr[0]+1;

      shotTower.add(new TowerAttackTerrtoriumShot());
      timer=0; 
      picked=1;
      placeble[0]=true;
      towerpickedOnBar[0]=false; 
      GO = true;
    }


    //rød
    if (mouseX>= width/2+25 && mouseX<=width/2+55 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[1]=true;
    } else {
      towerpickedOnBar[1]=false;
    }
    if (towerpickedOnBar[1] && mousePressed) {   
      towernr[1]=towernr[1]+1;

      bombTower.add(new TowerAttackTerrtoriumBomb());
      timer=0; 
      picked=2;
      placeble[1]=true;
      towerpickedOnBar[1]=false;   
      GO = true;
    }

    //gul
    if (mouseX>= width/2+60 && mouseX<=width/2+90 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[2]=true;
    } else {
      towerpickedOnBar[2]=false;
    }
    if (towerpickedOnBar[2] && mousePressed) {   
      towernr[2]=towernr[2]+1;

      enemyAttackTower.add(new TowerAttackETowers());
      timer=0; 
      picked=3;
      placeble[2]=true;
      towerpickedOnBar[2]=false;   

      GO = true;
    }

    //tukis
    if (mouseX>= width/2+140 && mouseX<=width/2+190 && mouseY>=height-65 && mouseY<=height-15 && timer>=10) { 
      towerpickedOnBar[3]=true;
    } else {
      towerpickedOnBar[3]=false;
    }
    if (towerpickedOnBar[3] && mousePressed) {   
      towernr[3]=towernr[3]+1;

      base.add(new TowerBase());
      timer=0; 
      picked=4;
      placeble[3]=true;
      towerpickedOnBar[3]=false; 
      GO = true;
    }

    //grøn
    if (mouseX >= width/2+215 && mouseX<=width/2+225 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[4]=true;
    } else {
      towerpickedOnBar[4]=false;
    }
    if (towerpickedOnBar[4] && mousePressed) {   
      towernr[4]=towernr[4]+1;

      energyTower.add(new TowerEnergy());
      timer=0; 
      picked=5;
      placeble[4]=true;
      energyTower.get(towernr[4]-1).vis = 0;
      towerpickedOnBar[4]=false; 
      GO = true;
      //GO = true;
    }
  }

  void gat() {

    if (mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) {
      towerpicked[0]=false; 
      towerpicked[1]=false; 
      towerpicked[2]=false;  
      towerpicked[3]=false; 
      towerpicked[4]=false;
    }

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
      }
    }


    if (towerpicked[0] && mousePressed && timer>=10) {

      placeble2[0]=true; 
      timer=0;
      picked=1; 
      towerpicked[0]=false; 
      GO = true;
    }
    if (towerpicked[1] && mousePressed && timer>=10) {

      placeble2[1]=true; 
      timer=0;
      picked=2; 
      towerpicked[1]=false; 
      GO = true;
    }
    if (towerpicked[2] && mousePressed && timer>=10) {

      placeble2[2]=true; 
      timer=0;
      picked=3; 
      towerpicked[2]=false; 
      GO = true;
    }
    if (towerpicked[3] && mousePressed && timer>=10) {

      placeble2[3]=true; 
      timer=0;
      picked=4; 
      towerpicked[3]=false; 
      GO = true;
    }

    if (towerpicked[4] && mousePressed && timer>=10) {

      placeble2[4]=true; 
      timer=0;

      towerpicked[4]=false;
    }
    if (placeble2[0]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      shotTower.get(nr[0]).location.set(loc);  
      shotTower.get(nr[0]).t=-3;
      shotTower.get(nr[0]).build=0;
      timer=0;      
      picked = 0;
      placeble2[0] = false;
    }  
    if (placeble2[1]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      bombTower.get(nr[1]).location.set(loc);  
      bombTower.get(nr[1]).t=-3;
      bombTower.get(nr[1]).build=0;

      timer=0;      
      picked = 0;
      placeble2[1] = false;
    }  
    if (placeble2[2]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      enemyAttackTower.get(nr[2]).location.set(loc);  
      enemyAttackTower.get(nr[2]).t=-3;
      enemyAttackTower.get(nr[2]).build=0;

      timer=0;      
      picked = 0;
      placeble2[2] = false;
    }

    if (placeble2[3]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      base.get(nr[3]).location.set(loc);  


      timer=0;      
      picked = 0;
      placeble2[3] = false;
    }

    if (placeble2[4]  && keys[3] && timer>=10) {
      if (nr[4]==0) { 
        energyTower.get(nr[4]).conected=false;
        if (towernr[3]>=1) {
          base.get(towernr[3]-1).conected=false;
        }
      } 
      if (nr[4]==1) {   
        energyTower.get(nr[4]-1).conected=false;  
        energyTower.get(nr[4]).conected=false;
        if (towernr[3]>=1) {
          base.get(towernr[3]-1).conected=false;
        }
      } 
      if (nr[4]>1) {
        energyTower.get(nr[4]-1).conected=false;
        energyTower.get(nr[4]+1).conected=false; 
        energyTower.get(nr[4]).conected=false; 
        if (towernr[3]>=1) {
          base.get(towernr[3]-1).conected=false;
        }
      }
      energyTower.remove(nr[4]);
      towernr[4]=towernr[4]-1;
      timer=0;      
      picked = 0;
      placeble2[4] = false;
    }  
    //if (placeble2[3]  && keys[3] && timer>=10) {
    //  energyTower.remove(nr[3]);
    //  towernr[3]=towernr[3]-1;
    //  timer=0;      
    //  picked = 0;
    //  placeble2[3] = false;
    //}
    //if (placeble2[2]  && keys[3] && timer>=10) {
    //  energyTower.remove(nr[2]);
    //  towernr[2]=towernr[2]-1;
    //  timer=0;      
    //  picked = 0;
    //  placeble2[2] = false;
    //}
    //if (placeble2[1]  && keys[3] && timer>=10) {
    //  energyTower.remove(nr[1]);
    //  towernr[1]=towernr[1]-1;
    //  timer=0;      
    //  picked = 0;
    //  placeble2[1] = false;
    //}
    //if (placeble2[0]  && keys[3] && timer>=10) {
    //  energyTower.remove(nr[0]);
    //  towernr[0]=towernr[0]-1;
    //  timer=0;      
    //  picked = 0;
    //  placeble2[0] = false;
    //}
    if (mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) {
      placeble2[4] = false; 
      timer=0;
    }
  }



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

    if (placeble[0]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      shotTower.get(towernr[0]-1).location.set(loc);  
      shotTower.get(towernr[0]-1).t=-3;

      timer=0;      
      picked = 0;
      placeble[0] = false;
    }  
    if (placeble[1]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      bombTower.get(towernr[1]-1).location.set(loc);  
      bombTower.get(towernr[1]-1).t=-3;

      timer=0;      
      picked = 0;
      placeble[1] = false;
    }  
    if (placeble[2]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      enemyAttackTower.get(towernr[2]-1).location.set(loc);  
      enemyAttackTower.get(towernr[2]-1).t=-3 ;

      timer=0;      
      picked = 0;
      placeble[2] = false;
    }

    if (placeble[3]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      base.get(towernr[3]-1).location.set(loc);  


      timer=0;      
      picked = 0;
      placeble[3] = false;
    }
    if (placeble[4]  && mousePressed && mouseX >= 0 && mouseX<=width && mouseY>=0 && mouseY<=height-61 && timer>=10) { 

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

      energyTower.get(towernr[4]-1).location.set(loc);  

      energyTower.get(towernr[4]-1).vis = 255;

      timer=0;      
      picked = 0;
      placeble[4] = false;
    }
  }

  void towerRun()
  {
    if (keys[0]) {
      gat();
    }
    for (int i = 0; i < energyTower.size(); i++) {
      TowerEnergy e = energyTower.get(i);
      e.run();
    }
    for (int i = 0; i < shotTower.size(); i++) {
      TowerAttackTerrtoriumShot s = shotTower.get(i);
      s.run();
    }    

    for (int i = 0; i < bombTower.size(); i++) {
      TowerAttackTerrtoriumBomb b = bombTower.get(i);
      b.run();
    }  

    for (int i = 0; i < enemyAttackTower.size(); i++) {
      TowerAttackETowers e = enemyAttackTower.get(i);
      e.run();
    }

    for (int i = 0; i < base.size(); i++) {
      TowerBase  b = base.get(i);
      b.run();
    }
  }



  void Run() {

    PickTowerOnBar();   
    highLight();   

    place();  
    towerRun();
    //////println(shotTower.size(), towernr[0], placeble[1], towerpickedOnBar[1], picked, width/2+215, mouseX);
    if (timer >= 20) {
      timer = 20;
    }
  }
}
