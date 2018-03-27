/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-27
 * Sketch #7
 *****************************************************/
 
int diameter =10;                             // initialize diameter with default value
void setup() {
  size(400, 400);
  background(0);

  noFill();
  stroke(255);
}

void draw() {
  //diameter = frameCount;                      // set diameter every updates of the frame
  diameter = frameCount  % width;             // to reset frame count if greater than width, to continue re-create another loop
  if (diameter < width && diameter % 5==0) {  // draw circle every 5 frame count interval and if less than width of screen
    background(0);                            // redraw background serve as eraser of previous created circle (uncomment if you want to view what happens)
    ellipse(width/2, height/2, diameter, diameter ); // and now let us create a circle
  } else {
    //Ignore
  }
}