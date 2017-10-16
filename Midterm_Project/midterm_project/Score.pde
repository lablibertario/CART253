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
    }
  //
  // score tracking for player B
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

    }
  }
  
  // nothing is being done with this yet, but i'll use it when i create the game over state
  void displayWinMessage() {
  
  }
}

/* end of CHANGE */