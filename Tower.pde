class Tower {   //<>//
  PVector location=new PVector(-100, -100);


  int life;

  //build timer
  int t=-2;

  int build;
  int energybuild = 40;
  int energyConsomstion = 3;

  boolean conected=false;

  int range = 20;

  void weapon(Enemy[][] enemyArray) {
  }

  PVector detection(Enemy[][] enemyArray) {
    PVector closest = new PVector();
    return closest;
  }

  void attack(Enemy[][] enemyArray) {
    if (!ready()) { 
      return ;
    }
    weapon(enemyArray);
    detection(enemyArray);
  }

  void Build() {



    stroke(0);
    strokeWeight(1.5);


    rect((location.x - 10), (location.y - 10), 30, 30);




    if (conected == false) {
      return;
    }
    if (game.energy.energyTotal < 0)
    {
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
  void Run() {

    Build();
  }
}
