Chain chain;

void setup(){
  //size(500, 500);
  fullScreen();
  background(255);
  strokeWeight(5);
  chain = new Chain(100, 500, 200);
  
}

void draw(){
  fill(255, 10);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  chain.off = (float)frameCount/100;
  fill(255);
  chain.show();
}