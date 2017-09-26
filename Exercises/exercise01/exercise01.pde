// all of these are initialized here, and can't be changed within the lower parts of the code because of "final"
final int CIRCLE_SPEED = 7; // sets the CIRCLE_SPEED var to 7
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);  //colors the NO_CLICK_FILL_COLOR var salmon pink
final color CLICK_FILL_COLOR = color(100, 100, 250); //colors the CLICK_FILL_COLOR var blue-ish 
final color BACKGROUND_COLOR = color(250, 150, 150); //colors the BACKGROUND_COLOR var a somewhat less salmon pink
final color STROKE_COLOR = color(250, 150, 150); //colors the STROKE_COLOR var a somewhat less salmon pink
final int CIRCLE_SIZE = 50; // sets CIRCLE_SIZE var to 50

int circleX; //circle height
int circleY; //circle width
int circleVX; //circle's side to side movement velocity
int circleVY; //circle's up and down movement velocity

void setup() {
  size(640, 480); //canvas size
  circleX = width/2; //
  circleY = height/2; // 
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
    fill(CLICK_FILL_COLOR);
  }
  //if not, then just colr the fill salmon pink
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
}

//when clicked, this applies the bg color over everything, clearing the canvas
void mousePressed() {
  background(BACKGROUND_COLOR); 
}