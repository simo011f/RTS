class Tower {  
  PVector location;


  int life;

  //build timer
  int t=-2;

  int underCunstructoin;

  int energyConsomstion;

  boolean conected = false;

  int range = 20;
  
  Tower()
  {
    location = new PVector(-10,-10);
  }

  void weapon(Enemy[][] enemyArray) {
  }

  PVector detection(Enemy[][] enemyArray) {
    PVector closest = new PVector(-20, -20);
    return closest;
  }

  void attack(Enemy[][] enemyArray) {
    if (!isBuild()) { 
      return ;
    }
    weapon(enemyArray);
    detection(enemyArray);
  }



  void Build() {
    stroke(0);
    strokeWeight(1.5);
    rect((location.x*10 - 10), (location.y*10 - 10), 30, 30);

    if (conected == false) {
      return;
    }

    if (game.player.energyNetwork.totalEnergy < 0)
    {
      return;
    }

    if (t==-3) {
      //game.energy.energyUsed = game.energy.energyUsed-energybuild;
      t=11;
    }

    if (t<=11&&t>=-1) { 
      t--;
    }

    if (t<=-1) {
      underCunstructoin++;
      t=11;
    }

    if (underCunstructoin==11) {
      underCunstructoin=12;
      t=13;
    }

    if (t==13) { 


      //game.energy.energyUsed = game.energy.energyUsed+energybuild-energyConsomstion; 
      t=14;
    }
  }



  boolean isBuild () { 
    if (t==14) {
      return true;
    } else {
      return false;
    }
  }


  void Run() {


    Build();
  }
}
