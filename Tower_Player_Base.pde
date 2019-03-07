class TowerBase {
  PVector location=new PVector(-100, -100);
  
  int life;
  
   boolean conected=false;

  void weapon() {
  }

  void detection() {
  }

  void highLight() {   

    fill(0, 255, 255);
    stroke(0);
    strokeWeight(1.5);

    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  void run() { 
    highLight();
    weapon();
    detection();
  }
}
