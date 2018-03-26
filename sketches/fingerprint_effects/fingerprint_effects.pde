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
  //fullScreen();                                        // uncomment to set fullscreen for the effects
  size(600, 600);
  _arc = new Arcs[_totalArcs];                           // initialize arcs array to be created with total number of arc
}

void draw() {
  background(0);                                         // set background with black color
  frameRate(30);                                         // speed of effects  
  translate(width/2, height/2);                          //center design


  for (int i=0; i< _totalArcs; i++) {                    // loop to create multiple arclines 
    if (i > 15) {                                        // limit figure to circle and stop filling with stroke
      noStroke();
    } else if (i < 1) {                                  // no stroke for the first arc 
      noStroke();
    } else {                                             // stroke color depends on mouse movement      
      stroke(mouseX/2.9, mouseY/2.9, i+255);             // stroke is set by mouse movement set to scale with fullscreen size
    }
    _arc[i] = new Arcs(_totalArcs, _step);               // initialize new Arc & set all required property
    _arc[i].index = i;
    _arc[i].theta = _theta;
    _arc[i].create();                                    // call create Arc to draw on screen
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
    strokeWeight(8);                                             // constant stroke width &
    noFill();                                                    // no fill on lines

    size = index *step+2;                                        // size of figure    
    float offSet = TWO_PI/totalArc* index *10;                   // step effect on spiral 
    float arcStart = map(cos(theta-offSet), -1, 1, PI, PI*2);    // where the arc starts   
    float arcEnd = map(sin(theta-offSet), -.5, .5, PI, PI*2);    // where the arc ends
    arc(0, 0, size, size, arcStart, arcEnd+1.5);                  // curves to create spiral through arcs
  }
}