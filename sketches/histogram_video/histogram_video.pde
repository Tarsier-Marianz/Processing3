/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #3
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
  if (movie.available() == true) {
    movie.read();
  }
  image(movie, 0, 0, width, height);
}