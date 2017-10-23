/*
Take the exercise code below and put it into a new Processing sketch called exercise04 and place it in your exercises folder in your local repository. (Note that there are two files this time, so you'll need to add a tab called Griddie and put the appropriate code in it too.)
Commit this change with a message like "Started exercise 04"
Go through the code and make sure you understand how it works (run it too of course!), then answer the QUESTIONS in the comments by writing your own comments below them to prove that you understand what is happening.
Commit this change with a message like "Answered exercise questions".
_Add a new class that defines a new creature that will exist in the system and add some number of these creature in an array in the main program in the same way as the Griddies (make sure you update and display your new creatures)
Commit this change with a message like "Added new creature" and a description of the creature.
If you haven't already, make the new creatures interact with the Griddies in some way that you find interesting
Commit this change with a message like "Added interaction between creatures" and a description of the interaction
Don't forget to push your repository to github.com either at the end or throughout
You're done!
*/

// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      if (j != i) {
        // QUESTION: What does this line check?
        griddies[i].collide(griddies[j]);
      }
    }
    
    // Display the griddies
    griddies[i].display();
  }
}