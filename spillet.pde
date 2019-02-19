class Game {


  int es;
  boolean hej;
  int loc = 0;
  Menu M = new Menu();
  NewGame Ng = new NewGame();  
  LoadGame Lg =  new LoadGame();
  Keymenu Km = new Keymenu();
  GameBoard Gb = new GameBoard();
  escMenu Ec = new escMenu();

  LogikWC Wc = new LogikWC();
  LogikWP Wp = new LogikWP();
  ProgessBar Pb = new ProgessBar();
  Timer T = new Timer();

  Game() {
  }
  void skift() {
    if (mousePressed && M.NewG) { 
      loc = 1;
    }
    if (mousePressed && M.Load) { 
      loc = 2;
    }
    if (mousePressed && M.KeyM) {
      loc = 3;
    }
    if (mousePressed && M.cont) { 
      loc = 4;
    }
    if (mousePressed && Ng.LVL1) { 
      loc = 4;
    }
    if (mousePressed && Lg.LVL[0]) { 
      loc = 4;
    }
    if (mousePressed && M.eks) { 
      loc = 5;
    }
    if (keys[9]) { 
      hej=true;
    } else {
      hej=false;
    }
  }

  void run() {

    skift();//det er en place holder
    switch (loc) {

    case 0:
      if (hej) { 
        Ec.run();
      }

      M.run();
      break;

    case 1:
      Ng.run();
      break; 

    case 2:
      Lg.run();
      break;

    case 3:
      Km.run();
      break;

    case 4:
      T.run();
      Pb.run();
      Gb.run();
      Wp.run();
      Wc.run();
      break;

    case 5: 
      exit();
      break;
    }
  }
}
