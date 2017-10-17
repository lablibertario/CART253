// Paddle
//
// A class that defines a paddle that can be moved up and down on the screen
// using keys passed through to the constructor.

class Paddle {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 5;
  int HEIGHT = 70;
  int WIDTH = 16;

  // The position and velocity of the paddle (note that vx isn't really used right now)
  int x;
  int y;
  int vx;
  int vy;
  
  // The fill color of the paddle
  color paddleColor = color(255);
  
  /* CHANGE: added the leftKey and rightKey characters to store the key codes for x axis movement */
  // The characters used to make the paddle move up and down, defined in constructor
  char upKey;
  char downKey;
  char leftKey;
  char rightKey;


  /////////////// Constructor ///////////////

  // Paddle(int _x, int _y, char _upKey, char _downKey)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  Paddle(int _x, int _y, char _upKey, char _downKey, char _leftKey, char _rightKey) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    upKey = _upKey;
    downKey = _downKey;
    leftKey = _leftKey;
    rightKey = _rightKey;
    /* end of CHANGE */
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update position with velocity (to move the paddle)
         x += vx;
         y += vy;
      

    /* CHANGED: edited the values so the paddle stays within the edges of the inner screen instead. also edited so that there's 
    a constraint on the x axis too; the paddle can only move on the x axis within their side of the screen */
    // Constrain the paddle's y position to be in the window
    y = constrain(y,200 + HEIGHT/2,680 - HEIGHT/2);
    // Constrain the paddle's x positions to be in their side of the window
    leftPaddle.x = constrain(leftPaddle.x,0 + WIDTH/2,width/2 - WIDTH/2);
    rightPaddle.x = constrain(rightPaddle.x,width/2 + WIDTH/2,width - WIDTH/2);
    /* end of CHANGE */
  }

  // display()
  //
  // Display the paddle at its location
  
  void display() {
    // Set display properties
    noStroke();
    fill(paddleColor);
    rectMode(CENTER);
    
    // Draw the paddle as a rectangle
    rect(x, y, WIDTH, HEIGHT);
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program
  
  void keyPressed() {
    // Check if the key is our up key
    if (key == upKey) {
      // If so we want a negative y velocity
      vy = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
      // If so we want a positive y velocity
      vy = SPEED;
    }
    /* CHANGED: added a version of the above code to allow the movement on the x axis */
        // Check if the key is our left key
    if (key == leftKey) {
      // If so we want a negative y velocity
      vx = -SPEED;
    } // Otherwise check if the key is our right key 
    else if (key == rightKey) {
      // If so we want a positive y velocity
      vx = SPEED;
    }
    /* end of CHANGE */
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (key == upKey && vy < 0) {
      // If so it should stop
      vy = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == downKey && vy > 0) {
      // If so it should stop
      vy = 0;
    }
    /* CHANGED: added a version of the above code to prevent the paddles from going on forever */
    // Check if the key is our up key and the paddle is moving up
    if (key == leftKey && vx < 0) {
      // If so it should stop
      vx = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == rightKey && vx > 0) {
      // If so it should stop
      vx = 0;
    }
    /* end of CHANGE */
  }
}