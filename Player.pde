class Player {




  void highLight() {   
    if (mouseX>1590) {
      mouseX = 1580;
    } if (mouseX<10) {
      mouseX = 10;
    } 
    if (mouseY<10) {
      mouseY = 10;
    } 
    if (mouseY>880) {
      mouseY = 880;
    }

    if (mousePressed) {
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1.5);

      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          rect(game.squareFeld.grid[(mouseX/10)+i][(mouseY/10)+j].x, game.squareFeld.grid[(mouseX/10)+i][(mouseY/10)+j].y, 10, 10);
        }
      }
    }
  }
  void run() {
    highLight();
  }
}
