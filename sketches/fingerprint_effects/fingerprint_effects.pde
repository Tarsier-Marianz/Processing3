/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author:   Marianz
 * Created:  2018-03-26
 * Sketch:   #2
 *****************************************************/
Arcs []_arc = null;
int _totalArcs = 200;
float _step = 30;
float _theta;

void setup() {
  // fullscreen for the effects
  //fullScreen();
  size(600, 600);
  _arc = new Arcs[_totalArcs];
}

void draw() {
  // background grey-black
  background(25);
  // speed of effects
  frameRate(30);
  //center design
  translate(width/2, height/2);
  // loop to create multiple arclines
  for (int i=0; i< _totalArcs; i++) {    
    if (i > 15) {                                        // limit figure to circle and stop filling with stroke
      noStroke();
    } else if (i < 1) {                                  // no stroke for the first arc 
      noStroke();
    } else {                                             // stroke color depends on mouse movement
      // stroke is set by mouse movement set to scale with fullscreen size
      // & set the blue by keeping a medium sized range
      stroke(mouseX/2.9, mouseY/2.9, i+135);
    }
    
    _arc[i] = new Arcs(_totalArcs, _step);
    _arc[i].index = i;
    _arc[i].theta = _theta;
    _arc[i].create();
  }

  colorMode(RGB);                                        // set color mode to RGB values & increase theta
  _theta += .0523;
}

class Arcs {
  int index, totalArc;
  float step, size, theta;

  /* params
   * _totalArc number of arc lines to create
   * _step size figure takes up on screen
   */
  public Arcs(int _totalArc, float _step) {
    totalArc = _totalArc;
    step = _step;
  }
  public void create() {   
    strokeWeight(6);                                             // constant stroke width &
    noFill();                                                    // no fill on lines

    size = index *step+2;                                        // size of figure    
    float offSet = TWO_PI/totalArc* index *10;                   // step effect on spiral    
    float arcStart = map(cos(theta-offSet), -1, 1, PI, PI*2);    // where the arc starts
    float arcEnd = map(sin(theta-offSet), -.5, .5, PI, PI*2);    // where the arc ends
    arc(0, 0,size, size, arcStart, arcEnd+1.5);                     // curves to create spiral through arcs
  }
}