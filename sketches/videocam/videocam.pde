/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-27
 * Sketch #9 videocam.pde
 *****************************************************/

import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);
  initializeCameras();
}

void initializeCameras() {
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:" + cameras.length);
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);

      //cam = new Capture(this, cameras[i]);
      //cam.start();
      //if(cam.available() == true){
      //  break;
      //}
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
    image(cam, 0, 0);

    // The following does the same, and is faster when just drawing the image
    // without any additional resizing, transformations, or tint.
    //set(0, 0, cam);
  }
}