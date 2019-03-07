class Game 
{

  int gameContinue = 0;
  boolean win = false;
  int nr = 0;
  int loc = 0;  
  int lvlcode = 0;

  //these are all the classes: 

  SquareField squareFeld = new SquareField();
  Timer timer = new Timer();
  Menu menu = new Menu();
  LoadGame loadGame =  new LoadGame();
  KeyMenu keyMenu = new KeyMenu();


  EscMenu escMenu = new EscMenu();
  Player player = new Player();
  Energy energy = new Energy();

  GameBord gameBord; 
  BaseLevel baseLevel;

  Game(int i)
  {
    if (i == 1)
    {
      squareFeld = new SquareField();
    }
  }

  Game() {
    gameBord = new GameBord(); 
    baseLevel = new BaseLevel();
    baseLevel.terrain(50, 10, 100, 50, squareFeld.grid, 1);
    baseLevel.terrain(5, 0, 10, 5, squareFeld.grid, 2);
    baseLevel = new BaseLevel(squareFeld.grid);
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
      baseLevel.Update();
      baseLevel.Draw(squareFeld.grid);
      gameBord.hotbar();
      //player stas
      player.Run();
      energy.run();
      baseLevel.enemyRun();
      escMenu.run();
      break;

    case 5:
      //this is the end screen
      break;
    }
  }
}
