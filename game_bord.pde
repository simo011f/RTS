class GameBoard {

  PFont f;
  boolean GO = false;
  int t = 2;
 

  void PlayerField() {   
    //this draws the stuff
    //Maybe an array of variables would have been better

    for (int i = 1; i < 900; i = i+10) {
      for (int j = 1; j < width+5; j = j+10) {
        stroke(0);
        strokeWeight(1.5);
        line(0, i, j, i);
      }
    }
    for (int i = 1; i < width+5; i = i+10) {
      for (int j = 1; j < 900; j = j+10) {
        stroke(0);
        strokeWeight(1.5);
        line(i, 0, i, j);
      }
    }
  } 

  void time() {
    //this function displays the time in the upper right corner of the game board.

    f = createFont("arial", 16, true);
    fill(150, 155, 155);
    stroke(0);
    strokeWeight(2);
    rect(width-40, 0, 40, 40);
    fill(222, 0, 222);
    textAlign(CENTER);
    textFont(f, 16);

    text("t", width-20, 20);
    noFill();
    textAlign(LEFT);
  }


  void display() {

    PlayerField();
    time();
  }
  void run() {
    display();

    if (t >= 2 && t < 3 && GO == false) {
      t++;
      if (t >= 3) {
        GO= true;
        t = 0;
      }
    }
  }
}
