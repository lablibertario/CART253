/* 
this is the Bouncer file, which contains all of the properties and initializes/runs functions (methods) for every object 
of the type Bouncer to be called from the main file.
*/

//defines the class of object Bouncer, with all of its properties and methods initialized between the curly brackets
class Bouncer {
 
 //initialized property values
 int x;
 int y;
 float vx;
 float vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 //this constructor sets up each new instance of the bouncer object
 //the arguments are there so we can set up each bouncer object with different prperties without making new files
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 
 //this method increments the bouncer's position coordinates and updates it each frame so it can move in a diagonal fashion
 //it also calls handleBounce() and handleMouse() contantly so their conditional statements can activate anytime
 void update() {
   x += vx;
   y += vy;
   
   handleBounce();
   handleMouse();
 }
 
 //this one makes the bouncer bounce off in another direction when it hits the edges of the canvas
 void handleBounce() {
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
    /* CHANGED: added this line so that every time either bouncer hits the right or left wall, its size shrinks until it disappears.
       after it shrinks to nothing, it starts to grow again, becoming bigger than ever before, because it passes into negative number territory
       this affects the constrain put on the edges of the canvas, which doesn't work well when you feed it a negative number */
    size = size - 1;
    /* end of CHANGE */
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
     /* same thing as the in the above conditional statement, but with the up or down wall */
     size = size - 1;
     /* end of CHANGE */
   }
   
   // this constraint prevents the bouncer from going off of the side of the screen so the animation looks better
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 
 //this one makes it so that when you hover over the bouncer, the color changes slightly
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 
 /* CHANGED: added this method, which adds 0.5 to the velocity and consequently throws off the entire groove of the program, making it behave erratically 
    the speed changes, usually getting faster and then slowing down every time it is called (or the opposite), and the direction changes too, usually going in a diagonal
    because bouncer uses a positive x velocity and bouncer2 uses a negative x velocity, their movements no longer synchronize when 0.5 is added. */
 void distortMovement() {
  vy = vy + 0.5;
  vx = vy + 0.5;
 }
 /* end of CHANGE */
 
 //this displays the bouncer on the screen
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}