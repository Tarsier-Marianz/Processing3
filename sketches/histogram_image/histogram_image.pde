/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #4
 *****************************************************/


import processing.video.*;

PImage pImg;

void setup() {
  size(854, 480);
  background(0);
  // Load image
  pImg = loadImage("assasin.jpg");
}
void draw() {
  image(pImg, 0, 0);
  histogram(pImg);
}


void histogram(PImage img) {
  int[] hist = new int[256];

  // Calculate the histogram
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      int bright = int(brightness(get(i, j)));
      hist[bright]++;
    }
  }

  // Find the largest value in the histogram
  int histMax = max(hist);
  stroke(255, 0, 0);
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < img.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, img.width, 0, 255));
    // Convert the histogram value to a location between 
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, img.height, 0));
    line(i, img.height, i, y);
  }
}