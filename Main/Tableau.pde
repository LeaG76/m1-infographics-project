/********************************************************************
 * Fichier de la classe Tableau, elle va nous permettre de réaliser *
 * le tableau de la salle A106. Le tableau est constitué de la zone *
 * d'écriture (verte), d'un contour et d'une zone pour déposer les  *
 * craies et le tampon (on va séparer cette zone en 3 tablettes :   *
 * 2 verticales & une horizontale)                                  * 
 ********************************************************************/

class Tableau {
  // Dessin du tableau
  PShape tableau;
  // Variables des 3 couleurs que l'on va utiliser pour le tableau
  color couleurVert, couleurGris, couleurGrisF;

  /* Constructeur sans argument */

  Tableau() {
    // Le tableau est un groupe de dessin
    tableau = createShape(GROUP);
    // Initialisation des couleurs
    couleurVert = color(#5C694E);
    couleurGris = color(#7f7f7f);
    couleurGrisF = color(#666666);
  }

  /* Fonction qui va nous retourner le dessin du tableau
    en utilisant les autres fonctions de la classe
    c'est-à-dire les fonctions creerTableauZoneEcriture
    creerBlocHV, creerTablette1 et creerTablette2 */

  PShape creerTableau() {
    PShape tableauZoneEcriture = creerTableauZoneEcriture(couleurGris);
    
    PShape contourH1 = creerBlocHV(tableauL+2, 1, 2, couleurGris, couleurGrisF);
    contourH1.translate(tableauL+1,1,2);
    
    PShape contourH2 = creerBlocHV(tableauL+2, 2, 2, couleurGris, couleurGrisF);
    contourH2.translate(tableauL+1,-tableauH,2);
    
    PShape contourV1 = creerBlocHV(1, tableauH, 2, couleurGris, couleurGrisF);
    contourV1.translate(0,0,2);
    
    PShape contourV2 = creerBlocHV(1, tableauH, 2, couleurGris, couleurGrisF);
    contourV2.translate(tableauL+1,0,2);
    
    PShape tablette1 = creerTablette1(couleurGris, couleurGrisF);
    tablette1.translate(-1, 1, 0);
    
    PShape tablette2 = creerTablette2(couleurGris, couleurGrisF);
    tablette2.translate(-1, 1, 0);
    
    PShape tablette3 = creerBlocHV(tableauL+2, 0.5, 1, couleurGris, couleurGrisF);
    tablette3.translate(tableauL+1,1+tablette1H,tablette2P);
    
    tableau.addChild(tableauZoneEcriture);
    tableau.addChild(contourH1);
    tableau.addChild(contourH2);
    tableau.addChild(contourV1);
    tableau.addChild(contourV2);
    tableau.addChild(tablette1);
    tableau.addChild(tablette2);
    tableau.addChild(tablette3);
    
    tableau.translate(-salleL+137, -80, -salleP);

    return tableau;
  }

  /* Fonction qui va nous retourner le dessin de la zone d'écriture du tableau */

  PShape creerTableauZoneEcriture(color couleur) {
    PShape groupeTableau = createShape(GROUP);

    PShape tableauFront = createShape();
    tableauFront.beginShape(QUADS);
    tableauFront.textureMode(NORMAL);
    tableauFront.texture(texTableau);
    tableauFront.shininess(200.0);
    tableauFront.emissive(0, 0, 0);
    tableauFront.normal(0, 0, 1);
    tableauFront.stroke(couleur);
    tableauFront.vertex(0, salleH, tableauP, 1, 1);
    tableauFront.vertex(0, salleH-tableauH, tableauP, 1, 0);
    tableauFront.vertex(tableauL, salleH-tableauH, tableauP, 0, 0);
    tableauFront.vertex(tableauL, salleH, tableauP, 0, 1);
    tableauFront.endShape(CLOSE);

    PShape tableauBack = createShape();
    tableauBack.beginShape(QUADS);
    tableauBack.fill(couleur);
    tableauBack.stroke(couleur);
    tableauBack.vertex(0, salleH, 0);
    tableauBack.vertex(0, salleH-tableauH, 0);
    tableauBack.vertex(tableauL, salleH-tableauH, 0);
    tableauBack.vertex(tableauL, salleH, 0);
    tableauBack.endShape(CLOSE);

    PShape tableauTop = createShape();
    tableauTop.beginShape(QUADS);
    tableauTop.fill(couleur);
    tableauTop.stroke(couleur);
    tableauTop.vertex(0, salleH-tableauH, tableauP);
    tableauTop.vertex(0, salleH-tableauH, 0);
    tableauTop.vertex(tableauL, salleH-tableauH, 0);
    tableauTop.vertex(tableauL, salleH-tableauH, tableauP);
    tableauTop.endShape(CLOSE);

    PShape tableauBottom = createShape();
    tableauBottom.beginShape(QUADS);
    tableauBottom.fill(couleur);
    tableauBottom.stroke(couleur);
    tableauBottom.vertex(0, salleH, tableauP);
    tableauBottom.vertex(0, salleH, 0);
    tableauBottom.vertex(tableauL, salleH, 0);
    tableauBottom.vertex(tableauL, salleH, tableauP);
    tableauBottom.endShape(CLOSE);

    PShape tableauLeft = createShape();
    tableauLeft.beginShape(QUADS);
    tableauLeft.fill(couleur);
    tableauLeft.stroke(couleur);
    tableauLeft.vertex(0, salleH, tableauP);
    tableauLeft.vertex(0, salleH-tableauH, tableauP);
    tableauLeft.vertex(0, salleH-tableauH, 0);
    tableauLeft.vertex(0, salleH, 0);
    tableauLeft.endShape(CLOSE);

    PShape tableauRight = createShape();
    tableauRight.beginShape(QUADS);
    tableauRight.fill(couleur);
    tableauRight.stroke(couleur);
    tableauRight.vertex(tableauL, salleH, tableauP);
    tableauRight.vertex(tableauL, salleH-tableauH, tableauP);
    tableauRight.vertex(tableauL, salleH-tableauH, 0);
    tableauRight.vertex(tableauL, salleH, 0);
    tableauRight.endShape(CLOSE);

    groupeTableau.addChild(tableauFront);
    groupeTableau.addChild(tableauBack);
    groupeTableau.addChild(tableauTop);
    groupeTableau.addChild(tableauBottom);
    groupeTableau.addChild(tableauLeft);
    groupeTableau.addChild(tableauRight);

    return groupeTableau;
  }

  /* Fonction qui va nous retourner le dessin d'un bloc gris,
    on va surtout utiliser cette fonction pour créer le contour
    du tableau */
  
  PShape creerBlocHV(float largeur, float hauteur, float profondeur, color couleur1, color couleur2) {
    PShape bloc = createShape(GROUP);
    
    PShape blocFront = createShape();
    blocFront.beginShape(QUADS);
    blocFront.fill(couleur1);
    blocFront.stroke(couleur2);
    blocFront.vertex(0, salleH, 0);
    blocFront.vertex(0, salleH-hauteur, 0);
    blocFront.vertex(-largeur, salleH-hauteur, 0);
    blocFront.vertex(-largeur, salleH, 0);
    blocFront.endShape(CLOSE);
    
    PShape blocBack= createShape();
    blocBack.beginShape(QUADS);
    blocBack.fill(couleur1);
    blocBack.stroke(couleur2);
    blocBack.vertex(0, salleH, -profondeur);
    blocBack.vertex(0, salleH-hauteur, -profondeur);
    blocBack.vertex(-largeur, salleH-hauteur, -profondeur);
    blocBack.vertex(-largeur, salleH, -profondeur);
    blocBack.endShape(CLOSE);
    
    PShape blocTop = createShape();
    blocTop.beginShape(QUADS);
    blocTop.fill(couleur1);
    blocTop.stroke(couleur2);
    blocTop.vertex(0, salleH-hauteur, -profondeur);
    blocTop.vertex(0, salleH-hauteur, 0);
    blocTop.vertex(-largeur, salleH-hauteur, 0);
    blocTop.vertex(-largeur, salleH-hauteur, -profondeur);
    blocTop.endShape(CLOSE);
    
    PShape blocBottom = createShape();
    blocBottom.beginShape(QUADS);
    blocBottom.fill(couleur1);
    blocBottom.stroke(couleur2);
    blocBottom.vertex(0, salleH, -profondeur);
    blocBottom.vertex(0, salleH, 0);
    blocBottom.vertex(-largeur, salleH, 0);
    blocBottom.vertex(-largeur, salleH, -profondeur);
    blocBottom.endShape(CLOSE);
    
    PShape blocLeft = createShape();
    blocLeft.beginShape(QUADS);
    blocLeft.fill(couleur1);
    blocLeft.stroke(couleur2);
    blocLeft.vertex(-largeur, salleH, 0);
    blocLeft.vertex(-largeur, salleH-hauteur, 0);
    blocLeft.vertex(-largeur, salleH-hauteur, -profondeur);
    blocLeft.vertex(-largeur, salleH, -profondeur);
    blocLeft.endShape(CLOSE);
    
    PShape blocRight = createShape();
    blocRight.beginShape(QUADS);
    blocRight.fill(couleur1);
    blocRight.stroke(couleur2);
    blocRight.vertex(0, salleH, 0);
    blocRight.vertex(0, salleH-hauteur, 0);
    blocRight.vertex(0, salleH-hauteur, -profondeur);
    blocRight.vertex(0, salleH, -profondeur);
    blocRight.endShape(CLOSE);
    
    bloc.addChild(blocFront);
    bloc.addChild(blocBack);
    bloc.addChild(blocTop);
    bloc.addChild(blocBottom);
    bloc.addChild(blocLeft);
    bloc.addChild(blocRight);

    return bloc;
  }
  
  /* Fonction qui va nous retourner le dessin d'une tablette verticale du tableau */

  PShape creerTablette1(color couleur1, color couleur2) {
    PShape tablette1 = createShape(GROUP);
    
    PShape tablette1Front = createShape();
    tablette1Front.beginShape(QUADS);
    tablette1Front.fill(couleur1);
    tablette1Front.stroke(couleur2);
    tablette1Front.vertex(0, salleH+tablette1H, tablette1P);
    tablette1Front.vertex(0, salleH, tablette1P);
    tablette1Front.vertex(tablette1L, salleH, tablette1P);
    tablette1Front.vertex(tablette1L, salleH+tablette1H, tablette1P);
    tablette1Front.endShape(CLOSE);
    
    PShape tablette1Back = createShape();
    tablette1Back.beginShape(QUADS);
    tablette1Back.fill(couleur1);
    tablette1Back.stroke(couleur2);
    tablette1Back.vertex(0, salleH+tablette1H, 0);
    tablette1Back.vertex(0, salleH, 0);
    tablette1Back.vertex(tablette1L, salleH, 0);
    tablette1Back.vertex(tablette1L, salleH+tablette1H, 0);
    tablette1Back.endShape(CLOSE);
    
    PShape tablette1Top = createShape();
    tablette1Top.beginShape(QUADS);
    tablette1Top.fill(couleur1);
    tablette1Top.stroke(couleur2);
    tablette1Top.vertex(0, salleH, tablette1P);
    tablette1Top.vertex(0, salleH, 0);
    tablette1Top.vertex(tablette1L, salleH, 0);
    tablette1Top.vertex(tablette1L, salleH, tablette1P);
    tablette1Top.endShape(CLOSE);

    PShape tablette1Bottom= createShape();
    tablette1Bottom.beginShape(QUADS);
    tablette1Bottom.fill(couleur1);
    tablette1Bottom.stroke(couleur2);
    tablette1Bottom.vertex(0, salleH+tablette1H, tablette1P);
    tablette1Bottom.vertex(0, salleH+tablette1H, 0);
    tablette1Bottom.vertex(tablette1L, salleH+tablette1H, 0);
    tablette1Bottom.vertex(tablette1L, salleH+tablette1H, tablette1P);
    tablette1Bottom.endShape(CLOSE);
    
    PShape tablette1Left = createShape();
    tablette1Left.beginShape(QUADS);
    tablette1Left.fill(couleur1);
    tablette1Left.stroke(couleur2);
    tablette1Left.vertex(0, salleH, tablette1P);
    tablette1Left.vertex(0, salleH+tablette1H, tablette1P);
    tablette1Left.vertex(0, salleH+tablette1H, 0);
    tablette1Left.vertex(0, salleH, 0);
    tablette1Left.endShape(CLOSE);

    PShape tablette1Right = createShape();
    tablette1Right.beginShape(QUADS);
    tablette1Right.fill(couleur1);
    tablette1Right.stroke(couleur2);
    tablette1Right.vertex(tablette1L, salleH, tablette1P);
    tablette1Right.vertex(tablette1L, salleH+tablette1H, tablette1P);
    tablette1Right.vertex(tablette1L, salleH+tablette1H, 0);
    tablette1Right.vertex(tablette1L, salleH, 0);
    tablette1Right.endShape(CLOSE);
    
    tablette1.addChild(tablette1Front);
    tablette1.addChild(tablette1Back);
    tablette1.addChild(tablette1Top);
    tablette1.addChild(tablette1Bottom);
    tablette1.addChild(tablette1Left);
    tablette1.addChild(tablette1Right);
    
    return tablette1;
  }

  /* Fonction qui va nous retourner le dessin d'une tablette horizontale du tableau */
  
  PShape creerTablette2(color couleur1, color couleur2) {
    PShape tablette2 = createShape(GROUP);
    
    PShape tablette2Front = createShape();
    tablette2Front.beginShape(QUADS);
    tablette2Front.fill(couleur1);
    tablette2Front.stroke(couleur2);
    tablette2Front.vertex(0, salleH+tablette1H+tablette2H, tablette2P);
    tablette2Front.vertex(0, salleH+tablette1H, tablette2P);
    tablette2Front.vertex(tablette2L, salleH+tablette1H, tablette2P);
    tablette2Front.vertex(tablette2L, salleH+tablette1H+tablette2H, tablette2P);
    tablette2Front.endShape(CLOSE);
    
    PShape tablette2Back = createShape();
    tablette2Back.beginShape(QUADS);
    tablette2Back.fill(couleur1);
    tablette2Back.stroke(couleur2);
    tablette2Back.vertex(0, salleH+tablette1H+tablette2H, 0);
    tablette2Back.vertex(0, salleH+tablette1H, 0);
    tablette2Back.vertex(tablette2L, salleH+tablette1H, 0);
    tablette2Back.vertex(tablette2L, salleH+tablette1H+tablette2H, 0);
    tablette2Back.endShape(CLOSE);
    
    PShape tablette2Top = createShape();
    tablette2Top.beginShape(QUADS);
    tablette2Top.fill(couleur1);
    tablette2Top.stroke(couleur2);
    tablette2Top.vertex(0, salleH+tablette1H, tablette2P);
    tablette2Top.vertex(0, salleH+tablette1H, 0);
    tablette2Top.vertex(tablette2L, salleH+tablette1H, 0);
    tablette2Top.vertex(tablette2L, salleH+tablette1H, tablette2P);
    tablette2Top.endShape(CLOSE);
    
    PShape tablette2Bottom= createShape();
    tablette2Bottom.beginShape(QUADS);
    tablette2Bottom.fill(couleur1);
    tablette2Bottom.stroke(couleur2);
    tablette2Bottom.vertex(0, salleH+tablette1H+tablette2H, tablette2P);
    tablette2Bottom.vertex(0, salleH+tablette1H+tablette2H, 0);
    tablette2Bottom.vertex(tablette2L, salleH+tablette1H+tablette2H, 0);
    tablette2Bottom.vertex(tablette2L, salleH+tablette1H+tablette2H, tablette2P);
    tablette2Bottom.endShape(CLOSE);
    
    PShape tablette2Left = createShape();
    tablette2Left.beginShape(QUADS);
    tablette2Left.fill(couleur1);
    tablette2Left.stroke(couleur2);
    tablette2Left.vertex(0, salleH+tablette1H, tablette2P);
    tablette2Left.vertex(0, salleH+tablette1H+tablette2H, tablette2P);
    tablette2Left.vertex(0, salleH+tablette1H+tablette2H, 0);
    tablette2Left.vertex(0, salleH+tablette1H, 0);
    tablette2Left.endShape(CLOSE);
    
    PShape tablette2Right = createShape();
    tablette2Right.beginShape(QUADS);
    tablette2Right.fill(couleur1);
    tablette2Right.stroke(couleur2);
    tablette2Right.vertex(tablette2L, salleH+tablette1H, tablette2P);
    tablette2Right.vertex(tablette2L, salleH+tablette1H+tablette2H, tablette2P);
    tablette2Right.vertex(tablette2L, salleH+tablette1H+tablette2H, 0);
    tablette2Right.vertex(tablette2L, salleH+tablette1H, 0);
    tablette2Right.endShape(CLOSE);
    
    tablette2.addChild(tablette2Front);
    tablette2.addChild(tablette2Back);
    tablette2.addChild(tablette2Top);
    tablette2.addChild(tablette2Bottom);
    tablette2.addChild(tablette2Left);
    tablette2.addChild(tablette2Right);
    
    return tablette2;
  }
}
