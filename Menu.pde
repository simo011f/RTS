class Menu {
  Game game;
  
  PFont font;
  
  int timer;
  int colorContinue;
  int colorNewGame;
  int colorLoadGame;
  int colorKeyMenu;
  int colorEscMenu;
  
  PVector mouseLocation = new PVector(mouseX, mouseY);
  
  boolean[] screen = new boolean[6];

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
    text("Continue", width*1/2, 120);
    //continue box

    //new game box
    fill(colorNewGame, 255, colorNewGame);
    stroke(0);
    strokeWeight(2);
    rect(width*1/3, height*3/8, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("New Game", width*1/2, 450);
    //new game box 

    //load game box
    fill(255, colorLoadGame, colorLoadGame);
    stroke(0);
    strokeWeight(2);
    rect(width*1/3, height*3/4-20, width*1/3, height/4-20);

    fill(0, 0, 0);
    textFont(font, 46);
    textAlign(CENTER);
    text("Load Game", width*1/2, 760);
    //load game box

    textAlign(LEFT);
  }
  void lvlChoiceLogic() {

    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=20 && mouseY<=height/4) {
      //continue box
      colorContinue = 0;
      screen[0] = true;
    } else {
      colorContinue = 255;
      screen[0] = false;
    }
    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=height*3/8 && mouseY<=height*3/8+height/4-20) {
      //new game box
      colorNewGame = 0;
      screen[2] = true;
    } else {
      colorNewGame = 255;
      screen[2] = false;
    }
    if (mouseX>= width*1/3 && mouseX<=width*2/3 && mouseY>=height*3/4-20 && mouseY<=height*3/4-20+height/4-20) {
      //load game box
      //G.Lg.t=0;
<<<<<<< HEAD
      
      cl = 0;
=======
      colorLoadGame = 0;
>>>>>>> Navne
      screen[1] = true;
    } else {
      colorLoadGame = 255;
      screen[1] = false;
    }
    //if (mouseX>=0 && mouseX<=80 && mouseY>=390 && mouseY<=height && t >= 10) {
    //  G.nr=12;
    //}
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

    if (mouseX>=width-80 && mouseX<=width && mouseY>=0 && mouseY<=80) {
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

    terminate();
    keymenu();
    lvlChoiceBox();
    lvlChoiceLogic();
  }
}
