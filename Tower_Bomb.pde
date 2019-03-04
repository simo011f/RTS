class TowerAttackTerrtoriumBomb {  
  PVector location=new PVector(width/2+35, height-35);

  void weapon() {
  }

  void detection() {
  }

  void highLight() {   

    fill(255, 0, 0);
    stroke(0);
    strokeWeight(1.5);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
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
