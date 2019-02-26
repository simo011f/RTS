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

  PVector[][] grid = new PVector[cols][rows];

  SquareField() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {  
        grid[i][j] = new PVector(i*scale, j*scale);
      }
    }
  }

  void highLight() {
    if (mousePressed) {
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1.5);
      rect(grid[(mouseX/10)][(mouseY/10)].x, grid[(mouseX/10)][(mouseY/10)].y, scale, scale);
    }
  }

  void addParikle() {  


    //c = int(random(3)); 
    //hej = int(random(5));

    //if (hej <= 0) {
    //  squareNR.x = squareNR.x + 90;
    //}  
    //if (hej == 1) {
    //  squareNR.x=squareNR.x-90;
    //}  
    //if (hej == 2) {
    //  squareNR.y=squareNR.y+1;
    //} 
    //if (hej == 3) {
    //  squareNR.y=squareNR.y-1;
    //} 

    //if (squareNR.x<0) {
    //  squareNR.x=0;
    //} 
    //if (squareNR.y<0) {
    //  squareNR.y=0;
    //}
    //if (squareNR.x>13500) {
    //  squareNR.x=13500;
    //}
    //if (squareNR.y>13500) {
    //  squareNR.y=13500;
    //}
    //if (c==0) {
    //  parts.add(new Square(grid[int(squareNR.x)]));
    //}
    //if (c==1) {
    //  parts.add(new Square(grid[int(squareNR.y)]));
    //}
    //if (c==2) {
    //  parts.add(new Square(grid[int(squareNR.x+squareNR.y)]));
    //}
  }





  void run() {     
    for (int i = parts.size()-1; i >=0; i--) {
      Square p =parts.get(i);
      p.run();
    }


    highLight();
    addParikle();



    //println(grid[int(squareNR.x)], grid[int(squareNR.y)], squareNR, squareNR.x+squareNR.y);
  }
}
