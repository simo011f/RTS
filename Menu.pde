class Menu {
  Game G;
  PFont f;

  PVector MLoc = new PVector(mouseX, mouseY);
  int cc;
  int cn;
  int cl;
  int km;
  int ek;
  boolean cont = false;
  boolean Load = false;
  boolean NewG = false;
  boolean KeyM = false;
  boolean eks = false;


  Menu() {
    f = createFont("areal", 16, true);
  }    

  void lvlChoiceBox() {
    fill(cc, cc, 255);
    stroke(0);
    strokeWeight(2);
    rect(66, height*3/4-20, width*2/8, height/4-20);
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("Continue", width*1/8+65, height*3/4+27);
    fill(cn, 255, cn);
    stroke(0);
    strokeWeight(2);
    rect(width*2/8+99, height*3/4-20, width*2/8, height/4-20);
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("New Game", width*3/8+99, height*3/4+27);
    fill(255, cl, cl);
    stroke(0);
    strokeWeight(2);
    rect(width*4/8+(66*2), height*3/4-20, width*2/8, height/4-20);
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("Load Game", width*5/8+(66*2), height*3/4+27);
    text("Key"+"\n"+"Menu", 760, 30);
    text("EXIT", 40, 50);
    textAlign(LEFT);
  }

  void lvlChioiceLogic() {

    if (mouseX>=66 && mouseX<=266&&mouseY>=280&&mouseY<=360) {
      cc = 0;
      cont = true;
    } else {
      cc = 255;
      cont = false;
    }
    if (mouseX>=299 && mouseX<=499 && mouseY>=280 && mouseY<=360) {
      cn = 0;
      NewG = true;
    } else {
      cn = 255;
      NewG = false;
    }
    if (mouseX>=532 && mouseX<=732 && mouseY>=280 && mouseY<=360) {
      cl = 0;
      Load = true;
    } else {
      cl = 255;
      Load = false;
    }
  }

  void keymenu() {
    fill(km, 255, 255);
    stroke(0);
    strokeWeight(2);
    rect(width-80, 0, 80, 80);

    if (mouseX>=720 && mouseX<=800 && mouseY>=0 && mouseY<=80) {
      km = 0;
      KeyM = true;
    } else {
      km = 255;
      KeyM = false;
    }
  }

  void eksit() {
    fill(255, ek, 255);
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 80, 80);

    if (mouseX>=0 && mouseX<=80 && mouseY>=0 && mouseY<=80) {
      ek = 0;
      eks = true;
    } else {
      ek = 255;
      eks = false;
    }
  }

  void run() {

    eksit();
    keymenu();
    lvlChoiceBox();
    lvlChioiceLogic();
  }
}
