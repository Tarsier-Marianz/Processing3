/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #5
 *****************************************************/

ArrayList<Arc> _arc = new ArrayList<Arc>();
int reflectIndex = 0;
float []reflectX = new float[3];
float []reflectY = new float[3];
void setup() {
  size(480, 480, P2D);
  //background(255f);
  smooth();
  initReflect();
  _arc.add(new Arc(0f, 0f, 50f, 7, 40f, false));
  _arc.add(new Arc(0f, 0f, 70f, 7, -5f, true));
  _arc.add(new Arc(0f, 0f, 100f, 10, 65f, false));
  _arc.add(new Arc(0f, 0f, 140f, 12, -25f, true));
  _arc.add(new Arc(0f, 0f, 200f, 15, 40f, false));
}

void initReflect(){
  reflectX[0] = 10f;  // slow
  reflectX[1] = 100f; //normal default
  reflectX[2] = 500f; // fast
  reflectY[0] = 10f;  // slow
  reflectY[1] = 100f;  //normal default
  reflectY[2] = 1000f; // fast
}

void draw() {
  translate(width / 2, height / 2);
  colorMode(HSB, 100f);
  background(0f, 0f, 100f);
  
  float tmpAngle = radians(frameCount);
  
  for(Arc currentDonut : _arc) {
    currentDonut.reflect(reflectX[2] * cos(tmpAngle), reflectX[2] * sin(tmpAngle));
    currentDonut.update();
    currentDonut.draw();
  }
}