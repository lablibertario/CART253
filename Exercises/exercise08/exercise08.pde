/* Alright so the goal of this is to create the part of the project that will have 
(probably) the most story branch points, based on how the components are interacted 
with (some lines, beziers, and text, let's say. different colors, too)

i will not create the links to the story branches they lead to just yet, bcause that 
would be too much work, so i'll put a placeholder shape (a yellow square i guess) in
the corner of the window to indicate when the interactor would have been locked into 
a story branch. if you'll remember, i said i would start with 3, so i'll aim for that

mouse input is still the main mechanic in this

// just some text to be added later. i'm writing it down now so i don't forget:

Pretty, isn't it? 

Wow, not even going to wait until i finish talking, are you? then fine, don't let me BORE you
with this...

[text turns white, bg turns angry color] I didn't say you were allowed to block me out with 
them! Don't you have any respect?

Oooh, what are you up to? Looks neat.

[upon unveiling text hidden as the same color as bg ] Ooh, look at that! look at what you 
uncovered!
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

// initialize circles
Circle circle1;
Circle circle2;
Circle circle3;
Circle circle4;
Circle circle5;

void setup() {
  // size and bg color
  size(640,480);
  background(255);
  
  // create the circles with their parameters
  // self-reminder: fill, alpha
  circle1 = new Circle(0, 255);
  circle2 = new Circle(0, 255);
  circle3 = new Circle(0, 255);
  circle4 = new Circle(0, 255);
  circle5 = new Circle(0, 255);
  
}

void draw() {
  // first, fade the intro text in (larger text)
  if(textAlpha1 < 255) {
    background(255);
    textSize(20);
    fill(0, textAlpha1);
    text(text1, textX1, textY1);
    textAlpha1 += 5;   
  }
  // second, fade the intro text in (smaller text) while still drawing the prevous line of text
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
  // third, draw some things to interact with. these are boring for now, but the way they look
  // and the way they will be interacted with will be spiced up later
  if (textAlpha2 >= 255) {
    noStroke();
    circle1.display();
    circle2.display();
    circle3.display();
    circle4.display();
    circle5.display();
  }
  
    // for debugging
    /*point(200,200);
    point(200,450);
    point(600,200);
    point(600,450);*/
    println(textAlpha1);
}

  /// starting from after the text has faded in, the interactor can begin affecting things
  // ...through clicking
void mouseClicked() {
  // change the color of the circles
  // (that goes here)
}
  // ...through pressing
void mousePressed() {
  // drag the circles around
  // (that goes here too)
}