/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-04-03
 * Sketch #11 clock_arc.pde
 *****************************************************/

Clock clock;
PFont font;
int mils, off, sec;
float angle;
float nextangle = 0;

void setup() {
  fullScreen();
  font = createFont("Consolas", 100);
  textFont(font, 50);
  textAlign(CENTER, CENTER);
  clock = new Clock();
  angle =  radians(random(-20, 20));
  smooth();
}


void draw() {
  color c = color(map(clock.sec, 0, 60, 0, 255), map(clock.min, 0, 60, 0, 255), map(clock.hr, 0, 60, 0, 255));
  background(c);
  pushMatrix();
  translate(50, 400);
  rotate(angle);
  if (angle > nextangle) {
    angle -= abs(angle-nextangle)/10;
  } else {
    angle += abs(angle-nextangle)/10;
  }
  clock.display();
  fill(255);
  String sc = hex(c).substring(2);
  text(sc, 680, 0);
  popMatrix();
}

void mousePressed() {
  float x = mouseX-50;
  float y = mouseY-400;
  nextangle = atan2(y, x);
}