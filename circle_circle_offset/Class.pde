class Chain{
  ArrayList<Node> nodes = new ArrayList<Node>();
  float subR;
  float off = 0;
  
  Chain(float len, float r, float subR){
    for(float i = 0; i < len; i++){
      nodes.add(new Node(cos(i/len*TWO_PI)*r, sin(i/len*TWO_PI)*r, i/len*TWO_PI*4));
    }
    this.subR = subR;
  }
  
  void show(){
    beginShape();
    for(Node node : nodes){
      vertex(node.pos.x+cos(node.off+off)*subR, node.pos.y+sin(node.off+off)*subR);
    }
    endShape(CLOSE);
    fill(0);
    for(Node node : nodes){
      ellipse(node.pos.x+cos(node.off+off)*subR, node.pos.y+sin(node.off+off)*subR, 20, 20);
    }
  }
}

class Node{
  PVector pos;
  float off;
  
  Node(float x, float y, float off){
    this.pos = new PVector(x, y);
    this.off = off;
  }
}