/* CHANGED: added this whole file in to house the star object. These get drawn individually to serve
   as a scoreboard mechanic and a nice aesthetic addition */

class Star {
  //// star properties ////
  // size
  int SIZE = 15;
  // position
  int x;
  int y;
  // color  Normal: white; Bad = dark red; Boon = jade green
  color normalStar = color(255);
  // nothing is being done with these for now, but these will later be used to draw abnormal stars
  color badStar = color(#a10000);
  color boonStar = color(#008141);
  
  //// constructor ////
  Star(int _x, int _y) {
    x = _x;
    y = _y;
  }
  
  //// methods ////
  
  // draw the star in its place, normally
  void display() {
    fill(normalStar);
    ellipseMode(CENTER);
    //i'll draw the star pulsating through this when i figure out how, probably
    ellipse(x, y, SIZE, SIZE);
  }
  
  // this is to draw those color stars in the bg that serve a purely aesthetic purpose
  void DrawBgStars() {
    //int[] bgStars
  }
}

/* end of CHANGE */