/****************************************************************
 * Fichier de la classe BureauProf, elle va nous permettre de   *
 * créer le bureau du professeur. Ce bureau est constitué de 4  *
 * pieds, d'un plateau, de 4 petits bords entre chaque pieds    *
 * sous le plateau, mais aussi de 3 planches sur les deus cotés *
 * et au fond du bureau.                                        *
 ****************************************************************/

class BureauProf {
  // Dessin pour le bureau du prof
  PShape bureauProf;
  // Variables des 2 couleurs que l'on va utiliser pour le bureau
  color couleurNoir, couleurBeige;
  // Instance de la classe Cylindre pour les 4 pieds du bureau
  Cylindre cylindre;

  /* Constructeur sans argument */

  BureauProf() {
    // Le bureau est un groupe de dessin
    bureauProf = createShape(GROUP);
    // Initialisation des couleurs
    couleurNoir = color(0);
    couleurBeige = color(#C0B7B0);
    // Initialisation du cylindre qui va nous servir pour les pieds
    cylindre = new Cylindre(30, piedPR, piedPH);
  }

  /* Fonction qui va nous retourner le dessin du bureau du prof
    avec sa bonne position dans la salle A106 */

  PShape creerLeBureauProf() {
    PShape groupeBureauProf = createShape(GROUP);

    PShape bureauProf = creerBureauProf(couleurNoir, couleurBeige);
    bureauProf.translate(salleL-240, 0, -salleP+plateauPP+143);

    groupeBureauProf.addChild(bureauProf);

    return groupeBureauProf;
  }

  /* Fonction qui va nous retourner le dessin du bureau
    du prof (qui est constitué d'un plateau, de 4 pieds,
    de 4 bordures (2 en largeur et 2 en profondeur), et
    de 3 planches) en utilisant les fonctions creerPlateauProf,
    creerPiedsProf, creerBordureLProf, creerBordurePProf,
    creerPlancheLProf et creerPlanchePProf */

  PShape creerBureauProf(color couleur1, color couleur2) {
    PShape bureau = createShape(GROUP);

    PShape plateau = creerPlateauProf(couleur1, couleur2, texBureauProf);

    PShape pieds = creerPiedsProf(couleur1);

    PShape bordureL1 = creerBordureLProf(couleur1);

    PShape bordureL2 = creerBordureLProf(couleur1);
    bordureL2.translate(0, 0, -plateauPP+10);

    PShape bordureP1 = creerBordurePProf(couleur1);
    
    PShape bordureP2 = creerBordurePProf(couleur1);
    bordureP2.translate(-plateauPL+10, 0, 0);
    
    PShape plancheL = creerPlancheLProf(couleur2);
    
    PShape plancheP1 = creerPlanchePProf(couleur2);
    
    PShape plancheP2 = creerPlanchePProf(couleur2);
    plancheP2.translate(-plateauPL+10, 0, 0);
    
    bureau.addChild(plateau);
    bureau.addChild(pieds);
    bureau.addChild(bordureL1);
    bureau.addChild(bordureL2);
    bureau.addChild(bordureP1);
    bureau.addChild(bordureP2);
    bureau.addChild(plancheL);
    bureau.addChild(plancheP1);
    bureau.addChild(plancheP2);
    
    return bureau;
  }

  /* Fonction qui va nous retourner le dessin du plateau
    du bureau du prof dont la texture de la partie haut
    de la forme est du bois blanc */

  PShape creerPlateauProf(color couleur1, color couleur2, PImage texture) {
    PShape plateau = createShape(GROUP);

    PShape plateauTop = createShape();
    plateauTop.beginShape(QUADS);
    plateauTop.textureMode(NORMAL);
    plateauTop.texture(texture);
    plateauTop.shininess(200.0);
    plateauTop.emissive(0, 0, 0);
    plateauTop.normal(0, 0, 1);
    plateauTop.stroke(couleur1);
    plateauTop.strokeWeight(2);
    plateauTop.vertex(0, salleH-piedPH-plateauPH, -plateauPP, 1, 1);
    plateauTop.vertex(0, salleH-piedPH-plateauPH, 0, 1, 0);
    plateauTop.vertex(-plateauPL, salleH-piedPH-plateauPH, 0, 0, 0);
    plateauTop.vertex(-plateauPL, salleH-piedPH-plateauPH, -plateauPP, 0, 1);
    plateauTop.endShape(CLOSE);

    PShape plateauBottom = createShape();
    plateauBottom.beginShape(QUADS);
    plateauBottom.fill(couleur2);
    plateauBottom.stroke(couleur1);
    plateauBottom.strokeWeight(2);
    plateauBottom.vertex(0, salleH-piedPH, -plateauPP);
    plateauBottom.vertex(0, salleH-piedPH, 0);
    plateauBottom.vertex(-plateauPL, salleH-piedPH, 0);
    plateauBottom.vertex(-plateauPL, salleH-piedPH, -plateauPP);
    plateauBottom.endShape(CLOSE);

    PShape plateauFront = createShape();
    plateauFront.beginShape(QUADS);
    plateauFront.fill(couleur1);
    plateauFront.stroke(couleur1);
    plateauFront.vertex(0, salleH-piedPH, 0);
    plateauFront.vertex(0, salleH-piedPH-plateauPH, 0);
    plateauFront.vertex(-plateauPL, salleH-piedPH-plateauPH, 0);
    plateauFront.vertex(-plateauPL, salleH-piedPH, 0);
    plateauFront.endShape(CLOSE);

    PShape plateauBack = createShape();
    plateauBack.beginShape(QUADS);
    plateauBack.fill(couleur1);
    plateauBack.stroke(couleur1);
    plateauBack.vertex(0, salleH-piedPH, -plateauPP);
    plateauBack.vertex(0, salleH-piedPH-plateauPH, -plateauPP);
    plateauBack.vertex(-plateauPL, salleH-piedPH-plateauPH, -plateauPP);
    plateauBack.vertex(-plateauPL, salleH-piedPH, -plateauPP);
    plateauBack.endShape(CLOSE);

    PShape plateauLeft = createShape();
    plateauLeft.beginShape(QUADS);
    plateauLeft.fill(couleur1);
    plateauLeft.stroke(couleur1);
    plateauLeft.vertex(-plateauPL, salleH-piedPH-plateauPH, 0);
    plateauLeft.vertex(-plateauPL, salleH-piedPH-plateauPH, -plateauPP);
    plateauLeft.vertex(-plateauPL, salleH-piedPH, -plateauPP);
    plateauLeft.vertex(-plateauPL, salleH-piedPH, 0);
    plateauLeft.endShape(CLOSE);

    PShape plateauRight = createShape();
    plateauRight.beginShape(QUADS);
    plateauRight.fill(couleur1);
    plateauRight.stroke(couleur1);
    plateauRight.vertex(0, salleH-piedPH-plateauPH, 0);
    plateauRight.vertex(0, salleH-piedPH-plateauPH, -plateauPP);
    plateauRight.vertex(0, salleH-piedPH, -plateauPP);
    plateauRight.vertex(0, salleH-piedPH, 0);
    plateauRight.endShape(CLOSE);

    plateau.addChild(plateauTop);
    plateau.addChild(plateauBottom);
    plateau.addChild(plateauFront);
    plateau.addChild(plateauBack);
    plateau.addChild(plateauLeft);
    plateau.addChild(plateauRight);

    return plateau;
  }

  /* Fonction qui va nous retourner le dessin d'une bordure
    en largeur (entre deux pieds du bureau du prof) */

  PShape creerBordureLProf(color couleur) {
    PShape bordureL = createShape(GROUP);

    PShape bordureLFront = createShape();
    bordureLFront.beginShape(QUADS);
    bordureLFront.fill(couleur);
    bordureLFront.stroke(couleur);
    bordureLFront.vertex(-5, salleH-piedPH, -3.75);
    bordureLFront.vertex(-5, salleH-piedPH+bordureP1H, -3.75);
    bordureLFront.vertex(-5-bordureP1L, salleH-piedPH+bordureP1H, -3.75);
    bordureLFront.vertex(-5-bordureP1L, salleH-piedPH, -3.75);
    bordureLFront.endShape(CLOSE);

    PShape bordureLBack = createShape();
    bordureLBack.beginShape(QUADS);
    bordureLBack.fill(couleur);
    bordureLBack.stroke(couleur);
    bordureLBack.vertex(-5, salleH-piedPH, -3.75-bordureP1P);
    bordureLBack.vertex(-5, salleH-piedPH+bordureP1H, -3.75-bordureP1P);
    bordureLBack.vertex(-5-bordureP1L, salleH-piedPH+bordureP1H, -3.75-bordureP1P);
    bordureLBack.vertex(-5-bordureP1L, salleH-piedPH, -3.75-bordureP1P);
    bordureLBack.endShape(CLOSE);

    PShape bordureLBottom = createShape();
    bordureLBottom.beginShape(QUADS);
    bordureLBottom.fill(couleur);
    bordureLBottom.stroke(couleur);
    bordureLBottom.vertex(-5, salleH-piedPH+bordureP1H, -3.75);
    bordureLBottom.vertex(-5, salleH-piedPH+bordureP1H, -3.75-bordureP1P);
    bordureLBottom.vertex(-5-bordureP1L, salleH-piedPH+bordureP1H, -3.75-bordureP1P);
    bordureLBottom.vertex(-5-bordureP1L, salleH-piedPH+bordureP1H, -3.75);
    bordureLBottom.endShape(CLOSE);

    bordureL.addChild(bordureLFront);
    bordureL.addChild(bordureLBack);
    bordureL.addChild(bordureLBottom);

    return bordureL;
  }

  /* Fonction qui va nous retourner le dessin d'une bordure
    en profondeur (entre deux pieds du bureau du prof) */

  PShape creerBordurePProf(color couleur) {
    PShape bordureP = createShape(GROUP);

    PShape bordurePRight = createShape();
    bordurePRight.beginShape(QUADS);
    bordurePRight.fill(couleur);
    bordurePRight.stroke(couleur);
    bordurePRight.vertex(-3.75, salleH-piedPH, -5);
    bordurePRight.vertex(-3.75, salleH-piedPH, -5-bordureP2P);
    bordurePRight.vertex(-3.75, salleH-piedPH+bordureP2H, -5-bordureP2P);
    bordurePRight.vertex(-3.75, salleH-piedPH+bordureP2H, -5);
    bordurePRight.endShape(CLOSE);

    PShape bordurePLeft = createShape();
    bordurePLeft.beginShape(QUADS);
    bordurePLeft.fill(couleur);
    bordurePLeft.stroke(couleur);
    bordurePLeft.vertex(-3.75-bordureP2L, salleH-piedPH, -5);
    bordurePLeft.vertex(-3.75-bordureP2L, salleH-piedPH, -5-bordureP2P);
    bordurePLeft.vertex(-3.75-bordureP2L, salleH-piedPH+bordureP2H, -5-bordureP2P);
    bordurePLeft.vertex(-3.75-bordureP2L, salleH-piedPH+bordureP2H, -5);
    bordurePLeft.endShape(CLOSE);

    PShape bordurePBottom = createShape();
    bordurePBottom.beginShape(QUADS);
    bordurePBottom.fill(couleur);
    bordurePBottom.stroke(couleur);
    bordurePBottom.vertex(-3.75, salleH-piedPH+bordureP2H, -5);
    bordurePBottom.vertex(-3.75, salleH-piedPH+bordureP2H, -5-bordureP2P);
    bordurePBottom.vertex(-3.75-bordureP2L, salleH-piedPH+bordureP2H, -5-bordureP2P);
    bordurePBottom.vertex(-3.75-bordureP2L, salleH-piedPH+bordureP2H, -5);
    bordurePBottom.endShape(CLOSE);

    bordureP.addChild(bordurePRight);
    bordureP.addChild(bordurePLeft);
    bordureP.addChild(bordurePBottom);

    return bordureP;
  }

  /* Fonction qui va nous retourner le dessin d'une planche
    en largeur (entre deux pieds du bureau du prof) */
  
  PShape creerPlancheLProf(color couleur) {
    PShape plancheL = createShape(GROUP);

    PShape plancheLFront = createShape();
    plancheLFront.beginShape(QUADS);
    plancheLFront.fill(couleur);
    plancheLFront.stroke(couleur);
    plancheLFront.vertex(-5, salleH-piedPH+bordureP1H, -3.75);
    plancheLFront.vertex(-5, salleH-piedPH+bordureP1H+planche1H, -3.75);
    plancheLFront.vertex(-5-planche1L, salleH-piedPH+bordureP1H+planche1H, -3.75);
    plancheLFront.vertex(-5-planche1L, salleH-piedPH+bordureP1H, -3.75);
    plancheLFront.endShape(CLOSE);

    PShape plancheLBack = createShape();
    plancheLBack.beginShape(QUADS);
    plancheLBack.fill(couleur);
    plancheLBack.stroke(couleur);
    plancheLBack.vertex(-5, salleH-piedPH+bordureP1H, -3.75-planche1P);
    plancheLBack.vertex(-5, salleH-piedPH+bordureP1H+planche1H, -3.75-planche1P);
    plancheLBack.vertex(-5-planche1L, salleH-piedPH+bordureP1H+planche1H, -3.75-planche1P);
    plancheLBack.vertex(-5-planche1L, salleH-piedPH+bordureP1H, -3.75-planche1P);
    plancheLBack.endShape(CLOSE);

    PShape plancheLBottom = createShape();
    plancheLBottom.beginShape(QUADS);
    plancheLBottom.fill(couleur);
    plancheLBottom.stroke(couleur);
    plancheLBottom.vertex(-5, salleH-piedPH+bordureP1H+planche1H, -3.75);
    plancheLBottom.vertex(-5, salleH-piedPH+bordureP1H+planche1H, -3.75-planche1P);
    plancheLBottom.vertex(-5-planche1L, salleH-piedPH+bordureP1H+planche1H, -3.75-planche1P);
    plancheLBottom.vertex(-5-planche1L, salleH-piedPH+bordureP1H+planche1H, -3.75);
    plancheLBottom.endShape(CLOSE);

    plancheL.addChild(plancheLFront);
    plancheL.addChild(plancheLBack);
    plancheL.addChild(plancheLBottom);

    return plancheL;
  }

  /* Fonction qui va nous retourner le dessin d'une planche
    en profondeur (entre deux pieds du bureau du prof) */
  
  PShape creerPlanchePProf(color couleur) {
    PShape plancheP = createShape(GROUP);
    
    PShape planchePRight = createShape();
    planchePRight.beginShape(QUADS);
    planchePRight.fill(couleur);
    planchePRight.stroke(couleur);
    planchePRight.vertex(-3.75, salleH-piedPH+bordureP2H, -5);
    planchePRight.vertex(-3.75, salleH-piedPH+bordureP2H, -5-planche2P);
    planchePRight.vertex(-3.75, salleH-piedPH+bordureP2H+planche2H, -5-planche2P);
    planchePRight.vertex(-3.75, salleH-piedPH+bordureP2H+planche2H, -5);
    planchePRight.endShape(CLOSE);
    
    PShape planchePLeft = createShape();
    planchePLeft.beginShape(QUADS);
    planchePLeft.fill(couleur);
    planchePLeft.stroke(couleur);
    planchePLeft.vertex(-3.75-planche2L, salleH-piedPH+bordureP2H, -5);
    planchePLeft.vertex(-3.75-planche2L, salleH-piedPH+bordureP2H, -5-planche2P);
    planchePLeft.vertex(-3.75-planche2L, salleH-piedPH+bordureP2H+planche2H, -5-planche2P);
    planchePLeft.vertex(-3.75-planche2L, salleH-piedPH+bordureP2H+planche2H, -5);
    planchePLeft.endShape(CLOSE);

    PShape planchePBottom = createShape();
    planchePBottom.beginShape(QUADS);
    planchePBottom.fill(couleur);
    planchePBottom.stroke(couleur);
    planchePBottom.vertex(-3.75, salleH-piedPH+bordureP2H+planche2H, -5);
    planchePBottom.vertex(-3.75, salleH-piedPH+bordureP2H+planche2H, -5-planche2P);
    planchePBottom.vertex(-3.75-planche2L, salleH-piedPH+bordureP2H+planche2H, -5-planche2P);
    planchePBottom.vertex(-3.75-planche2L, salleH-piedPH+bordureP2H+planche2H, -5);
    planchePBottom.endShape(CLOSE);
    
    plancheP.addChild(planchePRight);
    plancheP.addChild(planchePLeft);
    plancheP.addChild(planchePBottom);
    
    return plancheP;
  }

  /* Fonction qui va nous retourner le dessin des 4 pieds
    du bureau du prof en utilisant la fonction drawCylindre sur
    l'instance cylindre */

  PShape creerPiedsProf(color couleur) {
    PShape lesPieds = createShape(GROUP);

    PShape pied1 = cylindre.drawCylindre(couleur);
    pied1.translate(-5, 5, salleH-piedPH/2);
    pied1.rotateX(-PI/2);

    PShape pied2 = cylindre.drawCylindre(couleur);
    pied2.translate(-plateauPL+5, 5, salleH-piedPH/2);
    pied2.rotateX(-PI/2);

    PShape pied3 = cylindre.drawCylindre(couleur);
    pied3.translate(-5, plateauPP-5, salleH-piedPH/2);
    pied3.rotateX(-PI/2);

    PShape pied4 = cylindre.drawCylindre(couleur);
    pied4.translate(-plateauPL+5, plateauPP-5, salleH-piedPH/2);
    pied4.rotateX(-PI/2);

    lesPieds.addChild(pied1);
    lesPieds.addChild(pied2);
    lesPieds.addChild(pied3);
    lesPieds.addChild(pied4);

    return lesPieds;
  }
}
