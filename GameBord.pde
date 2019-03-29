class GameBord 
{

  PFont font;
  boolean GO;

  GameBord()
  {
  }

  void hotbar() {
    PVector location=new PVector(width/2, height-45);

    fill(150);
    stroke(0);
    strokeWeight(1.5);
    fill(0, 0, 255);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10+10, 10, 10);
      }
    }  

    fill(255, 0, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+scale*3+5, (location.y+j*10)+10, 10, 10);
      }
    } 

    fill(255, 255, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect((location.x+i*10)+scale*6+10, (location.y+j*10)+10, 10, 10);
      }
    }

    fill(0, 255, 255);
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        rect((location.x+i*10)+scale*6+100, (location.y+j*10)+10, 10, 10);
      }
    }

    fill(0, 255, 0);   
    rect((location.x+10)+scale*6+145, (location.y+10), 10, 10);
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
}
