class GameBoard {

  PFont font;
  boolean GO;
  int scale = 10;  

  int cols = width/scale;
  int rows = height/scale-6;




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
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }
  } 

  void hotbar() {
    fill(150);
    stroke(0);
    strokeWeight(1.5);
    rect(width/2-500, height-60, 1000, 60);
    fill(0, 0, 255);

    PVector location=new PVector(width/2, height-45);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }  fill(255, 0, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+scale*3+5, (location.y+j*10), 10, 10);
      }
    } fill(0, 255, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+scale*6+10, (location.y+j*10), 10, 10);
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
    hotbar();

    // time();
  }
  void run() { 
    display();
  }
}
