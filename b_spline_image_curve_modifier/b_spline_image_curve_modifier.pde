ArrayList<PVector> P = new ArrayList<PVector>();
int[] knots;
int DI = 3;//nth order
boolean close = true;
boolean showCP = false;//show control point
PImage img;

void setup() {
  //size(1000, 500);
  fullScreen(P3D);
  img = loadImage("FevCat.png");
  strokeWeight(10);
  strokeJoin(ROUND);
}

void keyPressed() {
  if (key == 'r') {
    P = new ArrayList<PVector>();
    knots = SplineKnots(P.size()-1, DI);
  }
  if (key == 'c') {
    close = !close;
    knots = SplineKnots(P.size()-1, DI);
  }
  if(key == 'e'){
    showCP = !showCP;
  }
  if (keyCode == UP) {
    DI++;
    knots = SplineKnots(P.size()-1, DI);
  }
  if (keyCode == DOWN) {
    DI--;
    if (DI <= 1) {
      DI = 1;
    }
    knots = SplineKnots(P.size()-1, DI);
  }
}

void mousePressed() {
  P.add(new PVector(mouseX, mouseY));
  knots = SplineKnots(P.size()-1, DI);
}

void draw() {
  background(255);
  if (P.size() > DI) {
    int tn = P.size() - DI + 1;
    if (close) tn = P.size();
    if(showCP){
    //curve show
      stroke(0);
      beginShape();
      for (float t = 0; t < tn; t+= 0.01f) {
        vertex(Spline(t));
      }
      endShape();
      //control point show
      stroke(0, 50);
      beginShape();
      for (PVector p : P) {
        vertex(p);
      }
      endShape();
    }
    //image show
    float len = 2;
    float offset = float(frameCount)/100%(tn-len);
    if(close)offset = float(frameCount)/100;
    noStroke();
    textureMode(NORMAL);
    beginShape(TRIANGLE_STRIP);
    texture(img);
    for (float t = 0; t < len; t += 0.1f) {
      PVector p1 = Spline((t+offset)%tn);
      PVector p2 = Spline((t+offset+EPSILON)%tn);
      PVector n = PVector.sub(p1, p2).normalize().rotate(HALF_PI);
      vertex(PVector.add(p1, PVector.mult(n, 200)), t/len, 0);
      vertex(PVector.sub(p2, PVector.mult(n, 200)), t/len, 1);
    }
    endShape();
  }
}