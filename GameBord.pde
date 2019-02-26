  class GameBoard {

  PFont font;
  boolean GO;
  int scale = 10;  

  int cols = width/scale;
  int rows = height/scale;




  void PlayerField() {   
    //this draws the stuff
    //Maybe an array of variables would have been better
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {

        int x = i*scale;
        int y = j*scale;
        fill(255);
        stroke(0);
        strokeWeight(1);
        rect(x, y, scale, scale);
      }
    }
  } 


  void time() {
    //this function displays the time in the upper right corner of the game board.

    font = createFont("arial", 16, true);
    fill(150, 155, 155);
    stroke(0);
    strokeWeight(2);
    rect(width-40, 0, 40, 40);
    fill(222, 0, 222);
    textAlign(CENTER);
    textFont(font, 16);

    text("t", width-20, 20);
    noFill();
    textAlign(LEFT);
  }


  void display() {

    PlayerField();
    // time();
  }
  void run() { 
    display();


  }
}
