class Enemy //<>//
{
  int strength;
  int terrainHeight;
  int updateNR;

  Enemy() {
    strength = -100;
    updateNR=0;
    terrainHeight= -1;
  }

  Enemy(PVector spawn)
  {
    strength = -100;
    updateNR=0;
    terrainHeight = (int)spawn.z;
  }

  void addLayer()
  {
    strength++;
  }

  void addLayer(int addStrength)
  {
    strength += addStrength;
  }
  
  void updateNumber(int u) {

    updateNR=u;
  }
}
