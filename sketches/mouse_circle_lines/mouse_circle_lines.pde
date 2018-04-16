/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-04-16
 * Sketch #15 mouse_circle_lines.pde
 *****************************************************/
 
int  a;

void setup () {
  size(540, 540);
  background(#222222);
  stroke(#dddddd);
  noFill();
}

void draw() {
  a = mouseX+ mouseY;
  //a = int(map(mouseX, 0, width, 0, 100));
  stroke(255, map(a, 0, (width+height), 0, 255), 0);
  background(#222222);

  pushMatrix();
  translate(width/2, height/2);
  ellipse(0, 0, 100, 100);
  popMatrix();



  for (int i = 0; i < a; i++) {
    float angle;    
    if (a*i==0) {
      angle  =  radians(360.0);
    } else {
      angle  =  radians(360.0/a*i);
    }

    float x1 = width/2  + 50 * cos(angle); 
    float y1 = height/2 + 50 * sin(angle);

    float x2 = width/2  + 110 * cos(angle); 
    float y2 = height/2 + 110 * sin(angle);

    line(x1, y1, x2, y2);
  }
  println(a);
}