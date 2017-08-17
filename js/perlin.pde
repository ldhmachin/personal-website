int cols, rows;
int scl = 40;
int w = 2200;
int h = 800;
int clr;
  
float flying = 0;
float[][] z;

void setup() {
  size(800, 400, P3D);
  cols = w/scl;
  rows = h/scl;
  z = new float[cols][rows];
  frameRate(20);
}

void draw() {
  flying += 0.1;
  float yoff = flying;
  for (int y = 0; y < rows-1; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      z[x][y] = map(noise(xoff,yoff),0,1,-160,160);
      //z[x][y] = random(-10,10);
      xoff += 0.3;
    }
    yoff += 0.3;
  }
  background(255); 
  stroke(255);
  fill(0);
  
  translate(width/2,height/2+50);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  fill(#FFFFFF);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      // Map 'z' to grey color palette
      clr = floor(map(z[x][y],-75,75,0,128));
      // Draw lines
      stroke(clr);
      vertex(x*scl,y*scl,z[x][y]);
      vertex(x*scl,(y+1)*scl,z[x][y+1]);
    }
    endShape();
  }
}