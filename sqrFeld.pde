class sqr {
  PVector loc;
  int scale=10;
  sqr(PVector l) {
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

class sqrFeld {  
  ArrayList<sqr> parts = new ArrayList<sqr>();

  PVector nr  = new PVector(0, 0);
  ;
  int hej=0; 
  int t;
  int scale = 10;  
  int k=0;
  int c;

  int cols = width/scale;
  int rows = height/scale;

  PVector[] grid = new PVector[13501];
  void gred() {




    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {  

        int x = i*scale;
        int y = j*scale;
        // Begin loop for rows




        grid[k]=new PVector(x, y);


        if (k<=13500) {
          k++;
        }
        if (k>13500) {
          k=13500;
        }
      }
    }
  }

  void high() {


    if (mouseX>grid[0].x && mouseX<grid[0].x+scale && mouseY>grid[0].y && mouseY<grid[0].y+scale) {
      println("hej");
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1.5);
      rect(grid[0].x, grid[0].y, scale, scale);
    }
  }



  void addParikle() {  
    c = int(random(3)); 
    hej = int(random(5));
   
    if (hej <= 0) {
      nr.x = nr.x + 90;
      
    }  
    if (hej == 1) {
      nr.x=nr.x-90;
      
    }  
    if (hej == 2) {
      nr.y=nr.y+1;
      
    } if (hej == 3) {
      nr.y=nr.y-1;
      
    } 

    if (nr.x<0) {
      nr.x=0;
    } 
    if (nr.y<0) {
      nr.y=0;
    }
    if (nr.x>13500) {
      nr.x=13500;
    }
    if (nr.y>13500) {
      nr.y=13500;
    }
    if (c==0) {
      parts.add(new sqr(grid[int(nr.x)]));
    }
    if (c==1) {
      parts.add(new sqr(grid[int(nr.y)]));
    }if (c==2) {
      parts.add(new sqr(grid[int(nr.x+nr.y)]));
    }
  }

  void run() {     
    for (int i = parts.size()-1; i >=0; i--) {
      sqr p =parts.get(i);
      p.run();
    }

    gred(); 
    high();

    addParikle();
    //if (mousePressed) {
    //  nr=(mouseX/10)*(mouseY/10);

    println(grid[int(nr.x)], grid[int(nr.y)], nr, nr.x+nr.y);
    //}
  }
}
