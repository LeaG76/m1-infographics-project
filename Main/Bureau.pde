/****************************************************************
 * Fichier de la classe Bureau, elle va nous permettre de créer *
 * les bureaux de la salle A106, c'est-à-dire les 3 bureaux sur *
 * les 4 rangées. Un bureau est constitué de 4 pieds, d'un      *
 * plateau et 4 petits bords entre chaque pieds sous le plateau *
 * Nous allons aussi créer dans ce fichier les deux bureaux qui *
 * se trouvent au fond de la salle car ils sont identiques aux  *
 * autres bureaux de la salle (construits de la même manière)   *
 ****************************************************************/

class Bureau {
  // Dessin pour les bureaux
  PShape lesBureaux;
  // Variables des 3 couleurs que l'on va utiliser pour un bureau
  color couleurNoir, couleurBleu, couleurBlanc;
  // Instance de la classe Cylindre pour les 4 pieds d'un bureau
  Cylindre cylindre;

  /* Constructeur sans argument */

  Bureau() {
    // Les bureaux sont un groupe de dessin
    lesBureaux = createShape(GROUP);
    // Initialisation des couleurs
    couleurNoir = color(0);
    couleurBleu = color(#A7B2C4);
    couleurBlanc = color(#f2f2f2);
    // Initialisation du cylindre qui va nous servir pour les pieds
    cylindre = new Cylindre(30, piedR, piedH);
  }

  /* Fonction qui va nous retourner le dessin des 3 bureaux
    sur les 4 rangées de la salle en utilisant la fonction
    creerLesBureaux de création des bureaux et des barres
    blanches pour les prises, celle-ci dépend de plusieurs
    arguments afin de mieux pouvoir faire le placement des
    bureaux */

  PShape creerRangeesBureaux() {
    PShape rangeesBureaux = createShape(GROUP);
    
    // On affiche les bureaux (au nombre de 3) sur les 4 rangées
    int k1=2;
    for (int i=0; i<nb_bureau; i++) {
      int k2=0;
      float k3=2.25;
      for (int j=1; j<=nb_rangee; j++) {
        PShape bureaux = creerLesBureaux(i, j, k1, k2, k3);
        rangeesBureaux.addChild(bureaux);
        k2+=83;
        k3+=83;
      }
      k1+=1;
    }
    
    lesBureaux.addChild(rangeesBureaux);
    
    return lesBureaux;
  }

  /* Fonction qui va nous retourner le dessin des bureaux
    ainsi que des barres blanches de prise en utilisant les
    fonctions creerBureau et creerBarre */

  PShape creerLesBureaux(int i, int j, float k1, int k2, float k3) {
    PShape groupeBureaux = createShape(GROUP);
    
    PShape bureaux = creerBureau(couleurNoir, couleurBleu);
    bureaux.translate(salleL-plateauL*i-k1, 0, -salleP+plateauP*j+216+k2);
    
    PShape barres = creerBarre(468, 5, 7, couleurBlanc);
    barres.translate(salleL-9, -piedH+5, -salleP+plateauP*(j-1)+216+k3);
    
    groupeBureaux.addChild(bureaux);
    groupeBureaux.addChild(barres);

    return groupeBureaux;
  }

  /* Fonction qui va nous retourner le dessin des 2 bureaux
    du fond en utilisant la fonction creerBureau */
  
  PShape creerLesBureauxFond() {
    PShape groupeBureauxFond = createShape(GROUP);
    
    PShape bureau1 = creerBureau(couleurNoir, couleurBleu);
    bureau1.translate(salleL-70, 0, salleP-2);
    
    PShape bureau2 = creerBureau(couleurNoir, couleurBleu);
    bureau2.translate(salleL-292, 0, salleP-2);

    groupeBureauxFond.addChild(bureau1);
    groupeBureauxFond.addChild(bureau2);
     
    return groupeBureauxFond;
  }

  /* Fonction qui va nous retourner le dessin d'un bureau
    (qui est constitué d'un plateau, de 4 pieds, et de 4
    bordures (2 en largeur et 2 en profondeur)) en utilisant
    les fonctions creerPlateau, creerPieds, creerBordureL et
    creerBordureP */

  PShape creerBureau(color couleur1, color couleur2) {
    PShape bureau = createShape(GROUP);

    PShape plateau = creerPlateau(couleur1, couleur2, texBureau);

    PShape pieds = creerPieds(couleur1);

    PShape bordureL1 = creerBordureL(couleur1);

    PShape bordureL2 = creerBordureL(couleur1);
    bordureL2.translate(0, 0, -plateauP+10);

    PShape bordureP1 = creerBordureP(couleur1);

    PShape bordureP2 = creerBordureP(couleur1);
    bordureP2.translate(-plateauL+10, 0, 0);

    bureau.addChild(plateau);
    bureau.addChild(pieds);
    bureau.addChild(bordureL1);
    bureau.addChild(bordureL2);
    bureau.addChild(bordureP1);
    bureau.addChild(bordureP2);

    return bureau;
  }

  /* Fonction qui va nous retourner le dessin d'un plateau
    de bureau dont la texture de la partie haut de la forme
    est du bois bleu */

  PShape creerPlateau(color couleur1, color couleur2, PImage texture) {
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
    plateauTop.vertex(0, salleH-piedH-plateauH, -plateauP, 1, 1);
    plateauTop.vertex(0, salleH-piedH-plateauH, 0, 1, 0);
    plateauTop.vertex(-plateauL, salleH-piedH-plateauH, 0, 0, 0);
    plateauTop.vertex(-plateauL, salleH-piedH-plateauH, -plateauP, 0, 1);
    plateauTop.endShape(CLOSE);

    PShape plateauBottom = createShape();
    plateauBottom.beginShape(QUADS);
    plateauBottom.fill(couleur2);
    plateauBottom.stroke(couleur1);
    plateauBottom.strokeWeight(2);
    plateauBottom.vertex(0, salleH-piedH, -plateauP);
    plateauBottom.vertex(0, salleH-piedH, 0);
    plateauBottom.vertex(-plateauL, salleH-piedH, 0);
    plateauBottom.vertex(-plateauL, salleH-piedH, -plateauP);
    plateauBottom.endShape(CLOSE);

    PShape plateauFront = createShape();
    plateauFront.beginShape(QUADS);
    plateauFront.fill(couleur1);
    plateauFront.stroke(couleur1);
    plateauFront.vertex(0, salleH-piedH, 0);
    plateauFront.vertex(0, salleH-piedH-plateauH, 0);
    plateauFront.vertex(-plateauL, salleH-piedH-plateauH, 0);
    plateauFront.vertex(-plateauL, salleH-piedH, 0);
    plateauFront.endShape(CLOSE);

    PShape plateauBack = createShape();
    plateauBack.beginShape(QUADS);
    plateauBack.fill(couleur1);
    plateauBack.stroke(couleur1);
    plateauBack.vertex(0, salleH-piedH, -plateauP);
    plateauBack.vertex(0, salleH-piedH-plateauH, -plateauP);
    plateauBack.vertex(-plateauL, salleH-piedH-plateauH, -plateauP);
    plateauBack.vertex(-plateauL, salleH-piedH, -plateauP);
    plateauBack.endShape(CLOSE);

    PShape plateauLeft = createShape();
    plateauLeft.beginShape(QUADS);
    plateauLeft.fill(couleur1);
    plateauLeft.stroke(couleur1);
    plateauLeft.vertex(-plateauL, salleH-piedH-plateauH, 0);
    plateauLeft.vertex(-plateauL, salleH-piedH-plateauH, -plateauP);
    plateauLeft.vertex(-plateauL, salleH-piedH, -plateauP);
    plateauLeft.vertex(-plateauL, salleH-piedH, 0);
    plateauLeft.endShape(CLOSE);

    PShape plateauRight = createShape();
    plateauRight.beginShape(QUADS);
    plateauRight.fill(couleur1);
    plateauRight.stroke(couleur1);
    plateauRight.vertex(0, salleH-piedH-plateauH, 0);
    plateauRight.vertex(0, salleH-piedH-plateauH, -plateauP);
    plateauRight.vertex(0, salleH-piedH, -plateauP);
    plateauRight.vertex(0, salleH-piedH, 0);
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
    en largeur (entre deux pieds du bureau) */

  PShape creerBordureL(color couleur) {
    PShape bordureL = createShape(GROUP);

    PShape bordureLFront = createShape();
    bordureLFront.beginShape(QUADS);
    bordureLFront.fill(couleur);
    bordureLFront.stroke(couleur);
    bordureLFront.vertex(-5, salleH-piedH, -4);
    bordureLFront.vertex(-5, salleH-piedH+bordure1H, -4);
    bordureLFront.vertex(-5-bordure1L, salleH-piedH+bordure1H, -4);
    bordureLFront.vertex(-5-bordure1L, salleH-piedH, -4);
    bordureLFront.endShape(CLOSE);

    PShape bordureLBack = createShape();
    bordureLBack.beginShape(QUADS);
    bordureLBack.fill(couleur);
    bordureLBack.stroke(couleur);
    bordureLBack.vertex(-5, salleH-piedH, -4-bordure1P);
    bordureLBack.vertex(-5, salleH-piedH+bordure1H, -4-bordure1P);
    bordureLBack.vertex(-5-bordure1L, salleH-piedH+bordure1H, -4-bordure1P);
    bordureLBack.vertex(-5-bordure1L, salleH-piedH, -4-bordure1P);
    bordureLBack.endShape(CLOSE);

    PShape bordureLBottom = createShape();
    bordureLBottom.beginShape(QUADS);
    bordureLBottom.fill(couleur);
    bordureLBottom.stroke(couleur);
    bordureLBottom.vertex(-5, salleH-piedH+bordure1H, -4);
    bordureLBottom.vertex(-5, salleH-piedH+bordure1H, -4-bordure1P);
    bordureLBottom.vertex(-5-bordure1L, salleH-piedH+bordure1H, -4-bordure1P);
    bordureLBottom.vertex(-5-bordure1L, salleH-piedH+bordure1H, -4);
    bordureLBottom.endShape(CLOSE);

    bordureL.addChild(bordureLFront);
    bordureL.addChild(bordureLBack);
    bordureL.addChild(bordureLBottom);

    return bordureL;
  }

  /* Fonction qui va nous retourner le dessin d'une bordure
    en profondeur (entre deux pieds du bureau) */

  PShape creerBordureP(color couleur) {
    PShape bordureP = createShape(GROUP);

    PShape bordurePRight = createShape();
    bordurePRight.beginShape(QUADS);
    bordurePRight.fill(couleur);
    bordurePRight.stroke(couleur);
    bordurePRight.vertex(-4, salleH-piedH, -5);
    bordurePRight.vertex(-4, salleH-piedH, -5-bordure2P);
    bordurePRight.vertex(-4, salleH-piedH+bordure2H, -5-bordure2P);
    bordurePRight.vertex(-4, salleH-piedH+bordure2H, -5);
    bordurePRight.endShape(CLOSE);

    PShape bordurePLeft = createShape();
    bordurePLeft.beginShape(QUADS);
    bordurePLeft.fill(couleur);
    bordurePLeft.stroke(couleur);
    bordurePLeft.vertex(-4-bordure2L, salleH-piedH, -5);
    bordurePLeft.vertex(-4-bordure2L, salleH-piedH, -5-bordure2P);
    bordurePLeft.vertex(-4-bordure2L, salleH-piedH+bordure2H, -5-bordure2P);
    bordurePLeft.vertex(-4-bordure2L, salleH-piedH+bordure2H, -5);
    bordurePLeft.endShape(CLOSE);

    PShape bordurePBottom = createShape();
    bordurePBottom.beginShape(QUADS);
    bordurePBottom.fill(couleur);
    bordurePBottom.stroke(couleur);
    bordurePBottom.vertex(-4, salleH-piedH+bordure2H, -5);
    bordurePBottom.vertex(-4, salleH-piedH+bordure2H, -5-bordure2P);
    bordurePBottom.vertex(-4-bordure2L, salleH-piedH+bordure2H, -5-bordure2P);
    bordurePBottom.vertex(-4-bordure2L, salleH-piedH+bordure2H, -5);
    bordurePBottom.endShape(CLOSE);

    bordureP.addChild(bordurePRight);
    bordureP.addChild(bordurePLeft);
    bordureP.addChild(bordurePBottom);

    return bordureP;
  }

  /* Fonction qui va nous retourner le dessin des 4 pieds
    d'un bureau en utilisant la fonction drawCylindre sur
    l'instance cylindre */

  PShape creerPieds(color couleur) {
    PShape lesPieds = createShape(GROUP);

    PShape pied1 = cylindre.drawCylindre(couleur);
    pied1.translate(-5, 5, salleH-piedH/2);
    pied1.rotateX(-PI/2);

    PShape pied2 = cylindre.drawCylindre(couleur);
    pied2.translate(-plateauL+5, 5, salleH-piedH/2);
    pied2.rotateX(-PI/2);

    PShape pied3 = cylindre.drawCylindre(couleur);
    pied3.translate(-5, plateauP-5, salleH-piedH/2);
    pied3.rotateX(-PI/2);

    PShape pied4 = cylindre.drawCylindre(couleur);
    pied4.translate(-plateauL+5, plateauP-5, salleH-piedH/2);
    pied4.rotateX(-PI/2);

    lesPieds.addChild(pied1);
    lesPieds.addChild(pied2);
    lesPieds.addChild(pied3);
    lesPieds.addChild(pied4);

    return lesPieds;
  }

  /* Fonction qui va nous retourner le dessin d'une barre
    blanche qui représente les barres de prise (il y en a
    une sur chaque rangée de bureaux) */
  
  PShape creerBarre(float largeur, float hauteur, float profondeur, color couleur) {
    PShape barre = createShape(GROUP);
    
    PShape barreFront = createShape();
    barreFront.beginShape(QUADS);
    barreFront.fill(couleur);
    barreFront.stroke(couleur);
    barreFront.vertex(0, salleH, 0, 1, 1);
    barreFront.vertex(0, salleH-hauteur, 0, 1, 0);
    barreFront.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    barreFront.vertex(-largeur, salleH, 0, 0, 1);
    barreFront.endShape(CLOSE);
    
    PShape barreBack = createShape();
    barreBack.beginShape(QUADS);
    barreBack.fill(couleur);
    barreBack.stroke(couleur);
    barreBack.vertex(0, salleH, -profondeur, 1, 1);
    barreBack.vertex(0, salleH-hauteur, -profondeur, 1, 0);
    barreBack.vertex(-largeur, salleH-hauteur, -profondeur, 0, 0);
    barreBack.vertex(-largeur, salleH, -profondeur, 0, 1);
    barreBack.endShape(CLOSE);

    PShape barreTop = createShape();
    barreTop.beginShape(QUADS);
    barreTop.fill(couleur);
    barreTop.stroke(couleur);
    barreTop.vertex(0, salleH-hauteur, -profondeur, 1, 1);
    barreTop.vertex(0, salleH-hauteur, 0, 1, 0);
    barreTop.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    barreTop.vertex(-largeur, salleH-hauteur, -profondeur, 0, 1);
    barreTop.endShape(CLOSE);

    PShape barreBottom = createShape();
    barreBottom.beginShape(QUADS);
    barreBottom.fill(couleur);
    barreBottom.stroke(couleur);
    barreBottom.vertex(0, salleH, -profondeur, 1, 1);
    barreBottom.vertex(0, salleH, 0, 1, 0);
    barreBottom.vertex(-largeur, salleH, 0, 0, 0);
    barreBottom.vertex(-largeur, salleH, -profondeur, 0, 1);
    barreBottom.endShape(CLOSE);

    PShape barreLeft = createShape();
    barreLeft.beginShape(QUADS);
    barreLeft.fill(couleur);
    barreLeft.stroke(couleur);
    barreLeft.vertex(-largeur, salleH, 0, 1, 1);
    barreLeft.vertex(-largeur, salleH-hauteur, 0, 1, 0);
    barreLeft.vertex(-largeur, salleH-hauteur, -profondeur, 0, 0);
    barreLeft.vertex(-largeur, salleH, -profondeur, 0, 1);
    barreLeft.endShape(CLOSE);

    PShape barreRight = createShape();
    barreRight.beginShape(QUADS);
    barreRight.fill(couleur);
    barreRight.stroke(couleur);
    barreRight.vertex(0, salleH, 0, 1, 1);
    barreRight.vertex(0, salleH-hauteur, 0, 1, 0);
    barreRight.vertex(0, salleH-hauteur, -profondeur, 0, 0);
    barreRight.vertex(0, salleH, -profondeur, 0, 1);
    barreRight.endShape(CLOSE);
    
    barre.addChild(barreFront);
    barre.addChild(barreBack);
    barre.addChild(barreTop);
    barre.addChild(barreBottom);
    barre.addChild(barreLeft);
    barre.addChild(barreRight);
    
    return barre;
  }
}
