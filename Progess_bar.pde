class ProgessBar {

  PFont f;
  int proR;
  int proB;
  int proP1W1;
  int proP1W2;
  int proP1W3;
  int proP1W4;
  int proP2U1;
  int proP2U2;
  int proP2U3;
  int proP2U4;

  ProgessBar() {
  }

  void ProgressBarscore() {

    f = createFont("areal", 16, true);
    stroke(0);
    strokeWeight(0);
    textAlign(LEFT);

    proR = 100;
    proB = 130;

    float mproR = map(proR, 0, 100, 0, width-100);
    float mproB = constrain(map(proB, 0, 100, 0, width-100), 0, width-100);

    fill(255, 0, 0);
    rect(50, 10, mproR, 15);
    fill(0, 0, 255);
    rect(50, 26, mproB, 15);
    stroke(0);
    strokeWeight(2);
    noFill();
    rect(50, 10, width-100, 15);
    rect(50, 26, width-100, 15);
    fill(100);
    textFont(f, 13);
    text(proR+" Red", 53, 23);
    text(proB+" Blue", 53, 39);
  }

  void ProgressBarworker() {
    if (G.Wc.accept==false) {
      if (G.Wc.P1Select.x == -1 && G.Wc.P1Select.y == 0) { 
        proP1W1 = 40;


        float mproP1W1 = map(proP1W1, 0, 100, 0, width-100);


        fill(23, 123, 222);
        rect(10, 65, mproP1W1, 15);
        stroke(0);
        strokeWeight(2);
        noFill();
        textAlign(LEFT);

        rect(10, 65, width*3/8-20, 15);
        rect(10, 81, width*3/8-20, 15);
        fill(100);
        textFont(f, 13);
        text(mproP1W1+" Red", 13, 78);
        text(proB+" Blue", 13, 94);
      }
      if (G.Wc.P1Select.x == 0 && G.Wc.P1Select.y == 1) {
        proP1W2 = 40;


        float mproP1W2 = map(proP1W2, 0, 100, 0, width-100);


        fill(23, 123, 222);
        rect(10, 65, mproP1W2, 15);
        stroke(0);
        strokeWeight(2);
        noFill();
        textAlign(LEFT);

        rect(10, 65, width*3/8-20, 15);
        rect(10, 81, width*3/8-20, 15);
        fill(100);
        textFont(f, 13);
        text(mproP1W2+" Red", 13, 78);
        text(proB+" Blue", 13, 94);
      }
      if (G.Wc.P1Select.x == 1 && G.Wc.P1Select.y == 0) {
        proP1W3 = 40;


        float mproP1W3 = map(proP1W3, 0, 100, 0, width-100);


        fill(23, 123, 222);
        rect(10, 65, mproP1W3, 15);
        stroke(0);
        strokeWeight(2);
        noFill();
        textAlign(LEFT);


        rect(10, 65, width*3/8-20, 15);
        rect(10, 81, width*3/8-20, 15);
        fill(100);
        textFont(f, 13);
        text(mproP1W3+" Red", 13, 78);
        text(proB+" Blue", 13, 94);
      }
      if (G.Wc.P1Select.x == 0 && G.Wc.P1Select.y == -1) {
        proP1W3 = 40;


        float mproP1W3 = map(proP1W3, 0, 100, 0, width-100);


        fill(23, 123, 222);
        rect(10, 65, mproP1W3, 15);
        stroke(0);
        strokeWeight(2);
        noFill();
        textAlign(LEFT);

        rect(10, 65, width*3/8-20, 15);
        rect(10, 81, width*3/8-20, 15);
        fill(100);
        textFont(f, 13);
        text(mproP1W3+" Red", 13, 78);
        text(proB+" Blue", 13, 94);
      }
      if (G.Wc.P2Select.x == 1 && G.Wc.P2Select.y == 0) {    
        proP2U1 = 40;


        float mproP2U1 = map(proP2U1, 0, 100, 0, width-100);


        fill(23, 123, 222);
        rect(width*5/8+10, 65, mproP2U1, 15);


        stroke(0);
        strokeWeight(2);
        noFill();
        rect(width*5/8+10, 65, width*3/8-20, 15);
        rect(width*5/8+10, 81, width*3/8-20, 15);
        fill(100);
        textFont(f, 13);
        text(mproP2U1+" Red", width*5/8+13, 78);
        text(proB+" Blue", width*5/8+13, 94);
      }
      if (G.Wc.P2Select.x == -1 && G.Wc.P2Select.y == 0) {   
        proP2U2 = 40;


        float mproP2U2 = map(proP2U2, 0, 100, 0, width-100);


        fill(23, 123, 222);
        rect(width*5/8+10, 65, mproP2U2, 15);
        stroke(0);
        strokeWeight(2);
        noFill();
        textAlign(LEFT);

        rect(width*5/8+10, 65, width*3/8-20, 15);
        rect(width*5/8+10, 81, width*3/8-20, 15);
        fill(100);
        textFont(f, 13);
        text(mproP2U2+" Red", width*5/8+13, 78);
        text(proB+" Blue", width*5/8+13, 94);
      }
      if (G.Wc.P2Select.x == 0 && G.Wc.P2Select.y == 1) {
        proP2U3 = 40;


        float mproP2U3 = map(proP2U3, 0, 100, 0, width-100);


        fill(23, 123, 222);
        rect(width*5/8+10, 65, mproP2U3, 15);
        stroke(0);
        strokeWeight(2);
        noFill();
        textAlign(LEFT);

        rect(width*5/8+10, 65, width*3/8-20, 15);
        rect(width*5/8+10, 81, width*3/8-20, 15);
        fill(100);
        textFont(f, 13);
        text(mproP2U3+" Red", width*5/8+13, 78);
        text(proB+" Blue", width*5/8+13, 94);
      }
      if (G.Wc.P2Select.x == 0 && G.Wc.P2Select.y == -1) {
        proP2U4 = 40;


        float mproP2U4 = map(proP2U4, 0, 100, 0, width-100);


        fill(23, 123, 222);
        rect(width*5/8+10, 65, mproP2U4, 15);
        stroke(0);
        strokeWeight(2);
        noFill();
        textAlign(LEFT);

        rect(width*5/8+10, 65, width*3/8-20, 15);
        rect(width*5/8+10, 81, width*3/8-20, 15);
        fill(100);
        textFont(f, 13);
        text(mproP2U4+" Red", width*5/8+13, 78);
        text(proB+" Blue", width*5/8+13, 94);
      }
    }
  }

  void run() {
    ProgressBarworker();
    ProgressBarscore();
  }
}
