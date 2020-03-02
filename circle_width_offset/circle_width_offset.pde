Chain chain;

void setup(){
  //size(500, 500);
  fullScreen();
  background(255);
  strokeWeight(5);
  chain = new Chain(500, 500, 100);
  
}

void draw(){
  fill(255, 50);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  chain.off = (float)frameCount/10;
  stroke(0);
  chain.show();
}