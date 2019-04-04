class TerrainEditor {  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

  Thread thread;
  Table table;

  int mapSaveNR = 0;
  boolean isMouseNotPressedSave = true;
  boolean isMouseNotPressedBrush = true;


  int terrainHeight = 0;
  int brushSize = 1;

  PVector[][] newMap = new PVector[cols][rows];


  TerrainEditor () 
  {
    createTabel();
    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++)
      {
        newMap[i][j] = new PVector(i, j, -1);
      }
    }
  }

  void createTabel()
  {
    table = new Table();
    table.addColumn("x");
    table.addColumn("y");
    table.addColumn("z");
    table.addColumn("LevelNR");
  }

  void fieldDraw(PVector[][] grid) 
  {   
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        layerZeroDraw(i, j, grid);
        layerOneDraw(i, j, grid);
        layerTowDraw(i, j, grid);
        layerThreeDraw(i, j, grid);
        layerFourDraw(i, j, grid);
        layerFiveDraw(i, j, grid);
        voidLayer(i, j, grid);
      }
    }
  }

  void voidLayer(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == -1)
    {
      int x = i*scale;
      int y = j*scale;
      fill(0);
      stroke(255);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerZeroDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 0) {
      int x = i*scale;
      int y = j*scale;
      fill(120, 58, 8);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerOneDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 1)
    {
      int x = i*scale;
      int y = j*scale;
      fill(160, 75, 30);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerTowDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 2)
    {
      int x = i*scale;
      int y = j*scale;
      fill(100);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerThreeDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 3)
    {
      int x = i*scale;
      int y = j*scale;
      fill(100, 70, 40);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerFourDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 4)
    {
      int x = i*scale;
      int y = j*scale;
      fill(90, 60, 30);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  void layerFiveDraw(int i, int j, PVector[][] grid)
  {
    if (grid[i][j].z == 5)
    {
      int x = i*scale;
      int y = j*scale;
      fill(50);
      stroke(0);
      strokeWeight(0.5);
      rect(x, y, scale, scale);
    }
  }

  PVector[][] loadMap(int levelNR)
  {
    PVector[][] thisMap = new PVector[cols][rows];
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        thisMap[i][j] = new PVector(i, j, -1);
      }
    }
    table = loadTable("Tarrains.csv", "header");

    if (table != null)
    {
      for (TableRow row : table.rows())
      {
        if (row.getInt("LevelNR") == levelNR)
        {
          int x = row.getInt("x");
          int y = row.getInt("y");
          int z = row.getInt("z");
          thisMap[x][y].z = z;
        }
      }
    }
    return thisMap;
  }

  void hotbar()
  {
    fill(150);
    noStroke();
    rect(width/2-500, height-60, 1000, 60);

    //void layer seleckt
    textSize(15);
    fill(0);
    text("Void layer", width/2-305, height-45);

    if (mouseX >= width / 2 - 290 && mouseX <= width / 2 - 260)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = -1;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale - 280;
        int y = height + j*scale - 30;
        fill(0);
        stroke(255);
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }
    stroke(0);

    //layer zero selekt
    textSize(15);
    fill(0);
    text("Layer zero", width/2-215, height-45);

    if (mouseX >= width / 2 - 200 && mouseX <= width / 2 - 170)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 0;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale - 190;
        int y = height + j*scale - 30;
        fill(120, 58, 8);
        stroke(0);
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }

    //layer one selekt
    textSize(15);
    fill(0);
    text("Layer One", width/2-125, height-45);

    if (mouseX >= width / 2 - 110 && mouseX <= width / 2 - 80)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 1;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale - 100;
        int y = height + j*scale - 30;
        fill(160, 75, 30);
        stroke(0);
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }

    //layer tow selekt
    textSize(15);
    fill(0);
    text("Layer two", width/2 - 35, height-45);

    if (mouseX >= width / 2 - 20 && mouseX <= width / 2 + 10)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 2;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale - 10;
        int y = height + j*scale - 30;
        fill(100);
        stroke(0);
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }

    //layer three selekt
    textSize(15);
    fill(0);
    text("Layer three", width/2 + 50, height-45);

    if (mouseX >= width / 2 + 70 && mouseX <= width / 2 + 100)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 3;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale + 80;
        int y = height + j*scale - 30;
        fill(100, 70, 40);
        stroke(0);
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }

    //layer four selekt
    textSize(15);
    fill(0);
    text("Layer four", width/2+145, height-45);

    if (mouseX >= width / 2 + 160 && mouseX <= width / 2 + 210)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 4;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale + 170;
        int y = height + j*scale - 30;
        fill(90, 60, 30);
        stroke(0);
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }

    //layer five selekt
    textSize(15);
    fill(0);
    text("Layer five", width/2+235, height-45);

    if (mouseX >= width / 2 + 250 && mouseX <= width / 2 + 280)
    {
      if (mouseY >= height - 40 && mousePressed) {
        terrainHeight = 5;
      }
    }
    for (int i = -1; i <= 1; i++)
    {
      for (int j = -1; j <= 1; j++)
      {
        int x = width / 2 + i*scale + 260;
        int y = height + j*scale - 30;
        fill(50);
        stroke(0);
        strokeWeight(0.5);
        rect(x, y, scale, scale);
      }
    }

    //Reset map
    textSize(15);
    fill(0);
    text("Reset map", width/2-415, height-45);
    if (mouseX >= width / 2 - 400 && mouseX <= width / 2 - 370)
    {
      if (mouseY >= height - 40 && mousePressed) {
        overrideMap(mapSaveNR);
        loadMap(mapSaveNR);
      }
    }
    fill(0);
    stroke(0);
    strokeWeight(0.5);
    rect(width / 2 - 400, height - 40, 3 * scale, 3 * scale);

    choseBrushSize();
  }

  void choseBrushSize()
  {
    //brush size
    int x = width / 2 + 315;
    int y = height - 40;
    textSize(15);
    fill(0);
    text("Brush size", x - 5, y - 5);

    // Display corrent mapNR
    fill(255);
    stroke(150);
    strokeWeight(0.5);

    rect(x, y, scale * 3, scale * 3);
    fill(0);
    text(brushSize, x +scale, y+scale*2);

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


    if (mouseX >= x + 30 && mouseX <= x + 60 && isMouseNotPressedBrush)  
    {
      if (mouseY >= height - 40 && mouseY < height - 25) {

        if (mousePressed && brushSize < 3)
        {
          brushSize++;
        } 
        fill(10, 240, 10);
        rect(x + scale * 3, y, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(15);
        text("+", x + scale * 4, y + scale + 2);
      }
    }

    if (mouseX >= x + 30 && mouseX <= x + 60 && isMouseNotPressedBrush)  
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {

        if (mousePressed && brushSize > 1) 
        {
          brushSize--;
        } 
        fill(240, 10, 10);
        rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale * 4, y + scale * 3);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    {
      isMouseNotPressedBrush = false;
    } else
    {
      isMouseNotPressedBrush = true;
    }
  }

  void saveMap()
  {
    //save map
    int x = width / 2 + 400;
    int y = height - 40; 
    textSize(15);
    fill(0);
    text("Save map", x - 5, y - 5);

    if (mouseX >= x && mouseX <= x + 30 && isMouseNotPressedSave)  
    {
      if (mouseY >= height - 40 && mousePressed) {
        overrideMap(mapSaveNR);
        addMap(mapSaveNR);
        saveTable(table, "Tarrains.csv");
      }
    }


    // Display corrent mapNR
    fill(255);
    stroke(150);
    strokeWeight(0.5);

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

    if (mouseX >= x + 30 && mouseX <= x + 60 && isMouseNotPressedSave) {
      if (mouseY >= height - 40 && mouseY < height - 25) {
        if (mousePressed==true)
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

    if (mouseX >= x + 30 && mouseX <= x + 60 && isMouseNotPressedSave)
    {
      if (mouseY >= height - 25 && mouseY <= height - 10) {
        if (mousePressed && mapSaveNR > 0) 
        {
          mapSaveNR--;
        }  //<>// //<>//
        fill(240, 10, 10); //<>// //<>//
        rect(x + scale * 3, y + scale * 3 / 2, scale * 3, scale * 3 / 2);
        fill(0);
        textSize(20);
        text("-", x + 1 + scale * 4, y + scale * 3);
      }
    }
    if (mousePressed && mouseY >= height - 40)
    {
      isMouseNotPressedSave = false;
      newMap = loadMap(mapSaveNR);
    } else //<>// //<>//
    {
      isMouseNotPressedSave = true;
    }
  }

  void updateMap()
  {
    if (mouseY >= height - 60 || mouseY <= 0 || mouseX <= 0 || mouseX >= width)
    {
      return; //<>//
    }

    if (mousePressed && brushSize == 3)
    {
      if (mouseX > width-30) {
        mouseX = width-30;
      } 
      if (mouseX < 20) {
        mouseX = 20;
      } 
      if (mouseY < 20) {
        mouseY = 20;
      } 
      if (mouseY > height-90) {
        mouseY = height-90;
      }

      for (int i = -2; i <= 2; ++i) {
        for (int j = -2; j <= 2; ++j) {
          if (mouseY + j * scale <= height - 60 || mouseY + j *scale >= 0 || mouseX + i * scale >= 0 || mouseX + i * scale <= width)
          {
            newMap[(mouseX / scale) + i][(mouseY / scale) + j].z = terrainHeight;
          }
        }
      }
      return;
    }

    if (mousePressed && brushSize == 2)
    {
      if (mouseX > width - 20) {
        mouseX = width - 20;
      } 
      if (mouseX < 10) {
        mouseX = 10;
      } 
      if (mouseY < 10) {
        mouseY = 10;
      } 
      if (mouseY > height-80) {
        mouseY = height-80;
      }

      for (int i = -1; i <= 1; ++i) {
        for (int j = -1; j <= 1; ++j) {

          if (mouseY + j * scale < height - 60 || mouseY + j *scale >= 0 || mouseX + i * scale >= 0 || mouseX + i * scale < width - 10)
          {
            newMap[(mouseX / scale) + i][(mouseY / scale) + j].z = terrainHeight;
          }
        }
      }
      return;
    }

    if (mousePressed)
    {
      newMap[mouseX/scale][mouseY/scale].z = terrainHeight;
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
    saveTable(table, "Tarrains.csv");
  }

  void addMap(int mapNR)
  {
    TableRow newRow;
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        if (newMap[i][j].z != -1) {
          newRow = table.addRow();
          newRow.setInt("x", i);
          newRow.setInt("y", j);
          newRow.setInt("z", (int)newMap[i][j].z);
          newRow.setInt("LevelNR", mapNR);
        }
      }
    }
  }


  void Draw()
  {
    fieldDraw(newMap);
  }


  void Run()
  {
    Draw();
    hotbar();
    saveMap();
    updateMap();
  }
}
