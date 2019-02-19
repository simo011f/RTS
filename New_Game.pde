class NewGame {
  PFont f; 
  boolean LVL1 = false;
  int cho = 255;
  NewGame() {
  }

  void bord() {
    f = createFont("areal", 16, true);
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("New Game", width*4/8, 40);
    textAlign(LEFT);

    fill(cho, 255, cho);
    stroke(0);
    strokeWeight(2);

    rect(width*1/8, 50, 150, height*1/4); 
    fill(0, 0, 0);
    textFont(f, 26);
    textAlign(CENTER);
    text("LvL1", width*1/8+75, 110);
    textAlign(LEFT);



    fill(0, 150, 0);
    stroke(0);
    strokeWeight(2);

    rect(width*2/8+50, 50, 150, height*1/4);     

    rect(width*3/8+100, 50, 150, height*1/4);  

    rect(width*4/8+150, 50, 150, height*1/4);

    rect(width*1/8, 150, 150, height*1/4); 

    rect(width*2/8+50, 150, 150, height*1/4);     

    rect(width*3/8+100, 150, 150, height*1/4);  

    rect(width*4/8+150, 150, 150, height*1/4); 

    rect(width*1/8, 250, 150, height*1/4); 

    rect(width*2/8+50, 250, 150, height*1/4);     

    rect(width*3/8+100, 250, 150, height*1/4);  

    rect(width*4/8+150, 250, 150, height*1/4);
  }

  void bordlogic() {    
     if (mouseX >= width*2/16 && mouseX <= width*5/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
      cho = 0;
      LVL1 = true;
    } else {
      cho = 255;
      LVL1 = false;
    }
  }

  void run() { 


    bord();
    bordlogic();
  }
}
