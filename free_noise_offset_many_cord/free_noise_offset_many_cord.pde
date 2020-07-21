Chain chain;
PVector prevMouse;

void setup(){
  size(1000, 1000);
  //fullScreen();
  background(255);
  strokeWeight(5);
  chain = new Chain(20, 500);
  
}

void draw(){
  fill(255, 50);//and filled line by this color
  rect(0, 0, width, height);
  if(mousePressed){
    PVector mouse = new PVector(mouseX, mouseY);
    if(prevMouse != null){
      PVector diff = PVector.sub(mouse, prevMouse);
      if(diff.mag() > 10){
        PVector normal = diff.rotate(HALF_PI).normalize();
        chain.add(mouse, normal);
        prevMouse = mouse.copy();
      }
    }else{
      prevMouse = mouse.copy();
    }
  }
  chain.off = (float)frameCount/50;
  stroke(0);
  chain.show();
}

void keyPressed(){
  if(key == 'r'){
    chain = new Chain(20, 500);
    prevMouse = null;
  }
}
