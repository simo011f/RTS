class TowerAttackEmitters  extends Tower {
  int energybuild = 40;
  int cooldown;

  boolean shoot = false;

  TowerAttackEmitters()
  {
    super();
    underCunstruction = 0;
    cunstructionEnergyConsomstion = 30;
    energyConsomstion = 100;
    range = 10;
    cunstructionTime=20;
    leif = 1;
    maxLeif = 25; 
    leifRegen = 2; 
  }


  void weapon(ArrayList<Emitter> emitters) {
    for (Emitter emitter : emitters) {
      if (emitterInRange(emitter) == null)
      {
        continue;
      }
      emitter.isDead = true;
      isDead = true;
    }
  }


  PVector emitterInRange(Emitter emitter) {

    for (int i = -range; i <= range; ++i) {
      for (int j = -range; j <= range; ++j) {
        if (emitter.location.x == location.x + i && emitter.location.y == location.y + j) {
          energyConsomstion = 100;
          return emitter.location;
        }
      }
    }
    energyConsomstion = 0;
    return null;
  }

  void attack(ArrayList<Emitter> emitters) {
    if (!isBuild()) { 
      return ;
    }
    weapon(emitters);
  }

  void Build() {  
    Draw();
    super.Build();
  }

  void Draw()
  {
    fill(15+(20*underCunstruction), 15+(20*underCunstruction), 0);
    super.Draw();
  }
  void Run() {


    Build();
  }
}
