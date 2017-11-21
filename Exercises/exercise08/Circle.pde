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
}

// i might need these later
// int _x, int _y, int _size, 
    //x = _x;
    //y = _y;
    //size = _size;