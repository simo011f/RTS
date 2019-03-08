class Enemy   //<>// //<>// //<>//
{
  int strength;
  int terrainHeight;

  Enemy() {
    strength = -100;
  }

  Enemy(PVector spawn)
  {
    game.squareFeld.ocupied[(int)spawn.x][(int)spawn.y] = 1;
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
