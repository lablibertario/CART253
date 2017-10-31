/*
Ideas, yadda yadda yadda:
- i wanna use sin, scale and screen resizing
- as the screen is resized, values will be changed, and this will affect the sin waves
- their scaling will change, and so will their shape? i'll see, because i've never tried this before
- when i try this combination of base code out, the waves get messed up and disappear. maybe because
  the wave depends on the width and height to be drawn?
- change of plans: even when i set the values for sin to fixed values the problem persists, so i'll only
  use sin/cos/tan
*/

/* BASE CODE: oscillation code taken from slides to be modified */
float theta = 0;
int x = 0;
/* CHANGED: added color variables to help destinguish the different wave types from one another
   also, made the window size bigger so i can better see the paths of the waves over time */
color sin = (#25E8CF); // cyan
color cos = (#6CE825); // lime
color tan = (#E8BE25); // tan (heh)
void setup() {
  size(1500,800);
  /* end of CHANGE */
  background(0);
  fill(255);
}

void draw() {
  /* CHANGED: created one wave of each type (sin, cos and tan) and gave each their own y value so
     they can mark their own path */
  //sin wave
  fill(sin);
  stroke(sin);
  float ySin = 150 + (sin(theta) * 150);
  ellipse(x,ySin,10,10);
  //cos wave
  fill(cos);
  stroke(cos);
  float yCos = 150 + (cos(theta) * 150);
  ellipse(x,yCos,10,10);
  //tan wave
  fill(tan);
  stroke(tan);
  float yTan = 150 + (tan(theta) * 150);
  ellipse(x,yTan,10,10);
  x++;
  theta += 0.05;
  // for debugging
  println(tan(theta));   
}
/* end of CHANGE */
/* end of BASE CODE */