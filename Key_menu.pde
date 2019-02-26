class Keymenu {

  boolean leave;
  int lea;
  int t;
  PFont f;

  Keymenu() {
    f = createFont("arial", 16, true);
  }
  void tekst() { 
    textAlign(CENTER);
    fill(0);
    textFont(f, 35);
    text("← A", 115, 170);  
    text("D →", 245, 170); 

    text("W ↑", 445, 185);  
    text("S ↓", 445, 305); 

    text("Space"+"\n"+"Accept", 700, 125);  
    text("Esc"+"\n"+"Mini Menu", 700, 300);

    if (t >= 41 && t <= 49) { 
      textAlign(CENTER);
      fill(155);
      textFont(f, 35);
      text("← A", 115, 170); 
      text("S ↓", 445, 305);
    }
    if (t >= 86 && t <= 94) { 
      textAlign(CENTER);
      fill(155);
      textFont(f, 35);
      text("D →", 245, 170);
      text("W ↑", 445, 185);
    }   
    if (t >= 131 && t <= 139) { 
      textAlign(CENTER);
      fill(155);
      textFont(f, 35);
      text("D →", 245, 170);
      text("W ↑", 445, 185);
    }
    if (t >= 176 && t <= 180) { 
      textAlign(CENTER);
      fill(155);
      textFont(f, 35);
      text("← A", 115, 170);
      text("S ↓", 445, 305);
    }



    textAlign(LEFT);
  }

  void display() {


    t++;



    fill(0, 150, 0);
    stroke(0);
    strokeWeight(2);
    rect(25, height*2/4, height*1/4, width*1/8);     
    rect(width*1/4+25, height*2/4, height*1/4, width*1/8); 
    fill(150);
    stroke(0);
    strokeWeight(2);
    rect(width*1/8+25, height*2/4, height*1/4, width*1/8);

    fill(0, 150, 0);
    stroke(0);
    strokeWeight(2);
    rect(width*5/8, height/4-25, height*1/4, width*1/8);
    rect(width*5/8, height*3/4-25, height*1/4, width*1/8);
    fill(150);
    stroke(0);
    strokeWeight(2);
    rect(width*5/8, height*2/4-25, height*1/4, width*1/8);
  }

  void highligt() {
    //the animation of how to change spots
    if (t<=45) { 
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*1/8+25, height*2/4, height*1/4, width*1/8);
      rect(width*5/8, height*2/4-25, height*1/4, width*1/8);
    }
    if (t >= 45 && t <= 90) { 

      fill(0, 200, 0);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(25, height*2/4, height*1/4, width*1/8);
      rect(width*5/8, height*3/4-25, height*1/4, width*1/8);
    }
    if (t>=90 && t<135) { 
      fill(200);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*1/8+25, height*2/4, height*1/4, width*1/8);
      rect(width*5/8, height*2/4-25, height*1/4, width*1/8);
    }
    if (t >= 135 && t <= 180) { 

      fill(0, 200, 0);
      stroke(random(170, 250));
      strokeWeight(2);
      rect(width*1/4+25, height*2/4, height*1/4, width*1/8);  
      rect(width*5/8, height/4-25, height*1/4, width*1/8);
    } 

    if (t>=180) {
      t=0;
    }
  }

  void leave() {
    fill(255, lea, 255);
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 80, 80);
    fill(0);
    textFont(f, 20);
    textAlign(CENTER);
    text("Back", 40, 45);


    if (mouseX>=0 && mouseX<=80 && mouseY>=0 && mouseY<=80 ) {
      G.M.t=0;
      lea = 0;
      G.M.screen[3]=false;
      leave = true;
    } else {
      lea = 255;
      leave = false;
    }
    textAlign(LEFT);
  }

  void run() {
    tekst();

    display();
    highligt(); 
    leave();
  }
}
