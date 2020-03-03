Chain chain;

void setup(){
  //size(500, 500);
  fullScreen();
  background(255);
  strokeWeight(5);
  chain = new Chain(20, 100);
  
}

void draw(){
  fill(255, 50);
  rect(0, 0, width, height);
  if(mousePressed){
    chain.add(mouseX, mouseY);
  }
  chain.off = (float)frameCount/10;
  stroke(0);
  chain.show();
}

void keyPressed(){
  if(key == 'r'){
    chain = new Chain(20, 100);
  }
}