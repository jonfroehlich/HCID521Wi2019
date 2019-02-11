class Branch{
  
  public PVector begin;
  public PVector end;
  float thickness;
  Branch parentBranch = null;
  ArrayList<Branch> childrenBranches = new ArrayList<Branch>();
  
  public Branch(Branch parent, PVector begin, PVector end){
    this.parentBranch = parent;
    this.begin = begin;
    this.end = end;
    
    float mag = PVector.sub(end, begin).mag();
    this.thickness = max(1, mag / random(8f, 10f));
    
    println("depth=" + this.getDepth() + " mag = " + mag + " thickness=" + this.thickness);
  }
  
  public void createBranches(){ //TODO, in future take in an int numBranches
    
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
  }
  
  public void addBranchesToEnd(){
    addBranchesToEnd(this);
  }
  
  private void addBranchesToEnd(Branch branch){
    for(Branch childBranch : branch.childrenBranches){
      addBranchesToEnd(childBranch);
    }
    
    if(!branch.hasChildren()){
      branch.createBranches();
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
    draw(this);
  }
  
  private void draw(Branch branch){
    for(Branch childBranch : branch.childrenBranches){
      draw(childBranch);
    }
    stroke(255);
  
    PVector dir = PVector.sub(branch.end, branch.begin);
    
    //println("depth=" + branch.getDepth() + " mag = " + branch.end.mag() + "mag2 = " + dir.mag());
    //println("strokeWidth = " + strokeWidth);
    strokeWeight(branch.thickness);
    line(branch.begin.x, branch.begin.y, branch.end.x, branch.end.y); 
    
    //if(branch.getDepth() > 6){
    //  float leafWidth = random(2,12);
    //  float leafHeight = random(2,12);
    //  ellipse(branch.end.x, branch.end.y,leafWidth,leafHeight);
    //}
  }
  
}
