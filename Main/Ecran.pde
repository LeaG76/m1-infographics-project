/***************************************************************
 * Fichier de la classe Ecran, elle va nous permettre de créer *
 * un écran. Un écran est constitué d'un support, d'un pied,   *
 * d'un cadran avec des contours ainsi que d'un logo de la     *
 * marque et d'un logo/bouton d'alimentation. On va utiliser   *
 * cette classe dans la classe BlocPC pour la création d'un    *
 * bloc de Pc, c'est-à-dire écran, tour, clavier et souris.    *
 ***************************************************************/

class Ecran {
  // Dessin pour l'écran
  PShape ecran;
  // Variables des 2 couleurs que l'on va utiliser pour un écran
  color couleurGris, couleurGrisF;
  // Instance de la classe Cylindre pour le pied de l'écran
  Cylindre cylindre;
  /* Tableaux contenant plusieurs images qui vont nous servir à mettre
    aléatoirement des images sur les écrans d'ordinateur */
  PImage[] image;

  /* Constructeur sans argument */

  Ecran() {
    ecran = createShape(GROUP);
    couleurGris = color(#3E3936);
    couleurGrisF = color(#252024);
    cylindre = new Cylindre(30, piedER, piedEH);
    image = new PImage[12];
    image[0] = texEcranTactile;
    image[1] = texEcran1;
    image[2] = texEcran2;
    image[3] = texEcran3;
    image[4] = texEcran4;
    image[5] = texEcran5;
    image[6] = texEcran6;
    image[7] = texEcran7;
    image[8] = texEcran8;
    image[9] = texEcran9;
    image[10] = texEcran10;
    image[11] = texEcran11;
  }

  /* Fonction qui va nous retourner le dessin d'un écran
    en utilisant les méthodes creerCadran, creerContourH,
    creerLogoEcran, creerAlimentationEcran, creerContourV,
    creerSupport et creerPiedEcran */

  PShape creerEcran() {
    PShape cadran = creerCadran(couleurGris, couleurGrisF);
    cadran.translate(0, -supportH-piedEH/4, 0);

    PShape contourH1 = creerContourH(2, 1, couleurGrisF);
    contourH1.translate(0, -supportH-piedEH/4+2, 0);

    PShape contourH2 = creerContourH(1, 1, couleurGrisF);
    contourH2.translate(0, -supportH-piedEH-6.5, 0);

    PShape logo = creerLogoEcran(5, 1.8);
    logo.translate(-ecranL/2+2.5, -supportH-piedEH/4+1.9, 0.1);
    
    PShape alimentation = creerAlimentationEcran(0.8, 0.8);
    alimentation.translate(0.4, -supportH-piedEH/4+1.4, 0.1);

    PShape contourV1 = creerContourV(1, couleurGrisF);
    contourV1.translate(-ecranL, -supportH-piedEH/4, 0);

    PShape contourV2 = creerContourV(1, couleurGrisF);
    contourV2.translate(1, -supportH-piedEH/4, 0);

    PShape support = creerSupport(couleurGris, couleurGrisF);
    support.translate(-ecranL/2+supportL/2, 0, -ecranP-piedER+supportP/2);

    PShape pied = creerPiedEcran(couleurGrisF);
    pied.translate(-ecranL/2, salleH-piedEH/2-supportH, -ecranP-piedER);

    ecran.addChild(cadran);
    ecran.addChild(contourH1);
    ecran.addChild(contourH2);
    ecran.addChild(logo);
    ecran.addChild(alimentation);
    ecran.addChild(contourV1);
    ecran.addChild(contourV2);
    ecran.addChild(support);
    ecran.addChild(pied);

    return ecran;
  }

  /* Fonction qui va nous retourner le dessin
    d'un cadran d'écran */

  PShape creerCadran(color couleur1, color couleur2) {
    PShape cadran = createShape(GROUP);

    PShape cadranFront = createShape();
    cadranFront.beginShape(QUADS);
    cadranFront.textureMode(NORMAL);
    cadranFront.texture(image[(int) random(image.length)]);
    cadranFront.shininess(200.0);
    cadranFront.emissive(0, 0, 0);
    cadranFront.normal(0, 0, 1);
    cadranFront.stroke(couleur2);
    cadranFront.vertex(0, salleH, 0, 1, 1);
    cadranFront.vertex(0, salleH-ecranH, 0, 1, 0);
    cadranFront.vertex(-ecranL, salleH-ecranH, 0, 0, 0);
    cadranFront.vertex(-ecranL, salleH, 0, 0, 1);
    cadranFront.endShape(CLOSE);

    PShape cadranBack = createShape();
    cadranBack.beginShape(QUADS);
    cadranBack.fill(couleur1);
    cadranBack.stroke(couleur2);
    cadranBack.vertex(0, salleH, -ecranP);
    cadranBack.vertex(0, salleH-ecranH, -ecranP);
    cadranBack.vertex(-ecranL, salleH-ecranH, -ecranP);
    cadranBack.vertex(-ecranL, salleH, -ecranP);
    cadranBack.endShape(CLOSE);

    PShape cadranTop = createShape();
    cadranTop.beginShape(QUADS);
    cadranTop.fill(couleur1);
    cadranTop.stroke(couleur2);
    cadranTop.vertex(0, salleH-ecranH, -ecranP);
    cadranTop.vertex(0, salleH-ecranH, 0);
    cadranTop.vertex(-ecranL, salleH-ecranH, 0);
    cadranTop.vertex(-ecranL, salleH-ecranH, -ecranP);
    cadranTop.endShape(CLOSE);

    PShape cadranBottom = createShape();
    cadranBottom.beginShape(QUADS);
    cadranBottom.fill(couleur1);
    cadranBottom.stroke(couleur2);
    cadranBottom.vertex(0, salleH, -ecranP);
    cadranBottom.vertex(0, salleH, 0);
    cadranBottom.vertex(-ecranL, salleH, 0);
    cadranBottom.vertex(-ecranL, salleH, -ecranP);
    cadranBottom.endShape(CLOSE);

    PShape cadranLeft = createShape();
    cadranLeft.beginShape(QUADS);
    cadranLeft.fill(couleur1);
    cadranLeft.stroke(couleur2);
    cadranLeft.vertex(-ecranL, salleH, 0);
    cadranLeft.vertex(-ecranL, salleH-ecranH, 0);
    cadranLeft.vertex(-ecranL, salleH-ecranH, -ecranP);
    cadranLeft.vertex(-ecranL, salleH, -ecranP);
    cadranLeft.endShape(CLOSE);

    PShape cadranRight = createShape();
    cadranRight.beginShape(QUADS);
    cadranRight.fill(couleur1);
    cadranRight.stroke(couleur2);
    cadranRight.vertex(0, salleH, 0);
    cadranRight.vertex(0, salleH-ecranH, 0);
    cadranRight.vertex(0, salleH-ecranH, -ecranP);
    cadranRight.vertex(0, salleH, -ecranP);
    cadranRight.endShape(CLOSE);

    cadran.addChild(cadranFront);
    cadran.addChild(cadranBack);
    cadran.addChild(cadranTop);
    cadran.addChild(cadranBottom);
    cadran.addChild(cadranLeft);
    cadran.addChild(cadranRight);

    return cadran;
  }

  /* Fonction qui va nous retourner le dessin
    d'un contour horizontale d'écran */

  PShape creerContourH(float hauteur, float largeur, color couleur) {
    PShape contourH = createShape(GROUP);

    PShape contourHFront = createShape();
    contourHFront.beginShape(QUADS);
    contourHFront.fill(couleur);
    contourHFront.stroke(couleur);
    contourHFront.vertex(largeur, salleH, 0);
    contourHFront.vertex(largeur, salleH-hauteur, 0);
    contourHFront.vertex(-ecranL-largeur, salleH-hauteur, 0);
    contourHFront.vertex(-ecranL-largeur, salleH, 0);
    contourHFront.endShape(CLOSE);

    PShape contourHBack = createShape();
    contourHBack.beginShape(QUADS);
    contourHBack.fill(couleur);
    contourHBack.stroke(couleur);
    contourHBack.vertex(largeur, salleH, -ecranP);
    contourHBack.vertex(largeur, salleH-hauteur, -ecranP);
    contourHBack.vertex(-ecranL-largeur, salleH-hauteur, -ecranP);
    contourHBack.vertex(-ecranL-largeur, salleH, -ecranP);
    contourHBack.endShape(CLOSE);

    PShape contourHTop = createShape();
    contourHTop.beginShape(QUADS);
    contourHTop.fill(couleur);
    contourHTop.stroke(couleur);
    contourHTop.vertex(largeur, salleH-hauteur, -ecranP);
    contourHTop.vertex(largeur, salleH-hauteur, 0);
    contourHTop.vertex(-ecranL-largeur, salleH-hauteur, 0);
    contourHTop.vertex(-ecranL-largeur, salleH-hauteur, -ecranP);
    contourHTop.endShape(CLOSE);

    PShape contourHBottom = createShape();
    contourHBottom.beginShape(QUADS);
    contourHBottom.fill(couleur);
    contourHBottom.stroke(couleur);
    contourHBottom.vertex(largeur, salleH, -ecranP);
    contourHBottom.vertex(largeur, salleH, 0);
    contourHBottom.vertex(-ecranL-largeur, salleH, 0);
    contourHBottom.vertex(-ecranL-largeur, salleH, -ecranP);
    contourHBottom.endShape(CLOSE);

    PShape contourHLeft = createShape();
    contourHLeft.beginShape(QUADS);
    contourHLeft.fill(couleur);
    contourHLeft.stroke(couleur);
    contourHLeft.vertex(-ecranL-largeur, salleH, 0);
    contourHLeft.vertex(-ecranL-largeur, salleH-hauteur, 0);
    contourHLeft.vertex(-ecranL-largeur, salleH-hauteur, -ecranP);
    contourHLeft.vertex(-ecranL-largeur, salleH, -ecranP);
    contourHLeft.endShape(CLOSE);

    PShape contourHRight = createShape();
    contourHRight.beginShape(QUADS);
    contourHRight.fill(couleur);
    contourHRight.stroke(couleur);
    contourHRight.vertex(largeur, salleH, 0);
    contourHRight.vertex(largeur, salleH-hauteur, 0);
    contourHRight.vertex(largeur, salleH-hauteur, -ecranP);
    contourHRight.vertex(largeur, salleH, -ecranP);
    contourHRight.endShape(CLOSE);

    contourH.addChild(contourHFront);
    contourH.addChild(contourHBack);
    contourH.addChild(contourHTop);
    contourH.addChild(contourHBottom);
    contourH.addChild(contourHLeft);
    contourH.addChild(contourHRight);

    return contourH;
  }

  /* Fonction qui va nous retourner le dessin
    du logo de l'écran */

  PShape creerLogoEcran(float largeur, float hauteur) {
    PShape logo = createShape(GROUP);

    PShape logoFront = createShape();
    logoFront.beginShape(QUADS);
    logoFront.textureMode(NORMAL);
    logoFront.texture(texLogoDell);
    logoFront.shininess(200.0);
    logoFront.emissive(0, 0, 0);
    logoFront.normal(0, 0, 1);
    logoFront.noStroke();
    logoFront.vertex(0, salleH, 0, 1, 1);
    logoFront.vertex(0, salleH-hauteur, 0, 1, 0);
    logoFront.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    logoFront.vertex(-largeur, salleH, 0, 0, 1);
    logoFront.endShape(CLOSE);

    logo.addChild(logoFront);

    return logo;
  }

  /* Fonction qui va nous retourner le dessin
    du bouton d'alimentation de l'écran */
  
  PShape creerAlimentationEcran(float largeur, float hauteur) {
    PShape alimentation = createShape(GROUP);

    PShape alimentationFront = createShape();
    alimentationFront.beginShape(QUADS);
    alimentationFront.textureMode(NORMAL);
    alimentationFront.texture(texAlimentation);
    alimentationFront.shininess(200.0);
    alimentationFront.emissive(0, 0, 0);
    alimentationFront.normal(0, 0, 1);
    alimentationFront.noStroke();
    alimentationFront.vertex(0, salleH, 0, 1, 1);
    alimentationFront.vertex(0, salleH-hauteur, 0, 1, 0);
    alimentationFront.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    alimentationFront.vertex(-largeur, salleH, 0, 0, 1);
    alimentationFront.endShape(CLOSE);

    alimentation.addChild(alimentationFront);

    return alimentation;
  }

  /* Fonction qui va nous retourner le dessin
    d'un contour verticale d'écran */

  PShape creerContourV(float largeur, color couleur) {
    PShape contourV = createShape(GROUP);

    PShape contourVFront = createShape();
    contourVFront.beginShape(QUADS);
    contourVFront.fill(couleur);
    contourVFront.stroke(couleur);
    contourVFront.vertex(0, salleH, 0);
    contourVFront.vertex(0, salleH-ecranH, 0);
    contourVFront.vertex(-largeur, salleH-ecranH, 0);
    contourVFront.vertex(-largeur, salleH, 0);
    contourVFront.endShape(CLOSE);

    PShape contourVBack = createShape();
    contourVBack.beginShape(QUADS);
    contourVBack.fill(couleur);
    contourVBack.stroke(couleur);
    contourVBack.vertex(0, salleH, -ecranP);
    contourVBack.vertex(0, salleH-ecranH, -ecranP);
    contourVBack.vertex(-largeur, salleH-ecranH, -ecranP);
    contourVBack.vertex(-largeur, salleH, -ecranP);
    contourVBack.endShape(CLOSE);

    PShape contourVTop = createShape();
    contourVTop.beginShape(QUADS);
    contourVTop.fill(couleur);
    contourVTop.stroke(couleur);
    contourVTop.vertex(0, salleH-ecranH, -ecranP);
    contourVTop.vertex(0, salleH-ecranH, 0);
    contourVTop.vertex(-largeur, salleH-ecranH, 0);
    contourVTop.vertex(-largeur, salleH-ecranH, -ecranP);
    contourVTop.endShape(CLOSE);

    PShape contourVBottom= createShape();
    contourVBottom.beginShape(QUADS);
    contourVBottom.fill(couleur);
    contourVBottom.stroke(couleur);
    contourVBottom.vertex(0, salleH, -ecranP);
    contourVBottom.vertex(0, salleH, 0);
    contourVBottom.vertex(-largeur, salleH, 0);
    contourVBottom.vertex(-largeur, salleH, -ecranP);
    contourVBottom.endShape(CLOSE);

    PShape contourVLeft = createShape();
    contourVLeft.beginShape(QUADS);
    contourVLeft.fill(couleur);
    contourVLeft.stroke(couleur);
    contourVLeft.vertex(-largeur, salleH, 0);
    contourVLeft.vertex(-largeur, salleH-ecranH, 0);
    contourVLeft.vertex(-largeur, salleH-ecranH, -ecranP);
    contourVLeft.vertex(-largeur, salleH, -ecranP);
    contourVLeft.endShape(CLOSE);

    PShape contourVRight = createShape();
    contourVRight.beginShape(QUADS);
    contourVRight.fill(couleur);
    contourVRight.stroke(couleur);
    contourVRight.vertex(0, salleH, 0);
    contourVRight.vertex(0, salleH-ecranH, 0);
    contourVRight.vertex(0, salleH-ecranH, -ecranP);
    contourVRight.vertex(0, salleH, -ecranP);
    contourVRight.endShape(CLOSE);

    contourV.addChild(contourVFront);
    contourV.addChild(contourVBack);
    contourV.addChild(contourVTop);
    contourV.addChild(contourVBottom);
    contourV.addChild(contourVLeft);
    contourV.addChild(contourVRight);

    return contourV;
  }

  /* Fonction qui va nous retourner le dessin
    d'un support d'écran */

  PShape creerSupport(color couleur1, color couleur2) {
    PShape support = createShape(GROUP);

    PShape supportFront = createShape();
    supportFront.beginShape(QUADS);
    supportFront.fill(couleur1);
    supportFront.stroke(couleur2);
    supportFront.vertex(0, salleH, 0);
    supportFront.vertex(0, salleH-supportH, 0);
    supportFront.vertex(-supportL, salleH-supportH, 0);
    supportFront.vertex(-supportL, salleH, 0);
    supportFront.endShape(CLOSE);

    PShape supportBack = createShape();
    supportBack.beginShape(QUADS);
    supportBack.fill(couleur1);
    supportBack.stroke(couleur2);
    supportBack.vertex(0, salleH, -supportP);
    supportBack.vertex(0, salleH-supportH, -supportP);
    supportBack.vertex(-supportL, salleH-supportH, -supportP);
    supportBack.vertex(-supportL, salleH, -supportP);
    supportBack.endShape(CLOSE);

    PShape supportTop = createShape();
    supportTop.beginShape(QUADS);
    supportTop.fill(couleur1);
    supportTop.stroke(couleur2);
    supportTop.vertex(0, salleH-supportH, -supportP);
    supportTop.vertex(0, salleH-supportH, 0);
    supportTop.vertex(-supportL, salleH-supportH, 0);
    supportTop.vertex(-supportL, salleH-supportH, -supportP);
    supportTop.endShape(CLOSE);

    PShape supportBottom = createShape();
    supportBottom.beginShape(QUADS);
    supportBottom.fill(couleur1);
    supportBottom.stroke(couleur2);
    supportBottom.vertex(0, salleH, -supportP);
    supportBottom.vertex(0, salleH, 0);
    supportBottom.vertex(-supportL, salleH, 0);
    supportBottom.vertex(-supportL, salleH, -supportP);
    supportBottom.endShape(CLOSE);

    PShape supportLeft = createShape();
    supportLeft.beginShape(QUADS);
    supportLeft.fill(couleur1);
    supportLeft.stroke(couleur2);
    supportLeft.vertex(-supportL, salleH, 0);
    supportLeft.vertex(-supportL, salleH-supportH, 0);
    supportLeft.vertex(-supportL, salleH-supportH, -supportP);
    supportLeft.vertex(-supportL, salleH, -supportP);
    supportLeft.endShape(CLOSE);

    PShape supportRight = createShape();
    supportRight.beginShape(QUADS);
    supportRight.fill(couleur1);
    supportRight.stroke(couleur2);
    supportRight.vertex(0, salleH, 0);
    supportRight.vertex(0, salleH-supportH, 0);
    supportRight.vertex(0, salleH-supportH, -supportP);
    supportRight.vertex(0, salleH, -supportP);
    supportRight.endShape(CLOSE);

    support.addChild(supportFront);
    support.addChild(supportBack);
    support.addChild(supportTop);
    support.addChild(supportBottom);
    support.addChild(supportLeft);
    support.addChild(supportRight);

    return support;
  }

  /* Fonction qui va nous retourner le dessin
    d'un pied d'écran */

  PShape creerPiedEcran(color couleur) {
    PShape piedEcran = cylindre.drawCylindre(couleur);
    piedEcran.rotateX(-PI/2);
    return piedEcran;
  }
}
