class Emitter implements Visualize //<>// //<>//
{
  PVector[][] pGrid;
  PVector location;

  int power;
  int delay;
  int timer = 0;

  boolean isDead = false;

  Emitter()
  {
  }

  Emitter(PVector spawn, int sDelay, int sPower)
  {
    location = spawn;
    delay = sDelay;
    power = sPower;
  }

  Emitter(PVector spawn, int sDelay, int sPower, EnemyGrid enemys) 
  {
    location = spawn;
    delay = sDelay;
    pGrid = game.squareFeld.grid;
    power = sPower;
    enemys.enemys[(int)spawn.x][(int)spawn.y].strength = 1;
    visualizer.add(this);
  }



  void visualize()
  {
    fill(200, 200, 25, 150);
    stroke(200, 100, 0);
    image(emitterImg, ((int)location.x - 1) * 10, ((int)location.y - 1) * 10, 30, 30);
  }
  
  void Draw()
  {
    fill(200, 200, 25, 150);
    stroke(200, 100, 0);
    image(emitterImg, ((int)location.x - 1) * 10, ((int)location.y - 1) * 10, 30, 30);
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
}
