
class Clock {
  int[] mins, hrs, secs;
  int m, h, s;
  boolean rotaterand = false;
  float minoff, hroff, secoff;
  float mult = 5;
  float min, hr, sec;

  Clock() {
    m = minute();
    h = hour();
    s = second();

    min = minute();
    hr = hour();
    sec = second();

    mins = new int[60];
    hrs = new int[24];
    secs = new int[60];

    minoff = random(1000);
    hroff = random(1000);
    secoff = random(1000);

    for (int i = 0; i < 60; i++) {
      mins[i] = i;
      secs[i] = i;
    }
    for (int i = 0; i < 24; i++) {
      hrs[i] = i;
    }
  }

  void display() {
    m = minute();
    h = hour();
    s = second();

    if (min > m) min -= abs(min-m)/10;
    else min += abs(min-m)/10;
    if (sec > s) sec -= abs(sec-s)/5;
    else sec += abs(sec-s)/5;
    if (hr > h) hr -= abs(hr-h)/15;
    else hr += abs(hr-h)/15;

    pushMatrix();
    if (rotaterand) rotate(-radians(sec*(360/secs.length)+(noise(secoff)*mult))-radians(360/secs.length));
    else rotate(-radians(sec*(360/secs.length))-radians(360/secs.length));
    secoff += 0.02;
    for (int i = 0; i < secs.length; i++) {
      rotate(radians(360/secs.length));
      if (secs[i] == s) fill(255);
      else fill(255, 100);
      if (secs[i] < 10) text("0" + secs[i], 540, 0);
      else text(secs[i], 540, 0);
    }
    popMatrix();

    pushMatrix();
    if (rotaterand) rotate(-radians(min*(360/mins.length)+(noise(minoff)*mult))-radians(360/mins.length));
    else rotate(-radians(min*(360/mins.length))-radians(360/mins.length));
    minoff += 0.02;
    for (int i = 0; i < mins.length; i++) {
      rotate(radians(360/mins.length));
      if (mins[i] == m) fill(255);
      else fill(255, 100);
      if (mins[i] < 10) text("0" + mins[i], 470, 0);
      else text(mins[i], 470, 0);
    }
    popMatrix();

    pushMatrix();
    if (rotaterand) rotate(-radians(hr*(360/hrs.length)+(noise(hroff)*mult))-radians(360/hrs.length));
    else rotate(-radians(hr*(360/hrs.length))-radians(360/hrs.length));
    hroff += 0.02;
    for (int i = 0; i < hrs.length; i++) {
      rotate(radians(360/hrs.length));
      if (hrs[i] == h) fill(255);
      else fill(255, 100);
      if (hrs[i] < 10) text("0" + hrs[i], 400, 0);
      else text(hrs[i], 400, 0);
    }
    popMatrix();
  }

  void update() {
    m = minute();
    h = hour();
    s = second();
  }
}