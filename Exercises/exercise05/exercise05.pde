/*
Ideas, yadda yadda yadda:
- i wanna use sin, scale and screen resizing
- as the screen is resized, values will be changed, and this will affect the sin waves
- their scaling will change, and so will their shape? i'll see, because i've never tried this before
- when i try this combination of base code out, the waves get messed up and disappear. maybe because
  the wave depends on the width and height to be drawn?
- change of plans: even when i set the values for sin to fixed values the problem persists, so i'll only
  use sin/cos/tan
- change the shape of the waves with mouse input
- instead of being animated as the sketch goes on, the waves start off fully animated and change as the mouse position
is changed. the tan wave will probably just stay the same, though
- nevermind... just stretch the width of the wave a little bit, i guess
*/

/* BASE CODE: oscillation code taken from slides to be modified */
float theta = 0;
int x = 0;
/* CHANGED: added color variables to help destinguish the different wave types from one another
   also, added variables for each wave's multiplier number to more easily control their sizes */
// colors
color sin = (#25E8CF); // cyan
color cos = (#6CE825); // lime
color tan = (#E8BE25); // tan (heh)

// multipliers
float sinMul = 150;
float cosMul = 150;
float tanMul = 650;
/* end of CHANGE */

void setup() {
  /* CHANGED: made the window size bigger so i can better see the paths of the waves over time */
  size(1500,800);
  //for debugging
  frameRate(60);
  /* end of CHANGE */
  background(0);
  fill(255);
}

void draw() {
  /* CHANGED: created one wave of each type (sin, cos and tan) and gave each their own y value so
     they can mark their own path. also, move the mouse's x position to the far right of the screen
     to stretch the width of the wave by one level
      */
  //sin wave 
  fill(sin);
  stroke(sin);
  float ySin = 150 + (sin(theta) * sinMul);
  ellipse(x,ySin,5,5);
  // gives either 0 or 1. 0 is normal and 1 is stretched
  x = x + mouseX/800; 
  //cos wave
  fill(cos);
  stroke(cos);
  float yCos = 550 + (cos(theta) * cosMul);
  ellipse(x,yCos,5,5);
  //tan wave
  fill(tan);
  stroke(tan);
  float yTan = 650 + (tan(theta) * tanMul);
  ellipse(x,yTan,5,5);
  x++;
  theta += 0.05;
  // for debugging
  println(mouseX/800);   
}
/* end of CHANGE */
/* end of BASE CODE */