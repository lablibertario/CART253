import processing.sound.*;

//hmm...

/* ok, ideas:
- something using lines and the arrow keys
- maybe tones play as you press the arrow keys and lines get drawn to match your tone level? sounds simple enough
- i'll use a short looping sound file to work with and manipulate that 
*/

// i've decided to do option 1

// initialize the sound file i'll be using
// the sound file chosen is a bg music track from the freeware game Yume Nikki
SoundFile jingle;

// y variable for line position
// place the inital y position midway through the height of the canvas
int lineY = 200;
// x variable for line position
int lineX = 0;
// starting rate for the jingle (normal speed)
float jingleRate = 1;

void setup() {
  size(800,400);
  // create the sound file
  jingle = new SoundFile(this, "BGM_023.mp3");
  // volume set to half because it's kind of loud on my end
  jingle.amp(0.5);
  // draw some green lines along the sides of the canvas to serve as a ruler guide
  stroke(0,150,0);
  int y2 = 0;
  for(int y1 = 0; y1 < 400; y1 += 10) {
    line(0, y1, 5, y2);
    line(width, y1, width-5, y2);
    y2 += 10;
  }
  // draw some pink lines vertically at every 20 pixels, also as a guide
  int y3 = 0;
  int y4 = height;
  stroke(255, 116, 255);
  for(int x = 0; x < 800; x += 20) {
    line(x,y3,x,y4);
  }
  // draw a red line at the cross-section of the canvas to indicate where the default rate of the jingle is
  stroke(255,0,0);
  line(0, height/2, width, height/2);
}

void draw() {  
  // set the jingle's rate to a new rate, if the jingleRate variable is modified
  jingle.rate(jingleRate);
}


// draw the lines in blue while playing the sound file at the same time
void keyPressed() {
  // press the DOWN key and draw a line going down and horizontally
  if(keyCode == DOWN) {
    lineY += 10;
    lineX += 20;
    // to make the line segments connect to each other, begin the line at the spot that previous one ended
    stroke(0,0,255);
    line(lineX - 20, lineY - 10, lineX, lineY);
    // decrease the sample rate by 0.1
    jingleRate -= 0.1;
    // play the sound file
    jingle.play();
  }
  // press the UP key and draw a line going up and horizontally
    if(keyCode == UP) {
    lineY -= 10;
    lineX += 20;
    // these are the same as in the previous if statement, only the rate is increased by 0.1 instead of decreased
    stroke(0,0,255);
    line(lineX - 20, lineY + 10, lineX, lineY);
    jingleRate += 0.1;
    jingle.play();
  }
  // for debugging
  println(lineX, lineY);
  println(jingleRate);
}