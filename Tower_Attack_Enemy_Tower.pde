class TowerAttackETowers  extends Tower
{
  int energybuild = 40;
  int cooldown;

  boolean shoot = false;

  TowerAttackETowers()
  {
    super();
    underCunstruction = 0;
    cunstructionEnergyConsomstion = 30;
    energyConsomstion = 100;
    range = 10;
  }


  void weapon(ArrayList<Emitter> emitters) {
    for (Emitter emitter : emitters) {
      if(emitterInRange(emitter) == null)
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
    fill(15+(20*underCunstruction), 15+(20*underCunstruction), 0);
    super.Build();
  }

}
