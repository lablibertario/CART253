// all of these are initialized here, and can't be changed within the lower parts of the code because of "final"
final int CIRCLE_SPEED = 7; // sets the CIRCLE_SPEED var to 7
/* CHANGED: added two new fill colors for use later in this code */
final color ALT_UP_CLICK_FILL_COLOR = color(0, 215, 0); // colors green
final color ALT_DOWN_CLICK_FILL_COLOR = color(245, 245, 0); // colors yellow
/* end of CHANGE */
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);  //colors the NO_CLICK_FILL_COLOR var salmon pink 
final color CLICK_FILL_COLOR = color(100, 100, 250); //colors the CLICK_FILL_COLOR var blue-ish 
final color BACKGROUND_COLOR = color(250, 150, 150); //colors the BACKGROUND_COLOR var a somewhat less salmon pink
final color STROKE_COLOR = color(250, 150, 150); //colors the STROKE_COLOR var a somewhat less salmon pink
final int CIRCLE_SIZE = 50; // sets CIRCLE_SIZE var to 50

int circleX; //circle height
int circleY; //circle width
int circleVX; //circle's side to side movement velocity
int circleVY; //circle's up and down movement velocity
/* CHANGED- added this variable: */
float colorDisturber = 3; //
/* end of CHANGE */

void setup() {
  size(640, 480); //canvas size
  circleX = width/2; //circleX is set to a size of the width of the canvas
  circleY = height/2; // same thing, only for circleY and to the height of the canvas
  circleVX = CIRCLE_SPEED; //sets the side to side velocity to the circle speed
  circleVY = CIRCLE_SPEED; //sets the up and down velocity to the circle speed
  stroke(STROKE_COLOR); //sets stroke color
  fill(NO_CLICK_FILL_COLOR); //sets fill color
  background(BACKGROUND_COLOR); //sets bg color
}

void draw() {
  //if the distance between the mouse position and the circle's current position...
  //is less than the size of the circle (50 pixels) then change the circle fill to the blue instead of the salmon pink
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) { 
      /* CHANGED: roll a random number between 1 and 3, and assign the value to colorDisturber. why? keep reading. */
      colorDisturber = random(1,3);
      /* end of CHANGE */
      /* CHANGED- made it so that these if and else statements and the random number rolled earlier, part of the time 
      (when the random number is less than 2), will fill the circle with green instead of blue when the mouse is in the top half 
      of the canvas and yellow when the mouse is in the bottom half of the canvas. */
      if (colorDisturber > 2) {
        /* this nested loop checks the mouse postion and selects the appropriate color*/
        if (mouseY > height/2) {
          fill(ALT_UP_CLICK_FILL_COLOR);
        } else {
          fill(ALT_DOWN_CLICK_FILL_COLOR);
        }
      /* if the random number is less than 2, just fill with blue */
      } else {
        fill(CLICK_FILL_COLOR);
      }
      /* end of CHANGE */
  }
  //if not, then just color the fill salmon pink 
  else {
    fill(NO_CLICK_FILL_COLOR);

  }
  //this draws the circles with the set parameters initialized eariler
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE); 
  //this allows incrementing/decrementing, changing the position of the circle
  circleX += circleVX; // "+=" makes this equivalent to circleX = circleX + circleVX
  circleY += circleVY; // same thing, only for the y axis
  //basically, if the circle hits the left or right of the screen, it will bounce off downward or upward
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX; //this switches the direction
  }
  //if the circle hits the top or bottom of the screen, it will bounce off to the left or the right
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
  println(colorDisturber); //for debugging
}

//when clicked, this applies the bg color over everything, clearing the canvas
void mousePressed() {
  background(BACKGROUND_COLOR); 
}