import peasy.*;

PeasyCam camera;
int cols, rows;
int scl = 20;

float[][] terrain;
int noiseScale = 3;

void setup() {
  size(600, 600, P3D);
  int w = 1200;
  int h = 1200;
  cols = w/scl;
  rows = h/scl;
  camera = new PeasyCam(this, 0, 0, 0, 50);
  terrain = new float[cols][rows];
  
  float yoff = 0;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for(int x = 0; x < cols; x++) {
      terrain[y][x] = map(noise(xoff, yoff), 0, 1, -50, 50);
    }
    xoff += 0.1;
  }
  yoff += 0.1;
}

void draw() {
  background(0);
  lights();
  fill(100);
  noStroke();
  
  for(int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}
