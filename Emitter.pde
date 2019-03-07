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
    fill(200, 200, 25, 150);
    stroke(200,100,0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(((int)location.x + i) * 10, ((int)location.y + j) * 10, 10, 10);
      }
    }
  }

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
