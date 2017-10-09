/* 
this is the main file, where the Bouncer type, and values are initialized, and methods from "Bouncer.pde" and 
other files are called
*/

//sets the bg color
color backgroundColor = color(200,150,150);
//initialize the objects bouncer and bouncer2
Bouncer bouncer;
Bouncer bouncer2;

void setup() {
  //set canvas size
  size(640,480);
  //set bg color
  background(backgroundColor);
  //create the bouncer and bouncer2 objects with these constructors
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

//from here, we call all methods of bouncer and bouncer2 when we need them. in this case, we don't need any...
//conditionals or anything special because we just want them to run continuously, so we just call them.
//we call them by accessing them with the name of the object, then a dot, then the method
void draw() {
  //for example, this line of code calls the update() function for the first Bouncer object
  bouncer.update();
  //and this one does the same thing, but for the second Bouncer object
  bouncer2.update();
  //these access the Bouncer's draw method, not this draw function, because of the use of the object name and the dot
  bouncer.draw();
  bouncer2.draw();
}