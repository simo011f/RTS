//<>// //<>// //<>// //<>// //<>// //<>// //<>//
class Energy {
  int timer;
  PVector energy = new PVector(0, 0);
  int energyTotal;
  int energyMade;
  int energyUsed;
  boolean prodotionStop = false;
  int conectedTowers;



  void energyMade() { 
<<<<<<< HEAD
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
=======
    if (conectedTowers < 0) {
      conectedTowers=0;
    }


    for (int j = 0; j < game.player.energyTower.size(); j++) {   
      conectedTowers = game.player.energyTower.get(j).baseConeced+conectedTowers;
      if (game.player.energyTower.get(j).baseConeced>=1 && game.player.energyTower.get(j).coutedOnBase==false) { 
        game.player.energyTower.get(j).coutedOnBase=true;
>>>>>>> Player-og-enemy-enteration
      }
    }
  }

  void energyLogic() {
    if (game.player.GO) {
      energy.x = game.player.energyTower.size()*49;

      timer++;
      energyMade = conectedTowers*49;


      energyTotal = energyMade + energyUsed;

      energy.z = energy.x + energy.y;

<<<<<<< HEAD
<<<<<<< HEAD
      //////println(energyTotal, energyMade, energyUsed, timer);
=======
      println(energyTotal, energyMade, energyUsed, timer, conectedTowers);
>>>>>>> Player-og-enemy-enteration
=======
      println(energyTotal, energyMade, energyUsed, timer);
>>>>>>> parent of 692abb3... der er lavet noget terranin
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
  }


  void energyGrid() {  
    if (game.player.base == null)
    {
      return;
    }
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
    for (int i = 0; i < game.player.tower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.tower.get(i).location.x*10+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.tower.get(i).location.x*10+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.tower.get(i).location.y*10+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.tower.get(i).location.y*10+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.tower.get(i).location.x*10+5, game.player.tower.get(i).location.y*10+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
          game.player.energyTower.get(j).conected=true;
          game.player.tower.get(i).conected=true;
        }        
        if ((game.player.tower.get(i).location.x*10+5)-(game.player.energyTower.get(j).location.x+5) > 140 || (game.player.tower.get(i).location.x*10+5)-(game.player.energyTower.get(j).location.x+5) < -140 || (game.player.tower.get(i).location.y*10+5)-(game.player.energyTower.get(j).location.y+5) > 140 || (game.player.tower.get(i).location.y*10+5)-(game.player.energyTower.get(j).location.y+5) < -140) {
          game.player.tower.get(i).conected=false;
          game.player.energyTower.get(j).conected=false;
        }
      }
    }
    for (int i = 0; i < game.player.bombTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.bombTower.get(i).location.x*10+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.bombTower.get(i).location.x*10+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.bombTower.get(i).location.y*10+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.bombTower.get(i).location.y*10+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.bombTower.get(i).location.x*10+5, game.player.bombTower.get(i).location.y*10+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
          game.player.energyTower.get(j).conected=true;
          game.player.bombTower.get(i).conected=true;
        } 
        if ((game.player.bombTower.get(i).location.x*10+5)-(game.player.energyTower.get(j).location.x+5) > 140 || (game.player.bombTower.get(i).location.x*10+5)-(game.player.energyTower.get(j).location.x+5) < -140 || (game.player.bombTower.get(i).location.y*10+5)-(game.player.energyTower.get(j).location.y+5) > 140 || (game.player.bombTower.get(i).location.y*10+5)-(game.player.energyTower.get(j).location.y+5) < -140) {
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

    for (int j = 0; j < game.player.energyTower.size(); j++) {

      println((game.player.base.location.x+5)/*-(game.player.energyTower.get(j).location.x+5) ,(game.player.base.location.x+5)-(game.player.energyTower.get(j).location.x+5) ,(game.player.base.location.y+5)-(game.player.energyTower.get(j).location.y+5) ,(game.player.base.location.y+5)-(game.player.energyTower.get(j).location.y+5)*/ );
      if ((game.player.base.location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.base.location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.base.location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.base.location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
        line (game.player.base.location.x+5, game.player.base.location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);

        game.player.base.conected=true;   
        game.player.energyTower.get(j).conected=true;
      }
    }

    for (int j = 0; j < game.player.tower.size(); j++) {
      if ((game.player.base.location.x+5)-(game.player.tower.get(j).location.x+5) <= 140 &&(game.player.base.location.x+5)-(game.player.tower.get(j).location.x+5) >= -140 && (game.player.base.location.y+5)-(game.player.tower.get(j).location.y+5) <= 140 &&(game.player.base.location.y+5)-(game.player.tower.get(j).location.y+5) >= -140) {
        line (game.player.base.location.x+5, game.player.base.location.y+5, game.player.tower.get(j).location.x+5, game.player.tower.get(j).location.y+5);
        game.player.base.conected=true;   
        game.player.tower.get(j).conected=true;
      }
    }

    for (int j = 0; j < game.player.bombTower.size(); j++) {
      if ((game.player.base.location.x+5)-(game.player.bombTower.get(j).location.x+5) <= 140 &&(game.player.base.location.x+5)-(game.player.bombTower.get(j).location.x+5) >= -140 && (game.player.base.location.y+5)-(game.player.bombTower.get(j).location.y+5) <= 140 &&(game.player.base.location.y+5)-(game.player.bombTower.get(j).location.y+5) >= -140) {
        line (game.player.base.location.x+5, game.player.base.location.y+5, game.player.bombTower.get(j).location.x+5, game.player.bombTower.get(j).location.y+5);
        game.player.base.conected=true;
        game.player.bombTower.get(j).conected=true;
      }
    }
  }

  void run() {
<<<<<<< HEAD
<<<<<<< HEAD
    //////println(energy);
=======
>>>>>>> Player-og-enemy-enteration
=======
    println(energy);
>>>>>>> parent of 692abb3... der er lavet noget terranin
    energyMade();
    energyGrid(); 
    energyLogic();

    if (timer > 10) {
      timer = 10;
    }
  }
}
