class Enemy   //<>// //<>//
{
  int strength;
  int terrainHeight;

  Enemy() {
    strength = -100;
    terrainHeight= -1;
  }

  Enemy(PVector spawn)
  {
    strength = -100;
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
}
