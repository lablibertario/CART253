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

void setup() {
  size(800,400);
  // create the sound file
  jingle = new SoundFile(this, "BGM_023.mp3");
  // volume set to half because it's kind of loud on my end
  jingle.amp(0.5);
}

void draw() {  
  // nothing yet
}


// draw the lines while playing the sound file at the same time
void keyPressed() {
  // press the DOWN key and draw a line going down
  if(keyCode == DOWN) {
    lineY += 10;
    lineX += 20;
    // to make the line segments connect to each other, begin the line at the spot that previous one ended
    line(lineX - 20, lineY - 10, lineX, lineY);
    // play the sound file
    jingle.play();
  }
  // press the UP key and draw a line going up
    if(keyCode == UP) {
    lineY -= 10;
    lineX += 20;
    // same as two lines above
    line(lineX - 20, lineY + 10, lineX, lineY);
    // play the sound file
    jingle.play();
  }
  // for debugging
  println(lineX, lineY);
  println(height);
}