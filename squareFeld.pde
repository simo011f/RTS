class Squares {
  PVector loc;
  int scale=10;
  
  Squares(PVector l) {
    loc = l.get();
  }
  
  void display() {
    fill(0, 0, 255);
    stroke(0);
    strokeWeight(1.5);
    rect(loc.x, loc.y, scale, scale);
  }
  
  void run() {
    display();
  }
}

class SquareFeld {  
  ArrayList<Squares> parts = new ArrayList<Squares>();

  PVector squareNR  = new PVector(0, 0);
  int hej=0; 
  int t;
  int scale = 10;  
  int gridSquares = 0;
  int c;

  int cols = width/scale;
  int rows = height/scale;

  PVector[] grid = new PVector[13501];
  void grid() {
    
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {  

        int x = i*scale;
        int y = j*scale;
        // Begin loop for rows

        grid[gridSquares]=new PVector(x, y);
        if (gridSquares<=13500) {
          gridSquares++;
        }
        if (gridSquares>13500) {
          gridSquares=13500;
        }
      }
    }
  }

  void highLight() {
    if (mouseX>grid[0].x && mouseX<grid[0].x+scale && mouseY>grid[0].y && mouseY<grid[0].y+scale) {
      println("hej");
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1.5);
      rect(grid[0].x, grid[0].y, scale, scale);
    }
  }



 

  void run() {     
    for (int i = parts.size()-1; i >=0; i--) {
      Squares p =parts.get(i);
      p.run();
    }

    grid(); 
    highLight();


    //if (mousePressed) {
    //  nr=(mouseX/10)*(mouseY/10);

    println(grid[int(squareNR.x)], grid[int(squareNR.y)], squareNR, squareNR.x+squareNR.y);
    //}
  }
}
