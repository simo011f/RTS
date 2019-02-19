class GameBoard {

  PFont f;
  boolean GO = false;
  int t = 2;


  void PlayerField() {

    //this draws the stuff
    //Maybe an array of variables would have been better

   
  }
  void time() {
    //this function displays the time in the upper right corner of the game board.

    f = createFont("arial", 16, true);
    fill(150, 155, 155);
    stroke(0);
    strokeWeight(2);
    rect(width-40, 5, 40, 40);
    fill(222, 0, 222);
    textAlign(CENTER);
    textFont(f, 16);
    textLeading(20);

    noFill();

    fill(150, 155, 155);
    stroke(0);
    strokeWeight(2);
    rect(0, 5, 40, 40);
    fill(222, 0, 222);
    textAlign(CENTER);
    textFont(f, 16);
    textLeading(20);

    noFill();
    textAlign(LEFT);
  }


  void display() {
    time();
    PlayerField();
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
