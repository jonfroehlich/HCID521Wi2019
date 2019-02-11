/* 
 * TODO
 *
 * By Jon Froehlich
 * http://makeabilitylab.io
 *
 * This example is based on:
 *  - The Coding Train Fractal Tree: https://www.youtube.com/watch?v=fcdNSZ9IzJM&t=2s
 *
 * Other inspirations:
 *  - http://gregtatum.com/interactive/2014/recursivity-2-branching/
 *
 * FUTURE IDEAS:
 *  - Add lighting
 *  - Gradient background
 *  - [done] Change width progressively from root to outter branches
 *  - Create wind
 *  - Add a forest
 *  - add purple flowers
 */



int _count = 0;
Branch _tree;

void setup(){
  //size(640, 480);
  fullScreen();
  
  //create root 
  PVector a = new PVector(width / 2, height);
  PVector b = new PVector(width / 2, height - height/4.0);
  _tree = new Branch(null, a, b);
}

void mousePressed(){
  if(_count < 11){
    _tree.addBranchesToEnd();
  }
 
  _count++;  
}

void draw(){
  background(51);
  
  _tree.draw();
}
