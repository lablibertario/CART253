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

nope, not this time! no obstructing text for you!
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

// initialize variable for color swapping
int switchNum = 1;

//** in the final version, each story branch will have its own function that will put it in
// its own state, but for the sake of this prototype, when the program fulfills a condition
// that would lead to one of these states, this function is run.
// all it does is stop all movement and draw a yellow square in the corner. it is just to
// point out when these branch locks would happen
void branchLock() {
  fill(255,230,0);
  rect(5,5, 20,20);
  frameRate(0);
}

void setup() {
  // size and bg color
  size(640,480);
  background(255);
  
  // create the circles with their parameters
  // self-reminder: fill, alpha
  circle1 = new Circle(100, 255);
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
  // third, draw some circles to interact with, while the text from before remains in the 
  // picture. these circles are boring for now, but the way they look and the way they will be 
  // interacted with will be spiced up later
  if (textAlpha2 >= 255) {
    background(255);
    fill(0);
    textSize(20);
    text(text1, textX1, textY1);
    textSize(15);
    text(text2, textX2, textY2);
    noStroke();
    circle1.display();
    circle2.display();
    circle3.display();
    circle4.display();
    circle5.display();
  
  // bringing a circle to the message text will lock you into a story branch:
  if(circle1.x < 300 && circle1.y < 100){
    background(255);
    fill(255,0,0);
    text("Wow, not even going to wait until i finish talking, are you?\nthen fine, don't let me BORE you with this...", textX1, textY1);
    branchLock();
  }
}
  
    // for debugging
    point(50,40);
    point(50,100);
    point(300,40);
    point(300,100);
    println(circle1.x);
}



  /// starting from after the text has faded in, the interactor can begin affecting things
  // ...through clicking
void mouseClicked() {
  // change the color of the circles, only when 
    // circle 1
  if (mouseX >= circle1.x - circle1.size/2 && mouseX <= circle1.x + circle1.size/2) {
    if (mouseY >= circle1.y - circle1.size/2 && mouseY <= circle1.y + circle1.size/2) {
        switchNum++;
        circle1.colorSwap();
    }
  }
    // circle 2
  if (mouseX >= circle2.x - circle2.size/2 && mouseX <= circle2.x + circle2.size/2) {
    if (mouseY >= circle2.y - circle2.size/2 && mouseY <= circle2.y + circle2.size/2) {
        switchNum++;
        circle2.colorSwap();
    }
  }
    // circle 3
  if (mouseX >= circle3.x - circle3.size/2 && mouseX <= circle3.x + circle3.size/2) {
    if (mouseY >= circle3.y - circle3.size/2 && mouseY <= circle3.y + circle3.size/2) {
        switchNum++;
        circle3.colorSwap();
    }
  }
    // circle 4
  if (mouseX >= circle4.x - circle4.size/2 && mouseX <= circle4.x + circle4.size/2) {
    if (mouseY >= circle4.y - circle4.size/2 && mouseY <= circle4.y + circle4.size/2) {
        switchNum++;
        circle4.colorSwap();
    }
  }
    // circle 5
  if (mouseX >= circle5.x - circle5.size/2 && mouseX <= circle5.x + circle5.size/2) {
    if (mouseY >= circle5.y - circle5.size/2 && mouseY <= circle5.y + circle5.size/2) {
        switchNum++;
        circle5.colorSwap();
    }
  }

}
  // ...through dragging
void mouseDragged() {
  // drag the circles around, but only when the cursor is inside the circle
  // circle 1
  if (mouseX >= circle1.x - circle1.size/2 && mouseX <= circle1.x + circle1.size/2) {
    if (mouseY >= circle1.y - circle1.size/2 && mouseY <= circle1.y + circle1.size/2) {
      circle1.x = mouseX;
      circle1.y = mouseY;
    }
  }
    // circle 2
  if (mouseX >= circle2.x - circle2.size/2 && mouseX <= circle2.x + circle2.size/2) {
    if (mouseY >= circle2.y - circle2.size/2 && mouseY <= circle2.y + circle2.size/2) {
      circle2.x = mouseX;
      circle2.y = mouseY;
    }
  }
    // circle 3
  if (mouseX >= circle3.x - circle3.size/2 && mouseX <= circle3.x + circle3.size/2) {
    if (mouseY >= circle3.y - circle3.size/2 && mouseY <= circle3.y + circle3.size/2) {
      circle3.x = mouseX;
      circle3.y = mouseY;
    }
  }
    // circle 4
  if (mouseX >= circle4.x - circle4.size/2 && mouseX <= circle4.x + circle4.size/2) {
    if (mouseY >= circle4.y - circle4.size/2 && mouseY <= circle4.y + circle4.size/2) {
      circle4.x = mouseX;
      circle4.y = mouseY;
    }
  }
    // circle 5
  if (mouseX >= circle5.x - circle5.size/2 && mouseX <= circle5.x + circle5.size/2) {
    if (mouseY >= circle5.y - circle5.size/2 && mouseY <= circle5.y + circle5.size/2) {
      circle5.x = mouseX;
      circle5.y = mouseY;
    }
  }
}