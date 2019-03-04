class Square {
  PVector loc;

  int gridSquareSize = 10;

  Square(PVector l) {

    loc = l.get();
  } 

  void display() {
    fill(0, 0, 255);
    stroke(0);
    strokeWeight(1.5);
    rect(loc.x, loc.y, gridSquareSize, gridSquareSize);
  }

  void run() {
    display();
  }
}

class SquareField {  
  ArrayList<Square> parts = new ArrayList<Square>();

  PVector squareNR  = new PVector(0, 0);
  int hej=0; 
  int t;
  int scale = 10;  
  int gridSquares = 0;
  int c;

  int cols = width/scale;
  int rows = height/scale;

  int[][] ocupied = new int[cols][rows];
  PVector[][] grid = new PVector[cols][rows];

  SquareField() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {  
        grid[i][j] = new PVector(i*scale, j*scale);
        ocupied[i][j] = 0;
      }
    }
  }

  void highLight() {
    if (mousePressed) {
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(1.5);
      rect(grid[(mouseX/10)][(mouseY/10)].x, grid[(mouseX/10)][(mouseY/10)].y, scale, scale);
    }
  }

  void addParikle() {  

  }

  void run() {     
    for (int i = parts.size()-1; i >=0; i--) {
      Square p =parts.get(i);
      p.run();
    }
    highLight();
    addParikle();
  }
}
