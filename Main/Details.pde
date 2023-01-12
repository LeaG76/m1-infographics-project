/***********************************************************
 * Fichier de la classe Details, elle va nous permettre de *
 * créer tous les petits détails qui se trouvent dans la   *
 * salle A106 ainsi que sur les murs de la salle (poubelle,*
 * projecteurs, rideau projecteur, tampon du tableau,      *
 * prises et interrupteurs)                                *
 ***********************************************************/

class Details {
  // Dessin pour les détails
  PShape details;
  // Variables des couleurs que l'on va utiliser pour tous les détails
  color couleurNoir, couleurNoirC, couleurGris, couleurGrisC, couleurGrisF, couleurBlanc, couleurMarron, couleurJauneC, couleurJaune;
  /* Instances des différents cylindres qui vont nous servirent pour
    les détails comme la poubelle ou le rideau projecteur */
  Cylindre cylindrePoubelle, cylindrePiedProjecteur, cylindreProjecteur, cylindreRideauProjecteur;

  /* Constructeur sans argument */

  Details() {
    details = createShape(GROUP);
    couleurNoir = color(0);
    couleurNoirC = color(#212021);
    couleurGris = color(#3E3936);
    couleurGrisC = color(#bababa);
    couleurGrisF = color(#252024);
    couleurBlanc = color(#f2f2f2);
    couleurMarron = color(#9d6c32);
    couleurJauneC = color(#dbd1c8);
    couleurJaune = color(#b1a8a9);
    cylindrePoubelle = new Cylindre(30, poubelleR, poubelleH);
    cylindrePiedProjecteur = new Cylindre(30, piedProjecteurR, piedProjecteurH);
    cylindreProjecteur = new Cylindre(30, 4.25, 1);
    cylindreRideauProjecteur = new Cylindre(30, rideauPR, rideauPH);
  }

  /* Fonction qui va nous retourner le dessin de tous les détails
    en utilisant les différentes fonctions creerPoubelle, creerProjecteur,
    creerRideauProjecteur, creerTampon et creerInterrupteurOuPrise */

  PShape creerDetails() {
    PShape poubelle = creerPoubelle(couleurNoir, couleurGrisF);
    poubelle.translate(salleL-25, salleH-15.1, -salleP+175);

    PShape projecteur = creerProjecteur(couleurBlanc, couleurGrisC, couleurGrisF, true);
    projecteur.translate(-projecteurL/2, -2*salleH+piedProjecteurH+projecteurH, -150);

    PShape rideauProjecteur = creerRideauProjecteur(couleurBlanc);
    rideauProjecteur.translate(-salleL+137+enceinteL+rideauPH/2+15, -salleH+rideauPR+5, -salleP+rideauPR+0.5);

    PShape tamponTableauBottom = creerTampon(tamponH, couleurNoirC, couleurNoirC, texTampon);
    tamponTableauBottom.translate(-salleL+137+tamponL+100, -80+tablette1H+1, -salleP+tablette1P+tamponP+1.5);

    PShape tamponTableauTop = creerTampon(tamponH-0.5, couleurMarron, couleurMarron, texTampon);
    tamponTableauTop.translate(-salleL+137+tamponL+100, -80+tablette1H+1-tamponH, -salleP+tablette1P+tamponP+1.5);

    PShape interrupteur1PorteEntree = creerInterrupteurOuPrise(couleurJauneC, couleurJaune, texInterrupteur);
    interrupteur1PorteEntree.translate(salleL+porteL-27-contourEpaisseur-15, -135+blocElecH, salleL);
    interrupteur1PorteEntree.rotateY(PI/2);

    PShape interrupteur2PorteEntree = creerInterrupteurOuPrise(couleurJauneC, couleurJaune, texInterrupteur);
    interrupteur2PorteEntree.translate(salleL+porteL-27-contourEpaisseur-15, -135+2*blocElecH+1, salleL);
    interrupteur2PorteEntree.rotateY(PI/2);

    PShape prisePorteEntree = creerInterrupteurOuPrise(couleurJauneC, couleurJaune, texPrise);
    prisePorteEntree.translate(salleL+porteL-27-contourEpaisseur-15, -25, salleL);
    prisePorteEntree.rotateY(PI/2);

    PShape interrupteurTableau = creerInterrupteurOuPrise(couleurJauneC, couleurJaune, texInterrupteur);
    interrupteurTableau.translate(salleL-123.5, -135+blocElecH, salleP);
    interrupteurTableau.rotateY(PI);

    PShape prise1Tableau = creerInterrupteurOuPrise(couleurJauneC, couleurJaune, texPrise);
    prise1Tableau.translate(salleL-127, -25, salleP);
    prise1Tableau.rotateY(PI);
    
    PShape prise2Tableau = creerInterrupteurOuPrise(couleurJauneC, couleurJaune, texPrise);
    prise2Tableau.translate(-salleL+30, -25, salleP);
    prise2Tableau.rotateY(PI);

    PShape priseFond = creerInterrupteurOuPrise(couleurJauneC, couleurJaune, texPrise);
    priseFond.translate(-salleL+137, -25, salleP);

    PShape priseCouloir = creerInterrupteurOuPrise(couleurJauneC, couleurJaune, texPrise);
    priseCouloir.translate(-salleP+150, -25, -salleL-epaisseur-blocElecP);
    priseCouloir.rotateY(-PI/2);
    
    PShape projecteurBureau = creerProjecteur(couleurNoir, couleurNoirC, couleurNoirC, false);
    projecteurBureau.translate(salleL-plateauL*2-20, -piedH-plateauH, -salleP+218.5+projecteurP);

    details.addChild(poubelle);
    details.addChild(projecteur);
    details.addChild(rideauProjecteur);
    details.addChild(tamponTableauBottom);
    details.addChild(tamponTableauTop);
    details.addChild(interrupteur1PorteEntree);
    details.addChild(interrupteur2PorteEntree);
    details.addChild(prisePorteEntree);
    details.addChild(interrupteurTableau);
    details.addChild(prise1Tableau);
    details.addChild(prise2Tableau);
    details.addChild(priseFond);
    details.addChild(priseCouloir);
    details.addChild(projecteurBureau);

    return details;
  }

  /* Fonction qui va nous retourner le dessin de la poubelle */

  PShape creerPoubelle(color couleur1, color couleur2) {
    PShape poubelle = cylindrePoubelle.drawCylindreWithoutTop(couleur1, couleur2);
    poubelle.rotateX(-PI/2);
    return poubelle;
  }

  /* Fonction qui va nous retourner le dessin du rideau du projecteur */

  PShape creerRideauProjecteur(color couleur) {
    PShape rideau = cylindreRideauProjecteur.drawCylindre(couleur);
    rideau.rotateY(PI/2);
    return rideau;
  }

  /* Fonction qui va nous retourner le dessin d'un projecteur
    (en fonction de si oui ou non il est au plafond il aura un pied) */

  PShape creerProjecteur(color couleur1, color couleur2, color couleur3, boolean auPlafond) {
    PShape projecteur = createShape(GROUP);

    if (auPlafond==true) {
      PShape piedProjecteur = cylindrePiedProjecteur.drawCylindre(couleur3);
      piedProjecteur.rotateX(-PI/2);
      piedProjecteur.translate(-projecteurL/2, salleH-piedProjecteurH/2-projecteurH, -projecteurP/2);
      
      projecteur.addChild(piedProjecteur);
    }

    PShape vueProjecteur = cylindreProjecteur.drawCylindre(couleur3);
    vueProjecteur.translate(-projecteurL+projecteurL/4, salleH-5, -projecteurP-0.5);

    PShape projecteurFront = createShape();
    projecteurFront.beginShape(QUADS);
    projecteurFront.fill(couleur1);
    projecteurFront.stroke(couleur2);
    projecteurFront.vertex(0, salleH, 0);
    projecteurFront.vertex(0, salleH-projecteurH, 0);
    projecteurFront.vertex(-projecteurL, salleH-projecteurH, 0);
    projecteurFront.vertex(-projecteurL, salleH, 0);
    projecteurFront.endShape(CLOSE);

    PShape projecteurBack = createShape();
    projecteurBack.beginShape(QUADS);
    projecteurBack.fill(couleur1);
    projecteurBack.stroke(couleur2);
    projecteurBack.vertex(0, salleH, -projecteurP);
    projecteurBack.vertex(0, salleH-projecteurH, -projecteurP);
    projecteurBack.vertex(-projecteurL, salleH-projecteurH, -projecteurP);
    projecteurBack.vertex(-projecteurL, salleH, -projecteurP);
    projecteurBack.endShape(CLOSE);

    PShape projecteurTop = createShape();
    projecteurTop.beginShape(QUADS);
    projecteurTop.fill(couleur1);
    projecteurTop.stroke(couleur2);
    projecteurTop.vertex(0, salleH-projecteurH, -projecteurP);
    projecteurTop.vertex(0, salleH-projecteurH, 0);
    projecteurTop.vertex(-projecteurL, salleH-projecteurH, 0);
    projecteurTop.vertex(-projecteurL, salleH-projecteurH, -projecteurP);
    projecteurTop.endShape(CLOSE);

    PShape projecteurBottom = createShape();
    projecteurBottom.beginShape(QUADS);
    projecteurBottom.fill(couleur1);
    projecteurBottom.stroke(couleur2);
    projecteurBottom.vertex(0, salleH, -projecteurP);
    projecteurBottom.vertex(0, salleH, 0);
    projecteurBottom.vertex(-projecteurL, salleH, 0);
    projecteurBottom.vertex(-projecteurL, salleH, -projecteurP);
    projecteurBottom.endShape(CLOSE);

    PShape projecteurLeft = createShape();
    projecteurLeft.beginShape(QUADS);
    projecteurLeft.fill(couleur1);
    projecteurLeft.stroke(couleur2);
    projecteurLeft.vertex(-projecteurL, salleH, 0);
    projecteurLeft.vertex(-projecteurL, salleH-projecteurH, 0);
    projecteurLeft.vertex(-projecteurL, salleH-projecteurH, -projecteurP);
    projecteurLeft.vertex(-projecteurL, salleH, -projecteurP);
    projecteurLeft.endShape(CLOSE);

    PShape projecteurRight = createShape();
    projecteurRight.beginShape(QUADS);
    projecteurRight.fill(couleur1);
    projecteurRight.stroke(couleur2);
    projecteurRight.vertex(0, salleH, 0);
    projecteurRight.vertex(0, salleH-projecteurH, 0);
    projecteurRight.vertex(0, salleH-projecteurH, -projecteurP);
    projecteurRight.vertex(0, salleH, -projecteurP);
    projecteurRight.endShape(CLOSE);

    projecteur.addChild(vueProjecteur);
    projecteur.addChild(projecteurFront);
    projecteur.addChild(projecteurBack);
    projecteur.addChild(projecteurTop);
    projecteur.addChild(projecteurBottom);
    projecteur.addChild(projecteurLeft);
    projecteur.addChild(projecteurRight);

    return projecteur;
  }

  /* Fonction qui va nous retourner le dessin du tampon effaceur du tableau */

  PShape creerTampon(float hauteur, color couleur1, color couleur2, PImage texture) {
    PShape tampon = createShape(GROUP);

    PShape tamponFront = createShape();
    tamponFront.beginShape(QUADS);
    tamponFront.fill(couleur1);
    tamponFront.stroke(couleur2);
    tamponFront.vertex(0, salleH, 0);
    tamponFront.vertex(0, salleH-hauteur, 0);
    tamponFront.vertex(-tamponL, salleH-hauteur, 0);
    tamponFront.vertex(-tamponL, salleH, 0);
    tamponFront.endShape(CLOSE);

    PShape tamponBack = createShape();
    tamponBack.beginShape(QUADS);
    tamponBack.fill(couleur1);
    tamponBack.stroke(couleur2);
    tamponBack.vertex(0, salleH, -tamponP);
    tamponBack.vertex(0, salleH-hauteur, -tamponP);
    tamponBack.vertex(-tamponL, salleH-hauteur, -tamponP);
    tamponBack.vertex(-tamponL, salleH, -tamponP);
    tamponBack.endShape(CLOSE);

    PShape tamponTop = createShape();
    tamponTop.beginShape(QUADS);
    tamponTop.textureMode(NORMAL);
    tamponTop.texture(texture);
    tamponTop.shininess(200.0);
    tamponTop.emissive(0, 0, 0);
    tamponTop.normal(0, 0, 1);
    tamponTop.stroke(couleur2);
    tamponTop.vertex(0, salleH-hauteur, -tamponP, 0, 0);
    tamponTop.vertex(0, salleH-hauteur, 0, 1, 0);
    tamponTop.vertex(-tamponL, salleH-hauteur, 0, 1, 1);
    tamponTop.vertex(-tamponL, salleH-hauteur, -tamponP, 0, 1);
    tamponTop.endShape(CLOSE);

    PShape tamponBottom = createShape();
    tamponBottom.beginShape(QUADS);
    tamponBottom.fill(couleur1);
    tamponBottom.stroke(couleur2);
    tamponBottom.vertex(0, salleH, 0);
    tamponBottom.vertex(0, salleH, -tamponP);
    tamponBottom.vertex(-tamponL, salleH, -tamponP);
    tamponBottom.vertex(-tamponL, salleH, 0);
    tamponBottom.endShape(CLOSE);

    PShape tamponLeft = createShape();
    tamponLeft.beginShape(QUADS);
    tamponLeft.fill(couleur1);
    tamponLeft.stroke(couleur2);
    tamponLeft.vertex(-tamponL, salleH, 0);
    tamponLeft.vertex(-tamponL, salleH-hauteur, 0);
    tamponLeft.vertex(-tamponL, salleH-hauteur, -tamponP);
    tamponLeft.vertex(-tamponL, salleH, -tamponP);
    tamponLeft.endShape(CLOSE);

    PShape tamponRight = createShape();
    tamponRight.beginShape(QUADS);
    tamponRight.fill(couleur1);
    tamponRight.stroke(couleur2);
    tamponRight.vertex(0, salleH, 0);
    tamponRight.vertex(0, salleH-hauteur, 0);
    tamponRight.vertex(0, salleH-hauteur, -tamponP);
    tamponRight.vertex(0, salleH, -tamponP);
    tamponRight.endShape(CLOSE);

    tampon.addChild(tamponFront);
    tampon.addChild(tamponBack);
    tampon.addChild(tamponTop);
    tampon.addChild(tamponBottom);
    tampon.addChild(tamponLeft);
    tampon.addChild(tamponRight);

    return tampon;
  }

  /* Fonction qui va nous retourner le dessin d'un bloc
    interrupteur ou prise (en fonction de la texture) */

  PShape creerInterrupteurOuPrise(color couleur1, color couleur2, PImage texture) {
    PShape blocElectrique = createShape(GROUP);

    PShape blocElectriqueFront = createShape();
    blocElectriqueFront.beginShape(QUADS);
    blocElectriqueFront.textureMode(NORMAL);
    blocElectriqueFront.texture(texture);
    blocElectriqueFront.shininess(200.0);
    blocElectriqueFront.emissive(0, 0, 0);
    blocElectriqueFront.normal(0, 0, 1);
    blocElectriqueFront.stroke(couleur2);
    blocElectriqueFront.vertex(0, salleH, -blocElecP, 1, 1);
    blocElectriqueFront.vertex(0, salleH-blocElecH, -blocElecP, 1, 0);
    blocElectriqueFront.vertex(-blocElecL, salleH-blocElecH, -blocElecP, 0, 0);
    blocElectriqueFront.vertex(-blocElecL, salleH, -blocElecP, 0, 1);
    blocElectriqueFront.endShape(CLOSE);

    PShape blocElectriqueBack = createShape();
    blocElectriqueBack.beginShape(QUADS);
    blocElectriqueBack.fill(couleur1);
    blocElectriqueBack.stroke(couleur2);
    blocElectriqueBack.vertex(0, salleH, 0);
    blocElectriqueBack.vertex(0, salleH-blocElecH, 0);
    blocElectriqueBack.vertex(-blocElecL, salleH-blocElecH, 0);
    blocElectriqueBack.vertex(-blocElecL, salleH, 0);
    blocElectriqueBack.endShape(CLOSE);

    PShape blocElectriqueTop = createShape();
    blocElectriqueTop.beginShape(QUADS);
    blocElectriqueTop.fill(couleur1);
    blocElectriqueTop.stroke(couleur2);
    blocElectriqueTop.vertex(0, salleH-blocElecH, -blocElecP);
    blocElectriqueTop.vertex(0, salleH-blocElecH, 0);
    blocElectriqueTop.vertex(-blocElecL, salleH-blocElecH, 0);
    blocElectriqueTop.vertex(-blocElecL, salleH-blocElecH, -blocElecP);
    blocElectriqueTop.endShape(CLOSE);

    PShape blocElectriqueBottom = createShape();
    blocElectriqueBottom.beginShape(QUADS);
    blocElectriqueBottom.fill(couleur1);
    blocElectriqueBottom.stroke(couleur2);
    blocElectriqueBottom.vertex(0, salleH, 0);
    blocElectriqueBottom.vertex(0, salleH, -blocElecP);
    blocElectriqueBottom.vertex(-blocElecL, salleH, -blocElecP);
    blocElectriqueBottom.vertex(-blocElecL, salleH, 0);
    blocElectriqueBottom.endShape(CLOSE);

    PShape blocElecLeft = createShape();
    blocElecLeft.beginShape(QUADS);
    blocElecLeft.fill(couleur1);
    blocElecLeft.stroke(couleur2);
    blocElecLeft.vertex(-blocElecL, salleH, 0);
    blocElecLeft.vertex(-blocElecL, salleH-blocElecH, 0);
    blocElecLeft.vertex(-blocElecL, salleH-blocElecH, -blocElecP);
    blocElecLeft.vertex(-blocElecL, salleH, -blocElecP);
    blocElecLeft.endShape(CLOSE);

    PShape blocElectriqueRight = createShape();
    blocElectriqueRight.beginShape(QUADS);
    blocElectriqueRight.fill(couleur1);
    blocElectriqueRight.stroke(couleur2);
    blocElectriqueRight.vertex(0, salleH, 0);
    blocElectriqueRight.vertex(0, salleH-blocElecH, 0);
    blocElectriqueRight.vertex(0, salleH-blocElecH, -blocElecP);
    blocElectriqueRight.vertex(0, salleH, -blocElecP);
    blocElectriqueRight.endShape(CLOSE);

    blocElectrique.addChild(blocElectriqueFront);
    blocElectrique.addChild(blocElectriqueBack);
    blocElectrique.addChild(blocElectriqueTop);
    blocElectrique.addChild(blocElectriqueBottom);
    blocElectrique.addChild(blocElecLeft);
    blocElectrique.addChild(blocElectriqueRight);

    return blocElectrique;
  }
}
