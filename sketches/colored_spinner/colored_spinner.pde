/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #5
 *****************************************************/

ArrayList<Arc> _arc = new ArrayList<Arc>();
int reflectIndex = 0, totalArcs = 5;
float []reflectX = new float[totalArcs];
float []reflectY = new float[totalArcs];
boolean toggleFlag = false;
void setup() {
  size(480, 480, P2D);
  //background(255f);
  smooth();
  initReflects();
  initArcLines();
}

void initReflects() {
  for (int i=0; i < totalArcs; i++) {
    reflectX[i] = i * 100F;
    reflectY[i] = i * 100F;
  }
}

void initArcLines() {
  for (int i=0; i < totalArcs; i++) {
    int sectionNum = int(random(2, 40));
    float huePrm = int(random(-100f, 100f));
    _arc.add(new Arc(0f, 0f, i* 50f, sectionNum, huePrm, !toggleFlag));
  }
}

void draw() {
  translate(width / 2, height / 2);
  colorMode(HSB, 100f);
  background(0f, 0f, 100f);

  float tmpAngle = radians(frameCount);
  int r = 0;
  for (Arc arc : _arc) {
    //arc.reflect(reflectX[2] * cos(tmpAngle), reflectX[2] * sin(tmpAngle));
    arc.reflect(reflectX[r] * cos(tmpAngle), reflectX[r] * sin(tmpAngle));
    arc.update();
    arc.draw();
    r++;
  }
}