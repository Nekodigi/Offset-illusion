class Chain{
  ArrayList<Node> nodes = new ArrayList<Node>();
  float subR;
  float off = 0;
  float len;
  float index;
  
  Chain(float len, float subR){
    this.len = len;
    this.subR = subR;
  }
  
  void add(PVector p, PVector n){
    nodes.add(new Node(p, n, index/len));
    index++;
  }
  
  void show(){
    if(nodes.size() > 0){
      for(float fac=0; fac<=1; fac+=0.1){
        beginShape();
        for(Node node : nodes){
          float t = lerp((noise(node.off+off)-0.5)*subR, (noise(node.off+off*1.5, 1)-0.5)*subR, fac);
          curveVertex(node.pos.x+node.normal.x*t, node.pos.y+node.normal.y*t);
        }
        endShape();
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
  PVector normal;
  float off;
  
  Node(PVector pos, PVector normal, float off){
    this.pos = pos;
    this.normal = normal;
    this.off = off;
  }
}
