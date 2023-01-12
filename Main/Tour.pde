/***************************************************************
 * Fichier de la classe Tour, elle va nous permettre de créer  *
 * une tour. Une tour est un simple bloc avec juste la texture *
 * d'une tour sur le devant. On va utiliser cette classe dans  *
 * la classe BlocPC pour la création d'un bloc de Pc,          *
 * c'est-à-dire écran, tour, clavier et souris.                *
 ***************************************************************/

class Tour {
  // Dessin pour la tour
  PShape tour;
  // Variables des 2 couleurs que l'on va utiliser pour une tour
  color couleurGris, couleurGrisF;
  
  /* Constructeur sans argument */

  Tour() {
    // Une tour est un groupe de dessin
    tour = createShape(GROUP);
    // Initialisation des couleurs
    couleurGris = color(#3E3936);
    couleurGrisF = color(#252024);
  }

  /* Fonction qui va nous retourner le dessin d'une tour */
  
  PShape creerTour() {
    PShape tourFront = createShape();
    tourFront.beginShape(QUADS);
    tourFront.textureMode(NORMAL);
    tourFront.texture(texTour);
    tourFront.shininess(200.0);
    tourFront.emissive(0, 0, 0);
    tourFront.normal(0, 0, 1);
    tourFront.stroke(couleurGrisF);
    tourFront.vertex(0, salleH, 0, 1, 1);
    tourFront.vertex(0, salleH-tourH, 0, 1, 0);
    tourFront.vertex(-tourL, salleH-tourH, 0, 0, 0);
    tourFront.vertex(-tourL, salleH, 0, 0, 1);
    tourFront.endShape(CLOSE);
    
    PShape tourBack = createShape();
    tourBack.beginShape(QUADS);
    tourBack.fill(couleurGris);
    tourBack.stroke(couleurGrisF);
    tourBack.vertex(0, salleH, -tourP);
    tourBack.vertex(0, salleH-tourH, -tourP);
    tourBack.vertex(-tourL, salleH-tourH, -tourP);
    tourBack.vertex(-tourL, salleH, -tourP);
    tourBack.endShape(CLOSE);
    
    PShape tourTop = createShape();
    tourTop.beginShape(QUADS);
    tourTop.fill(couleurGris);
    tourTop.stroke(couleurGrisF);
    tourTop.vertex(0, salleH-tourH, -tourP);
    tourTop.vertex(0, salleH-tourH, 0);
    tourTop.vertex(-tourL, salleH-tourH, 0);
    tourTop.vertex(-tourL, salleH-tourH, -tourP);
    tourTop.endShape(CLOSE);
    
    PShape tourBottom = createShape();
    tourBottom.beginShape(QUADS);
    tourBottom.fill(couleurGris);
    tourBottom.stroke(couleurGrisF);
    tourBottom.vertex(0, salleH, -tourP);
    tourBottom.vertex(0, salleH, 0);
    tourBottom.vertex(-tourL, salleH, 0);
    tourBottom.vertex(-tourL, salleH, -tourP);
    tourBottom.endShape(CLOSE);
    
    PShape tourLeft = createShape();
    tourLeft.beginShape(QUADS);
    tourLeft.fill(couleurGris);
    tourLeft.stroke(couleurGrisF);
    tourLeft.vertex(-tourL, salleH, 0);
    tourLeft.vertex(-tourL, salleH-tourH, 0);
    tourLeft.vertex(-tourL, salleH-tourH, -tourP);
    tourLeft.vertex(-tourL, salleH, -tourP);
    tourLeft.endShape(CLOSE);
    
    PShape tourRight = createShape();
    tourRight.beginShape(QUADS);
    tourRight.fill(couleurGris);
    tourRight.stroke(couleurGrisF);
    tourRight.vertex(0, salleH, 0);
    tourRight.vertex(0, salleH-tourH, 0);
    tourRight.vertex(0, salleH-tourH, -tourP);
    tourRight.vertex(0, salleH, -tourP);
    tourRight.endShape(CLOSE);

    tour.addChild(tourFront);
    tour.addChild(tourBack);
    tour.addChild(tourTop);
    tour.addChild(tourBottom);
    tour.addChild(tourLeft);
    tour.addChild(tourRight);
    
    return tour;
  }
}
