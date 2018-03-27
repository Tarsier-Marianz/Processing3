/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-27
 * Sketch #8 histogram_camera.pde
 *****************************************************/

import processing.video.*;

Capture video;

void setup() {
  size(640, 480);

  video = new Capture(this, width, height);           // Uses the default video input, see the reference if this causes an error
  video.start();  
  noStroke();
  smooth();
}

void draw() {
  if (video.available()) {
    video.read();
    image(video, 0, 0, width, height);                // Draw the webcam video onto the screen
    histogram(video);
  }
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

  int histMax = max(hist);                            // Find the largest value in the histogram  
  stroke(255, 0, 0);

  for (int i = 0; i < img.width; i += 2) {            // Draw half of the histogram (skip every second value)    
    int which = int(map(i, 0, img.width, 0, 255));    // Map i (from 0..img.width) to a location in the histogram (0..255)    
    int y = int(map(hist[which], 0, histMax, img.height, 0)); // Convert the histogram value to a location between  the bottom and the top of the picture
    line(i, img.height, i, y);
  }
}