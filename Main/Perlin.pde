class Perlin {
  
  float[][] map;
  int x, y, mx, my, cols, rows, scale;
  float precision;
  
  Perlin (int x, int y, int mx, int my, int cols, int rows, int scale, float precision) {
    this.x = x;
    this.y = y;
    this.mx = mx;
    this.my = my;
    this.cols = cols;
    this.rows = rows;
    this.scale = scale;
    this.precision = precision;
    
    generateMap();
  }
  
  void generateMap() {
   map = new float[this.cols][this.rows];
    float yoff = this.y;
    
    for(int cy = 0; cy < this.rows; cy++) {
      float xoff = x;
      
      for(int cx = 0; cx < this.cols; cx++) {
        this.map[cx][cy] = map(noise(xoff, yoff), 0, 1, this.mx, this.my);
        xoff += this.precision;
      }
      
      yoff += this.precision;
    }
  }
  
  void draw() {
    for(int cy = 0; cy < this.rows-1; cy++) {
      beginShape(TRIANGLE_STRIP);
      
      for(int cx = 0; cx < this.cols; cx++){
        vertex(cx*scale, cy*scale, map[cx][cy]);
        vertex(cx*scale, (cy+1)*scale, map[cx][cy+1]);
      }
      endShape();
    }
  }
}
