Game G;


void setup() {
  size(1501, 901);
  G = new Game();
  //frameRate(2);
}

void draw() {
  background(255);
  G.run(); 
  //println(mouseX, mouseY);
}

boolean[] keys = new boolean[11];
//this boolean handles all the key inputs.
void keyPressed() {
  switch (key) {
  case ' ':
    keys[0] = true;
    break;
  case 'a':
    keys[1] = true;
    break;
  case 's':
    keys[2] = true;
    break;
  case 'd':
    keys[3] = true;
    break;
  case 'w':
    keys[4] = true;
    break;
  }
  switch (keyCode) {
  case RIGHT:
    keys[5] = true;
    break;
  case LEFT:
    keys[6] = true;
    break;
  case DOWN:
    keys[7] = true;
    break;
  case UP:
    keys[8] = true;
    break;
  case ESC:
    keys[9] = true;
    key = 0;
    break;
  case ENTER:
    keys[10] = true;
    break;
  }
}

void keyReleased() {
  switch (key) {
  case ' ':
    keys[0] = false;
    G.timer.St = 0;
    break;
  case 'a':
    keys[1] = false;
    G.timer.Bt1=0;
    break;
  case 's':
    keys[2] = false;
    G.timer.Bt1=0;
    break;
  case 'd':
    keys[3] = false;
    G.timer.Bt1=0;
    break;
  case 'w':
    keys[4] = false;
    G.timer.Bt1=0;
    break;
  }
  switch (keyCode) {
  case RIGHT:
    keys[5] = false;
    G.timer.Bt2=0;
    break;
  case LEFT:
    keys[6] = false;
    G.timer.Bt2=0;
    break;
  case DOWN:
    keys[7] = false;
    G.timer.Bt2=0;
    break;
  case UP:
    keys[8] = false;
    G.timer.Bt2=0;
    break;
  case ESC:
    keys[9] = false;
    key = 0;
    G.timer.es = 0;
    break;
  case ENTER:
    keys[10] = true;
    break;
  }
}
