 class KeyMenu 
{

  boolean leave;
  int leaveColor;
  int t;
  PFont f;
  PVector towerMoveLocation = new PVector(width*1/5, height*3/5);
  PVector towerMoveVelocity = new PVector(1, 0);


  KeyMenu() {
    f = createFont("arial", 16, true);
  }
  void tekst() { 
    textAlign(CENTER);
    if (mousePressed)
    {
      println(mouseX, mouseY, 100*mouseX/width, 100*mouseY/height);
    }
    fill(0);
    textFont(f, 35);
    text("Hover over tower and click to select a tower", width*1/5, height*1/5);
    text("Clik again to move the tower", width*1/5, height*2/5);
    textAlign(LEFT);
  }

  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(0, 0, 255);
    if (width * 1 / 5 - 15 <= mouseX && width * 1 / 5 + 15 >= mouseX && height*1/5 + height*1/20 - 15 <= mouseY && height*1/5 + height*1/20 + 15 >= mouseY) {
      if (mousePressed) {
        stroke(255);
      }
    }
    rect(width*1/5, height*1/5 + height*1/20, 30, 30);

    stroke(255);
    rect(towerMoveLocation.x, towerMoveLocation.y, 30, 30);


    rectMode(CORNER);
  }

  void highligt() {
    t++;
    if (t > 45) {
      towerMoveLocation.x += towerMoveVelocity.x;
      towerMoveLocation.y += towerMoveVelocity.y;
    }
    if (towerMoveLocation.x > width*3/10 || towerMoveLocation.x < width*1/10 || towerMoveLocation.y < height*2/5 || towerMoveLocation.y > height*4/5)
    {
      towerMoveLocation = new PVector(width * 1 / 5, height * 3 / 5 );
      towerMoveVelocity = new PVector(random(-1,1),random(-1,1));
      towerMoveVelocity.setMag(1);
      t = 0;
    }
  }

  void leave() {
    fill(255, leaveColor, 255);
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 80, 80);
    fill(0);
    textFont(f, 20);
    textAlign(CENTER);
    text("Back", 40, 45);


    if (mouseX>=0 && mouseX<=80 && mouseY>=0 && mouseY<=80 ) {
      game.menu.timer=0;
      leaveColor = 0;
      game.menu.screen[3]=false;
      leave = true;
    } else {
      leaveColor = 255;
      leave = false;
    }
    textAlign(LEFT);
  }

  void run() {
    tekst();

    display();
    highligt(); 
    leave();
  }
}
