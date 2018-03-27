/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #5
 *****************************************************/

ArrayList<Arc> _arcs = new ArrayList<Arc>();
int reflectIndex = 0, totalArcs = 5, diameter= 30;
float []reflectX = new float[totalArcs];
float []reflectY = new float[totalArcs];
boolean toggleFlag = false;

void setup() {
  size(480, 480, P2D);
  smooth();
  initReflects();
  initArcLines();
}

void initReflects() {
  for (int i=0; i < totalArcs; i++) {
    reflectX[i] = i * 100F;
    reflectY[i] = i * 100f+50f;
  }
}

void initArcLines() {
  for (int i=0; i < totalArcs; i++) {
    int sectionNum = int(random(2, 50));
    float huePrm = int(random(-255f, 255f));
    _arcs.add(new Arc(0f, 0f, i* diameter, sectionNum, huePrm, !toggleFlag));
  }
}

void draw() {
  translate(width / 2, height / 2);
  colorMode(HSB, 100f);
  background(0f, 0f, 100f);

  float tmpAngle = radians(frameCount);
  int r = 0;
  for (Arc arc : _arcs) {
    arc.reflect(reflectX[r] * cos(tmpAngle), reflectX[r] * sin(tmpAngle));
    arc.update();
    arc.draw();
    r++;
  }
}