/* CHANGED: added this file that contains the scoring system in the form of an asterism that needs to 
   be drawn in full. each star added gives the player a point. for the time being, it's restricted to a 
   single one: the Big Dipper, which needs 7 stars to complete. in other words, 7 points and you win. 
  */

class Score {
  //// score properties ////
  int playerScore = 0;
  
  //// constructor ////
  Score(int _playerScore) {
    playerScore = _playerScore;
  }
  
  //// methods ////
  
  // draw the stars in the asterisms, as well as the lines that help complete the picture
  void increase() {
    
  //
  // score tracking for player A
  strokeWeight(2);
  if (pAScore.playerScore == 1) {
      star1a.display();
    }
  if (pAScore.playerScore == 2) {
      star2a.display();
      stroke(255);
      line(67,60,184,40);
    }
  if (pAScore.playerScore == 3) {
      star3a.display();
      stroke(255);
      line(184,40,284,86);
    }
  if (pAScore.playerScore == 4) {
      star4a.display();
      stroke(255);
      line(284,86,403,84);
    }
  if (pAScore.playerScore == 5) {
      star5a.display();
      stroke(255);
      line(403,84,426,160);
    }
  if (pAScore.playerScore == 6) {
      star6a.display();
      stroke(255);
      line(426,160,577,162);
      //change the message to show that player A only needs one more point to win
      pAMessage = "One more point to the win!";
    }
  if (pAScore.playerScore == 7) {
      star7a.display();
      stroke(255);
      line(577,162,587,67);
      line(587,67,403,84);
      gameOverStateA();
    }
  //
  // score tracking for player B
  strokeWeight(2);
  if (pBScore.playerScore == 1) {
      star1b.display();
    }
  if (pBScore.playerScore == 2) {
      star2b.display();
      stroke(255);
      line(67,730,184,720);
    }
  if (pBScore.playerScore == 3) {
      star3b.display();
      stroke(255);
      line(184,720,284,766);
    }
  if (pBScore.playerScore == 4) {
      star4b.display();
      stroke(255);
      line(284,766,403,764);
    }
  if (pBScore.playerScore == 5) {
      star5b.display();
      stroke(255);
      line(403,764,426,840);
    }
  if (pBScore.playerScore == 6) {
      star6b.display();
      stroke(255);
      line(426,840,577,842);
      //change the message to show that player A only needs one more point to win
      pBMessage = "One more point to the win!";   
    }
  if (pBScore.playerScore == 7) {
      star7b.display();
      stroke(255);
      line(577,842,587,747);
      line(587,747,403,764);
      gameOverStateB();
    }
  }
  
  // this method activates once player A gets to seven points and completes their asterism
  void gameOverStateA() {
    // this displays the win message for player A
    // first, we draw a square that covers up the previous message so a new one can be drawn in its place
    fill(0);
    noStroke();
    rectMode(CORNER);
    rect(30, 155, 310, 30);
    // change the message to show that player A won, and also draw it
    pAMessage = "Player A is the winner!";
    // this stops everything on screen so that the players can't use any of the controls in this state
    ball.vy = 0;
    ball.vx = 0;
    // this part doesn't really work actually but i'll figure out a way to get it to work later
    leftPaddle.vy = 0;
    rightPaddle.vy = 0;
    
    
  }
  // this state activates once player B gets to seven points and completes their asterism
  void gameOverStateB() {
    // this displays the win message for player B
    // draw a square that covers up the previous message so a new one can be drawn in its place
    fill(0);
    noStroke();
    rectMode(CORNER);
    rect(30, 835, 310, 30);
    // change the message to show that player B won, and also draw it
    pBMessage = "Player B is the winner!";
    // this stops everything on screen so that the players can't use any of the controls in this state
    ball.vy = 0;
    ball.vx = 0;
    // again, doesn't work
    leftPaddle.vy = 0;
    rightPaddle.vy = 0;
  }
}

/* end of CHANGE */