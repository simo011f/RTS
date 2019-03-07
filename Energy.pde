class Energy { //<>//
  int timer;

  int energyTotal;
  int energyMade;
  int energyUsed;
  boolean prodotionStop = false;
  int conectedTowers;



  void energyMade() { 
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {   
        println(i, j, game.player.base.get(i).conected);   
        if (game.player.energyTower.get(j).conected && game.player.base.get(i).conected) {
          println("hej");
          conectedTowers=game.player.energyTower.size();
        }  
        if (game.player.base.get(i).conected == false) {

          conectedTowers=0;
        }
      }
    }
  }

  void energyLogic() {

    timer++;
    energyMade = conectedTowers*49;


    energyTotal = energyMade + energyUsed;

    println(energyTotal, energyMade, energyUsed, timer);
    if (energyTotal < 0 && timer > 2) {
      prodotionStop=true;
    }    

    if (prodotionStop) {
      timer = energyTotal/4;
      prodotionStop=false;
    }

   

    if (timer >= 0) {
      energyTotal = 1;
    }
  }


  void energyGrid() {  

    for (int i = 1; i < game.player.energyTower.size(); i++) {
      for (int j = 1; j < game.player.energyTower.size(); j++) {
        if (i-1!=j) {
          if ((game.player.energyTower.get(i-1).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 && (game.player.energyTower.get(i-1).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.energyTower.get(i-1).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.energyTower.get(i-1).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
            line (game.player.energyTower.get(i-1).location.x+5, game.player.energyTower.get(i-1).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);

            game.player.energyTower.get(i-1).conected=true;
            game.player.energyTower.get(j).conected=true;
          }
        }
      }
    }
    for (int i = 0; i < game.player.shotTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.shotTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.shotTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.shotTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.shotTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.shotTower.get(i).location.x+5, game.player.shotTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
          game.player.energyTower.get(j).conected=true;
          game.player.shotTower.get(i).conected=true;
        }        
        if ((game.player.shotTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) > 140 || (game.player.shotTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) < -140 || (game.player.shotTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) > 140 || (game.player.shotTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) < -140) {
          game.player.shotTower.get(i).conected=false;
          game.player.energyTower.get(j).conected=false;
        }
      }
    }
    for (int i = 0; i < game.player.bombTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.bombTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.bombTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.bombTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.bombTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.bombTower.get(i).location.x+5, game.player.bombTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
          game.player.energyTower.get(j).conected=true;
          game.player.bombTower.get(i).conected=true;
        } 
        if ((game.player.bombTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) > 140 || (game.player.bombTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) < -140 || (game.player.bombTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) > 140 || (game.player.bombTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) < -140) {
          game.player.bombTower.get(i).conected=false;
          game.player.energyTower.get(j).conected=false;
        }
      }
    }

    for (int i = 0; i < game.player.enemyAttackTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.enemyAttackTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 && (game.player.enemyAttackTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.enemyAttackTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 && (game.player.enemyAttackTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.enemyAttackTower.get(i).location.x+5, game.player.enemyAttackTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
          game.player.energyTower.get(j).conected=true; 
          game.player.enemyAttackTower.get(i).conected=true;
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {


        if ((game.player.base.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);

          game.player.base.get(i).conected=true;   
          game.player.energyTower.get(j).conected=true;
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.shotTower.size(); j++) {
        if ((game.player.base.get(i).location.x+5)-(game.player.shotTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.shotTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.shotTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.shotTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.shotTower.get(j).location.x+5, game.player.shotTower.get(j).location.y+5);
          game.player.base.get(i).conected=true;   
          game.player.shotTower.get(i).conected=true;
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.bombTower.size(); j++) {
        if ((game.player.base.get(i).location.x+5)-(game.player.bombTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.bombTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.bombTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.bombTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.bombTower.get(j).location.x+5, game.player.bombTower.get(j).location.y+5);
          game.player.base.get(i).conected=true;
          game.player.bombTower.get(j).conected=true;
        }
      }
    }
  }

  void run() {
    energyLogic();
    energyMade();
    energyGrid(); 
   
    if (timer > 10) {
      timer = 10;
    } 

  }
}
