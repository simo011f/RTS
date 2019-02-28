class BaseLevel //<>// //<>//
{
  ArrayList<Enemy> enemys = new ArrayList<Enemy>();

  int scale = 10;  

  int cols = width/scale;
  int rows = height/scale;

  //kan fjernes
  int hej = 0;

  BaseLevel()
  {
    enemys.add(new Enemy(new PVector((cols/2), (rows/2))));
    enemys.add(new Enemy(new PVector(0, 0)));
    enemys.get(0).addLayer(10000);
    enemys.get(1).addLayer(1000);
    //println("enemy "+0+" strength "+enemys.get(0).strength +" " + enemys.get(0).location);
  }


  void fieldDraw() {   
    //this draws the stuff
    //Maybe an array of variables would have been better
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {

        int x = i*scale;
        int y = j*scale;
        fill(255);
        stroke(0);
        strokeWeight(1);
        rect(x, y, scale, scale);
      }
    }
  }

  void Draw()
  {
    fieldDraw();
    for (int i = 0; i < enemys.size(); i++)
    {
      Enemy e = enemys.get(i);
      e.Draw();
    }
  }

  void Update()
  {
    for (int i = 0; i < enemys.size(); i++)
    {
      Enemy e = enemys.get(i);
      e.spread(enemys);
      e.Update();
    }
  }

  void Run()
  {
    Update();
    Draw();
    hej++;
    //if (hej >= 20) {exit();}
  }
}
