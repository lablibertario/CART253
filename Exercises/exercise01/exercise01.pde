// all of these can't be changed within the lower parts of the code because of "final"
final int CIRCLE_SPEED = 7; // the speed of the circles
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);  //colors the fill of the circles salmon pink
final color CLICK_FILL_COLOR = color(100, 100, 250); //colors the fill of the circles blue-ish 
final color BACKGROUND_COLOR = color(250, 150, 150); //colors the background a somewhat less salmon pink
final color STROKE_COLOR = color(250, 150, 150); //colors the outline of the circle a somewhat less salmon pink
final int CIRCLE_SIZE = 50; //size of the circle

int circleX; //circle height
int circleY; //circle width
int circleVX; //circle's side to side movement velocity
int circleVY; //circle's up and down movement velocity

void setup() {
  size(640, 480); //canvas size
  circleX = width/2; //
  circleY = height/2;
  circleVX = CIRCLE_SPEED; //sets the side to side velocity to the circle speed
  circleVY = CIRCLE_SPEED; //sets the up and down velocity to the circle speed
  stroke(STROKE_COLOR); //sets stroke color
  fill(NO_CLICK_FILL_COLOR); //sets fill color
  background(BACKGROUND_COLOR); //sets bg color
}

void draw() {
  //hmmmm......
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) { 
    fill(CLICK_FILL_COLOR);
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE); //this draws the circles with the set parameters
  circleX += circleVX;
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR); //when clicked, this applies the bg color over everything, clearing the canvas
}