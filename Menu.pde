class Menu 
{
  Game game;

  PFont font;

  int timer;
  int colorContinue;
  int colorNewGame;
  int colorLoadGame;
  int colorKeyMenu;
  int colorEscMenu;
  int colorTerrainEditor;
  int colorEnemyPlasmentEditor;

  PVector mouseLocation = new PVector(mouseX, mouseY);

  boolean[] screen = new boolean[7];

  Menu() {
    font = createFont("areal", 16, true);
  }    

  void lvlChoiceBox() {
    //continue box
    fill(colorContinue, colorContinue, 255);
    stroke(0);
    strokeWeight(2);
    rect(width*1/3, 20, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Continue", width*1/2, height*11/72);
    //continue box

    //new game box
    fill(colorNewGame, 255, colorNewGame);
    stroke(0);
    strokeWeight(2);
    rect(width*1/3, height*7/18-10, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("New Game", width*1/2, height*1/2);
    //new game box 

    //load game box
    fill(255, colorLoadGame, colorLoadGame);
    stroke(0);
    strokeWeight(2);
    rect(width*1/3, height*55/72-15, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Load Game", width*1/2, height*127/144);
    //load game box

    //terrain edditor box
    fill(255, colorTerrainEditor * 2, colorTerrainEditor);
    stroke(0);
    strokeWeight(2);
    rect(width*2/3, height*55/72-15, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Terrain editor", width*16/20, height*127/144);
    //terrain editor box

    //enemy plasement edditor box
    fill(colorEnemyPlasmentEditor, colorEnemyPlasmentEditor * 2, 255);
    stroke(0);
    strokeWeight(2);
    rect(width*0/3, height*55/72-15, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Enemy plasement", width*3/20, height*127/144);
    //enemy plasement box

    textAlign(LEFT);
  }
  void lvlChoiceLogic() {

    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=20 && mouseY<=height/4 && timer >= 10) {
      //continue box
      colorContinue = 0;
      screen[0] = true;
    } else {
      colorContinue = 255;
      screen[0] = false;
    }
    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=height*3/8 && mouseY<=height*3/8+height/4-20 && timer >= 10) {
      //new game box
      colorNewGame = 0;
      screen[2] = true;
    } else {
      colorNewGame = 255;
      screen[2] = false;
    }

    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=height*55/72-15 && mouseY<= height*55/72-15+height/4-20 && timer >= 10) {
      colorLoadGame = 0;
      screen[1] = true;
    } else {
      colorLoadGame = 255;
      screen[1] = false;
    }

    if (mouseX >= width*2/3 && mouseX<=width*3/3 && mouseY>=height*55/72-15 && mouseY<= height*55/72-15+height/4-20 && timer >= 10) {
      colorTerrainEditor = 75;
      screen[5] = true;
    } else {
      colorTerrainEditor = 255;
      screen[5] = false;
    }

    if (mouseX >= width*0/3 && mouseX <= width*1/3 && mouseY>=height*55/72-15 && mouseY<= height*55/72-15+height/4-20 && timer >= 10) {
      colorEnemyPlasmentEditor = 75;
      screen[6] = true;
    } else {
      colorEnemyPlasmentEditor = 255;
      screen[6] = false;
    }
  }

  void keymenu() {
    timer++;
    //this is the part that handles if the player selects the key menu option.
    fill(colorKeyMenu, 255, 255);
    stroke(0);
    strokeWeight(2);
    rect(width-80, 0, 80, 80);
    fill(0);
    textFont(font, 20);
    textAlign(CENTER);
    text("Keys", width-40, 45);

    if (mouseX>=width-80 && mouseX<=width && mouseY>=0 && mouseY<=80 && timer >= 10) {
      colorKeyMenu = 0;
      screen[3] = true;
    } else {
      colorKeyMenu = 255;
      screen[3] = false;
    }
    textAlign(LEFT);
  }

  void terminate() {
    fill(255, colorEscMenu, 255);
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 80, 80);
    fill(0);
    textFont(font, 20);
    textAlign(CENTER);
    text("Exit", 40, 45);

    if (mouseX>=0 && mouseX<=80 && mouseY>=0 && mouseY<=80 && timer >= 10) {

      colorEscMenu = 0;
      screen[4] = true;
    } else { 
      colorEscMenu = 255;
      screen[4] = false;
    } 
    textAlign(LEFT);
  }

  void run() {
    if (timer >= 10) {
      timer = 10;
    }
    terminate();
    keymenu();
    lvlChoiceBox();
    lvlChoiceLogic();
  }
}
