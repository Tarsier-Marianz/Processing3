/* 
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #1
 */
 
Matrix a, b, c, d, e;
int w_height = 768;
int w_width= 1366;
void setup()
{
  fullScreen();
  smooth();
}

void draw()
{
  fill(0, 15);
  rect(0, 0, w_width, w_height);

  a = new Matrix();
  a.x = mouseX;
  a.y = random(0, w_height);
  a.o = random(50, 100);

  b = new Matrix();
  b.x = mouseX+75;
  b.y = random(0, w_height);
  b.o = random(50, 100);
  b.r = random(1, 10); //1;
  b.g = 131;
  b.b = 37;

  c = new Matrix();
  c.x = mouseX;
  c.y = random(0, w_height);
  c.o = random(50, 100);
  c.r = 1;
  c.g = 131;
  c.b = 37;

  d = new Matrix();
  d.x = mouseX;
  d.y = random(0, w_height);
  d.o = random(50, 100); 
  d.r = int(random(1, 10));
  d.g = int(random(120, 135));
  d.b = int(random(30, 40));

  a.create();
  b.create();
  c.create();
  d.create();
}

class Matrix
{
  float x, y, r, g, b, o, text1;

  void create()
  {
    for (int i = 0; i < 16; i++) {
      r = int(random(1, 10));
      g = int(random(120, 135));
      b = int(random(30, 40));
      fill(r, g, b, o);
      int x_pos = int(random(-420, 420));
      char c = (char) int(random(33, 127));
      text(c, x-x_pos, y);
    }
  }
}