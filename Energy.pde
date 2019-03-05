class Energy {

  void energyGrid() {  

    for (int i = 0; i < game.player.energyTower.size(); i++) {
      for (int j = 1; j < game.player.energyTower.size(); j++) {
        if ((game.player.energyTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.energyTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.energyTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.energyTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.energyTower.get(i).location.x+5, game.player.energyTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
       
        }
      }
    }
    for (int i = 0; i < game.player.shotTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.shotTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.shotTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.shotTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.shotTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.shotTower.get(i).location.x+5, game.player.shotTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.bombTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.bombTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.bombTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.bombTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.bombTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.bombTower.get(i).location.x+5, game.player.bombTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.enemyAttackTower.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.enemyAttackTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.enemyAttackTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.enemyAttackTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.enemyAttackTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.enemyAttackTower.get(i).location.x+5, game.player.enemyAttackTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.energyTower.size(); j++) {
        if ((game.player.base.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.shotTower.size(); j++) {
        if ((game.player.base.get(i).location.x+5)-(game.player.shotTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.shotTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.shotTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.shotTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.shotTower.get(j).location.x+5, game.player.shotTower.get(j).location.y+5);
        }
      }
    }
    for (int i = 0; i < game.player.base.size(); i++) {
      for (int j = 0; j < game.player.bombTower.size(); j++) {
        if ((game.player.base.get(i).location.x+5)-(game.player.bombTower.get(j).location.x+5) <= 140 &&(game.player.base.get(i).location.x+5)-(game.player.bombTower.get(j).location.x+5) >= -140 && (game.player.base.get(i).location.y+5)-(game.player.bombTower.get(j).location.y+5) <= 140 &&(game.player.base.get(i).location.y+5)-(game.player.bombTower.get(j).location.y+5) >= -140) {
          line (game.player.base.get(i).location.x+5, game.player.base.get(i).location.y+5, game.player.bombTower.get(j).location.x+5, game.player.bombTower.get(j).location.y+5);
        }
      }
    }
  }

  void run() {
    energyGrid();
  }
}
