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
      Node prevNode = nodes.get(0);
      beginShape(TRIANGLE_STRIP);
      for(Node node : nodes){
        float t = noise(node.off+off)*subR;float t2 = noise(prevNode.off+off)*subR;
        vertex(node.pos.x, node.pos.y);
        vertex(node.pos.x+node.normal.x*t, node.pos.y+node.normal.y*t);
        //line(node.pos.x+node.normal.x*t, node.pos.y+node.normal.y*t, prevNode.pos.x+prevNode.normal.x*t2, prevNode.pos.y+prevNode.normal.y*t2);
        prevNode = node;
      }
      endShape();
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