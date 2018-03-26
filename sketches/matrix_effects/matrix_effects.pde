/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #1
 *****************************************************/


Matrix []_matrix = null;
String[] _fontList = null;
PFont _font = null;

int w_height = 768;
int w_width= 1366;
int _matrix_count = 5;

void setup() {
  fullScreen();
  smooth();
  _matrix = new Matrix[_matrix_count];
  _fontList = PFont.list();
}

void draw() {
  fill(0, 15);
  rect(0, 0, w_width, w_height);

  for (int m= 0; m <_matrix_count; m++) {
    _font = createFont(_fontList[m], random(6, 24));
    _matrix[m] = new Matrix();
    _matrix[m].x = mouseX;
    _matrix[m].y = random(0, w_height);
    _matrix[m].o = random(50, 100);
    _matrix[m].r = random(1, 10);
    _matrix[m].g = random(131, 140);
    _matrix[m].b = random(37, 47);
    _matrix[m].font = _font;
    _matrix[m].create();
  }
}

class Matrix {
  PFont font;
  float x, y, r, g, b, o;

  void create() {
    fill(r, g, b, o);
    textFont(font);
    for (int i = 0; i < 16; i++) {
      int x_pos = int(random(-420, 420));
      char c = (char) int(random(33, 127));
      text(c, x-x_pos, y);
    }
  }
}