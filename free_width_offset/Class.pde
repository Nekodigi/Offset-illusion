class Chain{
  ArrayList<Node> nodes = new ArrayList<Node>();
  float subR;
  float off = 0;
  float len = 100;
  float index = 0;
  
  Chain(float len, float subR){
    this.subR = subR;
    this.len = len;
  }
  
  void add(float x, float y){
    nodes.add(new Node(x, y, index/len));
    index++;
  }
  
  void show(){
    if(nodes.size() > 0){
      PVector prevPos = nodes.get(0).pos;
      for(Node node : nodes){
        strokeWeight(constrain(sin(node.off+off), 0, 1)*subR);
        line(node.pos.x, node.pos.y, prevPos.x, prevPos.y);
        prevPos = node.pos;
      }
      noStroke();
      fill(0);
      for(Node node : nodes){
        //ellipse(node.pos.x, node.pos.y, 20, 20);
      }
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