class TowerAttackTerrtoriumShot {  
  PVector location=new PVector(-100, -100);
  PVector inRange = new PVector(0, 0);

  int life;

  int t=-2;

  int build;
  int energybuild = 40;
  int energyConsomstion = 3;

  boolean conected=false;

  int range = 20;

  void weapon() {
  }

  void detection() {
    for (int i = -range; i <= range; i++) {
      for (int j = -range; j <= range; j++) {
        if (enemyArray[i][j].strength > 0) {
          inRange = new PVector(i*10, j*10);
        }
      }
    }
  }

  void build() {   

    if (conected && game.energy.energyTotal > 0) {
      if (t==-3) {
        game.energy.energyUsed = game.energy.energyUsed-energybuild;
        t=11;
      }

      if (t<=11&&t>=-1) { 
        t--;
      }


      if (t<=-1) {
        build++;
        t=11;
      }
      if (build==11) {
        build=12;
        t=13;
      }
      if (t==13) { 
        game.energy.energyUsed = game.energy.energyUsed+energybuild-energyConsomstion; 

        t=14;
      }
    }

    fill(0, 0, 15+(20*build));
    stroke(0);
    strokeWeight(1.5);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  void run() { 

    build();

    if (t==14) { 
      weapon();
      detection();
    }
  }
}
