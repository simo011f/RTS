class Enemy
{
  PVector[][] pGrid;
  PVector location;

  int strength;

  Enemy(PVector spawn)
  {
    location = spawn;
    strength = 1;
    pGrid = game.squareFeld.grid;
  }

  void addLayer(int newStrength)
  {
    strength = newStrength;
  }
  
  void Draw()
  {
    rect(pGrid[(int)location.x][(int)location.y].x, pGrid[(int)location.x][(int)location.y].y, 10, 10);
  }
  
  void Update()
  {}
  
  void Run()
  {
    Update();
    Draw();
  }
}
