/*****************************************************************
 * Fichier de la classe Fenetre, elle va nous permettre de créer *
 * les fenetres qui se trouvent sur le mur de gauche de la salle *
 * A106. Une fenêtre est une simple face avec juste la texture   *
 * d'une fenêtre.                                                *
 *****************************************************************/

class Fenetre {
  // Dessin pour les fenêtres
  PShape lesFenetres;
  // Variable de la couleur que l'on va utiliser pour une fenêtre
  color couleurGris;
  
  /* Constructeur sans argument */

  Fenetre() {
    // Les fenêtres sont un groupe de dessin
    lesFenetres = createShape(GROUP);
    // Initialisation de la couleur
    couleurGris = color(#040d11);
  }

  /* Fonction qui va nous retourner le dessin des fenêtres
    en utilisant la fonction creerFenetre */
  
  PShape creerLesFenetres() {
    PShape fenetre1 = creerFenetre(fenetre1L, fenetreH, fenetreP, texFenetre1, couleurGris);
    fenetre1.translate(-salleP+fenetre1L+12,-95,-salleL+fenetreP);
    fenetre1.rotateY(PI/2);
    
    PShape fenetre2 = creerFenetre(fenetre2L, fenetreH, fenetreP, texFenetre2, couleurGris);
    fenetre2.translate(-salleP+fenetre1L+fenetre2L+79,-95,-salleL+fenetreP);
    fenetre2.rotateY(PI/2);
    
    lesFenetres.addChild(fenetre1);
    lesFenetres.addChild(fenetre2);
    
    return lesFenetres;
  }

  /* Fonction qui va nous retourner le dessin d'une fenêtre */
  
  PShape creerFenetre(float largeur, float hauteur, float profondeur, PImage texture, color couleur) {
    PShape fenetre = createShape(GROUP);
    
    PShape fenetreFront = createShape();
    fenetreFront.beginShape(QUADS);
    fenetreFront.textureMode(NORMAL);
    fenetreFront.texture(texture);
    fenetreFront.shininess(200.0);
    fenetreFront.emissive(0, 0, 0);
    fenetreFront.normal(0, 0, 1);
    fenetreFront.stroke(couleur);
    fenetreFront.vertex(0, salleH, 0, 1, 1);
    fenetreFront.vertex(0, salleH-hauteur, 0, 1, 0);
    fenetreFront.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    fenetreFront.vertex(-largeur, salleH, 0, 0, 1);
    fenetreFront.endShape(CLOSE);
    
    PShape fenetreBack = createShape();
    fenetreBack.beginShape(QUADS);
    fenetreBack.fill(couleur);
    fenetreBack.stroke(couleur);
    fenetreBack.vertex(0, salleH, -profondeur);
    fenetreBack.vertex(0, salleH-hauteur, -profondeur);
    fenetreBack.vertex(-largeur, salleH-hauteur, -profondeur);
    fenetreBack.vertex(-largeur, salleH, -profondeur);
    fenetreBack.endShape(CLOSE);

    PShape fenetreTop = createShape();
    fenetreTop.beginShape(QUADS);
    fenetreTop.fill(couleur);
    fenetreTop.stroke(couleur);
    fenetreTop.vertex(0, salleH-hauteur, -profondeur);
    fenetreTop.vertex(0, salleH-hauteur, 0);
    fenetreTop.vertex(-largeur, salleH-hauteur, 0);
    fenetreTop.vertex(-largeur, salleH-hauteur, -profondeur);
    fenetreTop.endShape(CLOSE);

    PShape fenetreBottom = createShape();
    fenetreBottom.beginShape(QUADS);
    fenetreBottom.fill(couleur);
    fenetreBottom.stroke(couleur);
    fenetreBottom.vertex(0, salleH, -profondeur);
    fenetreBottom.vertex(0, salleH, 0);
    fenetreBottom.vertex(-largeur, salleH, 0);
    fenetreBottom.vertex(-largeur, salleH, -profondeur);
    fenetreBottom.endShape(CLOSE);

    PShape fenetreLeft = createShape();
    fenetreLeft.beginShape(QUADS);
    fenetreLeft.fill(couleur);
    fenetreLeft.stroke(couleur);
    fenetreLeft.vertex(-largeur, salleH, 0);
    fenetreLeft.vertex(-largeur, salleH-hauteur, 0);
    fenetreLeft.vertex(-largeur, salleH-hauteur, -profondeur);
    fenetreLeft.vertex(-largeur, salleH, -profondeur);
    fenetreLeft.endShape(CLOSE);

    PShape fenetreRight = createShape();
    fenetreRight.beginShape(QUADS);
    fenetreRight.fill(couleur);
    fenetreRight.stroke(couleur);
    fenetreRight.vertex(0, salleH, 0);
    fenetreRight.vertex(0, salleH-hauteur, 0);
    fenetreRight.vertex(0, salleH-hauteur, -profondeur);
    fenetreRight.vertex(0, salleH, -profondeur);
    fenetreRight.endShape(CLOSE);
    
    fenetre.addChild(fenetreFront);
    fenetre.addChild(fenetreBack);
    fenetre.addChild(fenetreTop);
    fenetre.addChild(fenetreBottom);
    fenetre.addChild(fenetreLeft);
    fenetre.addChild(fenetreRight);
    
    return fenetre;
  }
}
