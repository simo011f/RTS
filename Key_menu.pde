class Keymenu {
  Keymenu() {
  }

  void display() {
    fill(random(0, 255), random(0, 255), random(0, 255));
    stroke(0);
    strokeWeight(2);
    rect(width*1/8, height/4, width*6/8, height*2/4 );//P1 store box
  }

  void run() {
    display();
  }
}
