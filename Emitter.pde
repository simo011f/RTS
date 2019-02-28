class Emitter
{
  PVector[][] pGrid;
  PVector location;

  int power;
  int delay;

  boolean isDead = false;

  Emitter(PVector spawn, int sDelay) 
  {
    location = spawn;
    delay = sDelay;
    pGrid = game.squareFeld.grid;
  }



  void Draw()
  {
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; i++)
      {
        fill(0, 255, 0);
        rect(pGrid[(int)location.x][(int)location.y].x, pGrid[(int)location.x][(int)location.y].y, 10, 10);
      }
    }
  }

  void Update() 
  {

  }

  void Run() 
  {
    Update();
    Draw();
  }
}
