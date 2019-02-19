class escMenu {

  PFont f;
  boolean es;
  boolean[] Opt = new boolean[4];
  int[] chol = new int[4];

  escMenu() {
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
      //this is the main menu option
      chol[2] = 0;
      Opt[2] = true;

      G.M.screen[0]=false;
      G.M.screen[1]=false;
      G.M.screen[2]=false;
      G.M.screen[3]=false; 
      G.M.screen[4]=false;

      G.Lg.LVL[1]=false; 
      G.Lg.LVL[0]=false; 
      G.Lg.LVL[2]=false; 
      G.Lg.LVL[3]=false; 
      G.Lg.LVL[4]=false; 
      G.Lg.LVL[5]=false; 
      G.Lg.LVL[6]=false; 
      G.Lg.LVL[7]=false; 
      G.Lg.LVL[8]=false; 
      G.Lg.LVL[9]=false; 
      G.Lg.LVL[10]=false; 
      G.Lg.LVL[11]=false;
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
    f = createFont("arial", 16, true);

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
    textFont(f, 46);
    text("Continue", 700, 120);
    //continue button

    //restart button
    fill(255, 255, chol[1]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*1/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(f, 46);
    text("Restart", 700, 310);
    //restart button

    //Main menu button
    fill(255, 255, chol[2]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*2/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(f, 46);
    text("Main Menu", 700, 515);
    //Main menu button

    //Close Game button
    fill(255, 255, chol[3]);
    stroke(0);
    strokeWeight(2);
    rect(width*3/8, height*3/4, width*2/8, height*1/4);
    textAlign(CENTER);
    fill(255, 0, 255);
    textFont(f, 46);
    text("Close Game", 700, 715);
    //Close Game button

    textAlign(LEFT);
  }



  void run() {
    if (mousePressed && Opt[1]) {





      es = false;
    }
    //Hvis ESC bliver trykket åbner det menuen og lukker den efter om menuen er åben eller ej
    if (keys[9] && G.T.es==0) {
      G.T.es=1;
      es = !es;
      Opt[0] = false;
      Opt[1] = false;
      Opt[2] = false;
      Opt[3] = false;
    } 
    //hvis continue bliver valgt
    if (mousePressed && Opt[0]) {
      es = false;
    }
    //hvis menu bliver valgt
    if (mousePressed && Opt[2]) {
      es = false;
    }

    if (es) {

      display();  
      choices();
    }
  }
}
