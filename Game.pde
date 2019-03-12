class Game {
  int gameContinue = 0;
  boolean win = false;
  int nr = 0;
  int loc = 0;  
  int lvlcode = 0;

  int scale = 10;
  int cols = width / scale;
  int rows = (height / scale) - 6;

  //these are all the classes: 

  SquareField squareFeld = new SquareField();
  Timer timer = new Timer();
  Menu menu = new Menu();
  LoadGame loadGame =  new LoadGame();
  KeyMenu keyMenu = new KeyMenu();


  EscMenu escMenu = new EscMenu();
  Player player = new Player();
  Energy energy = new Energy();

  GameBord gameBord = new GameBord(); 

  BaseLevel baseLevel;
  LevelOne levelOne;
  TestLevel testLevel;



  Game(int i) {
    if (i == 1)
    {
      squareFeld = new SquareField();
      println("why is this nessesary");
    }
  }

  Game() {
    squareFeld = new SquareField();
    gameBord = new GameBord(); 
    baseLevel = new BaseLevel();
    levelOne = new LevelOne(mapOne());
    testLevel = new TestLevel(mapTow());
  }

  PVector[][] mapOne()
  {
    PVector[][] thisMap = squareFeld.grid;
    combineTerrain(thisMap, terrain(52, 108, 14, 70, squareFeld.grid, 1));
    combineTerrain(thisMap, terrain(54, 106, 16, 68, squareFeld.grid, 0));
    combineTerrain(thisMap, terrain(56, 104, 18, 66, squareFeld.grid, 2));
    combineTerrain(thisMap, terrain(58, 102, 20, 64, squareFeld.grid, 0));
    combineTerrain(thisMap, terrain(60, 100, 22, 62, squareFeld.grid, 3));
    combineTerrain(thisMap, terrain(62, 98, 24, 60, squareFeld.grid, 0));
    combineTerrain(thisMap, terrain(64, 96, 26, 58, squareFeld.grid, 4));
    combineTerrain(thisMap, terrain(66, 94, 28, 56, squareFeld.grid, 0));
    combineTerrain(thisMap, terrain(68, 92, 30, 54, squareFeld.grid, 5));
    combineTerrain(thisMap, terrain(70, 90, 32, 52, squareFeld.grid, 0));
    return thisMap;
  }

  PVector[][] mapTow()
  {
    PVector[][] thisMap = squareFeld.grid;
    combineTerrain(thisMap, terrain(66, 94, 28, 56, squareFeld.grid, -1));
    combineTerrain(thisMap, terrain(68, 92, 30, 54, squareFeld.grid, 1));
    combineTerrain(thisMap, terrain(70, 90, 32, 52, squareFeld.grid, 0));
    combineTerrain(thisMap, terrain(65, 67, 42, 42, squareFeld.grid, 3));
    return thisMap;
  } 

  PVector[][] terrain(int x1, int x2, int y1, int y2, PVector[][] grid, int terrainHeight)
  {
    PVector[][] thisMap = grid;
    for (int i = x1; i <= x2; i++) 
    {
      for (int j = y1; j <= y2; j++) 
      {
        thisMap[i][j].z = terrainHeight;
      }
    }
    return thisMap;
  }

  PVector[][] combineTerrain(PVector[][] grid1, PVector[][] grid2)
  {

    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++) 
      {
        grid1[i][j].z = grid2[i][j].z;
      }
    }
    return grid1;
  }

  void changeState() {
    if (mousePressed && keyMenu.leave) { 
      //if the exit button is pressed in the keys menu
      loc = 0;
    }

    if (mousePressed && loadGame.leave) { 
      //if the exit button is pressed in the load game menu
      loc = 0;
    }

    if (mousePressed && escMenu.Opt[2]) { 
      //if the main menu button is pressed in the ESC menu. 
      escMenu.escPressed = false;
      escMenu.Opt[2]=false;
      loc = 0;
    }

    if (mousePressed && menu.screen[1]) {  
      //load game is pressed
      loc = 1;
    }

    if (mousePressed && menu.screen[2]) {   
      //if new game is pressed on the start menu
      nr = 0;
      loc = 1;
    }

    if (mousePressed && menu.screen[3]) {
      //if keys are pressed on the start menu
      keyMenu.t = 0;
      loc = 2;
    }
    if (mousePressed && menu.screen[0]) { 
      //if continue is pressed on the start menu
      menu.screen[0]=false;
      loc = 3;
      lvlcode=gameContinue;
    }

    if (mousePressed && loadGame.levelNR[0]) { 
      loc = 3;
      lvlcode=0;
    }
    if (mousePressed && loadGame.levelNR[1]) { 
      loc = 3;
      lvlcode=1;
    }
    if (mousePressed && loadGame.levelNR[2]) { 
      loc = 3;
      lvlcode=2;
    }
    if (mousePressed && loadGame.levelNR[3]) { 
      loc = 3;
      lvlcode=3;
    }
    if (mousePressed && loadGame.levelNR[4]) { 
      loc = 3;
      lvlcode=4;
    }
    if (mousePressed && loadGame.levelNR[5]) { 
      loc = 3;
      lvlcode=5;
    }
    if (mousePressed && loadGame.levelNR[6]) { 
      loc = 3;
      lvlcode=6;
    }
    if (mousePressed && loadGame.levelNR[7]) { 
      loc = 3;
      lvlcode=7;
    }
    if (mousePressed && loadGame.levelNR[8]) { 
      loc = 3;
      lvlcode=8;
    }
    if (mousePressed && loadGame.levelNR[9]) { 
      loc = 3;
      lvlcode=9;
    }
    if (mousePressed && loadGame.levelNR[10]) { 
      loc = 3;
      lvlcode=10;
    }
    if (mousePressed && loadGame.levelNR[11]) { 
      loc = 3;
      lvlcode=11;
    }
    if (mousePressed && menu.screen[4]) { 
      //exits the game if the exit button is pressed in the start menu
      loc = -1;
    }  
    if (mousePressed && escMenu.Opt[3]) {
      //exits the game if the exit button is chosen in the ESC menu
      loc = -1;
    }
    //this is a function that changes the data that is used for the level essentialy changes the level.
  }

  void run() {
    changeState();
    switch (loc) {
    case -1: 
      //exits the game
      exit();
      break;

    case 0:
      //this is the menu
      menu.run();
      break;

    case 1:
      //this is the load game menu
      loadGame.run(); 
      escMenu.run();
      break;

    case 2:
      //this is the key menu
      keyMenu.run(); 
      escMenu.run();
      break;

    case 3: 

      //this is the main game
      timer.run();
      //gameBoard.run();

      gameBord.hotbar();
      //player stas


      //levelOne
      levelOne.Update();
      levelOne.Draw(mapOne());
      levelOne.enemyRun();      

      //baseLevel
      //baseLevel.Update();
      //baseLevel.Draw(mapOne());
      //baseLevel.enemyRun();

      //testLevel
      //testLevel.Update();
      //testLevel.Draw(mapTow());
      //testLevel.enemyRun();
      player.Run();
      energy.run();
      escMenu.run();
      break;

    case 5:
      //this is the end screen
      break;
    }
  }
}
