class Game {

  int continu=0;
  boolean win = false;
  int nr=0;
  int loc = 0;  
  int lvlcode = 0;

  //these are all the classes:
  Timer T = new Timer();
  Menu M = new Menu();
  LoadGame Lg =  new LoadGame();
  Keymenu Km = new Keymenu();
  GameBoard Gb = new GameBoard();
  escMenu Ec = new escMenu();






  Game() {
  }
  void skift() {

    if (mousePressed && Km.leave) { 
      //if the exit button is pressed in the keys menu
      loc = 0;
    }
    if (mousePressed && Lg.leave) { 
      //if the exit button is pressed in the load game menu
      loc = 0;
    }
    if (mousePressed && Ec.Opt[2]) { 
      //if the main menu button is pressed in the ESC menu.
      loc = 0;
    }
    if (mousePressed && M.screen[2]) {   
      //if new game is pressed on the start menu
      nr = 0;
      loc = 1;
    }

    if (mousePressed && M.screen[3]) {
      //if keys are pressed on the start menu
      Km.t = 0;
      loc = 2;
    }
    if (mousePressed && M.screen[0]) { 
      //if continue is pressed on the start menu
      loc = 3;
      lvlcode=continu;
    }

    if (mousePressed && Lg.LVL[0]) { 
      loc = 3;
      lvlcode=0;
    }
    if (mousePressed && Lg.LVL[1]) { 
      loc = 3;
      lvlcode=1;
    }
    if (mousePressed && Lg.LVL[2]) { 
      loc = 3;
      lvlcode=2;
    }
    if (mousePressed && Lg.LVL[3]) { 
      loc = 3;
      lvlcode=3;
    }
    if (mousePressed && Lg.LVL[4]) { 
      loc = 3;
      lvlcode=4;
    }
    if (mousePressed && Lg.LVL[5]) { 
      loc = 3;
      lvlcode=5;
    }
    if (mousePressed && Lg.LVL[6]) { 
      loc = 3;
      lvlcode=6;
    }
    if (mousePressed && Lg.LVL[7]) { 
      loc = 3;
      lvlcode=7;
    }
    if (mousePressed && Lg.LVL[8]) { 
      loc = 3;
      lvlcode=8;
    }
    if (mousePressed && Lg.LVL[9]) { 
      loc = 3;
      lvlcode=9;
    }
    if (mousePressed && Lg.LVL[10]) { 
      loc = 3;
      lvlcode=10;
    }
    if (mousePressed && Lg.LVL[11]) { 
      loc = 3;
      lvlcode=11;
    }
    if (mousePressed && M.screen[4]) { 
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
      M.run();
      break;

    case 1:
      //this is the load game menu
      Lg.run(); 
      Ec.run();
      break;

    case 2:
      //this is the key menu
      Km.run(); 
      Ec.run();
      break;

    case 3:
      //this is the main game
      T.run();

      Gb.run();  





      Ec.run();
      break;

    case 5:
      //this is the end screen



      break;
    }
  }
}
