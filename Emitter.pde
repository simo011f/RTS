class Emitter  //<>//
{
  PVector[][] pGrid;
  PVector location;

  int power;
  int delay;
  int timer = 0;

  boolean isDead = false;

  Emitter(PVector spawn, int sDelay, int sPower, EnemyGrid enemys) 
  {
    location = spawn;
    delay = sDelay;
    pGrid = game.squareFeld.grid;
    power = sPower;
    enemys.enemys[(int)spawn.x][(int)spawn.y].strength = 1;
  }



  void Draw()
  {
    fill(0, 255, 0, 100);
    //for (int i = 0; i <= 2; i++)
    //{
    //  for (int j = 0; j <= 2; i++)
    //  {

        rect((int)location.x*10, (int)location.y*10, 10, 10);
      }
  //  }
  //}

  void Update(EnemyGrid enemys) 
  {

    if (delay > timer)
    {
      timer++;
    }
    if (delay <= timer) {
      enemys.enemys[(int)location.x][(int)location.y].addLayer(power);
      timer = 0;
    }
  }

  void Run() 
  {
    Draw();
  }
}
