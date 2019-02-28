class Player { //<>// //<>// //<>//

  int timer;
  int [] towernr = new int[3]; 
  int [] towernrremeber = new int[3];
  ArrayList<TowerAttackTerrtoriumShot> shotTower = new ArrayList<TowerAttackTerrtoriumShot>();
  ArrayList<TowerAttackTerrtoriumBomb> bombTower = new ArrayList<TowerAttackTerrtoriumBomb>();
  ArrayList<TowerAttackETowers> enemyAttackTower = new ArrayList<TowerAttackETowers>();
  boolean[] towerpickedOnBar = new boolean[4];  
  int picked;
  boolean[] placeble = new boolean[4];

  boolean GO = false;

  Player() {
  }

  void tower() {
  }

  void PickTowerOnBar() { 
    timer++;

    //blå
    if (mouseX>= width/2-15 && mouseX<=width/2+15 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
      towerpickedOnBar[0]=true;
    } else {
      towerpickedOnBar[0]=false; //<>//
    }
    if (towerpickedOnBar[0] && mousePressed) {   
      towernr[0]=towernr[0]+1;

      shotTower.add(new TowerAttackTerrtoriumShot());
      timer=0; 
      picked=1;
      placeble[0]=true;
      towerpickedOnBar[0]=false;
    }


    //rød
    if (mouseX>= width/2-35 && mouseX<=width/2+65 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
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
    }

    //grøn
    if (mouseX>= width/2+70 && mouseX<=width/2+105 && mouseY>=height-55 && mouseY<=height-25 && timer>=10) { 
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
      fill(0, 255, 0);
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          rect(location.x+i*10, location.y+j*10, 10, 10);
        }
      }
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

      println(shotTower.get(towernr[0]-1));   
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


      timer=0;      
      picked = 0;
      placeble[2] = false;
    }
  }

  void run() {
    PickTowerOnBar();   
    highLight();   
    place(); 

    for (int i = 0; i < shotTower.size(); i++) {
      TowerAttackTerrtoriumShot s = shotTower.get(i);
      s.run();
    }    
    for (int i = 0; i < bombTower.size(); i++) {
      TowerAttackTerrtoriumBomb b =bombTower.get(i);
      b.run();
    }  
    for (int i = 0; i < enemyAttackTower.size(); i++) {
      TowerAttackETowers e =enemyAttackTower.get(i);
      e.run();
    }




    println(shotTower.size(), towernr[0], placeble[1], towerpickedOnBar[1]);

    if (timer >= 20) {
      timer = 20;
    }
  }
}




class TowerAttackTerrtoriumShot {  
  PVector location=new PVector(width/2, height-45);

  void weapon() {
  }

  void detection() {
  }

  void highLight() {   

    fill(0, 0, 255);
    stroke(0);
    strokeWeight(1.5);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  void run() { 

    highLight();
    weapon();
    detection();
  }
}

class TowerAttackTerrtoriumBomb {  
  PVector location=new PVector(width/2+35, height-45);

  void weapon() {
  }

  void detection() {
  }

  void highLight() {   

    fill(255, 0, 0);
    stroke(0);
    strokeWeight(1.5);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  void run() { 
    highLight();
    weapon();
    detection();
  }
}

class TowerAttackETowers {
  PVector location=new PVector(width/2+70, height-45);

  void weapon() {
  }

  void detection() {
  }

  void highLight() {   

    fill(0, 255, 0);
    stroke(0);
    strokeWeight(1.5);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  void run() { 
    highLight();
    weapon();
    detection();
  }
}
