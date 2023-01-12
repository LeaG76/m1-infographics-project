/*********************************************************************
 * Fichier de la classe Enceinte, elle va nous permettre de créer    *
 * des 2 enceintes qui se trouvent en haut sur le mur du tableau     *
 * de la salle A106. Une enceinte est une bloc avec juste la texture *
 * de l'enceinte sur la face de devant.                              *
 *********************************************************************/

class Enceinte {
  // Dessin pour les enceintes
  PShape lesEnceintes;
  // Variables des couleurs que l'on va utiliser pour une enceinte
  color couleurGris, couleurBlanc;

  /* Constructeur sans argument */

  Enceinte() {
    // Les enceintes sont un groupe de dessin
    lesEnceintes = createShape(GROUP);
    // Initialisation des couleurs
    couleurGris = color(#bababa);
    couleurBlanc = color(#f1f1f1);
  }
  
  /* Fonction qui va nous retourner le dessin des enceintes
    en utilisant la fonction creerEnceinte */

  PShape creerLesEnceintes() {
    PShape enceinte1 = creerEnceinte(couleurGris, couleurBlanc);
    enceinte1.translate(-salleL+137+enceinteL+5,-2*salleH+enceinteH+5,-salleP+enceinteP+0.5);
    
    PShape enceinte2 = creerEnceinte(couleurGris, couleurBlanc);
    enceinte2.translate(-salleL+tableauL+137-5,-2*salleH+enceinteH+5,-salleP+enceinteP+0.5);
    
    lesEnceintes.addChild(enceinte1);
    lesEnceintes.addChild(enceinte2);
    
    return lesEnceintes;
  }

  /* Fonction qui va nous retourner le dessin d'une enceinte */
  
  PShape creerEnceinte(color couleur1, color couleur2) {
    PShape enceinte = createShape(GROUP);
    
    PShape enceinteFront = createShape();
    enceinteFront.beginShape(QUADS);
    enceinteFront.textureMode(NORMAL);
    enceinteFront.texture(texEnceinte);
    enceinteFront.shininess(200.0);
    enceinteFront.emissive(0, 0, 0);
    enceinteFront.normal(0, 0, 1);
    enceinteFront.stroke(couleur2);
    enceinteFront.vertex(0, salleH, 0, 1, 1);
    enceinteFront.vertex(0, salleH-enceinteH, 0, 1, 0);
    enceinteFront.vertex(-enceinteL, salleH-enceinteH, 0, 0, 0);
    enceinteFront.vertex(-enceinteL, salleH, 0, 0, 1);
    enceinteFront.endShape(CLOSE);
    
    PShape enceinteBack = createShape();
    enceinteBack.beginShape(QUADS);
    enceinteBack.fill(couleur1);
    enceinteBack.stroke(couleur2);
    enceinteBack.vertex(0, salleH, -enceinteP);
    enceinteBack.vertex(0, salleH-enceinteH, -enceinteP);
    enceinteBack.vertex(-enceinteL, salleH-enceinteH, -enceinteP);
    enceinteBack.vertex(-enceinteL, salleH, -enceinteP);
    enceinteBack.endShape(CLOSE);
    
    PShape enceinteTop = createShape();
    enceinteTop.beginShape(QUADS);
    enceinteTop.fill(couleur1);
    enceinteTop.stroke(couleur2);
    enceinteTop.vertex(0, salleH-enceinteH, -enceinteP);
    enceinteTop.vertex(0, salleH-enceinteH, 0);
    enceinteTop.vertex(-enceinteL, salleH-enceinteH, 0);
    enceinteTop.vertex(-enceinteL, salleH-enceinteH, -enceinteP);
    enceinteTop.endShape(CLOSE);
    
    PShape enceinteBottom = createShape();
    enceinteBottom.beginShape(QUADS);
    enceinteBottom.fill(couleur1);
    enceinteBottom.stroke(couleur2);
    enceinteBottom.vertex(0, salleH, -enceinteP);
    enceinteBottom.vertex(0, salleH, 0);
    enceinteBottom.vertex(-enceinteL, salleH, 0);
    enceinteBottom.vertex(-enceinteL, salleH, -enceinteP);
    enceinteBottom.endShape(CLOSE);
    
    PShape enceinteLeft = createShape();
    enceinteLeft.beginShape(QUADS);
    enceinteLeft.fill(couleur1);
    enceinteLeft.stroke(couleur2);
    enceinteLeft.vertex(-enceinteL, salleH, 0);
    enceinteLeft.vertex(-enceinteL, salleH-enceinteH, 0);
    enceinteLeft.vertex(-enceinteL, salleH-enceinteH, -enceinteP);
    enceinteLeft.vertex(-enceinteL, salleH, -enceinteP);
    enceinteLeft.endShape(CLOSE);
    
    PShape enceinteRight = createShape();
    enceinteRight.beginShape(QUADS);
    enceinteRight.fill(couleur1);
    enceinteRight.stroke(couleur2);
    enceinteRight.vertex(0, salleH, 0);
    enceinteRight.vertex(0, salleH-enceinteH, 0);
    enceinteRight.vertex(0, salleH-enceinteH, -enceinteP);
    enceinteRight.vertex(0, salleH, -enceinteP);
    enceinteRight.endShape(CLOSE);

    enceinte.addChild(enceinteFront);
    enceinte.addChild(enceinteBack);
    enceinte.addChild(enceinteTop);
    enceinte.addChild(enceinteBottom);
    enceinte.addChild(enceinteLeft);
    enceinte.addChild(enceinteRight);
    
    return enceinte;
  }
}
