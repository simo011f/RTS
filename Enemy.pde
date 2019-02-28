class Enemy  //<>// //<>// //<>// //<>// //<>//
{
  PVector[][] pGrid;
  PVector location;

  PVector north;
  PVector south;
  PVector east;
  PVector west;

  boolean spredDonNorth = false;
  boolean spredDonSouth = false;
  boolean spredDonEast = false;
  boolean spredDonWest = false;

  Enemy[] freindNESW = new Enemy[4];

  int scale = 10;
  int strength;

  Enemy() {
  }

  Enemy(PVector spawn)
  {
    game.squareFeld.ocupied[(int)spawn.x][(int)spawn.y] = 1;
    location = spawn;
    strength = 1;
    for (int i = 0; i < freindNESW.length; i++)
    {
      freindNESW[i] = new Enemy();
    }
  }

  Enemy(PVector spawn, int spawnStrength)
  {
    game.squareFeld.ocupied[(int)spawn.x][(int)spawn.y] = 1;
    location = spawn;
    strength = spawnStrength;
    for (int i = 0; i < freindNESW.length; i++)
    {
      freindNESW[i] = new Enemy();
    }
  }


  void addLayer(int newStrength)
  {
    strength += newStrength;
  }

  void addLayer()
  {
    strength++;
  }

  void spread(ArrayList<Enemy> enemys)
  {
    north =  new PVector(location.x, location.y - 1);
    south = new PVector(location.x, location.y + 1);
    east = new PVector(location.x + 1, location.y);
    west = new PVector(location.x - 1, location.y);

    spredLayer(enemys);
  }

  void spredLayer(ArrayList<Enemy> enemys) {
    for (int i = 0; i < enemys.size(); i++) {
      Enemy e = enemys.get(i);
      if (e != this) {
        spredDonNorth = false;
        spredDonSouth = false;
        spredDonEast = false;
        spredDonWest = false;

        int amount = 1;
        //if (strength > e.strength + 10)
        //{
        //  amount = 2;
        //}
        //if (strength > e.strength + 100)
        //{
        //  amount = 3;
        //}
        
        if (strength >= 5) {
          if (north.y > 0) {
            if ((int)north.x == (int)e.location.x && (int)north.y == (int)e.location.y && strength > e.strength)
            {
              strength -= amount;
              enemys.get(i).addLayer(amount);
              spredDonNorth = true;
            } else if (!spredDonNorth && game.squareFeld.ocupied[(int)north.x][(int)north.y] == 0)
            {
              strength -= amount;
              enemys.add(new Enemy(north));
            }
          }

          if (south.y < game.squareFeld.rows) {
            if ((int)south.x == (int)e.location.x && (int)south.y == (int)e.location.y  && strength > e.strength)
            {
              strength -= amount;
              enemys.get(i).addLayer(amount);
              spredDonSouth = true;
            } else if (!spredDonSouth && game.squareFeld.ocupied[(int)south.x][(int)south.y] == 0)
            {
              strength -= amount;
              enemys.add(new Enemy(south));
            }
          }

          if (east.x < game.squareFeld.cols) {
            if ((int)east.x == (int)e.location.x && (int)east.y == e.location.y  && strength > e.strength)
            {
              strength -= amount;
              enemys.get(i).addLayer(amount);
              spredDonEast = true;
            } else if (!spredDonEast && game.squareFeld.ocupied[(int)east.x][(int)east.y] == 0)
            {
              strength -= amount;
              enemys.add(new Enemy(east));
            }
          }

          if (west.x > 0) {
            if ((int)west.x == (int)e.location.x && (int)west.y == (int)e.location.y  && strength > e.strength)
            {
              strength -= amount;
              enemys.get(i).addLayer(amount);
              spredDonWest = true;
            } else if (!spredDonWest && game.squareFeld.ocupied[(int)west.x][(int)west.y] == 0)
            {
              strength -= amount;
              enemys.add(new Enemy(west));
            }
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
