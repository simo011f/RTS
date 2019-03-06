class TowerAttackTerrtoriumBomb {  
  PVector location=new PVector(-100, -100);

  int t=-1;

  int build;
  int energybuild = 40;
  int energyConsomstion = 9;

  void weapon() {
  }

  void detection() {
  }

  void build() {   

    if (t==-3) {
      game.energy.energy.y = game.energy.energy.y-energybuild;
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
      game.energy.energy.y = game.energy.energy.y+energybuild-energyConsomstion; 

      t=14;
    }

    fill(15+(20*build), 0, 0);
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
