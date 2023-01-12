/***************************************************************
 * Fichier de la classe Souris, elle va nous permettre de      *
 * créer une souris. Une souris est un simple bloc avec juste  *
 * la texture d'une souris sur le dessus. On va utiliser cette *
 * classe dans la classe BlocPC pour la création d'un bloc de  *
 * Pc, c'est-à-dire écran, tour, clavier et souris.            *
 ***************************************************************/

class Souris {
  // Dessin pour la souris
  PShape souris;
  // Variables des 2 couleurs que l'on va utiliser pour une souris
  color couleurGris, couleurGrisF;

  /* Constructeur sans argument */

  Souris() {
    // Une souris est un groupe de dessin
    souris = createShape(GROUP);
    // Initialisation des couleurs
    couleurGris = color(#2e2e2e);
    couleurGrisF = color(#252525);
  }
  
  /* Fonction qui va nous retourner le dessin d'une souris */

  PShape creerSouris() {
    
    PShape sourisFront = createShape();
    sourisFront.beginShape(QUADS);
    sourisFront.fill(couleurGris);
    sourisFront.stroke(couleurGrisF);
    sourisFront.vertex(0, salleH, 0);
    sourisFront.vertex(0, salleH-sourisH, 0);
    sourisFront.vertex(-sourisL, salleH-sourisH, 0);
    sourisFront.vertex(-sourisL, salleH, 0);
    sourisFront.endShape(CLOSE);
    
    PShape sourisBack = createShape();
    sourisBack.beginShape(QUADS);
    sourisBack.fill(couleurGris);
    sourisBack.stroke(couleurGrisF);
    sourisBack.vertex(0, salleH, -sourisP);
    sourisBack.vertex(0, salleH-sourisH, -sourisP);
    sourisBack.vertex(-sourisL, salleH-sourisH, -sourisP);
    sourisBack.vertex(-sourisL, salleH, -sourisP);
    sourisBack.endShape(CLOSE);

    PShape sourisTop = createShape();
    sourisTop.beginShape(QUADS);
    sourisTop.textureMode(NORMAL);
    sourisTop.texture(texSouris);
    sourisTop.shininess(200.0);
    sourisTop.emissive(0, 0, 0);
    sourisTop.normal(0, 0, 1);
    sourisTop.stroke(couleurGrisF);
    sourisTop.vertex(0, salleH-sourisH, 0, 1, 1);
    sourisTop.vertex(0, salleH-sourisH, -sourisP, 1, 0);
    sourisTop.vertex(-sourisL, salleH-sourisH, -sourisP, 0, 0);
    sourisTop.vertex(-sourisL, salleH-sourisH, 0, 0, 1);
    sourisTop.endShape(CLOSE);
    
    PShape sourisBottom = createShape();
    sourisBottom.beginShape(QUADS);
    sourisBottom.fill(couleurGris);
    sourisBottom.stroke(couleurGrisF);
    sourisBottom.vertex(0, salleH, 0);
    sourisBottom.vertex(0, salleH, -sourisP);
    sourisBottom.vertex(-sourisL, salleH, -sourisP);
    sourisBottom.vertex(-sourisL, salleH, 0);
    sourisBottom.endShape(CLOSE);
    
    PShape sourisLeft = createShape();
    sourisLeft.beginShape(QUADS);
    sourisLeft.fill(couleurGris);
    sourisLeft.stroke(couleurGrisF);
    sourisLeft.vertex(-sourisL, salleH, 0);
    sourisLeft.vertex(-sourisL, salleH-sourisH, 0);
    sourisLeft.vertex(-sourisL, salleH-sourisH, -sourisP);
    sourisLeft.vertex(-sourisL, salleH, -sourisP);
    sourisLeft.endShape(CLOSE);

    PShape sourisRight = createShape();
    sourisRight.beginShape(QUADS);
    sourisRight.fill(couleurGris);
    sourisRight.stroke(couleurGrisF);
    sourisRight.vertex(0, salleH, 0);
    sourisRight.vertex(0, salleH-sourisH, 0);
    sourisRight.vertex(0, salleH-sourisH, -sourisP);
    sourisRight.vertex(0, salleH, -sourisP);
    sourisRight.endShape(CLOSE);
    
    souris.addChild(sourisFront);
    souris.addChild(sourisBack);
    souris.addChild(sourisTop);
    souris.addChild(sourisBottom);
    souris.addChild(sourisLeft);
    souris.addChild(sourisRight);
    
    return souris;
  }
  
}
