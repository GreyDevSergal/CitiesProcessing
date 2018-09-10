import peasy.*;

PeasyCam camera;
Perlin terrain;

int cols, rows;
int scl = 10;

void setup() {
  fullScreen(P3D);
  frameRate(1000);
  
  int w = 1200;
  int h = 1200;
  cols = w/scl;
  rows = h/scl;
  camera = new PeasyCam(this, 0, 0, 0, 50);
  terrain = new Perlin(w, h, -50, 50, cols, rows, scl, 0.02);
  
  
  
  smooth();
}

void draw() {
  background(0);
  
  directionalLight(126, 126, 126 , 0, 0, -1); 
  ambientLight(71, 102, 96);
  
  fill(200);  
  noStroke();
  
  terrain.draw(); 
  
  //UI
  camera.beginHUD();
  drawFPS();
  camera.endHUD();
}

void drawFPS() {
PFont arialB = createFont("Arial Bold",48); // create font instance

textFont(arialB, 20); // Set font
fill(50, 255, 50); // White
text(int(frameRate), 15, 30);
}
