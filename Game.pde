class Game {
  int gameContinue = 0;
  boolean win = false;
  boolean pause = false;
  int pauseDelay = 0;
  int nr = 12;
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

  GameBord gameBord = new GameBord(); 

  BaseLevel baseLevel;
  TerrainEditor terrainEditor = new TerrainEditor();
  EnemyPlasmentEditor enemyPlasmentEditor = new EnemyPlasmentEditor();

  Game() {
    squareFeld = new SquareField();
    gameBord = new GameBord(); 
    baseLevel = new BaseLevel();
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
      menu.continueLevelNR = baseLevel.currentLevel;
      escMenu.escPressed = false;
      escMenu.Opt[2]=false;
      loc = 0;
    }
    if (mousePressed && escMenu.Opt[1]) { 
      //if the restart button is pressed in the ESC menu. 
      baseLevel.reloadLevel();
      escMenu.escPressed = false;
      escMenu.Opt[1]=false;
      loc = 3;
    }

    if (mousePressed && menu.screen[1]) {  
      //load game is pressed
      menu.screen[1] = false;
      loc = 1;
    }

    if (mousePressed && menu.screen[2]) {   
      //if new game is pressed on the start menu
      menu.screen[2]=false;
      loc = 3;
      baseLevel.currentLevel = 0;
      baseLevel.Update();
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
      baseLevel.currentLevel = menu.continueLevelNR;
      baseLevel.reloadLevel();
    }
    if (mousePressed && menu.screen[5]) { 
      //if tarrain editor is pressed on the start menu
      menu.screen[0]=false;
      loc = 4;
    }

    if (mousePressed && menu.screen[6]) {
      //if enemyplasment is presst on the start menu
      menu.screen[0] = false;
      loc = 6;
    }

    if (mousePressed && loadGame.levelNR[0]) { 
      loadGame.levelNR[0] = false;
      loc = 3;
      baseLevel.currentLevel = 1;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[1]) {
      loadGame.levelNR[1] = false;
      loc = 3;
      baseLevel.currentLevel = 2;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[2]) {
      loadGame.levelNR[2] = false;
      loc = 3;
      baseLevel.currentLevel = 3;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[3]) {
      loadGame.levelNR[3] = false;
      loc = 3;
      baseLevel.currentLevel = 4;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[4]) {
      loadGame.levelNR[4] = false;
      loc = 3;
      baseLevel.currentLevel = 5;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[5]) {
      loadGame.levelNR[5] = false;
      loc = 3;
      baseLevel.currentLevel = 6;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[6]) {
      loadGame.levelNR[6] = false;
      loc = 3;
      baseLevel.currentLevel = 7;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[7]) { 
      loadGame.levelNR[7] = false;
      loc = 3;
      baseLevel.currentLevel = 8;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[8]) { 
      loadGame.levelNR[8] = false;
      loc = 3;
      baseLevel.currentLevel = 9;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[9]) { 
      loadGame.levelNR[9] = false;
      loc = 3;
      baseLevel.currentLevel = 10;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[10]) {
      loadGame.levelNR[10] = false;
      loc = 3;
      baseLevel.currentLevel = 11;
      baseLevel.reloadLevel();
    }
    if (mousePressed && loadGame.levelNR[11]) { 
      loadGame.levelNR[11] = false;
      loc = 3;
      baseLevel.currentLevel = 12;
      baseLevel.reloadLevel();
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
      background(255);
      menu.run();
      break;

    case 1:
      //this is the load game menu
      background(255);
      loadGame.run(); 
      escMenu.run();
      break;

    case 2:
      //this is the key menu
      background(255);
      keyMenu.run(); 
      escMenu.run();
      break;

    case 3: 

      if (win) {
        levelWon();
        escMenu.run();
        return;
      }
      //this is the main game
      gameRun();
      break;

    case 4:
      //this is the level editor
      background(255);

      terrainEditor.Run();

      //testLevel


      //      
      escMenu.run();
      break;

    case 5:
      //this is the end screen
      break;

    case 6:
      background(255);

      enemyPlasmentEditor.Run();
      escMenu.run();
      break;
    }
  }
  void gameRun() {
    if (pause) {
      if (keys[0] && pauseDelay <= 0) {
        pause = false;
        pauseDelay = 10;
      } 
      baseLevel.Draw();
      player.energyNetwork.Update();
      player.PickTowerOnBar();   
      player.highLight();
      player.place();  
      player.drawHotbar(baseLevel.enemyArray.enemys);
      player.towerPause();
      rectMode(CENTER);
      fill(255, 100);
      rect(width/2, height/2 - 7, 110, 40);
      fill(0);
      rectMode(CORNER);
      textAlign(CENTER);
      fill(0);
      textSize(35);
      text("Pause", width/2, height/2 + 5);
      textAlign(CORNER);
      pauseDelay--;
      levelLost();
      escMenu.run();
      return;
    }
    if (keys[0] && pauseDelay <= 0) {
      pause = true;
      pauseDelay =10 ;
    }
    pauseDelay--;
    timer.run();
    baseLevel.Update();
    baseLevel.Draw();
    player.levelTerrain = game.baseLevel.currentTerrain;
    player.drawHotbar(baseLevel.enemyArray.enemys);
    player.towerDead(baseLevel.enemyArray.enemys);
    player.towerAttack(baseLevel.enemyArray.enemys, baseLevel.emitters);
    player.terrain(baseLevel.currentTerrain);
    player.Run();
    levelLost();
    levelWon();
    escMenu.run();
  }

  void levelWon()
  {
    //viktury

    if (baseLevel.currentLevel == 0)
    {
      baseLevel.currentLevel++;
      baseLevel.loadLevel(baseLevel.currentLevel);
      player.energyNetwork.updateTerrain(baseLevel.currentTerrain);
      background(255);
      baseLevel.fieldDraw(baseLevel.currentTerrain);
      baseLevel.enemyArray.terrainUpdate(baseLevel.currentTerrain);
      baseLevel.Draw();
      player = new Player();
    }
    if (baseLevel.emitters.size() == 0)
    {
      win = true;
    }
    if (!win) {
      return;
    }
    if (baseLevel.currentLevel == 12) {
      background(255);
      textAlign(CENTER);
      fill(0);
      textSize(50);
      text("You have won the game", width/2, height/2);
      text("Press the mouse to return to main menu", width/2, height/2 + 60);
      textAlign(CORNER);
      return;
    }
    
    fill(255);
    stroke(0);
    strokeWeight(1);
    background(255);
    rectMode(CENTER);
    if (mouseX >= width/2-width*1/6 && mouseX <= width/2+width*1/6 && mouseY >= height*1/4-height/8-10 && mouseY <= height*1/4+height/8-10)
    {
      fill(0, 255, 0, 200);
      if (mousePressed)
      {
        baseLevel.currentLevel++;
        baseLevel.loadLevel(baseLevel.currentLevel);
        player.energyNetwork.updateTerrain(baseLevel.currentTerrain);
        background(255);
        baseLevel.fieldDraw(baseLevel.currentTerrain);
        baseLevel.enemyArray.terrainUpdate(baseLevel.currentTerrain);
        baseLevel.Draw();
        player = new Player();
        win = false;
      }
    }
    rect(width/2, height*1/4, width*1/3, height/4-20);
    fill(255);
    if (mouseX >= width/2-width*1/6 && mouseX <= width/2+width*1/6 && mouseY >= height*2/4-height/8-10 && mouseY <= height*2/4+height/8-10)
    {
      fill(255, 255, 0, 200);
      if (mousePressed)
      {
        for (int i = 0; i < menu.screen.length; i++) {
          menu.screen[i] = false;
        }
        pause = false;
        loc = 0;
      }
    }
    rect(width/2, height*2/4, width*1/3, height/4-20);
    fill(255);
    if (mouseX >= width/2-width*1/6 && mouseX <= width/2+width*1/6 && mouseY >= height*3/4-height/8-10 && mouseY <= height*3/4+height/8-10)
    {
      fill(255, 100, 0, 200);
      if (mousePressed)
      {
        baseLevel.reloadLevel();
        win = false;
      }
    }
    rect(width/2, height*3/4, width*1/3, height/4-20);
    rectMode(CORNER);
    fill(0);
    textSize(45);
    textAlign(CENTER);
    text("You won this level", width/2, 130);
    text("Next level", width/2, height * 1/4 + 15);
    text("Restart level", width/2, height * 3/4 + 15);
    text("Main menu", width/2, height * 2/4 + 15);
    textAlign(CORNER);
  }

  void levelLost() 
  {
    if (player.base != null &&player.base.isDead)
    {
      pause = true;
      fill(255);
      stroke(0);
      strokeWeight(1);
      background(255);
      rectMode(CENTER);
      if (mouseX >= width/2-width*1/6 && mouseX <= width/2+width*1/6 && mouseY >= height*1/3-height/8-10 && mouseY <= height*1/3+height/8-10)
      {
        fill(0, 255, 0, 200);
        if (mousePressed)
        {
          baseLevel.reloadLevel();
          pause = false;
        }
      }
      rect(width/2, height*1/3, width*1/3, height/4-20);
      fill(255);
      if (mouseX >= width/2-width*1/6 && mouseX <= width/2+width*1/6 && mouseY >= height*2/3-height/8-10 && mouseY <= height*2/3+height/8-10)
      {
        fill(255, 255, 0, 200);
        if (mousePressed)
        {
          for (int i = 0; i < menu.screen.length; i++) {
            menu.screen[i] = false;
          }
          pause = false;
          loc = 0;
        }
      }
      rect(width/2, height*2/3, width*1/3, height/4-20);
      rectMode(CORNER);
      fill(0);
      textSize(45);
      textAlign(CENTER);
      text("You lost your base", width/2, 130);
      text("Restart level", width/2, height * 1/3 + 15);
      text("Main menu", width/2, height * 2/3 + 15);
      textAlign(CORNER);
    }
  }
}
