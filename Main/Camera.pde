/**********************************************************
 * Fichier de la classe Camera, elle va nous permettre de *
 * gérer la caméra, nous permettre de nous déplacer dans  *
 * l'espace avec les flèches du clavier mais également de *
 * bouger la position (la vue des yeux) de la caméra en   *
 * fonction des mouvements de la souris                   *
 **********************************************************/

class Camera {
  // Vecteurs pour la position de la vue de la caméra, la position des yeux et pour les déplacements
  PVector vue, position, deplacement;
  // Variables pour les mouvements de la caméra 
  float radius, theta, phi;

  /* Constructeur sans argument qui va nous permettre de construire une
    caméra par défaut avec la position de la vue de la caméra et la
    position des yeux */

  Camera() {
    vue = new PVector(camX, camY, camZ);
    position = new PVector(0, 1, 0);
    deplacement = new PVector();
    radius = 200;
    theta = 0;
    phi = 0;
    perspective(PI/2, (float) width / height, 0.1, 10000);
  }

  /* Fonction qui va nous permettre de mettre à jour la caméra
    (donc les coordonnées pour la position de la vue et des yeux) */
  
  void miseAJourCamera() {
    camera( 
      vue.x, vue.y, vue.z, 
      position.x, position.y, position.z, 
      0, 1, 0);
  }

  /* Fonction qui va nous permettre de bouger la caméra en fonction de la position de la souris.
    Pour cela, on va mettre à jour des coordonnées de la position des yeux en fonction de la
    position de la souris */
  
  void deplacementCamera() {
    position.set(radius * cos(phi) * cos(theta), -radius * sin(phi), radius * cos(phi) * sin(theta)).add(vue);
    theta = (float(mouseX)/width) * TWO_PI;
    phi = (float(mouseY)/width) * TWO_PI;
  }

  /* Fonction qui nous permettre de nous déplacer dans l'espace de la salle A106 (et son extérieur) via les touches
    (flèches ↑, ←, →, ↓) du clavier. Pour cela, on va vérifier si les touches sont pressées et plus particulièrement
    les flèches du clavier. Si c'est telle ou telle flèche on va se déplacer différemment dans l'espace. Les vecteurs
    sont mis à jour pour maintenir une distance correcte entre les objets observables et leur position */
    
  void deplacementEspace() {
    int distance = 0;
    // Si les touches sont pressées alors ...
    if (keyPressed) {
      if (key == CODED) {
        // Et si c'est la flèche du haut, on se déplace vers l'avant de la salle A106
        if (keyCode == UP) {
          deplacement = new PVector(position.x - vue.x, position.y - vue.y, position.z - vue.z).normalize();
          distance = 2;
        } else
        // Et si c'est la flèche de gauche, on se déplace vers la gauche de la salle A106
        if (keyCode == LEFT) {
          deplacement = new PVector(position.x - vue.x, position.y - vue.y, position.z - vue.z).normalize();
          PVector i = new PVector(0, 1, 0);
          deplacement.set(deplacement.copy().cross(i));
          distance = -2;
        } else
        // Et si c'est la flèche de droite, on se déplace vers la droite de la salle A106
        if (keyCode == RIGHT) {
          deplacement = new PVector(position.x - vue.x, position.y - vue.y, position.z - vue.z).normalize();
          PVector i = new PVector(0, 1, 0);
          deplacement.set(deplacement.copy().cross(i));
          distance = 2;
        } else
        // Et si c'est la flèche du bas, on se déplace vers l'arrière de la salle A106
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