class EscMenu  //<>// //<>//
{

  PFont font;
  boolean escPressed;
  boolean[] Opt = new boolean[4];
  int[] chol = new int[4];

  EscMenu() {
    font = createFont("arial", 16, true);
  }

  void choices() {  

    if (mouseX >= width*3/8 && mouseX <= width*5/8 && mouseY >= 0 && mouseY <= height*1/4) {
      //this is the continue button.
      chol[0] = 0;
      Opt[0] = true;
    } else {
      chol[0] = 255;
      Opt[0] = false;
    }

    if (mouseX >= width*3/8 && mouseX <= width*5/8 && mouseY >= height*1/4 && mouseY <= height*2/4) {
      //this is the restart button
      chol[1] = 0;
      Opt[1] = true;
    } else {
      chol[1] = 255;
      Opt[1] = false;
    }

    if (mouseX >= width*3/8 && mouseX <= width*5/8 && mouseY >= height*2/4 && mouseY <= height*3/4) { 
      game.menu.timer = 1;
      //this is the main menu option
      chol[2] = 0;
      Opt[2] = true;
      for (int i = 0; i < game.menu.screen.length; i++) {
        game.menu.screen[i] = false;
      }
    } else {
      chol[2] = 255;
      Opt[2] = false;
    }
    if (mouseX >= width*3/8 && mouseX <= width*5/8 && mouseY >= height*3/4 && mouseY <= height) {
      //this is the exit button
      chol[3] = 0;
      Opt[3] = true;
    } else {
      chol[3] = 255;
      Opt[3] = false;
    }
  }

  void display() {
    background(255);


    fill(255, 255, 0);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, 0, width*2/8, height);

    //continue button
    fill(255, 255, chol[0]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, 0, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(font, 46);
    text("Continue", width*4/8, height*1/7);
    //continue button

    //restart button
    fill(255, 255, chol[1]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*1/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(font, 46);
    text("Restart", width*4/8, height*7/18);
    //restart button

    //Main menu button
    fill(255, 255, chol[2]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*2/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(font, 46);
    text("Main Menu", width*4/8, height*12/19);
    //Main menu button

    //Close Game button
    fill(255, 255, chol[3]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*3/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(font, 46);
    text("Close Game", width*4/8, height*8/9);
    //Close Game button

    textAlign(LEFT);
  }

  void run() {

    if (mousePressed && Opt[1]) {

      //game.player.energyTower.clear();
      //game.player.shotTower.clear();
      //game.player.bombTower.clear();
      //game.player.enemyAttackTower.clear();
      //game.player.base.clear();
      //for (int i = 0; i <= 4; i++) {
      //  game.player.towernr[i]=1;
      //}
      escPressed = false;
    }

    //Hvis ESC bliver trykket åbner det menuen og lukker den efter om menuen er åben eller ej
    if (keys[9] && game.timer.es==0) {
      game.timer.es=1;
      escPressed = !escPressed;
      Opt[0] = false;
      Opt[1] = false;
      Opt[2] = false;
      Opt[3] = false;
    } 
    //hvis continue bliver valgt
    if (mousePressed && Opt[0]) {
      escPressed = false;
    }


    if (escPressed) {
      display();  
      choices();
    }
  }
}
