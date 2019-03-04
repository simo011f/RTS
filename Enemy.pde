class Enemy  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
{
  PVector[][] pGrid;
  PVector location;

  PVector north;
  PVector south;
  PVector east;
  PVector west;

  boolean spredNorth = false;
  boolean spredSouth = false;
  boolean spredEast = false;
  boolean spredWest = false;


  int scale = 10;
  int strength;

  Enemy() {
  }

  Enemy(PVector spawn)
  {
    game.squareFeld.ocupied[(int)spawn.x][(int)spawn.y] = 1;
    location = spawn;
    strength = 1;
  }

  Enemy(PVector spawn, int spawnStrength)
  {
    game.squareFeld.ocupied[(int)spawn.x][(int)spawn.y] = 1;
    location = spawn;
    strength = spawnStrength;
  }


  void addLayer(int newStrength)
  {
    strength += newStrength;
  }

  void addLayer()
  {
    strength++;
  }

  void spread(ArrayList<Enemy> enemys, int enemysThisUpdate)
  {
    north =  new PVector(location.x, location.y - 1);
    south = new PVector(location.x, location.y + 1);
    east = new PVector(location.x + 1, location.y);
    west = new PVector(location.x - 1, location.y);
    int N;
    int S;
    int E;
    int W;




    spredNewLayer(enemys, enemysThisUpdate);
  }



  void spredNewLayer(ArrayList<Enemy> enemys, int enemysThisUpdate) {
    for (int i = 0; i < enemysThisUpdate; i++) {
      Enemy e = enemys.get(i);
      if (e != this) {

        spredNorth = false;
        spredSouth = false;
        spredEast = false;
        spredWest = false;

        if (strength >= 5) {
          if ((int)location.y > 0 && game.squareFeld.ocupied[(int)location.x][(int)location.y - 1] == 0)
          {
            strength--;
            enemys.add(new Enemy(new PVector((int)location.x, (int)location.y - 1)));
          } else if ((int)location.y > 0 && game.squareFeld.ocupied[(int)location.x][(int)location.y - 1] == 1)
          {
            strength--;
            e.addLayer();
          }

          if ((int)location.y < game.squareFeld.rows - 1 && game.squareFeld.ocupied[(int)location.x][(int)location.y + 1] == 0)
          {
            strength--;
            enemys.add(new Enemy(new PVector((int)location.x, (int)location.y + 1)));
          } else if ((int)location.y < game.squareFeld.rows - 1 && game.squareFeld.ocupied[(int)location.x][(int)location.y + 1] == 1)
          {
            strength--;
            e.addLayer();
          }

          if ((int)location.x > 0 && game.squareFeld.ocupied[(int)location.x - 1][(int)location.y] == 0)
          {
            strength--;
            enemys.add(new Enemy(new PVector((int)location.x - 1, (int)location.y)));
          } else if ((int)location.x > 0 && game.squareFeld.ocupied[(int)location.x - 1][(int)location.y] == 1)
          {
            strength--;
            e.addLayer();
          }

          if ((int)location.x < game.squareFeld.cols - 1 && game.squareFeld.ocupied[(int)location.x + 1][(int)location.y] == 0)
          {
            strength--;
            enemys.add(new Enemy(new PVector((int)location.x + 1, (int)location.y)));
          } else if ((int)location.x < game.squareFeld.cols - 1 && game.squareFeld.ocupied[(int)location.x + 1][(int)location.y] == 1)
          {
            strength--;
            e.addLayer();
          }
        }
      }
    }
  }





  void Draw()
  {
    fill(0, 0, 255);
    rect(game.squareFeld.grid[(int)location.x][(int)location.y].x, game.squareFeld.grid[(int)location.x][(int)location.y].y, 10, 10);

    fill(0);
    textAlign(CENTER);  
    textSize(10);
    text(strength, game.squareFeld.grid[(int)location.x][(int)location.y].x+5, game.squareFeld.grid[(int)location.x][(int)location.y].y+10);
  }

  void Update()
  {
    //spread(game.baseLevel.enemys);
  }

  void Run()
  {
    Update();
    Draw();
  }
}
