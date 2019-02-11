/* 
 * Creates a recursive fractal tree. The following interactions are supported:
 *  - Click the mouse to add in new branches
 *  - The mouse's y-position controls how much of the tree is rendered (move mouse to render more)
 *  - Press spacebar to save a tree to a file 
 *  - Press the down arrow to have leaves drop from the tree (with animation)
 *
 * By Jon Froehlich
 * http://makeabilitylab.io
 *
 * This example is (loosely) based on:
 *  - The Coding Train Fractal Tree: https://www.youtube.com/watch?v=fcdNSZ9IzJM&t=2s. The code for this is:
 *    https://github.com/CodingTrain/website/tree/master/CodingChallenges/CC_015_FractalTreeArray/Processing/CC_015_FractalTreeArray
 *
 * Other inspirations:
 *  - http://gregtatum.com/interactive/2014/recursivity-2-branching/
 *
 * FUTURE IDEAS:
 *  - Add lighting
 *  - Gradient background (though I like the simplicity currently)
 *  - [done] Change width progressively from root to outter branches
 *  - [done] Add leaves
 *  - [done] Have leaves fall down
 *  - Have easing function for leaves falling down
 *  - Add in sine wave function on x-position to have leaves sway back and forth as they fall
 *  - Create wind
 *  - Add a forest
 *  - add purple/pink flowers (like blooming cherry blossoms)
 */



int _count = 0;
int _addLeavesAfterDepth = 9;
int _maxDepth = 11;
boolean _leavesFall = false;
Branch _tree;

void setup(){
  size(640, 480);
  //fullScreen();
  
  //create root 
  PVector a = new PVector(width / 2, height);
  PVector b = new PVector(width / 2, height - height/4.0);
  _tree = new Branch(null, a, b);
}

void mousePressed(){
  if(_count <= _maxDepth){
    _tree.addBranchesToEnd(_count >= _addLeavesAfterDepth);
    _count++; 
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      _leavesFall = true;
    } 
  } 
  else if (key == ' '){
    println("Saving current tree!");
    saveFrame("tree-######.png");
  }else{
    // clear the tree
    PVector a = new PVector(width / 2, height);
    PVector b = new PVector(width / 2, height - height/4.0);
    _tree = new Branch(null, a, b);
    _count = 0;
    _leavesFall = false;
  }
}

void draw(){
  background(51);
  
  int maxDepth = (int)map(mouseY, height, 0, 0, _maxDepth);
  _tree.draw(maxDepth);
  
  if(_leavesFall){
    _tree.leavesFall();
  }
}
