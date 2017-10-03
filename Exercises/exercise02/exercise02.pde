/* this program is single-person pong, wherein the ball spawns from the center, bounces off all of 
   the walls except the bottom one, and no score is kept track of. there's also some fuzz/static in the background. 
   
   the beginning sets colors, canvas size, values and functions to control the paddle, ball and the positions of everything 
   */
color backgroundColor = color(0);

int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);


void setup() {
  size(640, 480);
  
  setupPaddle();
  setupBall();
}
/* this function sets up attributes for the game paddle, setting its initial position to the bottom center based on the already initialized values */
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

/* this function sets up attributes for the ball, centering its initial position, setting its y and x velocity to
   the initialized ball speed, also based on the initialized values */
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

/* this calls the various functions on a loop */
void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}

/* this function draws the fuzz in the background */
void drawStatic() {
  /* for as long as the initialized value i is less than the value numStatic, increment i by 1 every time you go through
     the loop. in this loop, draw little squares at random positions, making it look like static */
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}

/* this function makes it possible for the paddle to move, and prevents the paddle from going off of the side of the screen */
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

/* this function makes it possible for the ball to move */
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

/* this function draws the paddle shape with the initialized values */
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

/* this one draws the ball shape with the initialized values */
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}


/* this one makes the ball bounce back when it hits the paddle */
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
}

/* this is the boolean that allows the if statement in handleBallHityPaddle() to work */
boolean ballOverlapsPaddle() {
  /* if the ball's edge comes into contact with the paddle's edge on any part of the paddle, activate the next 
  if statement. this is done by adding half of the width of the ball or the paddle to the ball or paddle respectively */
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    /* if the ball gets to a lower position on the screen than the position of the top of the paddle, return true */
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  /* if both of these are not true, return false */
  return false;
}

/* this one checks if handleBallOffBottom is returned */
void handleBallOffBottom() {
  /* if returned, set the ball coordinates to the middle of the screen */
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

/* this returns if the ball goes off the bottom edge */
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

/* this makes it so the ball will bounce off the walls, excluding the bottom one */
void handleBallHitWall() {
  /* this inverts the ball's x velocity  so it goes in the opposite direction */
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
    /* this */
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  /* this does the same thing as the last if statement, but with the y velocity */
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

/* this lets the player control the paddle left and right */
void keyPressed() {
  /* when the left key is pressed or held, move the paddle left */
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
    /* same thing, only to the right and with the right key */
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

/* this stops the paddle in its tracks when the left or right arrow keys are not being pressed so it won't slide */
void keyReleased() {
  /* if paddle x velocity is above zero when the keys are released, it will stop the paddle 
     by setting x velocity to 0 */
  if (keyCode == LEFT && paddleVX < 0)
    paddleVX = 0;
    /* same thing but for y velocity */
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}