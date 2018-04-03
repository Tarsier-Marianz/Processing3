/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-04-13
 * Sketch #12 rotating_circles.pde
 *****************************************************/

int _circleCount = 20;
float[]_angleX=new float[_circleCount];
float[]_angleY=new float[_circleCount];

void setup() {
  size(600, 400, P3D);
  for (int i=0; i < _circleCount; i++) {
    _angleX[i]=random(360);
    _angleY[i]=random(360);
  }
  smooth();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (int i=0; i < _circleCount; i++) {
    _angleX[i]+=1;
    _angleY[i]+=1;
    noFill();
    stroke(0, 100);
    strokeWeight(2);
    rotateX(radians(_angleX[i]));
    rotateY(radians(_angleY[i]));
    ellipse(0, 0, 250, 250);
  }
}