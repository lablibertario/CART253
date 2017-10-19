//*** we take all the telescopes                                     //
//      and we turn them inside out                                  //
//        and we point them away from the big sky                    //
//          put your right eye right up to the glass, now            //
//             and here we'll find the constellation of the heart ***// 

/* -------------------------------------- ****SPACE*PONG**** -------------------------------------- //
This is a space-themed game of Pong.
- Objective: complete your asterism by getting the pong ball across the other player's edge of the
screen as many times as it is needed to complete the picture. each time you score a point, one (1) 
star will be added to your constellation.
- You can move up and down just as you can in any regular game of pong, and you can also move right
and left, up to the middle of the screen. beware that if you stray from your edge of the screen at 
any moment, a shield will appear on the other side of the screen, and you won't be able to score a
point through there unless you return to the edge where you started
- every time you or the other player hits the ball with the paddle, it will of course bounce back,
but it will also increase or decrease in speed, so watch out. try to come up with a strategy to win
by examining the speed pattern
- The Big Dipper takes seven (7) stars to complete. that means you need 7 points to win

Godspeed.
// ------------------------------------------------------------------------------------------------ */

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);

/* CHANGED: added these variables, which serve various purposes: */
// variables to store the bg image and font files
PImage bg;
PFont fontSmall;
PFont fontBig;

// variables for the bg fade color effect
int levelOfRed = 254;
int switcher = 1;

// variables to store the current status messages for each player.
// they're empty to start with so no message gets displayed
String pAMessage = "";
String pBMessage = "";
// the x and y coordinates for the status messages, mostly for debugging. i might delete them later
int pAMessageX = 40;
int pBMessageX = 40;
int pAMessageY = 180;
int pBMessageY = 860;
// the size of the empty asterisms' stars, also here for debugging. might also delete this one
int emptyStarSize = 7;

// player A and player B's consistent colors
//player A is purple
int pAColor = color(148, 45, 166);
//player B is blue
int pBColor = color(45, 57, 166);

// Global variables for Star
// player A's stars
Star star1a;
Star star2a;
Star star3a;
Star star4a;
Star star5a;
Star star6a;
Star star7a;

//player B's stars
Star star1b;
Star star2b;
Star star3b;
Star star4b;
Star star5b;
Star star6b;
Star star7b;

// Global variables for Score
Score pAScore;
Score pBScore;

// Global variables for Shield
Shield pAShield;
Shield pBShield;
/* end of CHANGE */

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  /* CHANGED: made some modifications to the setup, detailed below */
  //set the font and bg image
  bg = loadImage("Blue-Background-Stars.jpg");
  fontSmall = loadFont("Munro-20.vlw");
  fontBig= loadFont("Munro-25.vlw");
  textFont(fontSmall);
  // set window size and create an inner window
  // the inner window will be the limits of the playing field, and the other parts will be the constellation scoreboards
  size(640, 880);
  background(0);
  fill(0);
  noStroke();
  rect(0,200,640,480);
  
   // create the stars, the scores and the shields
  // player A's stars
  star1a = new Star(67, 60);
  star2a = new Star(184, 40);
  star3a = new Star(284, 86);
  star4a = new Star(403, 84);
  star5a = new Star(426, 160);
  star6a = new Star(577, 162);
  star7a = new Star(587, 67);
  
  // player B's stars
  star1b = new Star(67, 730);
  star2b = new Star(184, 720);
  star3b = new Star(284, 766);
  star4b = new Star(403, 764);
  star5b = new Star(426, 840);
  star6b = new Star(577, 842);
  star7b = new Star(587, 747);
  
  // scores
  pAScore = new Score(0);
  pBScore = new Score(0);
  
  // shields (note: the colors are switched in this instance because the shields are on opposite ends of the screen from the player)
  // (also, the x and y values are offset from the corners of the inner screen so the lines' edges do't leak out into the scoreboards)
  pAShield = new Shield(pBColor, 0, 0, 203, 677);
  pBShield = new Shield(pAColor, 640, 640, 203, 677);
  
  // draw colorful stars in the background of each scoreboard at random
  // player A's scorebard
  fill(pAColor);
  for(int i = 0; i < 30; i++) {
    ellipse(random(0, 640), random(0, 200), 3, 3);
  }
  // player B's scorebard
  fill(pBColor);
  for(int i = 0; i < 30; i++) {
    ellipse(random(0, 640), random(680, 880), 3, 3);
  }
  
  // draw the empty asterisms that are gonna be filled up with stars in grey, with smaller-sized circles
  fill(75);
  ellipseMode(CENTER);
  ellipse(67, 60,emptyStarSize ,emptyStarSize);
  ellipse(184, 40, emptyStarSize, emptyStarSize);
  ellipse(284, 86, emptyStarSize, emptyStarSize);
  ellipse(403, 84, emptyStarSize, emptyStarSize);
  ellipse(426, 160, emptyStarSize, emptyStarSize);
  ellipse(577, 162, emptyStarSize, emptyStarSize);
  ellipse(587, 67, emptyStarSize, emptyStarSize);
  
  ellipse(67, 730, emptyStarSize, emptyStarSize);
  ellipse(184, 720, emptyStarSize, emptyStarSize);
  ellipse(284, 766, emptyStarSize, emptyStarSize);
  ellipse(403, 764, emptyStarSize, emptyStarSize);
  ellipse(426, 840, emptyStarSize, emptyStarSize);
  ellipse(577, 842, emptyStarSize, emptyStarSize);
  ellipse(587, 747, emptyStarSize, emptyStarSize);
  
  // label the contellations with a message indicating if it belongs to player A or B
  // done in the style of star, planet or constellation designations, hence the capitals and underscores
  fill(100);
  text("Constellation PLA_A", 430, 30);
  text("Constellation PLA_B", 430, 715);
  
  /* end of CHANGE */

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  /* CHANGED: changed the input keys to better fit the fingers of two players who will move their paddle in four directions
  W/I = UP
  S/K = DOWN
  A/J = LEFT
  D/L = RIGHT
  */
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'w', 's', 'a', 'd', pAColor);
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'i', 'k', 'j', 'l', pBColor);
  /* end of CHANGE */

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  /* CHANGED: changed this because drawing the whole background each frame is impractical for my purposes */
  // Fill the background each frame so we have animation
  //background(backgroundColor);
  
  // redraw the inner window's bg each frame so we have animation
   fill(0);
   noStroke();
   rectMode(CORNER);
   rect(0,200,640,480);
   // draw the inner bg image at low opacity, and make it fade from blue to purple, then back to blue
   if (levelOfRed == 0 || levelOfRed == 255) { 
     switcher = -switcher; 
   }
   tint(levelOfRed, 50, 255, 126);
   levelOfRed += switcher;
   image(bg, 0, 200);
  /* end of CHANGE */

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  
  /* CHANGED: added call for collide method between the ball and each of the shields */
  // Check if the ball has collided with either paddle or shield
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
  ball.collide(pAShield);
  ball.collide(pBShield);
  /* end of CHANGE */
  

  /* CHANGED: instead of doing the same thing when the ball goes off either side of the screen, the program does some things differently
     depending if the ball went off of the left side or right side */
     
  // Check if the ball has gone off the screen (on the right)
  if (ball.isOffScreenRight()) {
    // If it has, reset the ball
    ball.reset();
    // and increase player A's score by 1
    pAScore.playerScore++;
    pAScore.increase();
  }
     
  // Check if the ball has gone off the screen (on the left)
  if (ball.isOffScreenLeft()) {
    // If it has, reset the ball
    ball.reset();
    // and increase player B's score by 1
    pBScore.playerScore++;
    pBScore.increase();
  }

  /* end of CHANGE */

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  /* CHANGED: call the display motive for the shields */
  pAShield.display();
  pBShield.display();
  /* end of CHANGE */
  
    
  
  
  //draw the notification messages
  textFont(fontBig);
  fill(255);
  text(pAMessage, pAMessageX, pAMessageY);
  text(pBMessage, pBMessageX, pBMessageY);
  //println(ball.speed); // for debugging
  /* end of CHANGE */
}




// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
  //CHANGED: this is for debugging. 
    // press a to increase player A's score, for now. obviously i'll change this to activate when once i figure out how
    if(key == 'z') {
      pAScore.playerScore++;
      pAScore.increase();
    }
    // same goes for this, but with b
    if(key == 'b') {
      pBScore.playerScore++;
      pBScore.increase();
    }
    /* end of CHANGE */
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}