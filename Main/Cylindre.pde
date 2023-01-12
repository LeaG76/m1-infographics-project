/*********************************************************
 * Fichier de la classe Cylindre, elle va nous permettre *
 * de créer des cylindres afin de créer des objets dans  *
 * les autres fichiers classes objets du programmme      *
 *********************************************************/

class Cylindre {
  // Variable entière pour le nombre de coté
  int nbCote;
  // Variables réelles pour le rayon et la hauteur du cylindre
  float r, h;

  /* Constructeur avec le nombre de coté, le rayon et la hauteur du cylindre */

  Cylindre(int nbCote, float r, float h) {
    this.nbCote = nbCote;
    this.r = r;
    this.h = h;
  }

  /* Fonction qui va nous retourner le dessin du cylindre
    défini précédemment avec le constructeur */

  PShape drawCylindre(color couleur) {
    // Dessin du cylindre
    PShape cylindre = createShape(GROUP);
    
    // Variables pour l'angle d'inclinaison et la mi-hauteur
    float angle = 360 / nbCote;
    float h2 = h / 2;
    
    // Dessin du haut du cylindre (cercle)
    PShape cylindreTop = createShape();
    cylindreTop.beginShape();
    cylindreTop.fill(couleur);
    cylindreTop.stroke(couleur);
    for (int i = 0; i < nbCote; i++) {
      float x = cos(radians(i*angle))*r;
      float y = sin(radians(i*angle))*r;
      cylindreTop.vertex(x, y, -h2);
    }
    cylindreTop.endShape(CLOSE);
    
    // Dessin du bas du cylindre (cercle)
    PShape cylindreBottom = createShape();
    cylindreBottom.beginShape();
    cylindreBottom.fill(couleur);
    cylindreBottom.stroke(couleur);
    for (int i = 0; i < nbCote; i++) {
      float x = cos(radians(i*angle))*r;
      float y = sin(radians(i*angle))*r;
      cylindreBottom.vertex(x, y, h2);
    }
    cylindreBottom.endShape(CLOSE);
    
    // Dessin du corps du cylindre (assemblage de triangles)
    PShape cylindreBody = createShape();
    cylindreBody.beginShape(TRIANGLE_STRIP);
    cylindreBody.fill(couleur);
    cylindreBody.stroke(couleur);
    for (int i = 0; i < nbCote + 1; i++) {
      float x = cos(radians(i*angle))*r;
      float y = sin(radians(i*angle))*r;
      cylindreBody.vertex(x, y, h2);
      cylindreBody.vertex(x, y, -h2);
    }
    cylindreBody.endShape(CLOSE);
    
    cylindre.addChild(cylindreTop);
    cylindre.addChild(cylindreBottom);
    cylindre.addChild(cylindreBody);
    
    return cylindre;
  }
  
  /* Fonction qui va nous retourner le dessin du cylindre
    (mais sans le haut du cylindre) défini précédemment
    avec le constructeur */

  PShape drawCylindreWithoutTop(color couleur1, color couleur2) {
    // Dessin du cylindre
    PShape cylindre = createShape(GROUP);
    
    // Variables pour l'angle d'inclinaison et la mi-hauteur
    float angle = 360 / nbCote;
    float h2 = h / 2;
    
    // Dessin du bas du cylindre (cercle)
    PShape cylindreBottom = createShape();
    cylindreBottom.beginShape();
    cylindreBottom.fill(couleur1);
    cylindreBottom.stroke(couleur1);
    for (int i = 0; i < nbCote; i++) {
      float x = cos(radians(i*angle))*r;
      float y = sin(radians(i*angle))*r;
      cylindreBottom.vertex(x, y, h2);
    }
    cylindreBottom.endShape(CLOSE);
    
    // Dessin du corps du cylindre (assemblage de triangles)
    PShape cylindreBody = createShape();
    cylindreBody.beginShape(TRIANGLE_STRIP);
    cylindreBody.fill(couleur2);
    cylindreBody.stroke(couleur2);
    for (int i = 0; i < nbCote + 1; i++) {
      float x = cos(radians(i*angle))*r;
      float y = sin(radians(i*angle))*r;
      cylindreBody.vertex(x, y, h2);
      cylindreBody.vertex(x, y, -h2);
    }
    cylindreBody.endShape(CLOSE);
    
    cylindre.addChild(cylindreBottom);
    cylindre.addChild(cylindreBody);
    
    return cylindre;
  }
}
