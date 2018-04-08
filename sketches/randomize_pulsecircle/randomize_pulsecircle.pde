/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-04-08
 * Sketch #14 rotating_circles.pde
 *****************************************************/

int centX=0;
int centY=0;
float x, y;


void setup() {
  size(500, 500);
  background(255);
  strokeWeight(1);
  smooth();
  stroke(20, 50, 70);
  frameRate(4);
  initCenter();
}

void initCenter() {
  centX=width/2;
  centY=height/2;
}

void draw() {
  background(255);
  float radius = 100;
  float lastx=-999;
  float lasty=-999;
  stroke(mouseX, mouseY, random(2*(frameCount%20)));
  ellipse(mouseX, mouseY, 20, 20);
  for (float ang = 0; ang <= 1440; ang+=2) {
    float thisRadius = radius + (random(100)+50);
    float rad=radians(ang);
    x=centX + (thisRadius*cos(rad));
    y=centY + (thisRadius*sin(rad));
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
  }
}