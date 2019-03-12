class TowerEnergy 
{
  PVector location=new PVector(-100, -100);

  int life;

  int vis;

  boolean conected=false;

  void weapon() {
    for (int i = 0; i < game.player.base.size(); i++) {
      if (conected && game.player.base.get(i).conected) {
      }
    }
  }

  void detection() {
  }

  void highLight() {   


    stroke(0);
    if (vis == 255) {
      strokeWeight(1.5);
    } else {  
      noStroke();
    }


    fill(0, 155, 0, vis);
    for (int i = -3; i <= 3; i++) {
      for (int j = -3; j <= 3; j++) {
        rect(location.x+i*10, location.y+j*10, 10, 10);
      }
    }

    fill(0, 255, 0);     
    stroke(0);
    strokeWeight(1.5);
    rect(location.x, location.y, 10, 10);
  }
  void run() { 
    highLight();
    weapon();
    detection();
  }
}
