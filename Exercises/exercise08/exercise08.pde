/* Alright so the goal of this is to create the part of the project that will have 
(probably) the most story branch points, based on how the components are interacted 
with (some lines, beziers, and text, let's say. different colors, too)

i will not create the links to the story branches they lead to just yet, bcause that 
would be too much work, so i'll put a placeholder shape (a yellow square i guess) in
the corner of the window to indicate when the interactor would have been locked into 
a story branch. if you'll remember, i said i would start with 3, so i'll aim for that

mouse input is still the main mechanic in this
*/

/// initialize variables
// message text coordinates ('message text' refers to the the voice of the program
// aka the voice that bosses you around throughout the experience)

// values for larger message text
int textX1 = width/2;
int textY1 = 50;
int textAlpha1 = 0;
String text1 = "Are you done being a prick yet?";

// values for the smaller message text
int textX2 = width/2 + 20;
int textY2 = 80;
int textAlpha2 = 0;
String text2 = "Then, consider the following:";

void setup() {
  // size and bg color
  size(640,480);
  background(255);
}

void draw() {
  // fade the intro text in (larger text)
  if(textAlpha1 < 255) {
    background(255);
    textSize(20);
    fill(0, textAlpha1);
    text(text1, textX1, textY1);
    textAlpha1 += 5;   
  }
  // fade the intro text in (smaller text) while still drawing the prevous line of text
  if(textAlpha1 >= 255 && textAlpha2 < 255) {
    background(255);
    textSize(20);
    fill(0, textAlpha1);
    text(text1, textX1, textY1);
    textSize(15);
    fill(0, textAlpha2);
    text(text2, textX2, textY2);
    textAlpha2 += 5;
  }
    // for debugging
    println(textAlpha1);
}

void mouseClicked() {
  //
}

void mousePressed() {
  //
}