/****************************************************************
 * Fichier de la classe EcranTactile, elle va nous permettre de *
 * créer le grand écran tactile qui se trouve près du tableau.  *
 * Cet écran est constitué d'un support, d'un pied, de l'écran  *
 * (avec la texture de l'écran tactile), d'un cadran (derrière  *
 * l'écran) et de contours autour de l'écran. On ajoutera aussi *
 * le logo de la marque de l'écran sur le contour horizontal    *
 * de l'écran.                                                  *
 ****************************************************************/

class EcranTactile {
  // Dessin pour l'écran tactile
  PShape ecranTactile;
  // Variables des couleurs que l'on va utiliser pour l'écran tactile
  color couleurGris, couleurGrisF;

  /* Constructeur sans argument */

  EcranTactile() {
    ecranTactile = createShape(GROUP);
    couleurGris = color(#3E3936);
    couleurGrisF = color(#252024);
  }

  /* Fonction qui va nous retourner le dessin de l'écran tactile
    en utilisant les fonctions creerEcran, creerContourH, creerLogoEcran
    creerContourV, creerCadran, creerSupport et creerPied */

  PShape creerEcran() {
    PShape ecran = creerEcran(couleurGris, couleurGrisF);
    ecran.translate(-supportETL/2+ecranTL/2, -111, -supportETP+piedETP+supportETP/4+ecranTP+5);

    PShape contourH1 = creerContourH(5, 2, couleurGrisF);
    contourH1.translate(-supportETL/2+ecranTL/2, -106, -supportETP+piedETP+supportETP/4+ecranTP+5);
    
    PShape logo = creerLogoEcran(15, 4.5);
    logo.translate(-supportETL/2+piedETL/2-1, -106.25, -supportETP+piedETP+supportETP/4+ecranTP+5.1);

    PShape contourH2 = creerContourH(2, 2, couleurGrisF);
    contourH2.translate(-supportETL/2+ecranTL/2, -111-ecranTH, -supportETP+piedETP+supportETP/4+ecranTP+5);

    PShape contourV1 = creerContourV(2, couleurGrisF);
    contourV1.translate(-supportETL/2+ecranTL/2+2, -111, -supportETP+piedETP+supportETP/4+ecranTP+5);

    PShape contourV2 = creerContourV(2, couleurGrisF);
    contourV2.translate(-supportETL/2-ecranTL/2, -111, -supportETP+piedETP+supportETP/4+ecranTP+5);

    PShape cadran = creerCadran(couleurGris, couleurGrisF);
    cadran.translate(-supportETL/2+ecranTL/4, -116-ecranTH/4, -supportETP+piedETP+supportETP/4+5);

    PShape support = creerSupport(couleurGris, couleurGrisF);

    PShape pied = creerPied(couleurGrisF, couleurGrisF);
    pied.translate(piedETL/2-supportETL/2, -supportETH, -supportETP+piedETP+supportETP/4);

    ecranTactile.addChild(ecran);
    ecranTactile.addChild(contourH1);
    ecranTactile.addChild(logo);
    ecranTactile.addChild(contourH2);
    ecranTactile.addChild(contourV1);
    ecranTactile.addChild(contourV2);
    ecranTactile.addChild(cadran);
    ecranTactile.addChild(support);
    ecranTactile.addChild(pied);

    ecranTactile.rotateY(PI/6);
    ecranTactile.translate(-salleL+supportETL+supportETL/2, 0, -salleP+2*supportETP);

    return ecranTactile;
  }

  /* Fonction qui va nous retourner le dessin de la zone
    tactile de l'écran tactile */

  PShape creerEcran(color couleur1, color couleur2) {
    PShape ecran = createShape(GROUP);

    PShape ecranFront = createShape();
    ecranFront.beginShape(QUADS);
    ecranFront.textureMode(NORMAL);
    ecranFront.texture(texEcranTactile);
    ecranFront.shininess(200.0);
    ecranFront.emissive(0, 0, 0);
    ecranFront.normal(0, 0, 1);
    ecranFront.stroke(couleur2);
    ecranFront.vertex(0, salleH, 0, 1, 1);
    ecranFront.vertex(0, salleH-ecranTH, 0, 1, 0);
    ecranFront.vertex(-ecranTL, salleH-ecranTH, 0, 0, 0);
    ecranFront.vertex(-ecranTL, salleH, 0, 0, 1);
    ecranFront.endShape(CLOSE);

    PShape ecranBack = createShape();
    ecranBack.beginShape(QUADS);
    ecranBack.fill(couleur1);
    ecranBack.stroke(couleur2);
    ecranBack.vertex(0, salleH, -ecranTP);
    ecranBack.vertex(0, salleH-ecranTH, -ecranTP);
    ecranBack.vertex(-ecranTL, salleH-ecranTH, -ecranTP);
    ecranBack.vertex(-ecranTL, salleH, -ecranTP);
    ecranBack.endShape(CLOSE);

    PShape ecranTop = createShape();
    ecranTop.beginShape(QUADS);
    ecranTop.fill(couleur1);
    ecranTop.stroke(couleur2);
    ecranTop.vertex(0, salleH-ecranTH, -ecranTP);
    ecranTop.vertex(0, salleH-ecranTH, 0);
    ecranTop.vertex(-ecranTL, salleH-ecranTH, 0);
    ecranTop.vertex(-ecranTL, salleH-ecranTH, -ecranTP);
    ecranTop.endShape(CLOSE);

    PShape ecranBottom = createShape();
    ecranBottom.beginShape(QUADS);
    ecranBottom.fill(couleur1);
    ecranBottom.stroke(couleur2);
    ecranBottom.vertex(0, salleH, -ecranTP);
    ecranBottom.vertex(0, salleH, 0);
    ecranBottom.vertex(-ecranTL, salleH, 0);
    ecranBottom.vertex(-ecranTL, salleH, -ecranTP);
    ecranBottom.endShape(CLOSE);

    PShape ecranLeft = createShape();
    ecranLeft.beginShape(QUADS);
    ecranLeft.fill(couleur1);
    ecranLeft.stroke(couleur2);
    ecranLeft.vertex(-ecranTL, salleH, 0);
    ecranLeft.vertex(-ecranTL, salleH-ecranTH, 0);
    ecranLeft.vertex(-ecranTL, salleH-ecranTH, -ecranTP);
    ecranLeft.vertex(-ecranTL, salleH, -ecranTP);
    ecranLeft.endShape(CLOSE);

    PShape ecranRight = createShape();
    ecranRight.beginShape(QUADS);
    ecranRight.fill(couleur1);
    ecranRight.stroke(couleur2);
    ecranRight.vertex(0, salleH, 0);
    ecranRight.vertex(0, salleH-ecranTH, 0);
    ecranRight.vertex(0, salleH-ecranTH, -ecranTP);
    ecranRight.vertex(0, salleH, -ecranTP);
    ecranRight.endShape(CLOSE);

    ecran.addChild(ecranFront);
    ecran.addChild(ecranBack);
    ecran.addChild(ecranTop);
    ecran.addChild(ecranBottom);
    ecran.addChild(ecranLeft);
    ecran.addChild(ecranRight);

    return ecran;
  }

  /* Fonction qui va nous retourner le dessin du logo de l'écran tactile */

  PShape creerLogoEcran(float largeur, float hauteur) {
    PShape logo = createShape(GROUP);

    PShape logoFront = createShape();
    logoFront.beginShape(QUADS);
    logoFront.textureMode(NORMAL);
    logoFront.texture(texLogoSpeechi);
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

  /* Fonction qui va nous retourner le dessin d'un contour
    horizontale de l'écran tactile */

  PShape creerContourH(float hauteur, float largeur, color couleur) {
    PShape contourH = createShape(GROUP);

    PShape contourHFront = createShape();
    contourHFront.beginShape(QUADS);
    contourHFront.fill(couleur);
    contourHFront.stroke(couleur);
    contourHFront.vertex(largeur, salleH, 0);
    contourHFront.vertex(largeur, salleH-hauteur, 0);
    contourHFront.vertex(-ecranTL-largeur, salleH-hauteur, 0);
    contourHFront.vertex(-ecranTL-largeur, salleH, 0);
    contourHFront.endShape(CLOSE);

    PShape contourHBack = createShape();
    contourHBack.beginShape(QUADS);
    contourHBack.fill(couleur);
    contourHBack.stroke(couleur);
    contourHBack.vertex(largeur, salleH, -ecranTP);
    contourHBack.vertex(largeur, salleH-hauteur, -ecranTP);
    contourHBack.vertex(-ecranTL-largeur, salleH-hauteur, -ecranTP);
    contourHBack.vertex(-ecranTL-largeur, salleH, -ecranTP);
    contourHBack.endShape(CLOSE);

    PShape contourHTop = createShape();
    contourHTop.beginShape(QUADS);
    contourHTop.fill(couleur);
    contourHTop.stroke(couleur);
    contourHTop.vertex(largeur, salleH-hauteur, -ecranTP);
    contourHTop.vertex(largeur, salleH-hauteur, 0);
    contourHTop.vertex(-ecranTL-largeur, salleH-hauteur, 0);
    contourHTop.vertex(-ecranTL-largeur, salleH-hauteur, -ecranTP);
    contourHTop.endShape(CLOSE);

    PShape contourHBottom = createShape();
    contourHBottom.beginShape(QUADS);
    contourHBottom.fill(couleur);
    contourHBottom.stroke(couleur);
    contourHBottom.vertex(largeur, salleH, -ecranTP);
    contourHBottom.vertex(largeur, salleH, 0);
    contourHBottom.vertex(-ecranTL-largeur, salleH, 0);
    contourHBottom.vertex(-ecranTL-largeur, salleH, -ecranTP);
    contourHBottom.endShape(CLOSE);

    PShape contourHLeft = createShape();
    contourHLeft.beginShape(QUADS);
    contourHLeft.fill(couleur);
    contourHLeft.stroke(couleur);
    contourHLeft.vertex(-ecranTL-largeur, salleH, 0);
    contourHLeft.vertex(-ecranTL-largeur, salleH-hauteur, 0);
    contourHLeft.vertex(-ecranTL-largeur, salleH-hauteur, -ecranTP);
    contourHLeft.vertex(-ecranTL-largeur, salleH, -ecranTP);
    contourHLeft.endShape(CLOSE);

    PShape contourHRight = createShape();
    contourHRight.beginShape(QUADS);
    contourHRight.fill(couleur);
    contourHRight.stroke(couleur);
    contourHRight.vertex(largeur, salleH, 0);
    contourHRight.vertex(largeur, salleH-hauteur, 0);
    contourHRight.vertex(largeur, salleH-hauteur, -ecranTP);
    contourHRight.vertex(largeur, salleH, -ecranTP);
    contourHRight.endShape(CLOSE);

    contourH.addChild(contourHFront);
    contourH.addChild(contourHBack);
    contourH.addChild(contourHTop);
    contourH.addChild(contourHBottom);
    contourH.addChild(contourHLeft);
    contourH.addChild(contourHRight);

    return contourH;
  }

  /* Fonction qui va nous retourner le dessin d'un contour
    verticale de l'écran tactile */

  PShape creerContourV(float largeur, color couleur) {
    PShape contourV = createShape(GROUP);

    PShape contourVFront = createShape();
    contourVFront.beginShape(QUADS);
    contourVFront.fill(couleur);
    contourVFront.stroke(couleur);
    contourVFront.vertex(0, salleH, 0);
    contourVFront.vertex(0, salleH-ecranTH, 0);
    contourVFront.vertex(-largeur, salleH-ecranTH, 0);
    contourVFront.vertex(-largeur, salleH, 0);
    contourVFront.endShape(CLOSE);

    PShape contourVBack = createShape();
    contourVBack.beginShape(QUADS);
    contourVBack.fill(couleur);
    contourVBack.stroke(couleur);
    contourVBack.vertex(0, salleH, -ecranTP);
    contourVBack.vertex(0, salleH-ecranTH, -ecranTP);
    contourVBack.vertex(-largeur, salleH-ecranTH, -ecranTP);
    contourVBack.vertex(-largeur, salleH, -ecranTP);
    contourVBack.endShape(CLOSE);

    PShape contourVTop = createShape();
    contourVTop.beginShape(QUADS);
    contourVTop.fill(couleur);
    contourVTop.stroke(couleur);
    contourVTop.vertex(0, salleH-ecranTH, -ecranTP);
    contourVTop.vertex(0, salleH-ecranTH, 0);
    contourVTop.vertex(-largeur, salleH-ecranTH, 0);
    contourVTop.vertex(-largeur, salleH-ecranTH, -ecranTP);
    contourVTop.endShape(CLOSE);
    
    PShape contourVBottom= createShape();
    contourVBottom.beginShape(QUADS);
    contourVBottom.fill(couleur);
    contourVBottom.stroke(couleur);
    contourVBottom.vertex(0, salleH, -ecranTP);
    contourVBottom.vertex(0, salleH, 0);
    contourVBottom.vertex(-largeur, salleH, 0);
    contourVBottom.vertex(-largeur, salleH, -ecranTP);
    contourVBottom.endShape(CLOSE);
    
    PShape contourVLeft = createShape();
    contourVLeft.beginShape(QUADS);
    contourVLeft.fill(couleur);
    contourVLeft.stroke(couleur);
    contourVLeft.vertex(-largeur, salleH, 0);
    contourVLeft.vertex(-largeur, salleH-ecranTH, 0);
    contourVLeft.vertex(-largeur, salleH-ecranTH, -ecranTP);
    contourVLeft.vertex(-largeur, salleH, -ecranTP);
    contourVLeft.endShape(CLOSE);
    
    PShape contourVRight = createShape();
    contourVRight.beginShape(QUADS);
    contourVRight.fill(couleur);
    contourVRight.stroke(couleur);
    contourVRight.vertex(0, salleH, 0);
    contourVRight.vertex(0, salleH-ecranTH, 0);
    contourVRight.vertex(0, salleH-ecranTH, -ecranTP);
    contourVRight.vertex(0, salleH, -ecranTP);
    contourVRight.endShape(CLOSE);

    contourV.addChild(contourVFront);
    contourV.addChild(contourVBack);
    contourV.addChild(contourVTop);
    contourV.addChild(contourVBottom);
    contourV.addChild(contourVLeft);
    contourV.addChild(contourVRight);

    return contourV;
  }

  /* Fonction qui va nous retourner le dessin du cadran de l'écran tactile */

  PShape creerCadran(color couleur1, color couleur2) {
    PShape cadran = createShape(GROUP);

    PShape cadranFront = createShape();
    cadranFront.beginShape(QUADS);
    cadranFront.fill(couleur1);
    cadranFront.stroke(couleur2);
    cadranFront.vertex(0, salleH, 0);
    cadranFront.vertex(0, salleH-ecranTH/2, 0);
    cadranFront.vertex(-ecranTL/2, salleH-ecranTH/2, 0);
    cadranFront.vertex(-ecranTL/2, salleH, 0);
    cadranFront.endShape(CLOSE);

    PShape cadranBack = createShape();
    cadranBack.beginShape(QUADS);
    cadranBack.fill(couleur1);
    cadranBack.stroke(couleur2);
    cadranBack.vertex(0, salleH, -5);
    cadranBack.vertex(0, salleH-ecranTH/2, -5);
    cadranBack.vertex(-ecranTL/2, salleH-ecranTH/2, -5);
    cadranBack.vertex(-ecranTL/2, salleH, -5);
    cadranBack.endShape(CLOSE);

    PShape cadranTop = createShape();
    cadranTop.beginShape(QUADS);
    cadranTop.fill(couleur2);
    cadranTop.stroke(couleur2);
    cadranTop.vertex(0, salleH-ecranTH/2, -5);
    cadranTop.vertex(0, salleH-ecranTH/2, 0);
    cadranTop.vertex(-ecranTL/2, salleH-ecranTH/2, 0);
    cadranTop.vertex(-ecranTL/2, salleH-ecranTH/2, -5);
    cadranTop.endShape(CLOSE);

    PShape cadranBottom = createShape();
    cadranBottom.beginShape(QUADS);
    cadranBottom.fill(couleur2);
    cadranBottom.stroke(couleur2);
    cadranBottom.vertex(0, salleH, -5);
    cadranBottom.vertex(0, salleH, 0);
    cadranBottom.vertex(-ecranTL/2, salleH, 0);
    cadranBottom.vertex(-ecranTL/2, salleH, -5);
    cadranBottom.endShape(CLOSE);

    PShape cadranLeft = createShape();
    cadranLeft.beginShape(QUADS);
    cadranLeft.fill(couleur2);
    cadranLeft.stroke(couleur2);
    cadranLeft.vertex(-ecranTL/2, salleH, 0);
    cadranLeft.vertex(-ecranTL/2, salleH-ecranTH/2, 0);
    cadranLeft.vertex(-ecranTL/2, salleH-ecranTH/2, -5);
    cadranLeft.vertex(-ecranTL/2, salleH, -5);
    cadranLeft.endShape(CLOSE);

    PShape cadranRight = createShape();
    cadranRight.beginShape(QUADS);
    cadranRight.fill(couleur2);
    cadranRight.stroke(couleur2);
    cadranRight.vertex(0, salleH, 0);
    cadranRight.vertex(0, salleH-ecranTH/2, 0);
    cadranRight.vertex(0, salleH-ecranTH/2, -5);
    cadranRight.vertex(0, salleH, -5);
    cadranRight.endShape(CLOSE);

    cadran.addChild(cadranFront);
    cadran.addChild(cadranBack);
    cadran.addChild(cadranTop);
    cadran.addChild(cadranBottom);
    cadran.addChild(cadranLeft);
    cadran.addChild(cadranRight);

    return cadran;
  }

  /* Fonction qui va nous retourner le dessin du support de l'écran tactile */

  PShape creerSupport(color couleur1, color couleur2) {
    PShape support = createShape(GROUP);

    PShape supportFront = createShape();
    supportFront.beginShape(QUADS);
    supportFront.fill(couleur1);
    supportFront.stroke(couleur2);
    supportFront.vertex(0, salleH, 0);
    supportFront.vertex(0, salleH-supportETH, 0);
    supportFront.vertex(-supportETL, salleH-supportETH, 0);
    supportFront.vertex(-supportETL, salleH, 0);
    supportFront.endShape(CLOSE);

    PShape supportBack = createShape();
    supportBack.beginShape(QUADS);
    supportBack.fill(couleur1);
    supportBack.stroke(couleur2);
    supportBack.vertex(0, salleH, -supportETP);
    supportBack.vertex(0, salleH-supportETH, -supportETP);
    supportBack.vertex(-supportETL, salleH-supportETH, -supportETP);
    supportBack.vertex(-supportETL, salleH, -supportETP);
    supportBack.endShape(CLOSE);

    PShape supportTop = createShape();
    supportTop.beginShape(QUADS);
    supportTop.fill(couleur1);
    supportTop.stroke(couleur2);
    supportTop.vertex(0, salleH-supportETH, -supportETP);
    supportTop.vertex(0, salleH-supportETH, 0);
    supportTop.vertex(-supportETL, salleH-supportETH, 0);
    supportTop.vertex(-supportETL, salleH-supportETH, -supportETP);
    supportTop.endShape(CLOSE);

    PShape supportBottom = createShape();
    supportBottom.beginShape(QUADS);
    supportBottom.fill(couleur1);
    supportBottom.stroke(couleur2);
    supportBottom.vertex(0, salleH, -supportETP);
    supportBottom.vertex(0, salleH, 0);
    supportBottom.vertex(-supportETL, salleH, 0);
    supportBottom.vertex(-supportETL, salleH, -supportETP);
    supportBottom.endShape(CLOSE);

    PShape supportLeft = createShape();
    supportLeft.beginShape(QUADS);
    supportLeft.fill(couleur1);
    supportLeft.stroke(couleur2);
    supportLeft.vertex(-supportETL, salleH, 0);
    supportLeft.vertex(-supportETL, salleH-supportETH, 0);
    supportLeft.vertex(-supportETL, salleH-supportETH, -supportETP);
    supportLeft.vertex(-supportETL, salleH, -supportETP);
    supportLeft.endShape(CLOSE);

    PShape supportRight = createShape();
    supportRight.beginShape(QUADS);
    supportRight.fill(couleur1);
    supportRight.stroke(couleur2);
    supportRight.vertex(0, salleH, 0);
    supportRight.vertex(0, salleH-supportETH, 0);
    supportRight.vertex(0, salleH-supportETH, -supportETP);
    supportRight.vertex(0, salleH, -supportETP);
    supportRight.endShape(CLOSE);

    support.addChild(supportFront);
    support.addChild(supportBack);
    support.addChild(supportTop);
    support.addChild(supportBottom);
    support.addChild(supportLeft);
    support.addChild(supportRight);

    return support;
  }

  /* Fonction qui va nous retourner le dessin du pied de l'écran tactile */

  PShape creerPied(color couleur1, color couleur2) {
    PShape pied = createShape(GROUP);

    PShape piedFront = createShape();
    piedFront.beginShape(QUADS);
    piedFront.fill(couleur1);
    piedFront.stroke(couleur2);
    piedFront.vertex(0, salleH, 0);
    piedFront.vertex(0, salleH-piedETH, 0);
    piedFront.vertex(-piedETL, salleH-piedETH, 0);
    piedFront.vertex(-piedETL, salleH, 0);
    piedFront.endShape(CLOSE);

    PShape piedBack = createShape();
    piedBack.beginShape(QUADS);
    piedBack.fill(couleur1);
    piedBack.stroke(couleur2);
    piedBack.vertex(0, salleH, -piedETP);
    piedBack.vertex(0, salleH-piedETH, -piedETP);
    piedBack.vertex(-piedETL, salleH-piedETH, -piedETP);
    piedBack.vertex(-piedETL, salleH, -piedETP);
    piedBack.endShape(CLOSE);

    PShape piedTop = createShape();
    piedTop.beginShape(QUADS);
    piedTop.fill(couleur1);
    piedTop.stroke(couleur2);
    piedTop.vertex(0, salleH-piedETH, -piedETP);
    piedTop.vertex(0, salleH-piedETH, 0);
    piedTop.vertex(-piedETL, salleH-piedETH, 0);
    piedTop.vertex(-piedETL, salleH-piedETH, -piedETP);
    piedTop.endShape(CLOSE);

    PShape piedBottom = createShape();
    piedBottom.beginShape(QUADS);
    piedBottom.fill(couleur1);
    piedBottom.stroke(couleur2);
    piedBottom.vertex(0, salleH, -piedETP);
    piedBottom.vertex(0, salleH, 0);
    piedBottom.vertex(-piedETL, salleH, 0);
    piedBottom.vertex(-piedETL, salleH, -piedETP);
    piedBottom.endShape(CLOSE);

    PShape piedLeft = createShape();
    piedLeft.beginShape(QUADS);
    piedLeft.fill(couleur1);
    piedLeft.stroke(couleur2);
    piedLeft.vertex(-piedETL, salleH, 0);
    piedLeft.vertex(-piedETL, salleH-piedETH, 0);
    piedLeft.vertex(-piedETL, salleH-piedETH, -piedETP);
    piedLeft.vertex(-piedETL, salleH, -piedETP);
    piedLeft.endShape(CLOSE);

    PShape piedRight = createShape();
    piedRight.beginShape(QUADS);
    piedRight.fill(couleur1);
    piedRight.stroke(couleur2);
    piedRight.vertex(0, salleH, 0);
    piedRight.vertex(0, salleH-piedETH, 0);
    piedRight.vertex(0, salleH-piedETH, -piedETP);
    piedRight.vertex(0, salleH, -piedETP);
    piedRight.endShape(CLOSE);

    pied.addChild(piedFront);
    pied.addChild(piedBack);
    pied.addChild(piedTop);
    pied.addChild(piedBottom);
    pied.addChild(piedLeft);
    pied.addChild(piedRight);

    return pied;
  }
}
