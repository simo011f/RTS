class GameBoard {

  PFont f;



  void PlayerField() {
    f = createFont("areal", 16, true);


    fill(150);
    stroke(0);
    strokeWeight(2);
    rect(0, height/4, height*3/4, width*3/8);//P1 store box
    rect(width*5/8, height/4, height*3/4, width*3/8);//P2 store box


    fill(0, 150, 0);
    stroke(0);
    strokeWeight(2);
    //P1 små boxe
    rect(width/8, height/4, width*1/8, height*1/4);//øvereste
    rect(width*1/4, height*2/4, height*1/4, width*1/8);//højre
    rect(0, height*2/4, height*1/4, width*1/8);//venstre
    rect(width*1/8, height*3/4, height*1/4, width*1/8);//nedereste

    //P2 små boxe
    rect(width*6/8, height/4, height*1/4, width*1/8);
    rect(width*7/8, height*2/4, height*1/4, width*1/8);
    rect(width*5/8, height*2/4, height*1/4, width*1/8);
    rect(width*6/8, height*3/4, height*1/4, width*1/8);

    //upgeade box
    fill(222, 0, 222);
    stroke(0);
    strokeWeight(2);
    textAlign(CENTER);
    rect(width*3/8, height*1/4, width*2/8, height*1/4);
    fill(0, 222, 222);
    textFont(f, 26);
    text("upgrades", 400, 150);

    //task box
    fill(222, 0, 222);
    textAlign(CENTER);
    rect(width*3/8, height*3/4, width*2/8, height*1/4);
    fill(0, 222, 222);
    textFont(f, 26);
    text("task", 400, 350);
    noFill();
    textAlign(LEFT);
  }
  void time() {
    f = createFont("areal", 16, true);
    fill(150, 155, 155);
    stroke(0);
    strokeWeight(2);
    rect(width-40, 5, 40, 40);
    fill(222, 0, 222);
    textAlign(CENTER);
    textFont(f, 26);
    text("time", 780, 20);
    noFill();
    textAlign(LEFT);
  }


  void display() {
    time();
    PlayerField();
  }
  void run() {
    display();
  }
}
