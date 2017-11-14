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
  size(400,400);
  // create the sound file
  jingle = new SoundFile(this, "BGM_023.mp3");
}

void draw() {  
  // nothing yet
}

// for now, play the sound file when the mouse is clicked (it doesn't always work though? i guess it's just buggy)
void mouseClicked() {
  jingle.play();
}

// draw the lines that will help indicate something that i'm going to work in next
void keyPressed() {
  // press the DOWN key and draw a line going down
  if(keyCode == DOWN) {
    lineY += 10;
    lineX += 20;
    // to make the line segments connect to each other, begin the line at the spot that previous one ended
    line(lineX - 20, lineY - 10, lineX, lineY);
  }
  // press the UP key and draw a line going up
    if(keyCode == UP) {
    lineY -= 10;
    lineX += 20;
    // same as two lines above
    line(lineX - 20, lineY + 10, lineX, lineY);
  }
  // for debugging
  println(lineX, lineY);
  println(height);
}