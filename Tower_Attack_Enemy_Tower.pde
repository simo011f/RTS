class TowerAttackETowers {
  PVector location=new PVector(-100, -100);


  int t=-1;

  int build;

  void weapon() {
  }

  void detection() {
  }

  void build() {   

    t++;
    if (t<=12&&t>=0) {
      t++;
    }


    if (t>=12) {
      build++;
      t=0;
    }
    if (build>=12) {
      build=12;
      t=13;
    }


    fill(15+(20*build), 15+(20*build), 0);
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

    if (t==13) { 
      weapon();
      detection();
    }
  }
}
