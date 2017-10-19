/* CHANGED: Added this object to create some shields. a shield gets drawn on the opposite end of the screen from a paddle that moves from its 
initial x position to discourage the players from abusing the x movement mechanic in this modified version of pong. */

class Shield {
  //// star properties ////
  // thickness
  int WIDTH = 8;
  int HEIGHT = 480;

  // color
  color shieldColor;
  
  // position
  int x1;
  int x2;
  int y1;
  int y2;
  
  //// constructor ////
  Shield(color _shieldColor, int _x1, int _x2, int _y1, int _y2) {
    shieldColor = _shieldColor;
    x1 = _x1;
    x2 = _x2;
    y1 = _y1;
    y2 = _y2;
  }
  
  //// methods ////
  
  // draw the shield in its place
    void display() {
    // this draws a shield on the left side of the screeen when the right paddle is out of its starting x position, repelling the ball upon contact
    if(rightPaddle.x < width - 8) {
      stroke(pAShield.shieldColor);
      strokeWeight(WIDTH);
      line(pAShield.x1, pAShield.y1, pAShield.x2, pAShield.y2);
    }
    // same thing, but for the left paddle, and to make a shield on the right side of the screen
    if(leftPaddle.x > 8) {
      stroke(pBShield.shieldColor);
      strokeWeight(WIDTH);
      line(pBShield.x1, pBShield.y1, pBShield.x2, pBShield.y2);
    }
  } 
  
}

/* end of CHANGE */