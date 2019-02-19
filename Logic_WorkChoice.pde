class LogikWC {

  PFont f;
  boolean accept = false;
  boolean accepted = false;
  boolean accepted2 = false;
  PVector P1Select = new PVector(0, 0);
  PVector P2Select = new PVector(0, 0);
  int acceptP1 = 0;
  int acceptP2 = 0;

  LogikWC() {
  }

  void taskChoice() {
  }
  void upgradeChoice() {
  }

  void highLight() {

    if (P1Select.x == -1 && P1Select.y == -1) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(0, height/4, height*1/4, width*1/8);
      accepted = true;
    }

    if (P1Select.x == 0 && P1Select.y == -1) {
      fill(0, 200, 0);
      stroke(0, random(170, 250), 0);
      strokeWeight(2);
      rect(width*1/8, height/4, height*1/4, width*1/8);
      accepted = true;
    }    
    if (P1Select.x == 1 && P1Select.y == -1) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*2/8, height/4, height*1/4, width*1/8);
      accepted = true;
    }    

    if (P1Select.x == -1 && P1Select.y == 0) {
      fill(0, 200, 0);
      stroke(0, random(170, 250), 0);
      strokeWeight(2);
      rect(0, height*2/4, height*1/4, width*1/8);
      accepted = true;
    }    
    if (P1Select.x == 0 && P1Select.y == 0) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*1/8, height*2/4, height*1/4, width*1/8);
      accepted = true;
    }    

    if (P1Select.x == 1 && P1Select.y == 0) {
      fill(0, 200, 0);
      stroke(0, random(170, 250), 0);
      strokeWeight(2);
      rect(width*1/4, height*2/4, height*1/4, width*1/8);
      accepted = true;
    }    
    if (P1Select.x == -1 && P1Select.y == 1) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(0, height*3/4, height*1/4, width*1/8);
      accepted = true;
    }    

    if (P1Select.x == 0 && P1Select.y == 1) {
      fill(0, 200, 0);
      stroke(0, random(170, 250), 0);
      strokeWeight(2);
      rect(width*1/8, height*3/4, height*1/4, width*1/8);
      accepted = true;
    }    
    if (P1Select.x == 1 && P1Select.y == 1) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*2/8, height*3/4, height*1/4, width*1/8);
      accepted = true;
    }




    if (P2Select.x == -1 && P2Select.y == -1) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*5/8, height/4, height*1/4, width*1/8);
      accepted = true;
    }

    if (P2Select.x == 0 && P2Select.y == -1) {
      fill(0, 200, 0);
      stroke(0, random(170, 250), 0);
      strokeWeight(2);
      rect(width*6/8, height/4, height*1/4, width*1/8);
      accepted2 = true;
    }    
    if (P2Select.x == 1 && P2Select.y == -1) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*7/8, height/4, height*1/4, width*1/8);
      accepted = true;
    }    

    if (P2Select.x == -1 && P2Select.y == 0) {
      fill(0, 200, 0);
      stroke(0, random(170, 250), 0);
      strokeWeight(2);
      rect(width*5/8, height*2/4, height*1/4, width*1/8);
      accepted2 = true;
    }    
    if (P2Select.x == 0 && P2Select.y == 0) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*6/8, height*2/4, height*1/4, width*1/8);
      accepted = true;
    }    

    if (P2Select.x == 1 && P2Select.y == 0) {
      fill(0, 200, 0);
      stroke(0, random(170, 250), 0);
      strokeWeight(2);
      rect(width*7/8, height*2/4, height*1/4, width*1/8);
      accepted2 = true;
    }    
    if (P2Select.x == -1 && P2Select.y == 1) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*5/8, height*3/4, height*1/4, width*1/8);
      accepted = true;
    }    

    if (P2Select.x == 0 && P2Select.y == 1) {
      fill(0, 200, 0);
      stroke(0, random(170, 250), 0);
      strokeWeight(2);
      rect(width*6/8, height*3/4, height*1/4, width*1/8);
      accepted2 = true;
    }    
    if (P2Select.x == 1 && P2Select.y == 1) {
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*7/8, height*3/4, height*1/4, width*1/8);
      accepted = true;
    }
  }

  void acceptHighLight() {
    if (acceptP1 == -1) {
      fill(200, 0, 0);
      stroke(200, 0, 0);
      strokeWeight(2);
      rect(0, 150, width*1/4-5, 37+1/2);
    }

    if (acceptP1 == 1) {
      fill(200, 0, 0);
      stroke(200, 0, 0);
      strokeWeight(2);
      rect(width*3/4+5, 150, width, 37+1/2);
    }

    if (acceptP2 == -1) {
      fill(200, 0, 0);
      stroke(200, 0, 0);
      strokeWeight(2);
      rect(0, 150+37+1/2, width*1/4-5, 37+1/2);
    }

    if (acceptP2 == 1) {
      fill(200, 0, 0);
      stroke(200, 0, 0);
      strokeWeight(2);
      rect(width*3/4+5, 150+37+1/2, width*1/4-5, 37+1/2);
    }
  }

  void choseP1() {

    P1Select.x = constrain(P1Select.x, -1, 1);
    P1Select.y = constrain(P1Select.y, -1, 1);

    if (keys[4] && G.T.Bt1 == 0) { //w / up
      P1Select.y -= 1;
      G.T.Bt1 = 1;
    }

    if (keys[2] && G.T.Bt1 == 0) { //s / down
      P1Select.y += 1;
      G.T.Bt1 = 1;
    }

    if (keys[1] && G.T.Bt1 == 0) { //a / left
      P1Select.x -= 1;
      G.T.Bt1 = 1;
    }

    if (keys[3] && G.T.Bt1 == 0) { //d / right
      P1Select.x += 1;
      G.T.Bt1 = 1;
    }

    if (keys[0] && accepted && accepted2 && G.T.St == 0) { 
      accept = true;
      accepted = false;
      accepted2 = false;
      G.T.St = 1;
    }
  }

  void choseP2() {

    P2Select.x = constrain(P2Select.x, -1, 1);
    P2Select.y = constrain(P2Select.y, -1, 1);

    if (keys[8] && G.T.Bt2 == 0) { // up
      P2Select.y -= 1;
      G.T.Bt2 = 1;
    }
    if (keys[7] && G.T.Bt2 == 0) { // down
      P2Select.y += 1;
      G.T.Bt2 = 1;
    }
    if (keys[6] && G.T.Bt2 == 0) { // left
      P2Select.x -= 1;
      G.T.Bt2 = 1;
    }
    if (keys[5] && G.T.Bt2 == 0) { // right
      P2Select.x += 1;
      G.T.Bt2 = 1;
    }
  }

  void accept() {
    fill(0, 0, 200);
    stroke(200, 0, 0);
    strokeWeight(2);
    rect(0, 150, width, 75);
    f = createFont("areal", 20, true);
    fill(255, 0, 0);
    textFont(f, 36);
    textAlign(CENTER);
    text("ACCEPT THIS ACTION?", width/2, height/2);
    textAlign(LEFT);


    if (keys[0] && acceptP1 == -1 && acceptP2 == -1 && G.T.St == 0) {
      accept = false;
      P1Select = new PVector(0, 0);
      P2Select = new PVector(0, 0);
      G.T.St = 1;
      acceptP2 = 0;
      acceptP1 = 0;
    }
        if (keys[0] && acceptP1 == 1 && acceptP2 == 1 && G.T.St == 0) {
      accept = false;
      P1Select = new PVector(0, 0);
      P2Select = new PVector(0, 0);
      G.T.St = 1;
      acceptP2 = 0;
      acceptP1 = 0;
    }

    if (keys[6]) {
      acceptP2 = -1;
    }
    if (keys[5]) {
      acceptP2 = 1;
    }
    if (keys[1]) {
      acceptP1 = -1;
    }

    if (keys[3]) {
      acceptP1 = 1;
    }
  }

  void pause() {
  }


  void run() {
    taskChoice() ;
    upgradeChoice();
    highLight();

    if (accept) {
      accept();
      acceptHighLight();
    } else { 
      choseP1();
      choseP2();
    }
  }
}
