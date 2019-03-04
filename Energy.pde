class Energy {

  int timer = 98765432;

  void energyGrid() {  

    for (int i = 0; i < game.player.energyTower.size(); i++) {

      for (int j = 1; j < game.player.energyTower.size(); j++) {


        if ((game.player.energyTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) <= 140 &&(game.player.energyTower.get(i).location.x+5)-(game.player.energyTower.get(j).location.x+5) >= -140 && (game.player.energyTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) <= 140 &&(game.player.energyTower.get(i).location.y+5)-(game.player.energyTower.get(j).location.y+5) >= -140) {
          line (game.player.energyTower.get(i).location.x+5, game.player.energyTower.get(i).location.y+5, game.player.energyTower.get(j).location.x+5, game.player.energyTower.get(j).location.y+5);
        }
      }
    }
  }

  void run() {



    energyGrid();
  }
}
