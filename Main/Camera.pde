/*
  ┌───────────────────────────────────────────────────────────────────────────────────────────┐
  │   Camera class file, it will allow us to manage the camera, allow us to move in space     │
  │ with the arrows of the keyboard but also to move the position (the sight of the eyes) of  │
  │ the camera according to the movements of the mouse                                        │
  └───────────────────────────────────────────────────────────────────────────────────────────┘
*/

class Camera {
  // Vectors for the position of the camera view, the position of the eyes and for the displacements
  PVector vue, position, deplacement;
  // Variables for camera movements
  float radius, theta, phi;

  /* Constructor without arguments that will allow us to build a default camera
    with the position of the camera view and the position of the eyes */

  Camera() {
    vue = new PVector(camX, camY, camZ);
    position = new PVector(0, 1, 0);
    deplacement = new PVector();
    radius = 200;
    theta = 0;
    phi = 0;
    perspective(PI/2, (float) width / height, 0.1, 10000);
  }

  /* Function that will allow us to update the camera (therefore the coordinates
    for the position of the view and the eyes) */
  
  void miseAJourCamera() {
    camera( 
      vue.x, vue.y, vue.z, 
      position.x, position.y, position.z, 
      0, 1, 0);
  }

  /* Function that will allow us to move the camera according to the position of
    the mouse. For this, we will update the coordinates of the position of the
    eyes according to the position of the mouse */
  
  void deplacementCamera() {
    position.set(radius * cos(phi) * cos(theta), -radius * sin(phi), radius * cos(phi) * sin(theta)).add(vue);
    theta = (float(mouseX)/width) * TWO_PI;
    phi = (float(mouseY)/width) * TWO_PI;
  }

  /* Function that allows us to move around in the space of room A106 (and its exterior)
    via the keys (arrows ↑, ←, →, ↓) on the keyboard. To do this, we will check if
    the keys are pressed and more specifically the keyboard arrows. If it is such and
    such an arrow, we will move differently in space. Vectors are updated to maintain
    correct distance between observable objects and their position */
    
  void deplacementEspace() {
    int distance = 0;
    // If the keys are pressed then...
    if (keyPressed) {
      if (key == CODED) {
        // And if it's the up arrow, we move to the front of room A106
        if (keyCode == UP) {
          deplacement = new PVector(position.x - vue.x, position.y - vue.y, position.z - vue.z).normalize();
          distance = 2;
        } else
        // And if it's the left arrow, we move to the left of room A106
        if (keyCode == LEFT) {
          deplacement = new PVector(position.x - vue.x, position.y - vue.y, position.z - vue.z).normalize();
          PVector i = new PVector(0, 1, 0);
          deplacement.set(deplacement.copy().cross(i));
          distance = -2;
        } else
        // And if it's the right arrow, we move to the right of room A106
        if (keyCode == RIGHT) {
          deplacement = new PVector(position.x - vue.x, position.y - vue.y, position.z - vue.z).normalize();
          PVector i = new PVector(0, 1, 0);
          deplacement.set(deplacement.copy().cross(i));
          distance = 2;
        } else
        // And if it's the down arrow, we move to the back of room A106
        if (keyCode == DOWN) {
          deplacement = new PVector(position.x - vue.x, position.y - vue.y, position.z - vue.z).normalize();
          distance = -2;
        }
        vue.add(deplacement.mult(distance));
        position.add(deplacement.mult(distance));
      }
    }
  }
}