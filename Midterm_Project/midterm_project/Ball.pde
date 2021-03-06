// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  // Default values for speed and size
  /* CHANGED: turned the speed into a value to be changed as the program runs, so all instances of "SPEED" have been changed to "speed". 
     the ball now decreases in speed every time it hits a paddle, until the speed reaches 1, at which point it starts to gain speed instead
     until it reaches 10, where it will start to go down again (this is what the speedSwitcher value i added is for)
     */
  int speed = 5;
  int SIZE = 16;
  int speedSwitcher = 1;
  /* end of CHANGE */

  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;

  // The colour of the ball
  color ballColor = color(255);


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(int _x, int _y) {
    x = _x;
    y = _y;
    vx = speed;
    vy = speed;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;   
    
    /* CHANGED: edited the values so the ball bounces off the edges of the inner screen instead */
    // Check if the ball is going off the top or bottom
    if (y - SIZE/2 < 200 || y + SIZE/2 > 680) {
      /* end of CHANGE */
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
    /* CHANGED: added this constrain so the ball doesn't go off the inner screen and leave a mark on either of the scoreboards */
    y = constrain(y,200 + SIZE/2,680 - SIZE/2);
    /* end of CHANGE */
  }
  
  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity
  
  void reset() {
    x = width/2;
    y = height/2;
  }
  
  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")
  
  /* CHANGED: seperated isOffScreen() into left and right versions to score points to player B when the ball goes off the left
     side of the screen and points to player A when the ball goes off of the right side of the screen
     i know i'm not doing it the way it was described above, but this is fine for now. if i have time, i'll figure out how  to 
     do it the other way */
  boolean isOffScreenLeft() {
    return (x + SIZE/2 < 0);
  }
  boolean isOffScreenRight() {
    return (x - SIZE/2 > width);
  }
  /* end of CHANGE */

  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity
  

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);
    
    
    
    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx;
      /* CHANGED: and increase/decrease its speed by 1 */
      if (speed == 1 || speed == 10) { speedSwitcher = -speedSwitcher; }
      speed += speedSwitcher; 
        
    // with this addition, the ball's velocity values will change to the same as the speed
      if(vx > 0) {
        vx = speed;
      }
      if(vy > 0) {
        vy = speed;
      }
      if(vx < 0) {
        vx = -speed;
      }
      if(vy < 0) {
        vy = -speed;
      } 
        /* end of CHANGE */
        println(ball.speed, speedSwitcher); // for debugging
    }
  }
  /* CHANGED: added this collide motive for the shield for when the ball hits it */
  void collide(Shield shield) {
    boolean insideLeft = (x + SIZE/2 > shield.x1 - shield.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < shield.x1 + shield.WIDTH/2);
      // make it bounce only when the shield lines are drawn (left side of screen shield)
    if(insideLeft && insideRight && rightPaddle.x < width - 8 && ball.x <= width/2) {
      vx = -vx;
    }
      // make it bounce only when the shield lines are drawn (left side of screen shield)
    if(insideLeft && insideRight && leftPaddle.x > 8 && ball.x >= width/2) {
      vx = -vx;
    }
  }
  /* end of CHANGE */

  // display()
  //
  // Draw the ball at its position

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    /* CHANGED: changed the shape of the ball to a circle to make it match with the stars in the scoreboard */
    ellipseMode(CENTER);

    // Draw the ball
    ellipse(x, y, SIZE, SIZE);
    /* end of CHANGE */
  }
}