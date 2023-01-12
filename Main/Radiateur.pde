/************************************************************
 * Fichier de la classe Radiateur, elle va nous permettre   *
 * de créer les radiateurs qui se trouvent sur les murs des *
 * fenêtres de la salle A106. Un radiateur est un simple    *
 * bloc avec juste la texture d'un radiateur sur le devant. *
 ***********************************************************/

class Radiateur {
  // Dessin pour les radiateurs
  PShape lesRadiateurs;
  // Variables des 2 couleurs que l'on va utiliser pour un radiateur
  color couleurBlanc, couleurGris;
  
  /* Constructeur sans argument */

  Radiateur() {
    // Les radiateurs sont un groupe de dessin
    lesRadiateurs = createShape(GROUP);
    // Initialisation des couleurs
    couleurBlanc = color(#e3e3e3);
    couleurGris = color(#bebebe);
  }

  /* Fonction qui va nous retourner le dessin des radiateurs
    en utilisant la fonction creerRadiateur */
  
  PShape creerLesRadiateurs() {
    PShape radiateur1 = creerRadiateur(radiateurL, radiateurH, radiateurP, couleurBlanc, couleurGris);
    radiateur1.translate(-salleP+radiateurL+33,-20,-salleL+radiateurP+4);
    radiateur1.rotateY(PI/2);
    
    PShape radiateur2 = creerRadiateur(radiateurL+40, radiateurH, radiateurP, couleurBlanc, couleurGris);
    radiateur2.translate(-salleP+radiateurL+2*fenetre1L+radiateurL/2+20,-20,-salleL+radiateurP+4);
    radiateur2.rotateY(PI/2);
    
    lesRadiateurs.addChild(radiateur1);
    lesRadiateurs.addChild(radiateur2);
    
    return lesRadiateurs; 
  }

  /* Fonction qui va nous retourner le dessin d'un radiateur */
  
  PShape creerRadiateur(float largeur, float hauteur, float profondeur, color couleur1, color couleur2) {
    PShape radiateur = createShape(GROUP);
    
    PShape radiateurFront = createShape();
    radiateurFront.beginShape(QUADS);
    radiateurFront.textureMode(NORMAL);
    radiateurFront.texture(texRadiateur);
    radiateurFront.shininess(200.0);
    radiateurFront.emissive(0, 0, 0);
    radiateurFront.normal(0, 0, 1);
    radiateurFront.stroke(couleur2);
    radiateurFront.vertex(0, salleH, 0, 1, 1);
    radiateurFront.vertex(0, salleH-hauteur, 0, 1, 0);
    radiateurFront.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    radiateurFront.vertex(-largeur, salleH, 0, 0, 1);
    radiateurFront.endShape(CLOSE);
    
    PShape radiateurBack = createShape();
    radiateurBack.beginShape(QUADS);
    radiateurBack.fill(couleur1);
    radiateurBack.stroke(couleur2);
    radiateurBack.vertex(0, salleH, -profondeur);
    radiateurBack.vertex(0, salleH-hauteur, -profondeur);
    radiateurBack.vertex(-largeur, salleH-hauteur, -profondeur);
    radiateurBack.vertex(-largeur, salleH, -profondeur);
    radiateurBack.endShape(CLOSE);

    PShape radiateurTop = createShape();
    radiateurTop.beginShape(QUADS);
    radiateurTop.fill(couleur1);
    radiateurTop.stroke(couleur2);
    radiateurTop.vertex(0, salleH-hauteur, -profondeur);
    radiateurTop.vertex(0, salleH-hauteur, 0);
    radiateurTop.vertex(-largeur, salleH-hauteur, 0);
    radiateurTop.vertex(-largeur, salleH-hauteur, -profondeur);
    radiateurTop.endShape(CLOSE);

    PShape radiateurBottom = createShape();
    radiateurBottom.beginShape(QUADS);
    radiateurBottom.fill(couleur1);
    radiateurBottom.stroke(couleur2);
    radiateurBottom.vertex(0, salleH, -profondeur);
    radiateurBottom.vertex(0, salleH, 0);
    radiateurBottom.vertex(-largeur, salleH, 0);
    radiateurBottom.vertex(-largeur, salleH, -profondeur);
    radiateurBottom.endShape(CLOSE);

    PShape radiateurLeft = createShape();
    radiateurLeft.beginShape(QUADS);
    radiateurLeft.fill(couleur1);
    radiateurLeft.stroke(couleur2);
    radiateurLeft.vertex(-largeur, salleH, 0);
    radiateurLeft.vertex(-largeur, salleH-hauteur, 0);
    radiateurLeft.vertex(-largeur, salleH-hauteur, -profondeur);
    radiateurLeft.vertex(-largeur, salleH, -profondeur);
    radiateurLeft.endShape(CLOSE);

    PShape radiateurRight = createShape();
    radiateurRight.beginShape(QUADS);
    radiateurRight.fill(couleur1);
    radiateurRight.stroke(couleur2);
    radiateurRight.vertex(0, salleH, 0);
    radiateurRight.vertex(0, salleH-hauteur, 0);
    radiateurRight.vertex(0, salleH-hauteur, -profondeur);
    radiateurRight.vertex(0, salleH, -profondeur);
    radiateurRight.endShape(CLOSE);
    
    radiateur.addChild(radiateurFront);
    radiateur.addChild(radiateurBack);
    radiateur.addChild(radiateurTop);
    radiateur.addChild(radiateurBottom);
    radiateur.addChild(radiateurLeft);
    radiateur.addChild(radiateurRight);
    
    return radiateur;
  }
}
