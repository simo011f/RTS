class TowerAttackTerrtoriumShot {  
  PVector location=new PVector(-100, -100);

  int t=-2;

  int build;

  void weapon() {
  }

  void detection() {
  }

  void build() {   

    if (t==-3) {
      game.energy.energy.y = game.energy.energy.y-40;
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
      game.energy.energy.y = game.energy.energy.y+40; 
     
      t=14;
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
