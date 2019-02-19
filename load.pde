class Enemy {

  int i;
  int j;
  int k;
  PVector[] grid = new PVector[12000];

  Enemy() {
  }

  void gred() {

    if (k<910) { 
      if (i<11999) {
        i++;
      }

      if (j<=1500) {
        j=j+10;
      } 
      if (j>=1500) {
        j=2000;
      }

      if (j==2000) {
        if (k<=900) {
          k=k+10;
          j=0;
        }
        if (k==900) {
          k=910;
        }
      }
    }
    println(i, j, k);
    grid[i]=new PVector(j, k);
  }

  void high() {
  }


  void run() { 
    gred();
    println(grid[2521]);
  }
}
