/********************************************************
 * Fichier de la classe Colonne, elle va nous permettre *
 * de créer les colonnes qui se trouvent sur le mur des *
 * fenêtres. Pour cela, on va reproduire les colonnes,  *
 * reproduire les plinthes pour un meilleur rendu et    *
 * aussi créer les deux tuyaux qui sont collés à la     *
 * colonne du milieu.                                   *
 ********************************************************/

class Colonne {
  // Dessin pour les colonnes
  PShape lesColonnes;
  // Variable de la couleur que l'on va utiliser pour une colonne
  color couleurMur;
  // Instances de la classe Cylindre pour les 2 tuyaux
  Cylindre cylindre1, cylindre2;
  
  /* Constructeur sans argument */

  Colonne() {
    // Les colonnes sont un groupe de dessin
    lesColonnes = createShape(GROUP);
    // Initialisation de la couleur
    couleurMur = color(#e9e3d3);
    // Initialisation des cylindres
    cylindre1 = new Cylindre(30, 1.5, 280);
    cylindre2 = new Cylindre(30, 1.5, 280);
  }

  /* Fonction qui va nous retourner le dessin des colonnes
    avec les plinthes et les 2 tuyaux */
  
  PShape creerLesColonnes() {
    PShape colonne1 = creerColonne(12, 280, 14, texMur, couleurMur);
    colonne1.translate(-salleP+12,0,-salleL+14);
    colonne1.rotateY(PI/2);
    
    PShape plinthe1 = creerPlinthe(12, plintheH, plintheP, couleurMur);
    plinthe1.translate(-salleP+12+plintheP,0,-salleL+14+plintheP);
    plinthe1.rotateY(PI/2);
    
    PShape plinthe1bis = creerPlinthe(14, plintheH, plintheP, couleurMur);
    plinthe1bis.translate(-salleL+14+plintheP,0,salleP-12);
    
    PShape colonne2 = creerColonne(79, 280, 14, texMur, couleurMur);
    colonne2.translate(-salleP+fenetre1L+91,0,-salleL+14);
    colonne2.rotateY(PI/2);
    
    PShape plinthe2 = creerPlinthe(79, plintheH, plintheP, couleurMur);
    plinthe2.translate(-salleP+fenetre1L+91,0,-salleL+14+plintheP);
    plinthe2.rotateY(PI/2);
    
    PShape plinthe2bis = creerPlinthe(14, plintheH, plintheP, couleurMur);
    plinthe2bis.translate(-salleL+14+plintheP,0,salleP-fenetre1L-12+plintheP);
    
    PShape plinthe2bisbis = creerPlinthe(14, plintheH, plintheP, couleurMur);
    plinthe2bisbis.translate(-salleL+14+plintheP,0,salleP-fenetre1L-91);
    
    PShape tuyau1 = cylindre1.drawCylindre(couleurMur);
    tuyau1.translate(-salleL+17,-salleP+fenetre1L+75,salleH-280/2);
    tuyau1.rotateX(-PI/2);
    
    PShape tuyau2 = cylindre2.drawCylindre(couleurMur);
    tuyau2.translate(-salleL+17,-salleP+fenetre1L+65,salleH-280/2);
    tuyau2.rotateX(-PI/2);
    
    PShape colonne3 = creerColonne(14, 280, 14, texMur, couleurMur);
    colonne3.translate(salleP,0,-salleL+14);
    colonne3.rotateY(PI/2);
    
    PShape plinthe3 = creerPlinthe(14, plintheH, plintheP, couleurMur);
    plinthe3.translate(salleP-plintheP,0,-salleL+14+plintheP);
    plinthe3.rotateY(PI/2);
    
    PShape plinthe3bis = creerPlinthe(14, plintheH, plintheP, couleurMur);
    plinthe3bis.translate(-salleL+14+plintheP,0,-salleP+14+plintheP);
    
    lesColonnes.addChild(colonne1);
    lesColonnes.addChild(plinthe1);
    lesColonnes.addChild(plinthe1bis);
    lesColonnes.addChild(colonne2);
    lesColonnes.addChild(plinthe2);
    lesColonnes.addChild(plinthe2bis);
    lesColonnes.addChild(plinthe2bisbis);
    lesColonnes.addChild(tuyau1);
    lesColonnes.addChild(tuyau2);
    lesColonnes.addChild(colonne3);
    lesColonnes.addChild(plinthe3);
    lesColonnes.addChild(plinthe3bis);
    
    return lesColonnes;
  }

  /* Fonction qui va nous retourner le dessin d'une colonne
    avec la texture des murs */
  
  PShape creerColonne(float largeur, float hauteur, float profondeur, PImage texture, color couleur) {
    PShape colonne = createShape(GROUP);
    
    PShape colonneFront = createShape();
    colonneFront.beginShape(QUADS);
    colonneFront.textureMode(NORMAL);
    colonneFront.texture(texture);
    colonneFront.shininess(200.0);
    colonneFront.emissive(0, 0, 0);
    colonneFront.normal(0, 0, 1);
    colonneFront.stroke(couleur);
    colonneFront.vertex(0, salleH, 0, 1, 1);
    colonneFront.vertex(0, salleH-hauteur, 0, 1, 0);
    colonneFront.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    colonneFront.vertex(-largeur, salleH, 0, 0, 1);
    colonneFront.endShape(CLOSE);
    
    PShape colonneBack = createShape();
    colonneBack.beginShape(QUADS);
    colonneBack.textureMode(NORMAL);
    colonneBack.texture(texture);
    colonneBack.shininess(200.0);
    colonneBack.emissive(0, 0, 0);
    colonneBack.normal(0, 0, 1);
    colonneBack.stroke(couleur);
    colonneBack.vertex(0, salleH, -profondeur, 1, 1);
    colonneBack.vertex(0, salleH-hauteur, -profondeur, 1, 0);
    colonneBack.vertex(-largeur, salleH-hauteur, -profondeur, 0, 0);
    colonneBack.vertex(-largeur, salleH, -profondeur, 0, 1);
    colonneBack.endShape(CLOSE);

    PShape colonneTop = createShape();
    colonneTop.beginShape(QUADS);
    colonneTop.textureMode(NORMAL);
    colonneTop.texture(texture);
    colonneTop.shininess(200.0);
    colonneTop.emissive(0, 0, 0);
    colonneTop.normal(0, 0, 1);
    colonneTop.stroke(couleur);
    colonneTop.vertex(0, salleH-hauteur, -profondeur, 1, 1);
    colonneTop.vertex(0, salleH-hauteur, 0, 1, 0);
    colonneTop.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    colonneTop.vertex(-largeur, salleH-hauteur, -profondeur, 0, 1);
    colonneTop.endShape(CLOSE);

    PShape colonneBottom = createShape();
    colonneBottom.beginShape(QUADS);
    colonneBottom.textureMode(NORMAL);
    colonneBottom.texture(texture);
    colonneBottom.shininess(200.0);
    colonneBottom.emissive(0, 0, 0);
    colonneBottom.normal(0, 0, 1);
    colonneBottom.stroke(couleur);
    colonneBottom.vertex(0, salleH, -profondeur, 1, 1);
    colonneBottom.vertex(0, salleH, 0, 1, 0);
    colonneBottom.vertex(-largeur, salleH, 0, 0, 0);
    colonneBottom.vertex(-largeur, salleH, -profondeur, 0, 1);
    colonneBottom.endShape(CLOSE);

    PShape colonneLeft = createShape();
    colonneLeft.beginShape(QUADS);
    colonneLeft.textureMode(NORMAL);
    colonneLeft.texture(texture);
    colonneLeft.shininess(200.0);
    colonneLeft.emissive(0, 0, 0);
    colonneLeft.normal(0, 0, 1);
    colonneLeft.stroke(couleur);
    colonneLeft.vertex(-largeur, salleH, 0, 1, 1);
    colonneLeft.vertex(-largeur, salleH-hauteur, 0, 1, 0);
    colonneLeft.vertex(-largeur, salleH-hauteur, -profondeur, 0, 0);
    colonneLeft.vertex(-largeur, salleH, -profondeur, 0, 1);
    colonneLeft.endShape(CLOSE);

    PShape colonneRight = createShape();
    colonneRight.beginShape(QUADS);
    colonneRight.textureMode(NORMAL);
    colonneRight.texture(texture);
    colonneRight.shininess(200.0);
    colonneRight.emissive(0, 0, 0);
    colonneRight.normal(0, 0, 1);
    colonneRight.stroke(couleur);
    colonneRight.vertex(0, salleH, 0, 1, 1);
    colonneRight.vertex(0, salleH-hauteur, 0, 1, 0);
    colonneRight.vertex(0, salleH-hauteur, -profondeur, 0, 0);
    colonneRight.vertex(0, salleH, -profondeur, 0, 1);
    colonneRight.endShape(CLOSE);
    
    colonne.addChild(colonneFront);
    colonne.addChild(colonneBack);
    colonne.addChild(colonneTop);
    colonne.addChild(colonneBottom);
    colonne.addChild(colonneLeft);
    colonne.addChild(colonneRight);
    
    return colonne;
  }
  
  /* Fonction qui va nous retourner le dessin d'une plinthe */

  PShape creerPlinthe(float largeur, float hauteur, float profondeur, color couleur) {
    PShape plinthe = createShape(GROUP);
    
    PShape plintheFront = createShape();
    plintheFront.beginShape(QUADS);
    plintheFront.fill(couleur);
    plintheFront.stroke(couleur);
    plintheFront.vertex(0, salleH, 0, 1, 1);
    plintheFront.vertex(0, salleH-hauteur, 0, 1, 0);
    plintheFront.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    plintheFront.vertex(-largeur, salleH, 0, 0, 1);
    plintheFront.endShape(CLOSE);
    
    PShape plintheBack = createShape();
    plintheBack.beginShape(QUADS);
    plintheBack.fill(couleur);
    plintheBack.stroke(couleur);
    plintheBack.vertex(0, salleH, -profondeur, 1, 1);
    plintheBack.vertex(0, salleH-hauteur, -profondeur, 1, 0);
    plintheBack.vertex(-largeur, salleH-hauteur, -profondeur, 0, 0);
    plintheBack.vertex(-largeur, salleH, -profondeur, 0, 1);
    plintheBack.endShape(CLOSE);

    PShape plintheTop = createShape();
    plintheTop.beginShape(QUADS);
    plintheTop.fill(couleur);
    plintheTop.stroke(couleur);
    plintheTop.vertex(0, salleH-hauteur, -profondeur, 1, 1);
    plintheTop.vertex(0, salleH-hauteur, 0, 1, 0);
    plintheTop.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    plintheTop.vertex(-largeur, salleH-hauteur, -profondeur, 0, 1);
    plintheTop.endShape(CLOSE);

    PShape plintheBottom = createShape();
    plintheBottom.beginShape(QUADS);
    plintheBottom.fill(couleur);
    plintheBottom.stroke(couleur);
    plintheBottom.vertex(0, salleH, -profondeur, 1, 1);
    plintheBottom.vertex(0, salleH, 0, 1, 0);
    plintheBottom.vertex(-largeur, salleH, 0, 0, 0);
    plintheBottom.vertex(-largeur, salleH, -profondeur, 0, 1);
    plintheBottom.endShape(CLOSE);

    PShape plintheLeft = createShape();
    plintheLeft.beginShape(QUADS);
    plintheLeft.fill(couleur);
    plintheLeft.stroke(couleur);
    plintheLeft.vertex(-largeur, salleH, 0, 1, 1);
    plintheLeft.vertex(-largeur, salleH-hauteur, 0, 1, 0);
    plintheLeft.vertex(-largeur, salleH-hauteur, -profondeur, 0, 0);
    plintheLeft.vertex(-largeur, salleH, -profondeur, 0, 1);
    plintheLeft.endShape(CLOSE);

    PShape plintheRight = createShape();
    plintheRight.beginShape(QUADS);
    plintheRight.fill(couleur);
    plintheRight.stroke(couleur);
    plintheRight.vertex(0, salleH, 0, 1, 1);
    plintheRight.vertex(0, salleH-hauteur, 0, 1, 0);
    plintheRight.vertex(0, salleH-hauteur, -profondeur, 0, 0);
    plintheRight.vertex(0, salleH, -profondeur, 0, 1);
    plintheRight.endShape(CLOSE);
    
    plinthe.addChild(plintheFront);
    plinthe.addChild(plintheBack);
    plinthe.addChild(plintheTop);
    plinthe.addChild(plintheBottom);
    plinthe.addChild(plintheLeft);
    plinthe.addChild(plintheRight);
    
    return plinthe;
  }
}
