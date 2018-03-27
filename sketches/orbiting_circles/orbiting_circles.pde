/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-27
 * Sketch #5
 *****************************************************/

int _circleCount = 10;
float _circleRadius = 250;

void setup() {
  size(600, 600);
  rectMode(CENTER);  
  ellipseMode(RADIUS);
  noFill();
  stroke(255);
  strokeWeight(4);
  smooth();
}

void draw() {
  background(0);
  float speed = frameCount * 0.01f;

  ellipse(width/2, height/2, _circleRadius, _circleRadius);  
  translate(width/2, height/2);
  
  for (int i=0; i < _circleCount; i++) {
    float angle = speed + i * 0.1f;
    float x = cos(angle) * _circleRadius;
    float y = sin(angle) * _circleRadius;
    fill(i * 40f, 255f, 0f);
    ellipse(x, y, 10, 10);
  }
  noFill();
}