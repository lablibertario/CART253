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
float theScale = 1;
float theta = 0;
int x = 0;
void setup() {
  size(600,600);
  background(0);
  fill(255);

}
void draw() {
  //sin wave
  float y = 150 + (sin(theta) * 150);
  ellipse(x,y,10,10);
  x++;
  theta += 0.05;
  // for debugging
  println(width, height);   
}

/* end of BASE CODE */