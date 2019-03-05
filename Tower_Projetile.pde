class TowerAttackTerrtoriumShot {  
  PVector location=new PVector(width/2, height-35);
  
  

  void weapon() {
  }

  void detection() {
  }

  void build() {   
    
    

    fill(0, 0, 255);
    stroke(0);
    strokeWeight(1.5);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }
  }
  void run() { 

    build();
    weapon();
    detection();
  }
}
