/* 
 * The branch recursive object, which stores the root and all the branches
 *
 * By Jon Froehlich
 * http://makeabilitylab.io
 */

class Branch{
  
  public PVector begin;
  public PVector end;
  float thickness;
  Branch parentBranch = null;
  ArrayList<Branch> childrenBranches = new ArrayList<Branch>();
  ArrayList<Leaf> leaves = new ArrayList<Leaf>();
  
  public Branch(Branch parent, PVector begin, PVector end){
    this.parentBranch = parent;
    this.begin = begin;
    this.end = end;
    
    float mag = PVector.sub(end, begin).mag();
    this.thickness = max(1, mag / random(8f, 10f));
    
    println("depth=" + this.getDepth() + " mag = " + mag + " thickness=" + this.thickness);
  }
  
  public void leavesFall(){
    leavesFall(this);
  }
  
  private void leavesFall(Branch branch){
    for(Branch childBranch : branch.childrenBranches){
      leavesFall(childBranch);
    }
    
    for(Leaf leaf : branch.leaves){
      if(leaf.loc.y <= height - 2){
        leaf.loc.y += random(0.5, 4);
        leaf.loc.x += random(-2, 2);
      }
    }
  }
  
  public void createBranches(){
    createBranches(false); 
  }
  
  public void createBranches(boolean createLeaves){ //TODO, in future take in an int numBranches
    
      PVector dir = PVector.sub(end, begin);
      float angle = 25f; //(500 / (float) width) * 90f;
      // Convert it to radians
      float theta = radians(angle);
      dir.rotate(theta);
      dir.mult(random(0.5, 0.85));
      PVector newEnd = PVector.add(end, dir);
      Branch a = new Branch(this, end, newEnd); 
    
      dir = PVector.sub(end, begin);
      dir.rotate(-theta);
      dir.mult(random(0.5, 0.85));
      newEnd = PVector.add(end, dir);
      Branch b = new Branch(this, end, newEnd);
      
      this.childrenBranches.add(a);
      this.childrenBranches.add(b);
      
      // add leaves
      if(createLeaves){
        PVector leafALoc = new PVector(a.end.x + random(-2, 2), a.end.y + random(-2, 2));
        a.leaves.add(new Leaf(leafALoc));
        PVector leafBLoc = new PVector(b.end.x + random(-2, 2), b.end.y + random(-2, 2));
        b.leaves.add(new Leaf(leafBLoc));
      }
  }
  
  public void addBranchesToEnd(boolean createLeaves){
    addBranchesToEnd(this, createLeaves);
  }
  
  private void addBranchesToEnd(Branch branch, boolean createLeaves){
    for(Branch childBranch : branch.childrenBranches){
      addBranchesToEnd(childBranch, createLeaves);
    }
    
    if(!branch.hasChildren()){
      branch.createBranches(createLeaves);
    }
  }
  
  public boolean hasChildren(){
    return childrenBranches.size() > 0;
  }
  
  public Branch getParent(){
    return this.parentBranch;  
  }
  
  public int getDepth(){
    int depth = 0;
    Branch parent = this.parentBranch;
    while(parent != null){   
      parent = parent.getParent();
      depth++;
    }
    return depth;
  }
  
  public void draw(){
    //stroke(255);
    //line(this.begin.x, this.begin.y, this.end.x, this.end.y);  
    draw(this, -1);
  }
  
  public void draw(int maxDepth){
    draw(this, maxDepth);
  }
  
  private void draw(Branch branch, int maxDepth){
    
    // Controls how much of the tree to show. If maxDepth == -1, shows 
    // the whole tree
    if(maxDepth != -1 && branch.getDepth() > maxDepth){
        return; 
    }
    
    for(Branch childBranch : branch.childrenBranches){
      draw(childBranch, maxDepth);
    }
    //stroke(255, 255, 255, 200);
    stroke(255);
  
    PVector dir = PVector.sub(branch.end, branch.begin);
    
    //println("depth=" + branch.getDepth() + " mag = " + branch.end.mag() + "mag2 = " + dir.mag());
    //println("strokeWidth = " + strokeWidth);
    strokeWeight(branch.thickness);
    line(branch.begin.x, branch.begin.y, branch.end.x, branch.end.y); 
    
    // draw leaves
    for(Leaf leaf : branch.leaves){
      leaf.draw();
    }
  }
  
}
