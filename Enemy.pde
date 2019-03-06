class Enemy   //<>//
{
  int strength;

  Enemy() {
    strength = -1;
  }

  Enemy(PVector spawn)
  {
    game.squareFeld.ocupied[(int)spawn.x][(int)spawn.y] = 1;

    strength = -1;
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
