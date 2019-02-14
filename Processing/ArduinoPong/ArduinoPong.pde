/* 
 * Ideas:
 *   - Have a ball trail like /Demos/Graphics/Reflection2 or perhaps /Topics/Simualte/SmokeParticleSystem
 *   - Have particle explosion when ball hits paddle (see /Demos/Graphics/Particles)
 *      -- See also /Topics/Simulate/MultipleParticleSystems
 *   - Randomly cut paddle in half to make it harder? Or maybe do this when other team is ahead?
 *   - Release multiple balls into game play (maybe ball splits sometimes when it hits paddle?)
 *   - Add in directional lighting (see /Basics/Directional)
 *   - Could use an animated sprite as a ball (see /Topics/Animation/AnimatedSprite)
 *   - Perhaps a bouncing ball/rectangle (or more than one) is injected into gameplay and pong ball bounces off of it
 *   - 
 *
 * Other ideas:
 *   - Load an image and explode it using sensors (see /Topics/Explode)
 */

import java.awt.Rectangle;

Ball _ball = new Ball();
Paddle _leftPaddle;
Paddle _rightPaddle;

void setup(){
  size(640, 480);
  background(102);
  
  _leftPaddle = new Paddle(0, height / 2, 10, 40);
  _rightPaddle = new Paddle(width - 10, height / 2, 10, 40);
}

void draw(){
  background(51);
  
  _ball.update();
  _ball.draw();
  
  _leftPaddle.draw();
  _rightPaddle.draw();
}

class Ball{
  int _xPosition = 0;
  int _yPosition = 0;
  int _xSpeed = 1; // speed is in pixels/frame refresh
  int _ySpeed = 2; // speed is in pixels/frame refresh
  int _width = 15; // in pixels
  int _height = 15; // in pixels
  
  public void update(){
    _xPosition = _xPosition + _xSpeed;
    _yPosition = _yPosition + _ySpeed;
    
    if(_yPosition < 0 || _yPosition > height){
      _ySpeed *= -1;
    }
  }
  
  public void draw(){
    fill(255, 0, 255);
    rect(_xPosition, _yPosition, _width, _height);
  }
}

class Paddle extends Rectangle{
  Paddle(int x, int y, int rectWidth, int rectHeight){
    super(x, y, rectWidth, rectHeight);
  }
  
  public void draw(){
    rect(this.x, this.y, this.width, this.height);
  }
}
