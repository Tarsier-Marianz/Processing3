/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-04-04
 * Sketch #13 matrix_console.pde
 *****************************************************/

PFont _font;

boolean thistime = false;
float _matrixstep;
int _width, _height;
int[] _y;
int[] _l;

void setup() {
  fullScreen();
  //size(960, 600);
  _font = createFont("Courier New", 14);
  textFont(_font);
  smooth();
  
  initialize();
}

void draw() {
  background(0);

  float timeOne = millis();

  matrixStep(_width, _height, _y, _l);

  float m = ( millis() - timeOne);
  _matrixstep = random(10-m, m);
  text(_matrixstep, 10, 20);
  if (_matrixstep > 0) {
    delay((int)_matrixstep);
  }
}

void matrixStep(int w, int h, int[] y, int[] l) {
  int x;
  thistime = !thistime;
  for (x = 0; x < w; ++x) {
    if (x % 11 == 10) {
      if (!thistime) {
        continue;
      }
      fill(255); //white
    } else {
      fill(9, 107, 22); //.DarkGreen;  
      printChar( x, inBoxY(y[x] - 2 - (l[x] / 40 * 2), h), 10);

      fill(40, 191, 60); //Green;
    }
    printChar( x, y[x], 10);

    y[x] = inBoxY(y[x] + 1, h);
    text("", x, inBoxY(y[x] - l[x], h));
  }
}

void initialize() {
  int h1;
  int h2 = (h1 = (_height = height) / 2) / 2;
  _width = width - 1;
  _y = new int[_width];
  _l = new int[_width];
  int x;

  //clear();
  for (x = 0; x < _width; ++x) {
    _y[x] = (int)random(_height);
    _l[x] = (int)random(h2 * ((x % 11 != 10) ? 2 : 1), h1 * ((x % 11 != 10) ? 2 : 1));
  }
}

char randomChar() {
  int t = int(random(33, 127));
  if (t <= 2)
    return (char)random(10);
  else if (t <= 4)
    return (char)random(27);
  else if (t <= 6)
    return (char)random(27);
  else
    return (char)random(32, 255);
}

int inBoxY(int n, int _height) {
  n = n % _height;
  if (n < 0)
    return n + _height;
  else
    return n;
}

void printChar(int x, int y, int count) {
  if (count >0) {
    int y2= y;
    for (int i=0; i<count; i++) {
      char c = randomChar();
      text(c, x, y2);
      y2 *= 4;
    }
  } else { 
    char c = randomChar();
    text(c, x, y);
  }
}