class LevelOne extends BaseLevel
{
  Emitter emitter;

  LevelOne() {
  }

  LevelOne(PVector[][] grid) 
  {
    super(grid);
    emitter = new Emitter(new PVector(cols/2, rows/2), 1, 10, enemys);
    enemys.enemys[cols/2][rows/2].strength = 10000;
    //enemys.enemys[cols-1][rows-1].strength = 10000;
    //enemys.enemys[cols-1][0].strength = 10000;
    //enemys.enemys[0][rows-1].strength = 10000;
    //enemys.enemys[1][1].strength = 10000;
  }

  void enemyRun()
  {
    emitter.Update(enemys);
    super.enemyRun();
    emitter.Draw();
  }
}
