/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #3 histogram_video.pde
 *****************************************************/


import processing.video.*;

Movie movie;

void setup() {
  size(640, 360);
  background(0);
  // Load and play the video in a loop
  movie = new Movie(this, "movie.mp4");
  movie.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  /*
  if (movie.available() == true) {
    movie.read();
  }
  */
  image(movie, 0, 0, width, height);
  histogram(movie);
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