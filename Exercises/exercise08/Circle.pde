// File for circle object

class Circle {
  // Position, size, fill and transparency
  int x = floor(random(200,600));
  int y = floor(random(200,450));
  int size = floor(random(20, 150));
  color fill;
  int alpha;

  Circle(int _fill, int _alpha) {
    fill = _fill;
    alpha = _alpha;
  }

  // displays the circles
  void display() {
    fill(fill, alpha);
    ellipse(x,y,size,size);
  }
  
  // cycles through the colors black, green and red
  void colorSwap() {
    // switch back to black after clicking on a red circle by setting the switch variable
    // back to 1
    if(switchNum > 3){
      switchNum = 1;
    }
    switch(switchNum) {
      case 1: // black
        fill = color(#000000);
        break;
      case 2: // green
        fill = color(#1C5F20);
        break;
      case 3: // red
        fill = color(#D30000);
        break;
    }
  }
}

// i might need these later
// int _x, int _y, int _size, 
    //x = _x;
    //y = _y;
    //size = _size;