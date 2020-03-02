class Chain{
  ArrayList<Node> nodes = new ArrayList<Node>();
  float subR;
  float off = 0;
  
  Chain(float len, float r, float subR){
    for(float i = 0; i < len; i++){
      nodes.add(new Node(cos(i/len*TWO_PI)*r, sin(i/len*TWO_PI)*r, cos(i/len*TWO_PI+HALF_PI)*r, sin(i/len*TWO_PI+HALF_PI)*r, i/len*TWO_PI));
    }
    this.subR = subR;
  }
  
  void show(){
    Node prevNode = nodes.get(nodes.size()-1);
    for(Node node : nodes){
      float t = noise(node.off+off)*subR;
      line(node.pos.x+node.normal.x*t, node.pos.y+node.normal.y*t, prevNode.pos.x+prevNode.normal.x*t, prevNode.pos.y+prevNode.normal.y*t);
      prevNode = node;
    }
    noStroke();
    fill(0);
    for(Node node : nodes){
      //ellipse(node.pos.x, node.pos.y, 20, 20);
    }
  }
}

class Node{
  PVector pos;
  PVector normal;
  float off;
  
  Node(float x, float y, float nx, float ny, float off){
    this.pos = new PVector(x, y);
    this.normal = new PVector(x, y).normalize();
    this.off = off;
  }
}