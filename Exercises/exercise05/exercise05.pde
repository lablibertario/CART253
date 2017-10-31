/*
Ideas, yadda yadda yadda:
- i wanna use sin and screen resizing
- as the screen is resized, values will be changed, and this will affect the sin waves
*/

/* BASE CODE: oscillation code taken from slides to be modified */
float theta = 0;
int x = 0;
void setup() {
  size(600,600);
  background(0);
  fill(255);
}
void draw() {
  float y = height/2 + (sin(theta) * height/2);
  ellipse(x,y,10,10);
  x++;
  theta += 0.05;
}
/* end of BASE CODE */