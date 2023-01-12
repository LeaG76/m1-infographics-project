/***************************************************************
 * Fichier de la classe Clavier, elle va nous permettre de     *
 * créer un clavier. Un clavier est un simple bloc avec juste  *
 * la texture d'un clavier sur le dessus. On va utiliser cette *
 * classe dans la classe BlocPC pour la création d'un bloc de  *
 * Pc, c'est-à-dire écran, tour, clavier et souris.            *
 ***************************************************************/

class Clavier {
  // Dessin pour le clavier
  PShape clavier;
  // Variables des 2 couleurs que l'on va utiliser pour un clavier
  color couleurGris, couleurGrisF;

  /* Constructeur sans argument */

  Clavier() {
    // Un clavier est un groupe de dessin
    clavier = createShape(GROUP);
    // Initialisation des couleurs
    couleurGris = color(#3E3936);
    couleurGrisF = color(#252024);
  }

  /* Fonction qui va nous retourner le dessin d'un clavier */

  PShape creerClavier() {

    PShape clavierFront = createShape();
    clavierFront.beginShape(QUADS);
    clavierFront.fill(couleurGris);
    clavierFront.stroke(couleurGrisF);
    clavierFront.vertex(0, salleH, 0);
    clavierFront.vertex(0, salleH-clavierH, 0);
    clavierFront.vertex(-clavierL, salleH-clavierH, 0);
    clavierFront.vertex(-clavierL, salleH, 0);
    clavierFront.endShape(CLOSE);

    PShape clavierBack = createShape();
    clavierBack.beginShape(QUADS);
    clavierBack.fill(couleurGris);
    clavierBack.stroke(couleurGrisF);
    clavierBack.vertex(0, salleH, -clavierP);
    clavierBack.vertex(0, salleH-clavierH, -clavierP);
    clavierBack.vertex(-clavierL, salleH-clavierH, -clavierP);
    clavierBack.vertex(-clavierL, salleH, -clavierP);
    clavierBack.endShape(CLOSE);

    PShape clavierTop = createShape();
    clavierTop.beginShape(QUADS);
    clavierTop.textureMode(NORMAL);
    clavierTop.texture(texClavier);
    clavierTop.shininess(200.0);
    clavierTop.emissive(0, 0, 0);
    clavierTop.normal(0, 0, 1);
    clavierTop.stroke(couleurGrisF);
    clavierTop.vertex(0, salleH-clavierH, 0, 1, 1);
    clavierTop.vertex(0, salleH-clavierH, -clavierP, 1, 0);
    clavierTop.vertex(-clavierL, salleH-clavierH, -clavierP, 0, 0);
    clavierTop.vertex(-clavierL, salleH-clavierH, 0, 0, 1);
    clavierTop.endShape(CLOSE);

    PShape clavierBottom = createShape();
    clavierBottom.beginShape(QUADS);
    clavierBottom.fill(couleurGris);
    clavierBottom.stroke(couleurGrisF);
    clavierBottom.vertex(0, salleH, 0);
    clavierBottom.vertex(0, salleH, -clavierP);
    clavierBottom.vertex(-clavierL, salleH, -clavierP);
    clavierBottom.vertex(-clavierL, salleH, 0);
    clavierBottom.endShape(CLOSE);

    PShape clavierLeft = createShape();
    clavierLeft.beginShape(QUADS);
    clavierLeft.fill(couleurGris);
    clavierLeft.stroke(couleurGrisF);
    clavierLeft.vertex(-clavierL, salleH, 0);
    clavierLeft.vertex(-clavierL, salleH-clavierH, 0);
    clavierLeft.vertex(-clavierL, salleH-clavierH, -clavierP);
    clavierLeft.vertex(-clavierL, salleH, -clavierP);
    clavierLeft.endShape(CLOSE);

    PShape clavierRight = createShape();
    clavierRight.beginShape(QUADS);
    clavierRight.fill(couleurGris);
    clavierRight.stroke(couleurGrisF);
    clavierRight.vertex(0, salleH, 0);
    clavierRight.vertex(0, salleH-clavierH, 0);
    clavierRight.vertex(0, salleH-clavierH, -clavierP);
    clavierRight.vertex(0, salleH, -clavierP);
    clavierRight.endShape(CLOSE);

    clavier.addChild(clavierFront);
    clavier.addChild(clavierBack);
    clavier.addChild(clavierTop);
    clavier.addChild(clavierBottom);
    clavier.addChild(clavierLeft);
    clavier.addChild(clavierRight);

    return clavier;
  }
}
