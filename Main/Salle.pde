/**********************************************************************
 * Fichier de la classe Salle, elle va nous permettre de réaliser les *
 * 4 murs, sol, plafond et plinthes de la salle A106 en mettant une   *
 * épaisseur pour les murs                                            *
 **********************************************************************/

class Salle {
  // Dessin de la salle
  PShape salle;
  // Variables des 3 couleurs que l'on va utiliser pour la salle
  color couleurSol, couleurPlafond, couleurMur;
  // Variable pour l'épaisseur des murs
  int couche;

  /* Constructeur qui prend en argument la couche */

  Salle(int couche) {
    // La salle est un groupe de dessin
    salle = createShape(GROUP);
    // Initialisation des couleurs
    couleurSol = color(#7A4034);
    couleurMur = color(#e9e3d3);
    couleurPlafond = color(#D1CCC6);
    this.couche = couche;
  }

  /* Fonction qui va nous retourner le dessin de la salle entière
    en utilisant les autres fonctions de la classe */

  PShape creerSalle() {
    // Création des formes qui composent la salle
    PShape sol = creerSol();
    PShape mur1 = creerMur1();
    PShape mur2 = creerMur2();
    PShape mur3 = creerMur3();
    PShape mur4 = creerMur4();
    PShape plafond = creerPlafond();
    PShape plinthes = creerPlinthes();
    PShape afficheTableau = creerDetailsMur();

    // Ajout de ces formes au groupe 'salle'
    salle.addChild(sol);
    salle.addChild(mur1);
    salle.addChild(mur2);
    salle.addChild(mur3);
    salle.addChild(mur4);
    salle.addChild(plafond);
    salle.addChild(plinthes);
    salle.addChild(afficheTableau);

    return salle;
  }

  /* Fonction qui va nous retourner le dessin du sol de la pièce */

  PShape creerSol() {
    PShape sol = createShape(GROUP);

    // Face avec la texture du sol
    PShape solTop = createShape();
    solTop.beginShape(QUADS);
    solTop.textureMode(NORMAL);
    solTop.texture(texSol);
    solTop.shininess(200.0);
    solTop.emissive(0, 0, 0);
    solTop.normal(0, 0, 1);
    solTop.stroke(couleurSol);
    solTop.vertex(-salleL, salleH, salleP, 0, 1);
    solTop.vertex(salleL, salleH, salleP, 1, 1);
    solTop.vertex(salleL, salleH, -salleP, 1, 0);
    solTop.vertex(-salleL, salleH, -salleP, 0, 0);
    solTop.endShape(CLOSE);

    PShape solBottom = createShape();
    solBottom.beginShape(QUADS);
    solBottom.fill(couleurSol);
    solBottom.stroke(couleurSol);
    solBottom.vertex(-salleL, salleH+couche, salleP);
    solBottom.vertex(salleL, salleH+couche, salleP);
    solBottom.vertex(salleL, salleH+couche, -salleP);
    solBottom.vertex(-salleL, salleH+couche, -salleP);
    solBottom.endShape(CLOSE);

    PShape solLeft = createShape();
    solLeft.beginShape(QUADS);
    solLeft.fill(couleurSol);
    solLeft.stroke(couleurSol);
    solLeft.vertex(-salleL, salleH, salleP);
    solLeft.vertex(-salleL, salleH, -salleP);
    solLeft.vertex(-salleL, salleH+couche, -salleP);
    solLeft.vertex(-salleL, salleH+couche, salleP);
    solLeft.endShape(CLOSE);

    PShape solRight = createShape();
    solRight.beginShape(QUADS);
    solRight.fill(couleurSol);
    solRight.stroke(couleurSol);
    solRight.vertex(salleL, salleH, -salleP);
    solRight.vertex(salleL, salleH, salleP);
    solRight.vertex(salleL, salleH+couche, salleP);
    solRight.vertex(salleL, salleH+couche, -salleP);
    solRight.endShape(CLOSE);

    PShape solFront = createShape();
    solFront.beginShape(QUADS);
    solFront.fill(couleurSol);
    solFront.stroke(couleurSol);
    solFront.vertex(-salleL, salleH, -salleP);
    solFront.vertex(salleL, salleH, -salleP);
    solFront.vertex(salleL, salleH+couche, -salleP);
    solFront.vertex(-salleL, salleH+couche, -salleP);
    solFront.endShape(CLOSE);

    PShape solBack = createShape();
    solBack.beginShape(QUADS);
    solBack.fill(couleurSol);
    solBack.stroke(couleurSol);
    solBack.vertex(salleL, salleH, salleP);
    solBack.vertex(-salleL, salleH, salleP);
    solBack.vertex(-salleL, salleH+couche, salleP);
    solBack.vertex(salleL, salleH+couche, salleP);
    solBack.endShape(CLOSE);

    sol.addChild(solTop);
    sol.addChild(solBottom);
    sol.addChild(solLeft);
    sol.addChild(solRight);
    sol.addChild(solFront);
    sol.addChild(solBack);

    return sol;
  }

  /* Fonction qui va nous retourner le dessin du mur de devant (tableau) */

  PShape creerMur1() {
    PShape mur1 = createShape(GROUP);

    PShape mur1Top = createShape();
    mur1Top.beginShape(QUADS);
    mur1Top.fill(couleurMur);
    mur1Top.stroke(couleurMur);
    mur1Top.vertex(-salleL, -salleH, -salleP);
    mur1Top.vertex(salleL, -salleH, -salleP);
    mur1Top.vertex(salleL, -salleH, -salleP-couche);
    mur1Top.vertex(-salleL, -salleH, -salleP-couche);
    mur1Top.endShape(CLOSE);

    PShape mur1Bottom = createShape();
    mur1Bottom.beginShape(QUADS);
    mur1Bottom.fill(couleurMur);
    mur1Bottom.stroke(couleurMur);
    mur1Bottom.vertex(-salleL, salleH, -salleP);
    mur1Bottom.vertex(salleL, salleH, -salleP);
    mur1Bottom.vertex(salleL, salleH, -salleP-couche);
    mur1Bottom.vertex(-salleL, salleH, -salleP-couche);
    mur1Bottom.endShape(CLOSE);

    PShape mur1Left = createShape();
    mur1Left.beginShape(QUADS);
    mur1Left.fill(couleurMur);
    mur1Left.stroke(couleurMur);
    mur1Left.vertex(-salleL, -salleH, -salleP);
    mur1Left.vertex(-salleL, -salleH, -salleP-couche);
    mur1Left.vertex(-salleL, salleH, -salleP-couche);
    mur1Left.vertex(-salleL, salleH, -salleP);
    mur1Left.endShape(CLOSE);

    PShape mur1Right = createShape();
    mur1Right.beginShape(QUADS);
    mur1Right.fill(couleurMur);
    mur1Right.stroke(couleurMur);
    mur1Right.vertex(salleL, -salleH, -salleP-couche);
    mur1Right.vertex(salleL, -salleH, -salleP);
    mur1Right.vertex(salleL, salleH, -salleP);
    mur1Right.vertex(salleL, salleH, -salleP-couche);
    mur1Right.endShape(CLOSE);

    PShape mur1Front = createShape();
    mur1Front.beginShape(QUADS);
    mur1Front.fill(couleurMur);
    mur1Front.stroke(couleurMur);
    mur1Front.vertex(salleL, -salleH, -salleP-couche);
    mur1Front.vertex(-salleL, -salleH, -salleP-couche);
    mur1Front.vertex(-salleL, salleH, -salleP-couche);
    mur1Front.vertex(salleL, salleH, -salleP-couche); 
    mur1Front.endShape(CLOSE);

    // Face avec texture du mur
    PShape mur1Back = createShape();
    mur1Back.beginShape(QUADS);
    mur1Back.textureMode(NORMAL);
    mur1Back.texture(texMur);
    mur1Back.shininess(200.0);
    mur1Back.emissive(0, 0, 0);
    mur1Back.normal(0, 0, 1);
    mur1Back.stroke(couleurMur);
    mur1Back.vertex(salleL, -salleH, -salleP, 1, 0);
    mur1Back.vertex(-salleL, -salleH, -salleP, 0, 0);
    mur1Back.vertex(-salleL, salleH, -salleP, 0, 1);
    mur1Back.vertex(salleL, salleH, -salleP, 1, 1); 
    mur1Back.endShape(CLOSE);

    mur1.addChild(mur1Top);
    mur1.addChild(mur1Bottom);
    mur1.addChild(mur1Left);
    mur1.addChild(mur1Right);
    mur1.addChild(mur1Front);
    mur1.addChild(mur1Back);

    return mur1;
  }

  /* Fonction qui va nous retourner le dessin du mur du fond */
  
  PShape creerMur2() {
    PShape mur2 = createShape(GROUP);

    PShape mur2Top = createShape();
    mur2Top.beginShape(QUADS);
    mur2Top.fill(couleurMur);
    mur2Top.stroke(couleurMur);
    mur2Top.vertex(-salleL, -salleH, salleP);
    mur2Top.vertex(salleL, -salleH, salleP);
    mur2Top.vertex(salleL, -salleH, salleP+couche);
    mur2Top.vertex(-salleL, -salleH, salleP+couche);
    mur2Top.endShape(CLOSE);

    PShape mur2Bottom = createShape();
    mur2Bottom.beginShape(QUADS);
    mur2Bottom.fill(couleurMur);
    mur2Bottom.stroke(couleurMur);
    mur2Bottom.vertex(-salleL, salleH, salleP);
    mur2Bottom.vertex(salleL, salleH, salleP);
    mur2Bottom.vertex(salleL, salleH, salleP+couche);
    mur2Bottom.vertex(-salleL, salleH, salleP+couche);
    mur2Bottom.endShape(CLOSE);

    PShape mur2Left = createShape();
    mur2Left.beginShape(QUADS);
    mur2Left.fill(couleurMur);
    mur2Left.stroke(couleurMur);
    mur2Left.vertex(-salleL, -salleH, salleP);
    mur2Left.vertex(-salleL, -salleH, salleP+couche);
    mur2Left.vertex(-salleL, salleH, salleP+couche);
    mur2Left.vertex(-salleL, salleH, salleP);
    mur2Left.endShape(CLOSE);

    PShape mur2Right= createShape();
    mur2Right.beginShape(QUADS);
    mur2Right.fill(couleurMur);
    mur2Right.stroke(couleurMur);
    mur2Right.vertex(salleL, -salleH, salleP+couche);
    mur2Right.vertex(salleL, -salleH, salleP);
    mur2Right.vertex(salleL, salleH, salleP);
    mur2Right.vertex(salleL, salleH, salleP+couche);
    mur2Right.endShape(CLOSE);

    // Face avec texture du mur
    PShape mur2Front = createShape();
    mur2Front.beginShape(QUADS);
    mur2Front.textureMode(NORMAL);
    mur2Front.texture(texMur);
    mur2Front.shininess(200.0);
    mur2Front.emissive(0, 0, 0);
    mur2Front.normal(0, 0, 1);
    mur2Front.stroke(couleurMur);
    mur2Front.vertex(salleL, -salleH, salleP, 0, 0);
    mur2Front.vertex(-salleL, -salleH, salleP, 1, 0);
    mur2Front.vertex(-salleL, salleH, salleP, 1, 1);
    mur2Front.vertex(salleL, salleH, salleP, 0, 1); 
    mur2Front.endShape(CLOSE);

    PShape mur2Back = createShape();
    mur2Back.beginShape(QUADS);
    mur2Back.fill(couleurMur);
    mur2Back.stroke(couleurMur);
    mur2Back.vertex(salleL, -salleH, salleP+couche);
    mur2Back.vertex(-salleL, -salleH, salleP+couche);
    mur2Back.vertex(-salleL, salleH, salleP+couche);
    mur2Back.vertex(salleL, salleH, salleP+couche); 
    mur2Back.endShape(CLOSE);

    mur2.addChild(mur2Top);
    mur2.addChild(mur2Bottom);
    mur2.addChild(mur2Left);
    mur2.addChild(mur2Right);
    mur2.addChild(mur2Front);
    mur2.addChild(mur2Back);

    return mur2;
  }

  /* Fonction qui va nous retourner le dessin du mur de gauche (fenêtre) */

  PShape creerMur3() {
    PShape mur3 = createShape(GROUP);

    PShape mur3Top = createShape();
    mur3Top.beginShape(QUADS);
    mur3Top.fill(couleurMur);
    mur3Top.stroke(couleurMur);
    mur3Top.vertex(-salleL-couche, -salleH, salleP);
    mur3Top.vertex(-salleL, -salleH, salleP);
    mur3Top.vertex(-salleL, -salleH, -salleP);
    mur3Top.vertex(-salleL-couche, -salleH, -salleP);
    mur3Top.endShape(CLOSE);

    PShape mur3Bottom = createShape();
    mur3Bottom.beginShape(QUADS);
    mur3Bottom.fill(couleurMur);
    mur3Bottom.stroke(couleurMur);
    mur3Bottom.vertex(-salleL-couche, salleH, salleP);
    mur3Bottom.vertex(-salleL, salleH, salleP);
    mur3Bottom.vertex(-salleL, salleH, -salleP);
    mur3Bottom.vertex(-salleL-couche, salleH, -salleP);
    mur3Bottom.endShape(CLOSE);

    // Face avec la texture du batîment (briques)
    PShape mur3Left = createShape();
    mur3Left.beginShape(QUADS);
    mur3Left.textureMode(NORMAL);
    mur3Left.texture(texMurBrique);
    mur3Left.shininess(200.0);
    mur3Left.emissive(0, 0, 0);
    mur3Left.normal(0, 0, 1);
    mur3Left.stroke(couleurMur);
    mur3Left.vertex(-salleL-couche, -salleH, -salleP, 0, 0);
    mur3Left.vertex(-salleL-couche, -salleH, salleP, 1, 0);
    mur3Left.vertex(-salleL-couche, salleH, salleP, 1, 1);
    mur3Left.vertex(-salleL-couche, salleH, -salleP, 0, 1);
    mur3Left.endShape(CLOSE);

    // Face avec la texture du mur
    PShape mur3Right = createShape();
    mur3Right.beginShape(QUADS);
    mur3Right.textureMode(NORMAL);
    mur3Right.texture(texMur);
    mur3Right.shininess(200.0);
    mur3Right.emissive(0, 0, 0);
    mur3Right.normal(0, 0, 1);
    mur3Right.stroke(couleurMur);
    mur3Right.vertex(-salleL, -salleH, -salleP, 1, 0);
    mur3Right.vertex(-salleL, -salleH, salleP, 0, 0);
    mur3Right.vertex(-salleL, salleH, salleP, 0, 1);
    mur3Right.vertex(-salleL, salleH, -salleP, 1, 1);
    mur3Right.endShape(CLOSE);

    PShape mur3Front = createShape();
    mur3Front.beginShape(QUADS);
    mur3Front.fill(couleurMur);
    mur3Front.stroke(couleurMur);
    mur3Front.vertex(-salleL, -salleH, -salleP);
    mur3Front.vertex(-salleL-couche, -salleH, -salleP);
    mur3Front.vertex(-salleL-couche, salleH, -salleP);
    mur3Front.vertex(-salleL, salleH, -salleP);
    mur3Front.endShape(CLOSE);

    PShape mur3Back = createShape();
    mur3Back.beginShape(QUADS);
    mur3Back.fill(couleurMur);
    mur3Back.stroke(couleurMur);
    mur3Back.vertex(-salleL, -salleH, salleP);
    mur3Back.vertex(-salleL-couche, -salleH, salleP);
    mur3Back.vertex(-salleL-couche, salleH, salleP);
    mur3Back.vertex(-salleL, salleH, salleP);
    mur3Back.endShape(CLOSE);

    mur3.addChild(mur3Top);
    mur3.addChild(mur3Bottom);
    mur3.addChild(mur3Left);
    mur3.addChild(mur3Right);
    mur3.addChild(mur3Front);
    mur3.addChild(mur3Back);

    return mur3;
  }

  /* Fonction qui va nous retourner le dessin du mur de droite (porte d'entrée) */

  PShape creerMur4() {
    PShape mur4 = createShape(GROUP);

    PShape mur4Top = createShape();
    mur4Top.beginShape(QUADS);
    mur4Top.fill(couleurMur);
    mur4Top.stroke(couleurMur);
    mur4Top.vertex(salleL+couche, -salleH, salleP);
    mur4Top.vertex(salleL, -salleH, salleP);
    mur4Top.vertex(salleL, -salleH, -salleP);
    mur4Top.vertex(salleL+couche, -salleH, -salleP);
    mur4Top.endShape(CLOSE);

    PShape mur4Bottom = createShape();
    mur4Bottom.beginShape(QUADS);
    mur4Bottom.fill(couleurMur);
    mur4Bottom.stroke(couleurMur);
    mur4Bottom.vertex(salleL+couche, salleH, salleP);
    mur4Bottom.vertex(salleL, salleH, salleP);
    mur4Bottom.vertex(salleL, salleH, -salleP);
    mur4Bottom.vertex(salleL+couche, salleH, -salleP);
    mur4Bottom.endShape(CLOSE);

    // Face avec la texture du mur
    PShape mur4Left = createShape();
    mur4Left.beginShape(QUADS);
    mur4Left.textureMode(NORMAL);
    mur4Left.texture(texMur);
    mur4Left.shininess(200.0);
    mur4Left.emissive(0, 0, 0);
    mur4Left.normal(0, 0, 1);
    mur4Left.stroke(couleurMur);
    mur4Left.vertex(salleL, -salleH, -salleP, 0, 0);
    mur4Left.vertex(salleL, -salleH, salleP, 1, 0);
    mur4Left.vertex(salleL, salleH, salleP, 1, 1);
    mur4Left.vertex(salleL, salleH, -salleP, 0, 1);
    mur4Left.endShape(CLOSE);

    // Face avec la texture du mur du couloir 
    PShape mur4Right = createShape();
    mur4Right.beginShape(QUADS);
    mur4Right.textureMode(NORMAL);
    mur4Right.texture(texMurCouloir);
    mur4Right.shininess(200.0);
    mur4Right.emissive(0, 0, 0);
    mur4Right.normal(0, 0, 1);
    mur4Right.stroke(couleurMur);
    mur4Right.vertex(salleL+couche, -salleH, -salleP, 0, 0);
    mur4Right.vertex(salleL+couche, -salleH, salleP, 1, 0);
    mur4Right.vertex(salleL+couche, salleH, salleP, 1, 1);
    mur4Right.vertex(salleL+couche, salleH, -salleP, 0, 1);
    mur4Right.endShape(CLOSE);

    PShape mur4Front = createShape();
    mur4Front.beginShape(QUADS);
    mur4Front.fill(couleurMur);
    mur4Front.stroke(couleurMur);
    mur4Front.vertex(salleL, -salleH, -salleP);
    mur4Front.vertex(salleL+couche, -salleH, -salleP);
    mur4Front.vertex(salleL+couche, salleH, -salleP);
    mur4Front.vertex(salleL, salleH, -salleP);
    mur4Front.endShape(CLOSE);

    PShape mur4Back = createShape();
    mur4Back.beginShape(QUADS);
    mur4Back.fill(couleurMur);
    mur4Back.stroke(couleurMur);
    mur4Back.vertex(salleL, -salleH, salleP);
    mur4Back.vertex(salleL+couche, -salleH, salleP);
    mur4Back.vertex(salleL+couche, salleH, salleP);
    mur4Back.vertex(salleL, salleH, salleP);
    mur4Back.endShape(CLOSE);

    mur4.addChild(mur4Top);
    mur4.addChild(mur4Bottom);
    mur4.addChild(mur4Left);
    mur4.addChild(mur4Right);
    mur4.addChild(mur4Front);
    mur4.addChild(mur4Back);

    return mur4;
  }

  /* Fonction qui va nous retourner le dessin du plafond */

  PShape creerPlafond() {
    PShape plafond = createShape(GROUP);

    PShape plafondTop = createShape();
    plafondTop.beginShape(QUADS);
    plafondTop.fill(couleurPlafond);
    plafondTop.stroke(couleurPlafond);
    plafondTop.vertex(-salleL, -salleH-couche, salleP);
    plafondTop.vertex(salleL, -salleH-couche, salleP);
    plafondTop.vertex(salleL, -salleH-couche, -salleP);
    plafondTop.vertex(-salleL, -salleH-couche, -salleP);
    plafondTop.endShape(CLOSE);

    // Face avec la texture du plafond
    PShape plafondBottom = createShape();
    plafondBottom.beginShape(QUADS);
    plafondBottom.textureMode(NORMAL);
    plafondBottom.texture(texPlafond);
    plafondBottom.shininess(200.0);
    plafondBottom.emissive(0, 0, 0);
    plafondBottom.normal(0, 0, 1);
    plafondBottom.stroke(couleurPlafond);
    plafondBottom.vertex(-salleL, -salleH, salleP, 0, 0);
    plafondBottom.vertex(salleL, -salleH, salleP, 1, 0);
    plafondBottom.vertex(salleL, -salleH, -salleP, 1, 1);
    plafondBottom.vertex(-salleL, -salleH, -salleP, 0, 1);
    plafondBottom.endShape(CLOSE);

    PShape plafondLeft = createShape();
    plafondLeft.beginShape(QUADS);
    plafondLeft.fill(couleurPlafond);
    plafondLeft.stroke(couleurPlafond);
    plafondLeft.vertex(-salleL, -salleH, salleP);
    plafondLeft.vertex(-salleL, -salleH, -salleP);
    plafondLeft.vertex(-salleL, -salleH-couche, -salleP);
    plafondLeft.vertex(-salleL, -salleH-couche, salleP);
    plafondLeft.endShape(CLOSE);

    PShape plafondRight = createShape();
    plafondRight.beginShape(QUADS);
    plafondRight.fill(couleurPlafond);
    plafondRight.stroke(couleurPlafond);
    plafondRight.vertex(salleL, -salleH, -salleP);
    plafondRight.vertex(salleL, -salleH, salleP);
    plafondRight.vertex(salleL, -salleH-couche, salleP);
    plafondRight.vertex(salleL, -salleH-couche, -salleP);
    plafondRight.endShape(CLOSE);

    PShape plafondFront = createShape();
    plafondFront.beginShape();
    plafondFront.fill(couleurPlafond);
    plafondFront.stroke(couleurPlafond);
    plafondFront.vertex(-salleL, -salleH, -salleP);
    plafondFront.vertex(salleL, -salleH, -salleP);
    plafondFront.vertex(salleL, -salleH-couche, -salleP);
    plafondFront.vertex(-salleL, -salleH-couche, -salleP);
    plafondFront.endShape(CLOSE);

    PShape plafondBack = createShape();
    plafondBack.beginShape(QUADS);
    plafondBack.fill(couleurPlafond);
    plafondBack.stroke(couleurPlafond);
    plafondBack.vertex(salleL, -salleH, salleP);
    plafondBack.vertex(-salleL, -salleH, salleP);
    plafondBack.vertex(-salleL, -salleH-couche, salleP);
    plafondBack.vertex(salleL, -salleH-couche, salleP);
    plafondBack.endShape(CLOSE);

    plafond.addChild(plafondTop);
    plafond.addChild(plafondBottom);
    plafond.addChild(plafondLeft);
    plafond.addChild(plafondRight);
    plafond.addChild(plafondFront);
    plafond.addChild(plafondBack);

    return plafond;
  }

  /* Fonction qui va nous retourner le dessin des plinthes */
  
  PShape creerPlinthes() {
    PShape plinthes = createShape(GROUP);

    PShape plinthe1Front = createShape();
    plinthe1Front.beginShape(QUADS);
    plinthe1Front.fill(couleurMur);
    plinthe1Front.stroke(couleurMur);
    plinthe1Front.vertex(salleL, salleH, -salleP+plintheP);
    plinthe1Front.vertex(-salleL, salleH, -salleP+plintheP);
    plinthe1Front.vertex(-salleL, salleH-plintheH, -salleP+plintheP);
    plinthe1Front.vertex(salleL, salleH-plintheH, -salleP+plintheP); 
    plinthe1Front.endShape(CLOSE);

    PShape plinthe1Top = createShape();
    plinthe1Top.beginShape(QUADS);
    plinthe1Top.fill(couleurMur);
    plinthe1Top.stroke(couleurMur);
    plinthe1Top.vertex(salleL, salleH-plintheH, -salleP+plintheP);
    plinthe1Top.vertex(-salleL, salleH-plintheH, -salleP+plintheP);
    plinthe1Top.vertex(-salleL, salleH-plintheH, -salleP);
    plinthe1Top.vertex(salleL, salleH-plintheH, -salleP); 
    plinthe1Top.endShape(CLOSE);

    PShape plinthe2Front = createShape();
    plinthe2Front.beginShape(QUADS);
    plinthe2Front.fill(couleurMur);
    plinthe2Front.stroke(couleurMur);
    plinthe2Front.vertex(salleL-plintheP, salleH, salleP);
    plinthe2Front.vertex(salleL-plintheP, salleH, -salleP);
    plinthe2Front.vertex(salleL-plintheP, salleH-plintheH, -salleP);
    plinthe2Front.vertex(salleL-plintheP, salleH-plintheH, salleP); 
    plinthe2Front.endShape(CLOSE);

    PShape plinthe2Top = createShape();
    plinthe2Top.beginShape(QUADS);
    plinthe2Top.fill(couleurMur);
    plinthe2Top.stroke(couleurMur);
    plinthe2Top.vertex(salleL-plintheP, salleH-plintheH, salleP);
    plinthe2Top.vertex(salleL-plintheP, salleH-plintheH, -salleP);
    plinthe2Top.vertex(salleL, salleH-plintheH, -salleP);
    plinthe2Top.vertex(salleL, salleH-plintheH, salleP); 
    plinthe2Top.endShape(CLOSE);

    PShape plinthe3Front = createShape();
    plinthe3Front.beginShape(QUADS);
    plinthe3Front.fill(couleurMur);
    plinthe3Front.stroke(couleurMur);
    plinthe3Front.vertex(salleL, salleH, salleP-plintheP);
    plinthe3Front.vertex(-salleL, salleH, salleP-plintheP);
    plinthe3Front.vertex(-salleL, salleH-plintheH, salleP-plintheP);
    plinthe3Front.vertex(salleL, salleH-plintheH, salleP-plintheP); 
    plinthe3Front.endShape(CLOSE);
    
    PShape plinthe3Top = createShape();
    plinthe3Top.beginShape(QUADS);
    plinthe3Top.fill(couleurMur);
    plinthe3Top.stroke(couleurMur);
    plinthe3Top.vertex(salleL, salleH-plintheH, salleP-plintheP);
    plinthe3Top.vertex(-salleL, salleH-plintheH, salleP-plintheP);
    plinthe3Top.vertex(-salleL, salleH-plintheH, salleP);
    plinthe3Top.vertex(salleL, salleH-plintheH, salleP); 
    plinthe3Top.endShape(CLOSE);

    PShape plinthe4Front = createShape();
    plinthe4Front.beginShape(QUADS);
    plinthe4Front.fill(couleurMur);
    plinthe4Front.stroke(couleurMur);
    plinthe4Front.vertex(-salleL+plintheP, salleH, salleP);
    plinthe4Front.vertex(-salleL+plintheP, salleH, -salleP);
    plinthe4Front.vertex(-salleL+plintheP, salleH-plintheH, -salleP);
    plinthe4Front.vertex(-salleL+plintheP, salleH-plintheH, salleP); 
    plinthe4Front.endShape(CLOSE);
    
    PShape plinthe4Top = createShape();
    plinthe4Top.beginShape(QUADS);
    plinthe4Top.fill(couleurMur);
    plinthe4Top.stroke(couleurMur);
    plinthe4Top.vertex(-salleL+plintheP, salleH-plintheH, salleP);
    plinthe4Top.vertex(-salleL+plintheP, salleH-plintheH, -salleP);
    plinthe4Top.vertex(-salleL, salleH-plintheH, -salleP);
    plinthe4Top.vertex(-salleL, salleH-plintheH, salleP); 
    plinthe4Top.endShape(CLOSE);

    plinthes.addChild(plinthe1Front);
    plinthes.addChild(plinthe1Top);
    plinthes.addChild(plinthe2Front);
    plinthes.addChild(plinthe2Top);
    plinthes.addChild(plinthe3Front);
    plinthes.addChild(plinthe3Top);
    plinthes.addChild(plinthe4Front);
    plinthes.addChild(plinthe4Top);

    return plinthes;
  }
  
  /* Fonction qui va nous retourner le dessin des détails
    qui se trouvent sur le mur du tableau (affiche) et
    les détails qui se trouvent sur le mur du couloir (affiches) */

  PShape creerDetailsMur() {
    PShape groupeDetailsMur = createShape(GROUP);
    
    PShape afficheMurTableau = createShape();
    afficheMurTableau.beginShape(QUADS);
    afficheMurTableau.textureMode(NORMAL);
    afficheMurTableau.texture(texAfficheTableau);
    afficheMurTableau.shininess(200.0);
    afficheMurTableau.emissive(0, 0, 0);
    afficheMurTableau.normal(0, 0, 1);
    afficheMurTableau.noStroke();
    afficheMurTableau.vertex(salleL-155, -salleH+70, -salleP+0.5, 0, 1);
    afficheMurTableau.vertex(salleL-155, -salleH+50, -salleP+0.5, 0, 0);
    afficheMurTableau.vertex(salleL-125, -salleH+50, -salleP+0.5, 1, 0);
    afficheMurTableau.vertex(salleL-125, -salleH+70, -salleP+0.5, 1, 1);
    afficheMurTableau.endShape(CLOSE);
    
    PShape afficheCouloir1 = createShape();
    afficheCouloir1.beginShape(QUADS);
    afficheCouloir1.textureMode(NORMAL);
    afficheCouloir1.texture(texAfficheCouloir1);
    afficheCouloir1.shininess(200.0);
    afficheCouloir1.emissive(0, 0, 0);
    afficheCouloir1.normal(0, 0, 1);
    afficheCouloir1.noStroke();
    afficheCouloir1.vertex(-salleL-couche-0.5, -salleH+165, salleP-410, 0, 1);
    afficheCouloir1.vertex(-salleL-couche-0.5, -salleH+125, salleP-410, 0, 0);
    afficheCouloir1.vertex(-salleL-couche-0.5, -salleH+125, salleP-350, 1, 0);
    afficheCouloir1.vertex(-salleL-couche-0.5, -salleH+165, salleP-350, 1, 1);
    afficheCouloir1.endShape(CLOSE);
    
    afficheCouloir1.rotateY(PI);
    
    PShape afficheCouloir2 = createShape();
    afficheCouloir2.beginShape(QUADS);
    afficheCouloir2.textureMode(NORMAL);
    afficheCouloir2.texture(texAfficheCouloir2);
    afficheCouloir2.shininess(200.0);
    afficheCouloir2.emissive(0, 0, 0);
    afficheCouloir2.normal(0, 0, 1);
    afficheCouloir2.noStroke();
    afficheCouloir2.vertex(-salleL-couche-0.5, -salleH+180, -salleP+150, 0, 1);
    afficheCouloir2.vertex(-salleL-couche-0.5, -salleH+140, -salleP+150, 0, 0);
    afficheCouloir2.vertex(-salleL-couche-0.5, -salleH+140, -salleP+180, 1, 0);
    afficheCouloir2.vertex(-salleL-couche-0.5, -salleH+180, -salleP+180, 1, 1);
    afficheCouloir2.endShape(CLOSE);
    
    afficheCouloir2.rotateY(PI);
    
    groupeDetailsMur.addChild(afficheMurTableau);
    groupeDetailsMur.addChild(afficheCouloir1);
    groupeDetailsMur.addChild(afficheCouloir2);
    
    return groupeDetailsMur;
  }
}
