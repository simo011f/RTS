class Square
{
  PVector loc;

  int gridSquareSize = 10;

  Square() {
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

  int cols = width / scale;
  int rows = (height / scale) - 6;

  int[][] ocupied = new int[cols][rows];
  PVector[][] grid = new PVector[cols][rows];

  SquareField() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) { 
        grid[i][j] = new PVector();
        ocupied[i][j] = 0;
      }
    }
  }

  void addParikle() {
  }

  void run() {     
  }
}
