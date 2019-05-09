class LoadGame {
  PFont font; 
  boolean[] levelNR = new boolean[13];
  int[] levelColors = new int[13];
  int colorLeave;
  boolean leave;
  int timer;

  LoadGame() { 
    font = createFont("arial", 16, true);
  }

  void levelBord() {

    //this draws all the necessary numbers at the right locations

    fill(0, 0, 0); 
    textFont(font, 40);
    textAlign(CENTER);
    text("Load Game", width*4/8, 40);
    textAlign(LEFT);


    fill(levelColors[0], 255, levelColors[0]);
    stroke(0);
    strokeWeight(2);
    rect(width*2/16, height*1/8, width*5/16 - width*2/16, height*3/8 - height*1/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL1", width*3/16 + width*1/32, height*2/8 + 10);
    textAlign(LEFT);



    fill(levelColors[1], 255, levelColors[1] );
    if (game.nr <= 1) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*5/16, height*1/8, width*8/16 - width*5/16, height*3/8 - height*1/8);     
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL2", width*6/16 + width*1/32, height*2/8 + 10);
    textAlign(LEFT);


    fill(levelColors[2], 255, levelColors[2] );
    if (game.nr <= 2) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*8/16, height*1/8, width*11/16 - width*8/16, height*3/8 - height*1/8);     
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL3", width*9/16 + width*1/32, height*2/8 + 10);
    textAlign(LEFT);


    fill(levelColors[3], 255, levelColors[3] );
    if (game.nr <= 3) {
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*11/16, height*1/8, width*14/16 - width*11/16, height*3/8 - height*1/8);     
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL4", width*12/16 + width*1/32, height*2/8 + 10);
    textAlign(LEFT);

    fill(levelColors[4], 255, levelColors[4] );
    if (game.nr <= 4) {
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*2/16, height*3/8, width*5/16 - width*2/16, height*5/8 - height*3/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL5", width*3/16 + width*1/32, height*4/8 + 10);    
    textAlign(LEFT);


    fill(levelColors[5], 255, levelColors[5] );
    if (game.nr <= 5) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*5/16, height*3/8, width*8/16 - width*5/16, height*5/8 - height*3/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL6", width*6/16 + width*1/32, height*4/8 + 10);
    textAlign(LEFT);

    fill(levelColors[6], 255, levelColors[6] );
    if (game.nr <= 6) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*8/16, height*3/8, width*11/16 - width*8/16, height*5/8 - height*3/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL7", width*9/16 + width*1/32, height*4/8 + 10);
    textAlign(LEFT); 

    fill(levelColors[7], 255, levelColors[7] );
    if (game.nr <= 7) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*11/16, height*3/8, width*14/16 - width*11/16, height*5/8 - height*3/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL8", width*12/16 + width*1/32, height*4/8 + 10);
    textAlign(LEFT);

    fill(levelColors[8], 255, levelColors[8] );
    if (game.nr <= 8) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*2/16, height*5/8, width*5/16 - width*2/16, height*7/8 - height*5/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL9", width*3/16 + width*1/32, height*6/8 + 10);    
    textAlign(LEFT);


    fill(levelColors[9], 255, levelColors[9]);
    if (game.nr <= 9) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*5/16, height*5/8, width*8/16 - width*5/16, height*7/8 - height*5/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL10", width*6/16 + width*1/32, height*6/8 + 10);
    textAlign(LEFT);

    fill(levelColors[10], 255, levelColors[10] );
    if (game.nr <= 10) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*8/16, height*5/8, width*11/16 - width*8/16, height*7/8 - height*5/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL11", width*9/16 + width*1/32, height*6/8 + 10);
    textAlign(LEFT); 

    fill(levelColors[11], 255, levelColors[11] );
    if (game.nr <= 11) {  
      fill(0, 200);
    }
    stroke(0);
    strokeWeight(2);
    rect(width*11/16, height*5/8, width*14/16 - width*11/16, height*7/8 - height*5/8); 
    fill(0, 0, 0);
    textFont(font, 26);
    textAlign(CENTER);
    text("LvL12", width*12/16 + width*1/32, height*6/8 + 10);
    textAlign(LEFT);
  }


  void levelBordLogic() {    
    if (timer<30) {
      timer++;
    }
    //You can chose the level that you want to play.
    if ( timer >= 10) {
      if (mouseX >= width*2/16 && mouseX <= width*5/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
        levelColors[0] = 0;
        levelNR[0] = true;
      } else {
        levelColors[0] = 255;
        levelNR[0] = false;
      }
      if (game.nr >= 1) { 
        if (mouseX >= width*5/16 && mouseX <= width*8/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
          levelColors[1] = 0;
          levelNR[1] = true;
        } else {
          levelColors[1] = 255;
          levelNR[1] = false;
        }
      } 
      if (game.nr >= 2) { 
        if (mouseX >= width*8/16 && mouseX <= width*11/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
          levelColors[2] = 0;
          levelNR[2] = true;
        } else {
          levelColors[2] = 255;
          levelNR[2] = false;
        }
      } 
      if (game.nr >= 3) { 
        if (mouseX >= width*11/16 && mouseX <= width*14/16 && mouseY >= height*1/8 && mouseY <= height*3/8) {
          levelColors[3] = 0;
          levelNR[3] = true;
        } else {
          levelColors[3] = 255;
          levelNR[3] = false;
        }
      }     
      if (game.nr >= 4) { 
        if (mouseX >= width*2/16 && mouseX <= width*5/16 && mouseY >= height*3/8 && mouseY <= height*5/8) {
          levelColors[4] = 0;
          levelNR[4] = true;
        } else {
          levelColors[4] = 255;
          levelNR[4] = false;
        }
      }
      if (game.nr >= 5) { 
        if (mouseX >= width*5/16 && mouseX <= width*8/16 && mouseY >= height*3/8 && mouseY <= height*5/8) {
          levelColors[5] = 0;
          levelNR[5] = true;
        } else {
          levelColors[5] = 255;
          levelNR[5] = false;
        }
      } 
      if (game.nr >= 6) { 
        if (mouseX >= width*8/16 && mouseX <= width*11/16 && mouseY >= height*3/8 && mouseY <= height*5/8) {
          levelColors[6] = 0;
          levelNR[6] = true;
        } else {
          levelColors[6] = 255;
          levelNR[6] = false;
        }
      }  
      if (game.nr >= 7) { 
        if (mouseX >= width*11/16 && mouseX <= width*14/16 && mouseY >=height*3/8 && mouseY <= height*5/8) {
          levelColors[7] = 0;
          levelNR[7] = true;
        } else {
          levelColors[7] = 255;
          levelNR[7] = false;
        }
      }     
      if (game.nr >= 8) { 
        if (mouseX >= width*2/16 && mouseX <= width*5/16 && mouseY >= height*5/8 && mouseY <= height*7/8) {
          levelColors[8] = 0;
          levelNR[8] = true;
        } else {
          levelColors[8] = 255;
          levelNR[8] = false;
        }
      }
      if (game.nr >= 9) { 
        if (mouseX >= width*5/16 && mouseX <= width*8/16 && mouseY >= height*5/8 && mouseY <= height*7/8) {
          levelColors[9] = 0;
          levelNR[9] = true;
        } else {
          levelColors[9] = 255;
          levelNR[9] = false;
        }
      }  
      if (game.nr >= 10) { 
        if (mouseX >= width*8/16 && mouseX <= width*11/16 && mouseY >= height*5/8 && mouseY <= height*7/8) {
          levelColors[10] = 0;
          levelNR[10] = true;
        } else {
          levelColors[10] = 255;
          levelNR[10] = false;
        }
      }  
      if (game.nr >= 11) { 
        if (mouseX >= width*11/16 && mouseX <= width*14/16 && mouseY >= height*5/8 && mouseY <= height*7/8) {
          levelColors[11] = 0;
          levelNR[11] = true;
        } else {
          levelColors[11] = 255;
          levelNR[11] = false;
        }
      }
    }
  }


  void leave() {
    fill(255, colorLeave, 255);
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 80, 80);
    fill(0);
    textFont(font, 20);
    textAlign(CENTER);
    text("Back", 40, 45); 


    if (mouseX>=0 && mouseX<=80 && mouseY>=0 && mouseY<=80 ) {



      game.menu.timer = 0;
      colorLeave = 0;
      game.menu.screen[2]=false;
      game.menu.screen[1]=false;

      colorLeave = 0;
      game.menu.screen[2]=false;
      game.menu.screen[1]=false;


      leave = true;
    } else {
      colorLeave = 255;
      leave = false;
    }  
    textAlign(LEFT);
  }

  void run() { 

    leave();
    levelBord();
    levelBordLogic();
  }
}
