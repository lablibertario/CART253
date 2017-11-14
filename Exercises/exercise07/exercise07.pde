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

void setup() {
  size(400,400);
  // create the sound file
  jingle = new SoundFile(this, "BGM_023.mp3");
}

void draw() {
  // nothing for now
}

// for now, play the sound file when the mouse is clicked (it doesn't always work though? i guess it's just buggy)
void mouseClicked() {
  jingle.play();
}