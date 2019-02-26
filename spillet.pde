class Game {

  int gameContinue = 0;
  boolean win = false;
  int nr = 0;
  int loc = 0;  
  int lvlcode = 0;

  //these are all the classes: 

  Timer timer = new Timer();
  Menu menu = new Menu();
  LoadGame loadGame =  new LoadGame();
  KeyMenu keyMenu = new KeyMenu();
  GameBoard Gb = new GameBoard();
  escMenu Ec = new escMenu();
  SquareFeld sq = new SquareFeld();





  Game() {
  }
  void skift() {

    if (mousePressed && keyMenu.leave) { 
      //if the exit button is pressed in the keys menu
      loc = 0;
    }
    if (mousePressed && loadGame.leave) { 
      //if the exit button is pressed in the load game menu
      loc = 0;
    }
    if (mousePressed && Ec.Opt[2]) { 
      //if the main menu button is pressed in the ESC menu.
      loc = 0;
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

    if (mousePressed && loadGame.LVL[0]) { 
      loc = 3;
      lvlcode=0;
    }
    if (mousePressed && loadGame.LVL[1]) { 
      loc = 3;
      lvlcode=1;
    }
    if (mousePressed && loadGame.LVL[2]) { 
      loc = 3;
      lvlcode=2;
    }
    if (mousePressed && loadGame.LVL[3]) { 
      loc = 3;
      lvlcode=3;
    }
    if (mousePressed && loadGame.LVL[4]) { 
      loc = 3;
      lvlcode=4;
    }
    if (mousePressed && loadGame.LVL[5]) { 
      loc = 3;
      lvlcode=5;
    }
    if (mousePressed && loadGame.LVL[6]) { 
      loc = 3;
      lvlcode=6;
    }
    if (mousePressed && loadGame.LVL[7]) { 
      loc = 3;
      lvlcode=7;
    }
    if (mousePressed && loadGame.LVL[8]) { 
      loc = 3;
      lvlcode=8;
    }
    if (mousePressed && loadGame.LVL[9]) { 
      loc = 3;
      lvlcode=9;
    }
    if (mousePressed && loadGame.LVL[10]) { 
      loc = 3;
      lvlcode=10;
    }
    if (mousePressed && loadGame.LVL[11]) { 
      loc = 3;
      lvlcode=11;
    }
    if (mousePressed && menu.screen[4]) { 
      //exits the game if the exit button is pressed in the start menu
      loc = -1;
    }  
    if (mousePressed && Ec.Opt[3]) {
      //exits the game if the exit button is chosen in the ESC menu
      loc = -1;
    }
    //this is a function that changes the data that is used for the level essentialy changes the level.
  }

  void run() {

    //println(Lg.chol);
    //  println(continu);

    skift();
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
      Ec.run();
      break;

    case 2:
      //this is the key menu
      keyMenu.run(); 
      Ec.run();
      break;

    case 3:

      loc = 4;
      break;

    case 4:
      //this is the main game
      timer.run();

      Gb.run();  
      sq.run();


      Ec.run();
      break;

    case 5:
      //this is the end screen



      break;
    }
  }
}
