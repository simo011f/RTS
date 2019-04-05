class EnemyPlasmentEditor {     //<>// //<>// //<>// //<>//
  Table table;

  int mapSaveNR = 0;

  boolean isMouseNotPressedSave = true;
  boolean isMouseNotPressedBasicStrength = true;
  boolean isMouseNotPressedUpdateMap = true;
  boolean isMouseNotPressedEmitterStrength = true;
  boolean isMouseNotPressedEmitterDelay = true;


  TerrainEditor terrainEditor = new TerrainEditor();

  PVector[][] newMap = new PVector[cols][rows];

  int[][] newBasicEnemys = new int[cols][rows];
  int newBasicEnemysStrength = 1; 

  ArrayList<Emitter> newLevelEmitters = new ArrayList<Emitter>();
  int newLevelEmitterStrength = 1;
  int newLevelEmitterDelay = 1;



  EnemyPlasmentEditor () 
  {
    thread("hotbar");
    createTabel();
    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++)
      {
        newMap[i][j] = new PVector(i, j, 0);
        newBasicEnemys[i][j] = -100;
      }
    }
  }

  void createTabel()
  {
    table = new Table();
    table.addColumn("x");
    table.addColumn("y");
    table.addColumn("EmitterDelay");
    table.addColumn("EmitterStrength");
    table.addColumn("BasicEnemyStrength");    
    table.addColumn("EnemyType");
    table.addColumn("LevelNR");
  }

  boolean enemyTypeOne = false;
  boolean enemyTypeTow = false;
  boolean enemyTypeThree = false;

  void hotbar()
  {
    int x;
    int y;

    fill(150);
    rect(width/2-500, height-60, 1000, 60);

    //Basic enemy seleckt
    x = width / 2 - 350;
    y = height - 30;
    textSize(15);
    fill(0);
    text("Basic enemy", x - 35, y - 15);

    if (mouseX >= x - 10 && mouseX <= x + 20)
    {
      if (mouseY >= height - 40 && mousePressed) {
        enemyTypeOne = true;
        enemyTypeTow = false;
        enemyTypeThree = false;
      }
    }

    fill(0, 5, 255, 100);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, scale, scale);
    increaseDecreaseBasicEnemyStrength(x, y);

    //Emitter selekt
    x = width / 2 - 1 * scale - 260;
    y = height - 1 * scale - 30;
    textSize(15);
    fill(0);
    text("Emitter", x-10, y-5);

    if (mouseX >= x && mouseX <= x + 30)
    {
      if (mouseY >= y && mousePressed) {
        enemyTypeOne = false;
        enemyTypeTow = true;
        enemyTypeThree = false;
      }
    }
    increaseDecreaseEmitterStrength(x, y);
    increaseDecreaseEmitterDelay(x, y);

    fill(200, 200, 25, 150);
    stroke(200, 100, 0);
    strokeWeight(0.5);
    rect(x, y, 3 * scale, 3 * scale);

    //New Enemy type selekt
    x = width / 2 - 1 * scale + 70;
    y = height - 1 * scale - 30;
    textSize(15);
    fill(0);
    text("New Enemy type", x - 15, y - 5);

    if (mouseX >= x && mouseX <= x + 30)
    {
      if (mouseY >= y && mousePressed) {
        enemyTypeOne = false;
        enemyTypeTow = false;
        enemyTypeThree = true;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        fill(160, 75, 30);
        stroke(0);
        strokeWeight(0.5);
        rect(x + 10 + i*scale, y + 10 + j*scale, scale, scale);
      }
    }

    // Reset level
    x = width / 2 - 1 * scale + 200;
    y = height - 1 * scale - 30;
    textSize(15);
    fill(0);
    text("Reset level", x - 15, y - 5);

    if (mouseX >= x && mouseX <= x + 30)
    {
      if (mouseY >= y && mousePressed) {
        overrideMap(mapSaveNR);
        loadEnemys(mapSaveNR);
      }
    }

    fill(0);
    stroke(0);
    strokeWeight(0.5);
    rect(x, y, 3 * scale, 3 * scale);
  }

  void increaseDecreaseBasicEnemyStrength(int x, int y)
  {
    fill(250);
    stroke(150);
    strokeWeight(0.5);
    rect(x + scale * 2, y - scale * 5 / 6, scale * 3, scale * 3 / 2);  
    rect(x + scale * 2, y + scale * 2 / 3, scale * 3, scale * 3 / 2);
    fill(0);
    text("+", x + scale * 3, y + scale * 5 / 6 - 4);
    textSize(20);
    text("-", x + 1 + scale * 3, y + scale * 2);
    textSize(15);
    text("Enemy strength: " + newBasicEnemysStrength, x - 140, y + 10);
    if (mouseX >= x + 20 && mouseX <= x + 50 && isMouseNotPressedBasicStrength)  
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed && newBasicEnemysStrength < 100)
        {
          newBasicEnemysStrength++;
        } 
        fill(10, 240, 10);
        rect(x + scale * 2, y - scale * 5 / 6, scale * 3, scale * 3 / 2);  
        fill(0);
        textSize(15);
        text("+", x + scale * 3, y + scale * 5 / 6 - 4);
      }
    }

    if (mouseX >= x + 20 && mouseX <= x + 50 && isMouseNotPressedBasicStrength)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && newBasicEnemysStrength > 0) 
        {
          newBasicEnemysStrength--;
        } 
        fill(240, 10, 10);
        rect(x + scale * 2, y + scale * 2 / 3, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale * 3, y + scale * 2 - 2);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedBasicStrength = false;
    } else
    {
      isMouseNotPressedBasicStrength = true;
    }
  }

  void increaseDecreaseEmitterStrength(int x, int y)
  {
    x = x + scale * 10;
    fill(250);
    stroke(150);
    strokeWeight(0.5);
    rect(x, y, scale * 3, scale * 3 / 2);  
    rect(x, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
    fill(0);
    textSize(15);
    text("+", x + scale, y + scale * 3 / 2 - 2);
    textSize(20);
    text("-", x + 1 + scale, y + scale * 3 - 2);
    textSize(15);
    text("Emitter strength: " + newLevelEmitterStrength, x - 50, y - 5);
    if (mouseX >= x && mouseX <= x + 30 && isMouseNotPressedEmitterStrength)  
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed && newLevelEmitterStrength < 10000)
        {
          newLevelEmitterStrength++;
        } 
        fill(10, 240, 10);
        rect(x, y, scale * 3, scale * 3 / 2);  
        fill(0);
        textSize(15);
        text("+", x + scale, y + scale * 3 / 2 - 2);
      }
    }

    if (mouseX >= x && mouseX <= x + 30 && isMouseNotPressedEmitterStrength)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && newLevelEmitterStrength > 1) 
        {
          newLevelEmitterStrength--;
        } 
        fill(240, 10, 10);
        rect(x, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale, y + scale * 3 - 2);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedEmitterStrength = false;
    } else
    {
      isMouseNotPressedEmitterStrength = true;
    }
  }

  void increaseDecreaseEmitterDelay(int x, int y)
  {
    x = x + scale * 24;
    fill(250);
    stroke(150);
    strokeWeight(0.5);
    rect(x, y, scale * 3, scale * 3 / 2);  
    rect(x, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
    fill(0);
    textSize(15);
    text("+", x + scale, y + scale * 3 / 2 - 2);
    textSize(20);
    text("-", x + 1 + scale, y + scale * 3 - 2);
    textSize(15);
    text("Emitter delay: " + newLevelEmitterDelay, x - 50, y - 5);
    if (mouseX >= x && mouseX <= x + 30 && isMouseNotPressedEmitterDelay)  
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed && newLevelEmitterDelay < 100)
        {
          newLevelEmitterDelay++;
        } 
        fill(10, 240, 10);
        rect(x, y, scale * 3, scale * 3 / 2);  
        fill(0);
        textSize(15);
        text("+", x + scale, y + scale * 3 / 2 - 2);
      }
    }

    if (mouseX >= x&& mouseX <= x + 30 && isMouseNotPressedEmitterDelay)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && newLevelEmitterDelay > 1) 
        {
          newLevelEmitterDelay--;
        } 
        fill(240, 10, 10);
        rect(x, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale, y + scale * 3 - 2);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    { 
      isMouseNotPressedEmitterDelay = false;
    } else
    {
      isMouseNotPressedEmitterDelay = true;
    }
  }

  void saveMap()
  {
    //save map
    textSize(15);
    fill(0);
    text("Save map", width/2+375, height-45);

    if (mouseX >= width / 2 + 380 && mouseX <= width / 2 + 410)
    {
      if (mouseY >= height - 40 && mousePressed) {
        overrideMap(mapSaveNR);
        addMap(mapSaveNR);
        saveTable(table, "EnemyPlasment.csv");
      }
    }

    // Display corrent mapNR
    fill(255);
    stroke(150);  
    strokeWeight(0.5);
    int x = width / 2 + 380;
    int y = height - 40;
    rect(x, y, scale * 3, scale * 3);
    fill(0);
    text(mapSaveNR, x +scale, y+scale*2); 
    // Display + or - mapNR
    fill(250);
    stroke(150);
    strokeWeight(0.5);
    rect(x + scale * 3, y, scale * 3, scale * 3 / 2);  
    rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
    fill(0);
    text("+", x + scale * 4, y + scale + 2);
    textSize(20);
    text("-", x + 1 + scale * 4, y + scale * 3);

    if (mouseX >= width / 2 + 410 && mouseX <= width / 2 + 440 && isMouseNotPressedSave) 
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed)
        {
          mapSaveNR++;
        } 
        fill(10, 240, 10);
        rect(x + scale * 3, y, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(15);
        text("+", x + scale * 4, y + scale + 2);
      }
    }


    if (mouseX >= width / 2 + 410 && mouseX <= width / 2 + 440 && isMouseNotPressedSave)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && mapSaveNR > 0) 
        {
          mapSaveNR--;
        } 
        fill(240, 10, 10);
        rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale * 4, y + scale * 3);
      }
    }
    if (mousePressed && mouseY >= height - 40 && mouseX > width / 2 + 370)
    { 
      isMouseNotPressedSave = false;
      enemyTypeOne = false;
      enemyTypeTow = false;
      enemyTypeThree = false;
      loadEnemys(mapSaveNR);
    } else
    {
      isMouseNotPressedSave = true;
    }
  }

  void overrideMap(int mapNR)
  {

    int rowMapNr;
    for (int i = table.getRowCount()-1; i >= 0; i--)
    {
      TableRow row = table.getRow(i);
      rowMapNr = row.getInt("LevelNR");
      if (mapNR == rowMapNr)
      {
        table.removeRow(i);
      }
    }
    saveTable(table, "EnemyPlasment.csv");
  }

  void addMap(int mapNR)
  {
    TableRow newRow;
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        if (newBasicEnemys[i][j] > 0)
        {
          newRow = table.addRow();
          newRow.setInt("x", i);
          newRow.setInt("y", j);
          newRow.setInt("BasicEnemyStrength", newBasicEnemys[i][j]);
          newRow.setInt("EnemyType", 1);
          newRow.setInt("LevelNR", mapNR);
        }
      }
    }
    if (newLevelEmitters.size() > 0)
    {
      for (int i = 0; i < newLevelEmitters.size(); ++i) 
      {
        newRow = table.addRow();
        Emitter emitter = newLevelEmitters.get(i);
        newRow.setInt("x", (int)emitter.location.x);
        newRow.setInt("y", (int)emitter.location.y);
        newRow.setInt("EmitterStrength", emitter.power);
        newRow.setInt("EmitterDelay", emitter.delay);
        newRow.setInt("EnemyType", 2);
        newRow.setInt("LevelNR", mapNR);
      }
    }
  }

  void updateMap()
  {
    if (mouseY >= height - 60 || mouseY <= 0 || mouseX <= 0 || mouseX >= width)
    {
      return;
    }

    if (enemyTypeOne && mousePressed)
    {
      newBasicEnemys[mouseX/scale][mouseY/scale] = newBasicEnemysStrength;
    }

    if (enemyTypeTow && mousePressed && isMouseNotPressedUpdateMap)
    {
      for (int i = 0; i < newLevelEmitters.size(); ++i) {
        Emitter emitter = newLevelEmitters.get(i);
        if  (emitter.location.x == mouseX / scale && emitter.location.y == mouseY / scale)
        {
          newLevelEmitters.remove(i);
          isMouseNotPressedUpdateMap = false;
          return;
        }
      }
      newLevelEmitters.add(new Emitter(new PVector(mouseX/scale, mouseY/scale), newLevelEmitterDelay, newLevelEmitterStrength));
    }

    if (enemyTypeThree && mousePressed && isMouseNotPressedUpdateMap)
    {
      newMap[mouseX/scale][mouseY/scale].z = 3;
    }

    if (mousePressed && mouseY < height - 40)
    { 
      isMouseNotPressedUpdateMap = false;
    } else
    {
      isMouseNotPressedUpdateMap = true;
    }
  }

  void drawEnemys()
  {
    drawBasicEnemy();
    drawEmitter();
  }

  void drawBasicEnemy()
  {
    for (int i = 0; i < cols; ++i) {
      for (int j = 0; j < rows; ++j) {
        if (newBasicEnemys[i][j] > 0) {
          fill(0, 5 * newBasicEnemys[i][j], 255, 100);
          stroke(0);
          strokeWeight(0.5);
          rect(i*scale, j*scale, scale, scale);
        }
      }
    }
  }

  void drawEmitter()
  {
    for (int i = 0; i < newLevelEmitters.size(); ++i) {
      newLevelEmitters.get(i).Draw();
    }
  }

  void loadEnemys(int levelNR)
  {
    int x;
    int y;
    newLevelEmitters.clear();
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        newBasicEnemys[i][j] = 0;
      }
    }

    table = loadTable("EnemyPlasment.csv", "header");

    if (table != null)
    {
      for (TableRow row : table.rows())
      {
        if (row.getInt("LevelNR") == levelNR)
        {
          x = row.getInt("x");
          y = row.getInt("y");
          int enemyType = row.getInt("EnemyType");
          if (enemyType == 1)
          {
            newBasicEnemysStrength = row.getInt("BasicEnemyStrength");
            newBasicEnemys[x][y] = newBasicEnemysStrength;
          }
          if (enemyType == 2)
          {
            x = row.getInt("x");
            y = row.getInt("y");
            newLevelEmitterStrength = row.getInt("EmitterStrength");
            newLevelEmitterDelay = row.getInt("EmitterDelay");
            newLevelEmitters.add(new Emitter(new PVector(x, y), newLevelEmitterDelay, newLevelEmitterStrength));
          }
        }
      }
    }
  }

  EnemyGrid loadBasicEnemy(int levelNR, PVector[][] levelMap)
  {
    EnemyGrid newLevelEnemyGrid = new EnemyGrid(levelMap);
    table = loadTable("EnemyPlasment.csv", "header");
    if (table != null)
    {
      for (int i = table.getRowCount()-1; i >= 0; i--)
      {
        TableRow row = table.getRow(i);
        if (row.getInt("LevelNR") == levelNR)
        {
          if (row.getInt("EnemyType") == 1) {
            int x = row.getInt("x");
            int y = row.getInt("y");
            newLevelEnemyGrid.enemys[x][y].strength = row.getInt("BasicEnemyStrength");
          }
        }
      }
      return newLevelEnemyGrid;
    }
    return null;
  }  //<>// //<>//
  //<>// //<>//
  ArrayList<Emitter> loadEmitters(int levelNR, EnemyGrid enemys)
  {
    table = loadTable("EnemyPlasment.csv", "header");
    if (table != null)
    {
      for (int i = table.getRowCount()-1; i >= 0; i--)
      {
        TableRow row = table.getRow(i);
        if (row.getInt("LevelNR") == levelNR)
        {
          if (row.getInt("EnemyType") == 2) {
            int x = row.getInt("x");
            int y = row.getInt("y");
            int emitterDelay = row.getInt("EmitterDelay");
            int emitterStrength = row.getInt("EmitterStrength");
            newLevelEmitters.add(new Emitter(new PVector(x, y), emitterDelay, emitterStrength, enemys));
          }
        }
      }
      return newLevelEmitters;
    }
    return null;
  }

  void Draw()
  {
    game.baseLevel.fieldDraw(terrainEditor.loadMap(mapSaveNR));
    image(game.baseLevel.thisMap,0,0);
  }

  void Run()
  {
    Draw();
    hotbar();
    drawEnemys();
    saveMap();
    updateMap();
  }
}
