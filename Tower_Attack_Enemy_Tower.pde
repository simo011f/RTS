//class TowerAttackETowers  extends Tower
//{
//  PVector location=new PVector(-100, -100);

//  int life;

//  int t=-2;

//  int build;
//  int energybuild = 50;
//  int energyConsomstion = 9;

//  boolean conected=false;

//  void weapon() {
//  }

//  void detection() {
//  }
/*
  void build() {  
    
    fill(15+(20*build), 15+(20*build), 0);
     stroke(0);
     strokeWeight(1.5);
     
     for (int i = -1; i <= 1; i++) {
     for (int j = -1; j <= 1; j++) {
     rect(location.x+i*10, location.y+j*10, 10, 10);
     }
     }
     
     if (!conected && game.energy.energyTotal <= 0) {
     return;
     }
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

  boolean ready() { 
    if (t==14) {
      return true;
    } else {
      return false;
    }
  }

//  void build() {  
    
//    fill(15+(20*build), 15+(20*build), 0);
//    stroke(0);
//    strokeWeight(1.5);

//    for (int i = -1; i <= 1; i++) {
//      for (int j = -1; j <= 1; j++) {
//        rect(location.x+i*10, location.y+j*10, 10, 10);
//      }
//    }

//    if (!conected && game.energy.energyTotal <= 0) {
//      return;
//    }
//    if (t==-3) {
//      game.energy.energyUsed = game.energy.energyUsed-energybuild;
//      t=11;
//    }

//    if (t<=11&&t>=-1) { 
//      t--;
//    }


//    if (t<=-1) {
//      build++;
//      t=11;
//    }
//    if (build==11) {
//      build=12;
//      t=13;
//    }
//    if (t==13) { 
//      game.energy.energyUsed = game.energy.energyUsed+energybuild-energyConsomstion; 

//      t=14;
//    }
//  }
//  boolean ready() { 
//    if (t==14) {
//      return true;
//    } else {
//      return false;
//    }
//  }
>>>>>>> origin/Tower-Energy-to-Tower

//  void run() { 
//    build();
//    if (ready()) {
//      weapon();
//    }
//  }
//}
*/
