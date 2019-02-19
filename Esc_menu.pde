class escMenu {

  boolean es;
  escMenu() {
  }

  void choises() {
  }

  void display() {
    fill(222, 0, 222);
    stroke(0);
    strokeWeight(2);
    textAlign(CENTER);
    rect(width*3/8, 0, width*2/8, height);
  }
  void dont() {
    if (keys[9] && G.T.es==0) {
      G.T.es=1;
      es = false;
    }
  }
  void run() {
    if (es && G.T.es == 1) {
      dont();
    } else {
      display();
    }
  }
}
